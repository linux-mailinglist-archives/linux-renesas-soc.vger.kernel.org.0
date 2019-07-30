Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 587F97A3F6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2019 11:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbfG3JXt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Jul 2019 05:23:49 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52382 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731007AbfG3JXs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Jul 2019 05:23:48 -0400
Received: by mail-wm1-f67.google.com with SMTP id s3so56405245wms.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2019 02:23:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IVKY/KEUXjTWN+bYP3M9li6aLpvlVa9sTGtOM6kUeiU=;
        b=M+0yiMqtFk8AboqK+1OaND0/m2YwluxoYHyC7x1YF2eJ1Up8Re1WvfFL0xxw+RTrn2
         4FDWJUQ0p0KXpF0wERHIezB0EqMNiPC11tPZ0PhN5BxOxtZYDNNheJGlWREkPIxsABjL
         se/LhHWhr5eREoglxOQ8nyxvN+t7VMAb7yzKyCvMWn+GpOwB/CQfcxxjC65W4/FNQVCw
         PRYEkka8BtWxhMMHrlhyr26n1dAmSxOvzVsKFSqa8ztDeaaVZFdkzfafYtPfXqjGGuZ2
         xhhHB2tDd5VCTL93mJnkeNjKn5C40/L1ysi99SlopoSMkZuxYGIOn0v7EUrBiidG08FR
         3m+Q==
X-Gm-Message-State: APjAAAXjK6gNj7QfKupoHHnkndCTl4RkNb7AVCg/XKNgv48radBHQJdi
        iAj5ZgiljhE/51ji4aqKPxTpBUImFYgGNqaypeQ=
X-Google-Smtp-Source: APXvYqyFeh5CWq4lx5qP/Lw6wykdQGeWP2Ty9SqBR2iBLJHWuDQBk7YcFYjciyT2+R2xAH4drl8Z8kyjyYjieNyymmA=
X-Received: by 2002:a05:600c:254b:: with SMTP id e11mr97212692wma.171.1564478625893;
 Tue, 30 Jul 2019 02:23:45 -0700 (PDT)
MIME-Version: 1.0
References: <1563905015-2911-1-git-send-email-ykaneko0929@gmail.com> <CAMuHMdWwMfduK_G3_YRxyuYsmd51Hmj5UJshRvZjZ+zNVo-CVQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWwMfduK_G3_YRxyuYsmd51Hmj5UJshRvZjZ+zNVo-CVQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Jul 2019 11:23:34 +0200
Message-ID: <CAMuHMdVBpZwxNQ1apL_DkTLL_9SPFdX52cdswbvhEzCrChTzAA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: ulcb-kf: sort nodes
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jul 30, 2019 at 11:14 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Tue, Jul 23, 2019 at 8:03 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> > Sort nodes.
> >
> > If node address is present
> >    * Sort by node address, grouping all nodes with the same compat string
> >      and sorting the group alphabetically.
> > Else
> >    * Sort alphabetically
> >
> > This should not have any run-time effect.
> >
> > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
>
> You forgot to sort the i2c slave nodes.
> As this kind of patches is hard to rebase and rework, I'm fixing that up while
> applying:
>
> --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> @@ -83,6 +83,56 @@
>  };
>
>  &i2c2 {
> +       i2cswitch2: i2c-switch@71 {
> +               compatible = "nxp,pca9548";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x71>;
> +               reset-gpios = <&gpio5 3 GPIO_ACTIVE_LOW>;
> +
> +               /* Audio_SDA, Audio_SCL */
> +               i2c@7 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <7>;
> +
> +                       pcm3168a: audio-codec@44 {
> +                               #sound-dai-cells = <0>;
> +                               compatible = "ti,pcm3168a";
> +                               reg = <0x44>;
> +                               clocks = <&clksndsel>;
> +                               clock-names = "scki";
> +
> +                               VDD1-supply     = <&snd_3p3v>;
> +                               VDD2-supply     = <&snd_3p3v>;
> +                               VCCAD1-supply   = <&snd_vcc5v>;
> +                               VCCAD2-supply   = <&snd_vcc5v>;
> +                               VCCDA1-supply   = <&snd_vcc5v>;
> +                               VCCDA2-supply   = <&snd_vcc5v>;
> +
> +                               ports {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       mclk-fs = <512>;
> +                                       port@0 {
> +                                               reg = <0>;
> +                                               pcm3168a_endpoint_p: endpoint {
> +
> remote-endpoint = <&rsnd_for_pcm3168a_play>;
> +                                                       clocks = <&clksndsel>;
> +                                               };
> +                                       };
> +                                       port@1 {
> +                                               reg = <1>;
> +                                               pcm3168a_endpoint_c: endpoint {
> +
> remote-endpoint = <&rsnd_for_pcm3168a_capture>;
> +                                                       clocks = <&clksndsel>;
> +                                               };
> +                                       };
> +                               };
> +                       };
> +               };
> +       };
> +
>         /* U11 */
>         gpio_exp_74: gpio@74 {
>                 compatible = "ti,tca9539";
> @@ -153,56 +203,6 @@
>                 interrupt-parent = <&gpio6>;
>                 interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
>         };
> -
> -       i2cswitch2: i2c-switch@71 {
> -               compatible = "nxp,pca9548";
> -               #address-cells = <1>;
> -               #size-cells = <0>;
> -               reg = <0x71>;
> -               reset-gpios = <&gpio5 3 GPIO_ACTIVE_LOW>;
> -
> -               /* Audio_SDA, Audio_SCL */
> -               i2c@7 {
> -                       #address-cells = <1>;
> -                       #size-cells = <0>;
> -                       reg = <7>;
> -
> -                       pcm3168a: audio-codec@44 {
> -                               #sound-dai-cells = <0>;
> -                               compatible = "ti,pcm3168a";
> -                               reg = <0x44>;
> -                               clocks = <&clksndsel>;
> -                               clock-names = "scki";
> -
> -                               VDD1-supply     = <&snd_3p3v>;
> -                               VDD2-supply     = <&snd_3p3v>;
> -                               VCCAD1-supply   = <&snd_vcc5v>;
> -                               VCCAD2-supply   = <&snd_vcc5v>;
> -                               VCCDA1-supply   = <&snd_vcc5v>;
> -                               VCCDA2-supply   = <&snd_vcc5v>;
> -
> -                               ports {
> -                                       #address-cells = <1>;
> -                                       #size-cells = <0>;
> -                                       mclk-fs = <512>;
> -                                       port@0 {
> -                                               reg = <0>;
> -                                               pcm3168a_endpoint_p: endpoint {
> -
> remote-endpoint = <&rsnd_for_pcm3168a_play>;
> -                                                       clocks = <&clksndsel>;
> -                                               };
> -                                       };
> -                                       port@1 {
> -                                               reg = <1>;
> -                                               pcm3168a_endpoint_c: endpoint {
> -
> remote-endpoint = <&rsnd_for_pcm3168a_capture>;
> -                                                       clocks = <&clksndsel>;
> -                                               };
> -                                       };
> -                               };
> -                       };
> -               };
> -       };
>  };
>
>  &i2c4 {
>

and the second i2c bus, too, of course:

--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -206,6 +206,14 @@
 };

 &i2c4 {
+       i2cswitch4: i2c-switch@71 {
+               compatible = "nxp,pca9548";
+               #address-cells = <1>;
+               #size-cells = <0>;
+               reg = <0x71>;
+               reset-gpios = <&gpio3 15 GPIO_ACTIVE_LOW>;
+       };
+
        gpio_exp_76: gpio@76 {
                compatible = "ti,tca9539";
                reg = <0x76>;
@@ -225,14 +233,6 @@
                interrupt-parent = <&gpio5>;
                interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
        };
-
-       i2cswitch4: i2c-switch@71 {
-               compatible = "nxp,pca9548";
-               #address-cells = <1>;
-               #size-cells = <0>;
-               reg = <0x71>;
-               reset-gpios = <&gpio3 15 GPIO_ACTIVE_LOW>;
-       };
 };

 &ohci0 {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
