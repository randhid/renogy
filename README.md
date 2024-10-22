# [`renogy` module](<https://app.viam.com/module/rand/renogy>)

This [module](https://docs.viam.com/registry/modular-resources/) implements a `rand:renogy:renogy` model as a `rdk:component:power_sensor`.

You will be able to integrate a [Renogy charge controller](https://www.renogy.com/wanderer-10a-pwm-charge-controller/) connected by a USB-to-RS232/RS485 connector such as the one [linked here](https://www.amazon.com/Charger-Controller-Converter-Adapter-Chipset/dp/B07JGRJR4V). *Note*: This module is only compatible with Renogy charge controllers that can communicate over USB. A list of compatible controllers can be found [here](https://www.amazon.com/EPEVER-Communication-Controller-Connector-CC-USB-RS485-150U/dp/B07BLQ7Q5B).

To configure a `renogy` sensor and integrate a [Renogy charge controller](https://www.renogy.com/wanderer-10a-pwm-charge-controller/) into your machine:

1. Navigate to the **CONFIGURE** tab of your machine's page in [the Viam app](https://app.viam.com).
2. Click the **+** icon next to your machine part in the left-hand menu and select **Component**.
3. Select the `power_sensor` type, then select the `renogy` model.
4. Enter a name or use the suggested name for your sensor and click **Create**.

Edit the attributes as applicable to your power sensor, according to the table below:

```json
{
  "components": [
    {
      "name": "ren1",
      "model": "renogy",
      "type": "power_sensor",
      "namespace": "rdk",
      "attributes": {
        "serial_path": "<string>",
        "serial_baud_rate": <int>,
        "modbus_id": <int>
      },
      "depends_on": []
    }
  ]
}
```

# Example Configuration
```json
{
  "components": [
    {
      "name": "your-renogy-sensor",
      "model": "renogy",
      "type": "power_sensor",
      "namespace": "rdk",
      "attributes": {
        "serial_path": "/dev/serial/by-path/usb-0:1.1:1.0",
        "serial_baud_rate": 9600,
        "modbus_id": 1
      },
      "depends_on": []
    }
  ]
}
```
The following attributes are available for `renogy` sensors:


The `"serial_path"` filepath used in this example is specific to serial devices connected to Linux systems.
The `"serial_path"` filepath on a macOS system might resemble <file>"/dev/ttyUSB0"</file> or <file>"/dev/ttyS0"</file>.

The following attributes are available for `renogy` sensors:

| Attribute | Type | Required? | Description |
| --------- | ---- | --------- | ----------- |
| `serial_path` | string | Optional | The full filesystem path to the serial device, starting with <file>/dev/</file>. |
| `serial_baud_rate` | integer | Optional | The baud rate to use for serial communications. <br> Default: `9600` |
| `modbus_id`  | integer | Optional | Controller MODBUS address. <br> Default: `1` |


## Troubleshooting
To find your serial device path, first connect the serial device to your machine, then:<ul><li>On Linux, run <code>ls /dev/serial/by-path/\*</code> to show connected serial devices, or look for your device in the output of <code>sudo dmesg \| grep tty</code>. 
Example: 
<code>"/dev/serial/by-path/usb-0:1.1:1.0"</code>.</li><li>

On macOS, run <code>ls /dev/tty\* \| grep -i usb</code> to show connected USB serial devices, <code>ls /dev/tty\*</code> to browse all devices, or look for your device in the output of <code>sudo dmesg \| grep tty</code>. 
Example: <code>"/dev/ttyS0"</code>.</li></ul><br>Default: `/dev/serial0`