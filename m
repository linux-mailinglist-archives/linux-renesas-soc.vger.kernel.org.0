Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AA8D175BE5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2020 14:40:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727734AbgCBNkM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Mar 2020 08:40:12 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44495 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727627AbgCBNkM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Mar 2020 08:40:12 -0500
Received: by mail-ot1-f65.google.com with SMTP id v22so5155473otq.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Mar 2020 05:40:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yhx+kuGysS0PSx+bjM/5y5GIqcKEHTx7Ep2AaXO6H5k=;
        b=I7MA93puqJP2S3VLsgKB7emgtG9YarTiMXLocSkEf3ErEXbgavl8AYgoKB2BP4/y2I
         +HPahr2vkGmnmykSgK4TDZdUnGXdgk0pZw2FycZmbVtw+0xMTcjU2SxWLbzByPImEdNB
         ztI8+L6toLlqw05S5ojZ8GTlTTVHrmUxCZaCCZCxevbD8TIUokJLFolxeKO3jvnXjcq6
         FdqlS0xUnHfqfO2QR5V/wozBVrwo1ccDdNlM2rnNycx8oS1W5H1yHZ4P1Nd8ovvv7XW5
         gixD3YNTSR6Liqgrj6qw/XVT/GUHtuskkPVLxE/MyrY6wu3VQvHnGjt3jWTVpXLGPXIf
         2U9w==
X-Gm-Message-State: ANhLgQ0ouiX/eb+1wtSrMx6ePx6bAlfKQUJJEYBxpt+9Z4kYi2JRXZAa
        fgFyKb9Q102NSPb+auWQPBQQyW7zmWGBfBJLOyTjeIZZ
X-Google-Smtp-Source: ADFU+vtL/oJcc5r++kl6H0DTY4DDjsV0QfI6Cux4314Wwq9gyyFcJOTAUoAPh59eL6q1hj/9f8pRWGrGp0Bd2agkRrY=
X-Received: by 2002:a05:6830:1e9c:: with SMTP id n28mr133840otr.107.1583156410394;
 Mon, 02 Mar 2020 05:40:10 -0800 (PST)
MIME-Version: 1.0
References: <1580323253-3281-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
 <1580323253-3281-2-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
In-Reply-To: <1580323253-3281-2-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 Mar 2020 14:39:58 +0100
Message-ID: <CAMuHMdVDLrE8yu_vhhT=4u58XYPn=OAmf6XwO=qT2n=sxkLHXw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: iwg22d-sodimm: enable LCD panel
To:     Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <chris.paterson2@renesas.com>,
        "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marian-Cristian,

On Wed, Jan 29, 2020 at 7:58 PM Marian-Cristian Rotariu
<marian-cristian.rotariu.rb@bp.renesas.com> wrote:
> On the Generic SODIMM Development Platform there is an RGB LCD panel
> directly connected to the DU output. It uses the TPU0 as backlight, one
> GPIO pull-up configuration for power enable, R[2:7], G[2:7], B[2:7],
> VSYNC, HSYNC, DU0_DISP and, DU0_CLK as inputs.
>
> There is no encoder between the DU and the panel, therefore the default
> connector driver is used.
>
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
> +++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
> @@ -79,6 +79,52 @@
>                 states = <3300000 1
>                           1800000 0>;
>         };
> +
> +       vccq_panel: regulator-vccq-panel {
> +               compatible = "regulator-fixed";
> +               regulator-name = "Panel VccQ";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               gpio = <&gpio1 13 GPIO_ACTIVE_LOW>;
> +               enable-active-high;
> +       };
> +
> +       backlight {
> +               compatible = "pwm-backlight";
> +               pwms = <&tpu 3 5000000 GPIO_ACTIVE_LOW>;
> +               brightness-levels = <0 4 8 16 32 64 128 255>;
> +               default-brightness-level = <7>;
> +               pinctrl-0 = <&backlight_pins>;
> +               pinctrl-names = "default";
> +       };
> +
> +       lcd {
> +               compatible = "edt,etm043080dh6gp", "simple-panel";

According to the latest panel-simple.yaml, the "simple-panel" should be
dropped...

> +               power-supply = <&vccq_panel>;
> +
> +               ports {
> +                       port@0 {
> +                               lcd_in: endpoint {
> +                                       remote-endpoint = <&du_out_rgb0>;
> +                               };
> +                       };
> +               };

... and there should only be a single "port".

> +       };
> +};
> +
> +&du {
> +       pinctrl-0 = <&du0_pins>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +
> +       ports {
> +               port@0 {
> +                       endpoint {
> +                               remote-endpoint = <&lcd_in>;
> +                       };
> +               };
> +       };
>  };
>
>  &avb {
> @@ -150,11 +196,21 @@
>                 function = "avb";
>         };
>
> +       backlight_pins: backlight {
> +               renesas,groups = "tpu_to3";

According to my schematics, DISP_BL_GPIO is connected to TPUTO3_C(GP0_21),
so this should be "tpu_to3_c".

> +               renesas,function = "tpu";
> +       };
> +
>         can0_pins: can0 {
>                 groups = "can0_data";
>                 function = "can0";
>         };
>
> +       du0_pins: du0 {
> +               renesas,groups = "du0_rgb666", "du0_sync", "du0_disp", "du0_clk0_out";
> +               renesas,function = "du0";
> +       };
> +
>         hscif1_pins: hscif1 {
>                 groups = "hscif1_data", "hscif1_ctrl";
>                 function = "hscif1";

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
