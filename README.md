<body>
  <p align="center">
  <img width="629" height="284" alt="image" src="https://github.com/user-attachments/assets/3d314c82-b48a-4803-91f3-f307265333e0" />
  </p>
<h2 align="center"> Important:</h2>
<p>
  We are migrating from a old private repository in GitHub and removing media, directories and other content to wipe all previous commits. This application was created on June 2023 and is going through a new filing structure. To monitor the tasking and project progression via Jira click <a href="https://valadezf3031.atlassian.net/jira/software/projects/FLUX/boards/68?atlOrigin=eyJpIjoiZWM0ZTVmNDJjNGNlNDIxMWFhMTgyYTU3YmFjOTEzOTYiLCJwIjoiaiJ9">valadezf3031/FluxConverter</a>
</p>
<h2 align="center">Latest Patch Notes:</h2>
<pre>
4.0.0
- Change Drop Box Items Name into just Name not Full directory
- Added Themes (Light and Dark)
- This Program will no longer receive any more features and updates, we will continue to monitor any issues.
</pre>

<h2>
  Standalone Installation:
</h2>
<p>
  <ol> 
    <li>Check the execution policy is set to bypass to run PowerShell Scripts. Start Windows PowerShell (WIN + R, powershell)
      Paste the Following: <code>Get-ExecutionPolicy</code></li>
    <li>Set the execution policy. Paste the following: <code>Set-ExecutionPolicy bypass</code></li>
    <li>Download the package from <a href="https://github.com/felipev1516/FluxConverterPSV/releases/tag/FluxConverterPSV_v4.0.0">FluxConverterPSV_v4.0.0</a></li>
    <li>Unzip the folder</li>
    <li>Double click on run.bat</li>
    <li>A script waring prompt may be present, just run the application anyways</li>
    <li>The program should open now</li>
  </ol>
</p>

<h2>
  (Admins Only) Server File Placement:
</h2>
<p>
  <p>
    Required for application update for clients restricted to access the web and unathorized to download external programs
  </p>
  <ol> 
    <li>Download the package from <a href="https://github.com/felipev1516/FluxConverterPSV/releases/tag/FluxConverterPSV_v4.0.0">FluxConverterPSV_v4.0.0</a></li>
    <li>Place the zip file into a interal network directory that clients can access (ex: \\NETWORK\INTERNAL\)</li>
    <li>Unzip the folder into that directory, Make sure the unzip folder contains at lease one FluxConverterPSV Folder.<br>
      <b>Recommended:</b> <code>\\NETWORK\INTERNAL\FluxConverterPSV\</code></li>
      <b>Acceptable:</b> <code>\\NETWORK\INTERNAL\FluxConverterPSV\FluxConverterPSV\</code><br>
    <li>Navigate to the Config Folder and open the server_path.cfg file<br>
      <code>notepad \\NETWORK\INTERNAL\FluxConverterPSV\config\server_path.cfg</code></li>
    <li>Paste the network directory as the examples follows. This is NOT depth first search dependable as long the FluxConverter Folder is specified, this should work.<br>
      <b>Recommended:</b><code>server_path=\\NETWORK\INTERNAL\FluxConverterPSV\</code><br>
      <b>Acceptable for depth beyond:</b><code>server_path=\\NETWORK\INTERNAL\Folder1\Folder2\FolderN\FluxConverterPSV\</code><br>
      <b>Acceptable for whitespaced labels:</b><code>server_path="\\NETWORK\INTERNAL\Shared Folder\FluxConverter PSV\"</code><br>
      <b>Acceptable:</b><code>server_path=\\NETWORK\INTERNAL\FluxConverterPSV\FluxConverterPSV</code><br>
      <b>Not Acceptable:</b><code>server_path=\\NETWORK\INTERNAL\FluxConverterPSV.zip</code><br>
    </li>
    <li>Return to the root of the program <code>\\NETWORK\INTERNAL\FluxConverterPSV\</code>, zip the folder and distruibe to clients</li>
  </ol>
</p>
<h2> For internal developers and engineers:</h2>
  <p>
    All changes of this program should be processed and saved within the internal network. Once all clients has obtain the program, the <code>\\NETWORK\INTERNAL\FluxConverterPSV\</code> directory is active for internal updates. You do not need to download this file from Github again and redistrubite to clients. Please branch off from <code>\\NETWORK\INTERNAL\FluxConverterPSV\</code> to implement changes.<br>
    <h3>Making a new change and broadcast the new directory</h3>
    <ol>
    <li>Create a new directory within the internal network
    <code>\\NETWORK\INTERNAL\v2\</code></li>
    <li>Copy the orginal Fluxconverter folder into this directory
    <code>\\NETWORK\INTERNAL\v2\FluxConverterPSV\</code></li>
    <li>Make a change with the program <br><b>CAUTION:</b> Please keep a back up of the working directory and make sure no issues are present</li>
    <li>Navigate to the Config Folder and modify the server_path.cfg file<br>
      <code>notepad \\NETWORK\INTERNAL\v2\FluxConverterPSV\config\server_path.cfg</code></li>
    <li>Paste the following directory into the server_path.cfg file<br>
    <code>\\NETWORK\INTERNAL\v2\FluxConverterPSV\</code></li>
      <b>Example: </b><code>server_path=\\NETWORK\INTERNAL\v2\FluxConverterPSV\</code>
    <li>Navigate back to the original branch <code>\\NETWORK\INTERNAL\FluxConverterPSV\</code> and change the set server directory in the server_path.cfg file<br>
    <code>\\NETWORK\INTERNAL\v2\FluxConverterPSV\</code>
      <br><br><b>Note:</b> Confirm that clients are able to access the new directory by placing the new path in File Explorer. If successful, clients will also need to update twice to have their server path to point to the new v2 directory before applying the new implementations.
    </li>
    </ol>
  </p>
</body>
