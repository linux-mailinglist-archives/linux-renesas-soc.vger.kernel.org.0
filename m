Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD2B2207D9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2020 10:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730465AbgGOIxe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jul 2020 04:53:34 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42102 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730435AbgGOIxe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jul 2020 04:53:34 -0400
Received: by mail-ot1-f68.google.com with SMTP id g37so869001otb.9;
        Wed, 15 Jul 2020 01:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fegVhyn3STlKjt12R9hh8prB5z0M+XRshkNWgzH+c0A=;
        b=mHc61kzPm3KTsgTb4tYpSFoX9qkkpK9bCp8jdYfjOXzpDQArDgxH6RdawBLGOH2LC8
         F9PTTmratkihAlx/Ry864wnnKvtVpDfMwYAGj4cXsmpbDLCvaRPN/EVIJDXnwBW33NKr
         1UseVHR4qbePHFj8ltZ7KZpDY3TwwMuh1xYz2FMIwjUapYIRFEvewcfhJEXQ0anoaC9X
         E1BiQlecFn1PSeZF9cU6EMuySni+zIO4WNr6I8O3k88bA89PJY0rlAdVMzgR4PVsz8pt
         v3esyrqIURa24QcrfFpBjuu+IInfRPPHp1MsBZztibPLYQq4kHljxUiCG0efgNR0lO55
         Iv/w==
X-Gm-Message-State: AOAM531kN9T4QwTS4LdFEarRHozNlWRG7LiM8Bxv89xsZqqHhq7vjsLw
        0PN9/OyDOAIOTVctt/5xjiyMGQe2GlSjEqrvT7E=
X-Google-Smtp-Source: ABdhPJwzqy/71BcT98+G7u2CIKJOUb+gfsSSUeTfyxWkvI4GCs2jzfcFtPG1NotmJya2dMsYwvWAXToz7YiXdIblay8=
X-Received: by 2002:a9d:2646:: with SMTP id a64mr7385300otb.107.1594803213089;
 Wed, 15 Jul 2020 01:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200714123419.3390-1-aford173@gmail.com>
In-Reply-To: <20200714123419.3390-1-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Jul 2020 10:53:21 +0200
Message-ID: <CAMuHMdXfc4EKKOLq1yhwiFaKE1=HT+_puuj6rJZ+OgnHv2cS8g@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] arm64: dts: Introduce r8a774a1-beacon-rzg2m-kit
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Adam,

On Tue, Jul 14, 2020 at 2:34 PM Adam Ford <aford173@gmail.com> wrote:
> Beacon EmebeddedWorks, formerly Logic PD is introducing a new
> SOM and development kit based on the RZ/G2M SoC from Renesas.
>
> The SOM supports eMMC, WiFi and Bluetooth, along with a Cat-M1
> cellular radio.
>
> The Baseboard has Ethernet, USB, HDMI, stereo audio in and out,
> along with a variety of push buttons and LED's, and support for
> a parallel RGB and an LVDS display.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
> V2:  Add support for RGB display, second backlight, fix clock references,
>      fix Makefile, remove unsupported versaclock features, and fix typos.

Thanks for the update!
Looks mostly OK to me, "make dtbs_check" found a few issues, though.

> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-ex-idk-1110wr.dtb
>  dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-rev2.dtb
>  dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-rev2-ex.dtb
>  dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb
> +dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-beacon-rzg2m-kit.dtb

Please preserve alphabetical sort order.

>
>  dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n.dtb
>  dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-ex.dtb

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi

> +       lvds {
> +               compatible = "panel-lvds";
> +               power-supply = <&reg_lcd_reset>;
> +               width-mm = <223>;
> +               height-mm = <125>;
> +               backlight = <&backlight_lvds>;
> +               data-mapping = "vesa-24";
> +
> +               panel-timing {
> +                       /* 800x480@60Hz */
> +                       clock-frequency = <30000000>;
> +                       hactive = <800>;
> +                       vactive = <480>;
> +                       hsync-len = <48>;
> +                       hfront-porch = <40>;
> +                       hback-porch = <40>;
> +                       vfront-porch = <13>;
> +                       vback-porch = <29>;
> +                       vsync-len = <3>;
> +                       hsync-active = <1>;
> +                       vsync-active = <3>;

"make dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/panel/panel-timing.yaml":
lvds: panel-timing:vsync-active:0:0: 3 is not one of [0, 1]

> +                       de-active = <1>;
> +                       pixelclk-active = <0>;
> +               };
> +
> +               port {
> +                       panel_in: endpoint {
> +                               remote-endpoint = <&lvds0_out>;
> +                       };
> +               };
> +       };
> +
> +       rgb {
> +               /* Different LCD with compatible timings */
> +               compatible = "rocktech,rk070er9427";
> +               backlight = <&backlight_rgb>;
> +               enable-gpios = <&gpio1 21 GPIO_ACTIVE_HIGH>;
> +               port {
> +                       rgb_panel: endpoint {
> +                               remote-endpoint = <&du_out_rgb>;
> +                       };
> +               };

Documentation/devicetree/bindings/display/panel/panel-simple.yaml
rgb: 'power-supply' is a required property

> +       };

> +       versaclock6_bb: versaclock@6a {

As per DT generic node name rules, this should be called
"clock-controller@6a".  I'm aware that would cause issues with the
current driver implementation, so I'll accept this for now.  But it
would be good to resolve this later.

> +               compatible = "idt,5p49v6965";
> +               reg = <0x6a>;
> +               #clock-cells = <1>;
> +               clocks = <&x304_clk>;
> +               clock-names = "xin";
> +               /* CSI0_MCLK, CSI1_MCLK, AUDIO_CLKIN, USB_HUB_MCLK_BB */
> +               assigned-clocks = <&versaclock6_bb 1>,
> +                                  <&versaclock6_bb 2>,
> +                                  <&versaclock6_bb 3>,
> +                                  <&versaclock6_bb 4>;
> +               assigned-clock-rates =  <24000000>, <24000000>, <24000000>, <24576000>;
> +       };
> +};

> +       hd3ss3220@47 {
> +               compatible = "ti,hd3ss3220";
> +               reg = <0x47>;
> +               interrupt-parent = <&gpio6>;
> +               interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
> +
> +               connector {
> +                       compatible = "usb-c-connector";
> +                       label = "USB-C";
> +                       data-role = "dual";
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@1 {
> +                                       reg = <1>;
> +                                       hd3ss3220_ep: endpoint {
> +                                               remote-endpoint = <&usb3_role_switch>;
> +                                       };
> +                               };

Documentation/devicetree/bindings/connector/usb-connector.yaml
connector: ports: 'port@0' is a required property

For now, I'd ignore that, as it's a contradiction between the usb-connector
and the hd3ss3220 bindings.

> +                       };
> +               };
> +       };
> +};

> index 000000000000..97272f5fa0ab
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi

> +       versaclock5: versaclock_som@6a {

Same comment: "clock-controller@6a" (ignored for now).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
