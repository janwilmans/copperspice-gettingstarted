import sys, os, shutil, glob
import xml.etree.ElementTree as ET
import subprocess


def sprint(*args, **kwargs):
    print("post_cpack: ".format(sys.argv[0]), end='', file=sys.stdout, flush=False)
    print(*args, file=sys.stdout, flush=True, **kwargs)


def add_nuget_property(nuspec_file, key, value):
    try:
        tree = ET.parse(nuspec_file)
        root = tree.getroot()
        namespace_uri = root.tag.split('}', 1)[0][1:]
        xmlns = {'ns': namespace_uri}
        ET.register_namespace('', namespace_uri)
        metadata_element = root.find('.//ns:metadata', xmlns)
        
        if metadata_element is not None:
            new_element = ET.SubElement(metadata_element, key)
            new_element.text = value
            new_element.tail = "\n"
            tree.write(nuspec_file)
            print(f"Added '{key} = {value}' to {nuspec_file}")
        else:
            print("Metadata element not found.")
    except Exception as e:
        print(f"add_nuget_property error: {e}")


def get_first_match(path):
    result = glob.glob(path)
    if len(result) > 0:
        return result[0]
    return ""


if __name__ == "__main__":
    if len(sys.argv) < 4:
        print("Usage: post_cpack.py <nuget_executable> <.nuspec> <result.nupkg> <output_path>")
        sys.exit(1)

    nuget_executable = os.path.normpath(sys.argv[1])      # location of nuget.exe
    nuspec_file = os.path.normpath(sys.argv[2])           # the nuspec file to modify
    nupkg_file = os.path.normpath(sys.argv[3])            # the output location to output needs to be copied to
    source_path = os.path.normpath(sys.argv[4])           # the location of the temporary directory containing the package source material
    
    # the temporary location where nuget generates the output
    temp_nupkg_file = get_first_match(os.path.normpath(source_path + "/*.nupkg"))
                                               
    if temp_nupkg_file == "":
        sprint(f"Warning: temporary nupkg file not found in {source_path}\n")
        #sys.exit(1)

    os.chdir(source_path)
    if os.path.exists(temp_nupkg_file):
        os.remove(temp_nupkg_file)
    
    add_nuget_property(nuspec_file, "readme", "README.md")
    sys.stdout.flush()
    subprocess.run([nuget_executable, "pack"])

    # we make sure we always overwrite the original file
    if os.path.exists(temp_nupkg_file) and os.path.exists(nupkg_file):
        shutil.copyfile(temp_nupkg_file, nupkg_file)
    