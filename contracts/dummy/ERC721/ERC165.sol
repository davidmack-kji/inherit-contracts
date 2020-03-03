pragma solidity ^0.5.8;
import "../../tokens/ERC721Interface.sol";
// Open Zepellin implementation
/**
 * @title ERC165
 */
contract ERC165 is ERC165Interface {
  bytes4 private constant _InterfaceId_ERC165 = 0x01ffc9a7;
  /**
   * 0x01ffc9a7 ===
   *     bytes4(keccak256('supportsInterface(bytes4)'))
   */

  /**
   * @dev a mapping of interface id to whether or not it's supported
   */
  mapping(bytes4 => bool) private _supportedInterfaces;

  /**
   * @dev A contract implementing SupportsInterfaceWithLookup
   * implement ERC165 itself
   */
  constructor () internal {
    _registerInterface(_InterfaceId_ERC165);
  }

  /**
   * @dev implement supportsInterface(bytes4) using a lookup table
   */
  function supportsInterface(bytes4 interfaceId) external view returns (bool) {
    return _supportedInterfaces[interfaceId];
  }

  /**
   * @dev internal method for registering an interface
   */
  function _registerInterface(bytes4 interfaceId) internal {
    require(interfaceId != 0xffffffff);
    _supportedInterfaces[interfaceId] = true;
  }
}