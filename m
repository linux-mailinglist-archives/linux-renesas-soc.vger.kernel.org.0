Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAEA2382B1E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 May 2021 13:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236736AbhEQLfL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 May 2021 07:35:11 -0400
Received: from mail-vs1-f46.google.com ([209.85.217.46]:37830 "EHLO
        mail-vs1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236712AbhEQLfL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 May 2021 07:35:11 -0400
Received: by mail-vs1-f46.google.com with SMTP id s15so2930702vsi.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 May 2021 04:33:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WnV2YQeZDTz7S03Lwh6WBC1uU8C22+RO61rF7rJA6fs=;
        b=sW+Io/qBsOCDVO1kEz1GQH3nzf6zn0rS4G4YtH1H6DneiNjVmnqpBRWbk/wEVVhV6/
         fdVJHQjgyCpwLtzrriSQIin9ZNGJSPIuxkAKi4tKiRCH65vMrP2xMQJQMsS3ggvAHWHN
         vF19W2hO407SjPUIEMsFd6NyaYUgicAyM5MPrIONqdaLdkpZV2qNkDpGrTFuiUZPzLl7
         W1lc7aubtrdtOHF5qND7WDddv0E+INiUnWvrUzgl8vl3gF7VW9hufQT5kZuRtvAlKqVf
         NqRpLhuDOqi7+nbI5+j1GFR0d/KXPGstINX6P6vMusl6LQzQsT0b9HFK111x94Xk/OIV
         OH/g==
X-Gm-Message-State: AOAM531+zUnUopmVD9n8OZ9t7HbyNhhmZyIjeHhLfbe5lRxY6e7xFFXu
        PobkDIZC+1mwSSDiIPHntWpZf3vvWy+hz38AIKs=
X-Google-Smtp-Source: ABdhPJxV5UAbMkQfVsPJ8gVvwwg2pjRm4vw+F902eVcQiQc/lSRfbPbHBKjfJyok97X3s9xpduVn0yGs0To3808VZ1Y=
X-Received: by 2002:a67:3c2:: with SMTP id 185mr50141867vsd.42.1621251231170;
 Mon, 17 May 2021 04:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <87k0nyci2t.wl-kuninori.morimoto.gx@renesas.com> <87h7j2ci1k.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87h7j2ci1k.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 May 2021 13:33:39 +0200
Message-ID: <CAMuHMdXtnSenYk3sE6Pp89YeuUf=RsU5ueOLKX3ip9j1NMBKCQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a77995: add R-Car Sound support
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        hoai.luu.ub@renesas.com,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Harunobu Kurokawa <harunobu.kurokawa.dn@renesas.com>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        Hien Dang <hien.dang.eb@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

Thanks for your patch!

On Mon, May 17, 2021 at 2:36 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds R-Car Sound and Audio-DMAC support for D3.
>
> 1st note is that D3 doesn't have audio-clk-c, but is
> required from driver. This patch uses null-clk for it.
>
> 2nd note is that D3 has SSI3/4 and SRC5/6 only, but driver
> requres from SSI0/SRC0. This patch has disabled SSI/SRC for it.

I think it would be better to fix the driver instead.

>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 176 ++++++++++++++++++++++
>  1 file changed, 176 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> index 2319271c881b..0950f39711eb 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> @@ -43,6 +43,33 @@ L2_CA53: cache-controller-1 {
>                 };
>         };
>
> +       /*
> +        * The external audio clocks are configured as 0 Hz fixed frequency
> +        * clocks by default.
> +        * Boards that provide audio clocks should override them.
> +        */
> +       audio_clk_a: audio_clk_a {

Please use alphabetical sort order when adding nodes without unit
addresses.

> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <0>;
> +       };
> +
> +       audio_clk_b: audio_clk_b {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <0>;
> +       };
> +
> +       /*
> +        * R8A77995 doesn't have audio_clk_c, * but is required from driver.
> +        * Create NULL clock for it.
> +        */
> +       null_clk: null_clk {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <0>;
> +       };

Please do not add nodes not matching the hardware description, but fix
the driver instead. ("DT describes hardware, not software policy").

> +
>         extal_clk: extal {
>                 compatible = "fixed-clock";
>                 #clock-cells = <0>;
> @@ -642,6 +669,48 @@ dmac2: dma-controller@e7310000 {
>                                <&ipmmu_ds1 22>, <&ipmmu_ds1 23>;
>                 };
>
> +               audma0: dma-controller@ec700000 {

Please use numerical sort order when adding nodes with unit addresses.

> @@ -1258,6 +1327,113 @@ prr: chipid@fff00044 {
>                         compatible = "renesas,prr";
>                         reg = <0 0xfff00044 0 4>;
>                 };
> +
> +               rcar_sound: sound@ec500000 {

Please use numerical sort order when adding nodes with unit addresses.

> +                       /*
> +                        * #sound-dai-cells is required
> +                        *
> +                        * Single DAI : #sound-dai-cells = <0>; <&rcar_sound>;
> +                        * Multi  DAI : #sound-dai-cells = <1>; <&rcar_sound N>;
> +                        */
> +                       /*
> +                        * #clock-cells is required for audio_clkout0/1/2/3
> +                        *
> +                        * clkout       : #clock-cells = <0>;   <&rcar_sound>;
> +                        * clkout0/1/2/3: #clock-cells = <1>;   <&rcar_sound N>;
> +                        */
> +                       compatible =  "renesas,rcar_sound-r8a77995", "renesas,rcar_sound-gen3";
> +                       reg =   <0 0xec500000 0 0x1000>, /* SCU */
> +                               <0 0xec5a0000 0 0x100>,  /* ADG */
> +                               <0 0xec540000 0 0x1000>, /* SSIU */
> +                               <0 0xec541000 0 0x280>,  /* SSI */
> +                               <0 0xec740000 0 0x200>;  /* Audio DMAC peri peri*/
> +                       reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
> +
> +                       clocks = <&cpg CPG_MOD 1005>,
> +                                <&cpg CPG_MOD 1011>, <&cpg CPG_MOD 1012>,
> +                                <&cpg CPG_MOD 1025>, <&cpg CPG_MOD 1026>,
> +                                <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
> +                                <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
> +                                <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
> +                                <&audio_clk_a>, <&audio_clk_b>, <&null_clk>, /* clk_c is NULL */
> +                                <&cpg CPG_CORE R8A77995_CLK_ZA2>;
> +                       clock-names = "ssi-all",
> +                                     "ssi.4", "ssi.3",
> +                                     "src.6", "src.5",
> +                                     "mix.1", "mix.0",
> +                                     "ctu.1", "ctu.0",
> +                                     "dvc.0", "dvc.1",
> +                                     "clk_a", "clk_b", "clk_c", "clk_i"; /* clk_c is NULL */
> +                       power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
> +                       resets = <&cpg 1005>,
> +                                <&cpg 1011>, <&cpg 1012>;
> +                       reset-names = "ssi-all",
> +                                     "ssi.4", "ssi.3";

arch/arm64/boot/dts/renesas/r8a77995-draak.dt.yaml: sound@ec500000:
resets: [[4, 1005], [4, 1011], [4, 1012]] is too short
        From schema: Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
arch/arm64/boot/dts/renesas/r8a77995-draak.dt.yaml: sound@ec500000:
reset-names: ['ssi-all', 'ssi.4', 'ssi.3'] is too short
        From schema: Documentation/devicetree/bindings/sound/renesas,rsnd.yaml

As the DTS is correct, the DT bindings should be updated.

> +                       rcar_sound,src {
> +                               src0: src-0 { status = "disabled"; };
> +                               src1: src-1 { status = "disabled"; };
> +                               src2: src-2 { status = "disabled"; };
> +                               src3: src-3 { status = "disabled"; };
> +                               src4: src-4 { status = "disabled"; };

Please drop nonexistent src channels.

> +                               src5: src-5 {
> +                                       interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
> +                                       dmas = <&audma0 0x8f>, <&audma0 0xb2>;
> +                                       dma-names = "rx", "tx";
> +                               };
> +                               src6: src-6 {
> +                                       interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
> +                                       dmas = <&audma0 0x91>, <&audma0 0xb4>;
> +                                       dma-names = "rx", "tx";
> +                               };
> +                       };
> +
> +                       rcar_sound,ssi {
> +                               ssi0: ssi-0 { status = "disabled"; };
> +                               ssi1: ssi-1 { status = "disabled"; };
> +                               ssi2: ssi-2 { status = "disabled"; };

Please drop nonexistent ssi channels.

> +                               ssi3: ssi-3 {
> +                                       interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
> +                                       dmas = <&audma0 0x07>, <&audma0 0x08>,
> +                                              <&audma0 0x6f>, <&audma0 0x70>;
> +                                       dma-names = "rx", "tx", "rxu", "txu";
> +                               };
> +                               ssi4: ssi-4 {
> +                                       interrupts = <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>;
> +                                       dmas = <&audma0 0x09>, <&audma0 0x0a>,
> +                                              <&audma0 0x71>, <&audma0 0x72>;
> +                                       dma-names = "rx", "tx", "rxu", "txu";
> +                               };
> +                       };
> +               };
>         };
>
>         thermal-zones {

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
