Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2659458E3A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Nov 2021 13:25:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232340AbhKVM2N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Nov 2021 07:28:13 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:40316 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233288AbhKVM2K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Nov 2021 07:28:10 -0500
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 20BA814C3;
        Mon, 22 Nov 2021 13:25:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637583903;
        bh=H3AEcsklDjIEbw/3SWvBzxFFINayg0dQrFG4ytoHOzc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FyNAm6HwX7OKsN6S14HKK2EsQCN6SNPRqdkjwDyTBt2SP4yHdsxkMPwu+CTsE/ZlW
         in2w09SnsItBf7gXnylctYf55zEpgpBAEGbT0llJSXh7yQXxe3KwkZeg1Uao4RzmI8
         r/JTOSZJz0pODe7LlhNlWDibujqsCZefB9nLW6vw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <163742290656.715.15960553560678858057.sendpatchset@octo>
References: <163742290656.715.15960553560678858057.sendpatchset@octo>
Subject: Re: [PATCH] r8a77995 Draak SCIF0 LED and KEY Serdev prototype
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     robh@kernel.org, Magnus Damm <damm@opensource.se>,
        johan@kernel.org, geert+renesas@glider.be
To:     Magnus Damm <damm@opensource.se>, linux-renesas-soc@vger.kernel.org
Date:   Mon, 22 Nov 2021 12:25:00 +0000
Message-ID: <163758390064.2984710.8277487311059323967@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Magnus,

Quoting Magnus Damm (2021-11-20 15:41:46)
> From: Magnus Damm <damm+renesas@opensource.se>
>=20
> Here's a work-in-progress patch for shared pin LED and KEY functionality:
>  - UART TX Serdev LED driver prototype (functional)
>  - UART RX Serdev KEY driver prototype (partial)
>  - r8a77995 Draak DTS modifications to use above drivers with SCIF0
>=20
> With this code my hope is to use hardware to drive an LED and allow
> detection of a key press without software performing any kind of polling.
>=20
> In theory on SoCs that support UART RX and TX on the same pin (and also
> open drain output) with the above software it is possible to handle boards
> with single pin shared LED and KEY functionality.
>=20
> This prototype on r8a77995 Draak makes use of 3 pins and an external circ=
uit:
>  - LED13/SW59/GP4_07 <-> EXIO_A:10 (CN46)
>  - SCIF0_RX/GP4_20 <- EXIO_A:38 (CN46)
>  - SCIF0_TX/GP4_21 -> EXIO_A:36 (CN46)
> Ether-AVB PHY connector (CN23) has 3.3V on pin 54 and 56 and GND on 14
> In the future SCIF1 and SCIF3 may also be used for other LEDs and switche=
s.
>=20
> Currently two inverters on SN74HC05 together with pull-ups are used to ex=
tend
> the D3 SoC and the Draak board with open drain functionality and also tie
> together the TX and RX pins with LED13/SW59.
>=20
> The prototype LED driver allows user space to turn on/off the LED using:
>  # echo 1 > /sys/class/leds/serial0-0/brightness
>  # echo 0 > /sys/class/leds/serial0-0/brightness
> Must be easy to extend the driver with some degree of brightness control.
>=20
> Apart from some general brush up the following issues have surfaced:
>  - "controller busy" error happens when more than one serdev is used
>  - it is unclear how to take RX errors from serdev and generate key events
>  - there seem to be no way to silence "sh-sci e6e60000.serial: frame erro=
r"
>  - the DTS "current-speed" property looks like sw config and not hw descr=
iption
>=20
> Obviously not for upstream merge as-is. Might however be useful as SCIF e=
rror
> test bench and/or as potential (corner) use case for serdev.

Very interesting use of the DMA capabilities for the SCIF to generate
output on the lines.

What's the maximum speed of the SCIF? I could see this being further
used to provide a software defined controller for RGB LEDs [0], which
have often previously used SPI in a similar fashion to your proposal [1].

https://github.com/msperl/rgbled-fb/blob/master/ws2812b-spi-fb.c
https://www.arrow.com/en/research-and-events/articles/protocol-for-the-ws28=
12b-programmable-led


> Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
>=20
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts |   34 ++++++
>  drivers/tty/serdev/Makefile                    |    2=20
>  drivers/tty/serdev/barfoo.c                    |   99 +++++++++++++++++++
>  drivers/tty/serdev/foobar.c                    |  121 ++++++++++++++++++=
++++++
>  4 files changed, 254 insertions(+), 2 deletions(-)
>=20
> --- 0001/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> +++ work/arch/arm64/boot/dts/renesas/r8a77995-draak.dts 2021-11-20 23:47:=
14.965609878 +0900
> @@ -16,6 +16,8 @@
> =20
>         aliases {
>                 serial0 =3D &scif2;
> +               serial1 =3D &scif0;
> +
>                 ethernet0 =3D &avb;
>         };
> =20
> @@ -226,6 +228,15 @@
>         clock-frequency =3D <48000000>;
>  };
> =20
> +&gpio4 {
> +       gp4_07_led13_sw59 {
> +               gpio-hog;
> +               gpios =3D <7 GPIO_ACTIVE_HIGH>;
> +               input;
> +               line-name =3D "gp4_07";
> +       };
> +};
> +
>  &hsusb {
>         dr_mode =3D "host";
>         status =3D "okay";
> @@ -432,6 +443,11 @@
>                 function =3D "pwm1";
>         };
> =20
> +       scif0_pins: scif0 {
> +               groups =3D "scif0_data_a";
> +               function =3D "scif0";
> +       };
> +
>         scif2_pins: scif2 {
>                 groups =3D "scif2_data";
>                 function =3D "scif2";
> @@ -479,13 +495,29 @@
>         status =3D "okay";
>  };
> =20
> +&scif0 {
> +       pinctrl-0 =3D <&scif0_pins>;
> +       pinctrl-names =3D "default";
> +
> +       status =3D "okay";
> +#if 1
> +        led {
> +                compatible =3D "serdev,led";
> +                current-speed =3D <9600>;
> +        };                                                           =20
> +#else
> +        key {
> +                compatible =3D "serdev,key";
> +                current-speed =3D <9600>;
> +        };
> +#endif
> +};
>  &scif2 {
>         pinctrl-0 =3D <&scif2_pins>;
>         pinctrl-names =3D "default";
> =20
>         status =3D "okay";
>  };
> -
>  &sdhi2 {
>         /* used for on-board eMMC */
>         pinctrl-0 =3D <&sdhi2_pins>;
> --- 0001/drivers/tty/serdev/Makefile
> +++ work/drivers/tty/serdev/Makefile    2021-11-20 23:08:15.925462579 +09=
00
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> -serdev-objs :=3D core.o
> +serdev-objs :=3D core.o foobar.o barfoo.o
> =20
>  obj-$(CONFIG_SERIAL_DEV_BUS) +=3D serdev.o
> =20
> --- /dev/null
> +++ work/drivers/tty/serdev/barfoo.c    2021-11-20 23:42:21.628591406 +09=
00
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Serdev Push Switch Device Driver Prototype
> + * Copyright (C) 2021 Magnus Damm
> + *
> + * Detect a key press using the RX pin function of an UART
> + *
> + * This assumes the RX pin is kept in high state one way or the other and
> + * the push switch will pull down the pin once asserted.
> + *
> + * The idea is that any kind of RX errors will be treated as a key press:
> + * Frame errors, Parity errors and/or Break
> + *
> + * Currently with the RX line being idle asserting the switch results in:
> + * # [   18.627197] barfoo_receive_buf 1:=20
> + * [   18.627283] 0x00=20
> + * [   18.636261] sh-sci e6e60000.serial: frame error
> + * [   18.653335]=20
> + * [   18.653335] barfoo_receive_buf - done
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/serdev.h>
> +
> +struct key_priv {
> +       struct serdev_device *serdev;
> +       u32 bps;
> +};
> +
> +static int key_receive_buf(struct serdev_device *serdev,
> +                             const unsigned char *buf, size_t size)
> +{
> +       int k;
> +
> +       printk("barfoo_receive_buf %d: ", (int)size);
> +
> +       for (k =3D 0; k < size; k++) {
> +         printk("0x%02x ", buf[k]);
> +       }
> +      =20
> +       printk("\nbarfoo_receive_buf - done\n");
> +
> +       return size;
> +}
> +
> +static const struct serdev_device_ops key_serdev_device_ops =3D {
> +       .receive_buf =3D key_receive_buf,
> +       .write_wakeup =3D serdev_device_write_wakeup,
> +};
> +
> +static int key_probe(struct serdev_device *serdev)
> +{
> +       struct key_priv *p;
> +       int ret;
> +
> +       p =3D devm_kzalloc(&serdev->dev, sizeof(*p), GFP_KERNEL);
> +       if (!p)
> +               return -ENOMEM;
> +
> +       p->serdev =3D serdev;
> +       dev_set_drvdata(&serdev->dev, p);
> +
> +       if (of_property_read_u32(serdev->dev.of_node, "current-speed", &p=
->bps))
> +               return -EINVAL;
> +      =20
> +       serdev_device_set_client_ops(serdev, &key_serdev_device_ops);
> +       ret =3D devm_serdev_device_open(&serdev->dev, serdev);
> +       if (ret)
> +               return ret;
> +
> +       serdev_device_set_baudrate(serdev, p->bps);
> +       serdev_device_set_flow_control(serdev, false);
> +       return serdev_device_set_parity(serdev, SERDEV_PARITY_NONE);
> +}
> +
> +static void key_remove(struct serdev_device *serdev)
> +{
> +};
> +
> +static const struct of_device_id key_of_match[] =3D {
> +       { .compatible =3D "serdev,key" },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, key_of_match);
> +
> +static struct serdev_device_driver key_driver =3D {
> +       .driver =3D {
> +               .name           =3D "serdev-key",
> +               .of_match_table =3D of_match_ptr(key_of_match),
> +       },
> +       .probe  =3D key_probe,
> +       .remove =3D key_remove,
> +};
> +module_serdev_device_driver(key_driver);
> --- /dev/null
> +++ work/drivers/tty/serdev/foobar.c    2021-11-20 23:42:35.800592298 +09=
00
> @@ -0,0 +1,121 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Serdev LED Device Driver Prototype
> + * Copyright (C) 2021 Magnus Damm
> + *
> + * Control brightness of an LED using the TX pin of an UART
> + *
> + * At this time two levels of brightness are supported:
> + * Brightness 1: Make LED lit by setting UART TX pin to idle state
> + * Brightness 0: Send dim data pattern 0x01 which keeps pin mostly low
> + *
> + * The above UART data patterns may optionally be used with an external =
open
> + * drain circuit driving both the LED and a push switch using a single p=
in.
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/serdev.h>
> +#include <linux/workqueue.h>
> +
> +struct led_priv {
> +       struct serdev_device *serdev;
> +       u32 bps;
> +       struct led_classdev lcd;
> +       unsigned int led_brightness;
> +       struct delayed_work work;
> +       unsigned char buf[128]; /* dim pattern data */
> +};
> +
> +static void led_work(struct work_struct *work)
> +{
> +       struct led_priv *p =3D container_of(work, struct led_priv, work.w=
ork);
> +       unsigned int bits_queued;
> +       int ret;
> +
> +       /* wait in case all dim pattern data is not sent out yet */
> +       serdev_device_wait_until_sent(p->serdev, 0);
> +      =20
> +       if (p->led_brightness) {
> +               /* uart line idle state is high so do nothing */
> +               return;
> +       }
> +
> +       /* output continuous dim pattern */
> +       ret =3D serdev_device_write_buf(p->serdev, p->buf, sizeof(p->buf)=
);
> +       bits_queued =3D (ret > 0 ? ret : 1) * 10;
> +       schedule_delayed_work(&p->work, (HZ * bits_queued) / p->bps);
> +}
> +
> +static void led_brightness_set(struct led_classdev *lcdp,
> +                              enum led_brightness brightness)
> +{
> +       struct led_priv *p =3D container_of(lcdp, struct led_priv, lcd);
> +
> +       p->led_brightness =3D (int)brightness;
> +       schedule_delayed_work(&p->work, 0);
> +}
> +
> +static const struct serdev_device_ops led_serdev_device_ops =3D {
> +       .write_wakeup =3D serdev_device_write_wakeup,
> +};
> +
> +static int led_probe(struct serdev_device *serdev)
> +{
> +       struct led_priv *p;
> +       int ret;
> +
> +       p =3D devm_kzalloc(&serdev->dev, sizeof(*p), GFP_KERNEL);
> +       if (!p)
> +               return -ENOMEM;
> +
> +       p->serdev =3D serdev;
> +       dev_set_drvdata(&serdev->dev, p);
> +
> +       if (of_property_read_u32(serdev->dev.of_node, "current-speed", &p=
->bps))
> +               return -EINVAL;
> +      =20
> +       memset(p->buf, sizeof(p->buf), 1); /* almost zero brightness */
> +       INIT_DELAYED_WORK(&p->work, led_work);
> +       p->lcd.name =3D dev_name(&serdev->dev);
> +       p->lcd.max_brightness =3D 1;
> +       p->lcd.brightness_set =3D led_brightness_set;
> +
> +       ret =3D devm_led_classdev_register_ext(&serdev->dev, &p->lcd, NUL=
L);
> +      =20
> +       serdev_device_set_client_ops(serdev, &led_serdev_device_ops);
> +       ret =3D devm_serdev_device_open(&serdev->dev, serdev);
> +       if (ret)
> +               return ret;
> +
> +       serdev_device_set_baudrate(serdev, p->bps);
> +       serdev_device_set_flow_control(serdev, false);
> +       return serdev_device_set_parity(serdev, SERDEV_PARITY_NONE);
> +}
> +
> +static void led_remove(struct serdev_device *serdev)
> +{
> +       struct led_priv *p =3D dev_get_drvdata(&serdev->dev);
> +
> +       cancel_delayed_work_sync(&p->work);
> +};
> +
> +static const struct of_device_id led_of_match[] =3D {
> +       { .compatible =3D "serdev,led" },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, led_of_match);
> +
> +static struct serdev_device_driver led_driver =3D {
> +       .driver =3D {
> +               .name           =3D "serdev-led",
> +               .of_match_table =3D of_match_ptr(led_of_match),
> +       },
> +       .probe  =3D led_probe,
> +       .remove =3D led_remove,
> +};
> +module_serdev_device_driver(led_driver);
