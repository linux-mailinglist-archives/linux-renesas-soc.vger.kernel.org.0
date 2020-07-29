Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 934BB23264E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jul 2020 22:38:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbgG2Uiq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jul 2020 16:38:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbgG2Uip (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jul 2020 16:38:45 -0400
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1130C061794;
        Wed, 29 Jul 2020 13:38:45 -0700 (PDT)
Received: by mail-oo1-xc44.google.com with SMTP id t6so4805405ooh.4;
        Wed, 29 Jul 2020 13:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8i7JA74dcDdZD4r2vHndd0TrafQ0rw7tAC4FR7aF7N0=;
        b=u3ztOMEzQpHszSipRCwuHDFWeE+7VuScg5q+wWy9BZzxsEz4fThqqQh+Hdq//WZst9
         EYw9Pt/SXJxXGjrujN8H0Vm6GvYAKFccv0i4yzgRL1/naznbNbWfMVVuhh/GAW2TaxfV
         W3x2EO6kFsU6S8f8+Ju1kxAPA2GlNse42ICHvAeTNSlHTSwNQcjuQqc9EuJE7sS0LUkh
         Ey79hRg+aRny+8+JUYYt4RHoFAygUfH4okYRx3Tw65bWRt5SryH/Oh+Mk+E4odqCEX3c
         EtS0sWrOCE3/bh5lE8XSLrcfbkLRolDpcMN4YWbLhcrxbsI12MKObu7jRqVVwC6ScYHk
         b8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8i7JA74dcDdZD4r2vHndd0TrafQ0rw7tAC4FR7aF7N0=;
        b=a60BK/5jVc1eED8dOBwhJ/xVyNhSaMOwmGGaH/P/1s1Udjljc/K5V8vAIAZ7fD/HEz
         UZurqdFfXP4q1v638uKTE6IcYfU2jABQvVELtIW793f56N8QGHcL1n+5y6Vl7xCGlM5O
         MqZdyGKePB6iyBPgG7d04f29pdKxslI3YZkYKSPS5x+Cq/SwwFHQ32Ae1lyTqRnQ+e4h
         jzm5StSE5F7H2WPkyWurjz8e2qN6lRWXHwLnptLg68AXaD4lus9YO074oLQoXfeMGJ/j
         xXipDX/xJ4/QkATX00apTBIA+IS0MP1nTUzzsOqGUcJVeakdk+KOpQODIJASu2MgafEI
         ky/Q==
X-Gm-Message-State: AOAM531IZrFnbsM0l3YEFBoeAFcCl68WNjYWq1jEFvgkjHJHhhAVhB3e
        xt3eja8Lm2Ft6K9A1PH3HEb/ii2Ga/tBACBrKEA=
X-Google-Smtp-Source: ABdhPJy+U91ZQ6GeEgbrSsl5nCEIm7jAagWhVwoqHuIhjvjoQCh1ujevt1AmD67c2PTa/e3nSIgJaW9HesqIkiD4U38=
X-Received: by 2002:a4a:a782:: with SMTP id l2mr15095oom.62.1596055124954;
 Wed, 29 Jul 2020 13:38:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200729122602.9561-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20200729122602.9561-1-biju.das.jz@bp.renesas.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 29 Jul 2020 21:38:18 +0100
Message-ID: <CA+V-a8utOfONMXjxT56SQ9VdrzwihE-thhPvu4HLjrr_0m11Zg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: iwg22d-sodimm: Fix dt nodes sorting
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Wed, Jul 29, 2020 at 1:26 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> Some device nodes in the r8a7745-iwg22d-sodimm.dts are not sorted
> alphabetically. This patch fixes the sorting of nodes and also fixes a
> typo in the stmpe node.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> This patch is tested against renesas-devel
> ---
>  arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts | 104 ++++++++++----------
>  1 file changed, 52 insertions(+), 52 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
> index b15b1b088a32..5f7f230de529 100644
> --- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
> +++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
> @@ -53,6 +53,25 @@
>                 clock-frequency = <26000000>;
>         };
>
> +       backlight_lcd: backlight {
> +               compatible = "pwm-backlight";
> +               pwms = <&tpu 3 5000000 PWM_POLARITY_INVERTED>;
> +               brightness-levels = <0 4 8 16 32 64 128 255>;
> +               default-brightness-level = <7>;
> +       };
> +
> +       lcd_panel: lcd {
> +               compatible = "edt,etm043080dh6gp";
> +               power-supply = <&vccq_panel>;
> +               backlight = <&backlight_lcd>;
> +
> +               port {
> +                       lcd_in: endpoint {
> +                               remote-endpoint = <&du_out_rgb0>;
> +                       };
> +               };
> +       };
> +
>         rsnd_sgtl5000: sound {
>                 compatible = "simple-audio-card";
>                 simple-audio-card,format = "i2s";
> @@ -68,18 +87,6 @@
>                 };
>         };
>
> -       vccq_sdhi0: regulator-vccq-sdhi0 {
> -               compatible = "regulator-gpio";
> -
> -               regulator-name = "SDHI0 VccQ";
> -               regulator-min-microvolt = <1800000>;
> -               regulator-max-microvolt = <3300000>;
> -
> -               gpios = <&gpio0 20 GPIO_ACTIVE_LOW>;
> -               gpios-states = <1>;
> -               states = <3300000 1>, <1800000 0>;
> -       };
> -
>         vccq_panel: regulator-vccq-panel {
>                 compatible = "regulator-fixed";
>                 regulator-name = "Panel VccQ";
> @@ -89,38 +96,16 @@
>                 enable-active-high;
>         };
>
> -       backlight_lcd: backlight {
> -               compatible = "pwm-backlight";
> -               pwms = <&tpu 3 5000000 PWM_POLARITY_INVERTED>;
> -               brightness-levels = <0 4 8 16 32 64 128 255>;
> -               default-brightness-level = <7>;
> -       };
> -
> -       lcd_panel: lcd {
> -               compatible = "edt,etm043080dh6gp";
> -               power-supply = <&vccq_panel>;
> -               backlight = <&backlight_lcd>;
> -
> -               port {
> -                       lcd_in: endpoint {
> -                               remote-endpoint = <&du_out_rgb0>;
> -                       };
> -               };
> -       };
> -};
> -
> -&du {
> -       pinctrl-0 = <&du0_pins>;
> -       pinctrl-names = "default";
> +       vccq_sdhi0: regulator-vccq-sdhi0 {
> +               compatible = "regulator-gpio";
>
> -       status = "okay";
> +               regulator-name = "SDHI0 VccQ";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <3300000>;
>
> -       ports {
> -               port@0 {
> -                       endpoint {
> -                               remote-endpoint = <&lcd_in>;
> -                       };
> -               };
> +               gpios = <&gpio0 20 GPIO_ACTIVE_LOW>;
> +               gpios-states = <1>;
> +               states = <3300000 1>, <1800000 0>;
>         };
>  };
>
> @@ -150,6 +135,21 @@
>         status = "okay";
>  };
>
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
> +};
> +
>  &hscif1 {
>         pinctrl-0 = <&hscif1_pins>;
>         pinctrl-names = "default";
> @@ -171,6 +171,15 @@
>         status = "okay";
>         clock-frequency = <400000>;
>
> +       sgtl5000: codec@a {
> +               compatible = "fsl,sgtl5000";
> +               #sound-dai-cells = <0>;
> +               reg = <0x0a>;
> +               clocks = <&audio_clock>;
> +               VDDA-supply = <&reg_3p3v>;
> +               VDDIO-supply = <&reg_3p3v>;
> +       };
> +
>         stmpe811@44 {
>                 compatible = "st,stmpe811";
>                 reg = <0x44>;
> @@ -179,7 +188,7 @@
>
>                 /* 3.25 MHz ADC clock speed */
>                 st,adc-freq = <1>;
> -               /* ADC converstion time: 80 clocks */
> +               /* ADC conversion time: 80 clocks */
>                 st,sample-time = <4>;
>                 /* 12-bit ADC */
>                 st,mod-12b = <1>;
> @@ -203,15 +212,6 @@
>                         st,touch-det-delay = <5>;
>                 };
>         };
> -
> -       sgtl5000: codec@a {
> -               compatible = "fsl,sgtl5000";
> -               #sound-dai-cells = <0>;
> -               reg = <0x0a>;
> -               clocks = <&audio_clock>;
> -               VDDA-supply = <&reg_3p3v>;
> -               VDDIO-supply = <&reg_3p3v>;
> -       };
>  };
>
>  &pci1 {
> --
> 2.17.1
>
