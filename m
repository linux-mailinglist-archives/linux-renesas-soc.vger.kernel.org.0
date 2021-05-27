Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04F89392A9A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 May 2021 11:19:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235731AbhE0JVR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 May 2021 05:21:17 -0400
Received: from mail-vs1-f48.google.com ([209.85.217.48]:37732 "EHLO
        mail-vs1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235608AbhE0JVR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 May 2021 05:21:17 -0400
Received: by mail-vs1-f48.google.com with SMTP id s15so31254vsi.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 May 2021 02:19:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fn2sYOhO16uBjEIQpu/SfUgnlFThJxwbMyUa+rhHd90=;
        b=G3qbOPv9SpxS1FvFM9lUkJ/8IKwNuvs68DiZZgQybHi4e/Gqmf4NO+laEqN8nCcNJZ
         JkhkpA9v2jwOGexmb0qNSj4MFoqGypPTNaM07AgM30roAuyiqxedlF+uQnT/E8mZOJ+o
         r8mL386ZIIJMtyXzsWOEGPB4iu8N4RR6+kIM/4ReB1Y3/dbFGqIfxBJdl2aFFrNLQF76
         HP/xJLZkaHgbaNhRd3td6QoQ1gINaiR+OduXZraF5ChSVu7QpPcHSnWmzWdTy3CDWfg2
         IeOYpUJBWxrKrmaRmPp4Kn/52Xni+WIpo56KOQdwbeHTeyvPlCzEqDU+VyYSIvujpY73
         rNYQ==
X-Gm-Message-State: AOAM532yFg1SVCJExFLR3EXHgvbWlBtxDbz4nnXSdKjDbh8amYusatXJ
        lekBglfWNd3+l42Asm90YjGOzhAXpWI92+nbf/g=
X-Google-Smtp-Source: ABdhPJynay3P8yvsKyqlNY3kEN6SVc2hoVpAwfenQWNdCKbaUcC5qlsn/h7CRFUwd3eKOHjGTzUAWn5ziiDWV+57FCE=
X-Received: by 2002:a05:6102:392:: with SMTP id m18mr1142346vsq.40.1622107183489;
 Thu, 27 May 2021 02:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <87r1hslrno.wl-kuninori.morimoto.gx@renesas.com> <87o8cwlrmp.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o8cwlrmp.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 May 2021 11:19:31 +0200
Message-ID: <CAMuHMdX3OM-7y+LxkQWkTm2ZgUDTP3=ATs48zFP2CSkRU_DwFg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: renesas: r8a77995: add R-Car Sound support
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Harunobu Kurokawa <harunobu.kurokawa.dn@renesas.com>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        Hien Dang <hien.dang.eb@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Thu, May 27, 2021 at 6:36 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds R-Car Sound and Audio-DMAC support for D3.
> One note is that D3's SSI0-2 and SRC0-4 are not connected.
>
> Link: https://lore.kernel.org/r/87k0nyci2t.wl-kuninori.morimoto.gx@renesas.com
> Link: https://lore.kernel.org/r/87sg2boi3h.wl-kuninori.morimoto.gx@renesas.com
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> @@ -1015,6 +1032,155 @@ vin4: video@e6ef4000 {
>                         status = "disabled";
>                 };
>
> +               rcar_sound: sound@ec500000 {
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
> +                                <&audio_clk_a>, <&audio_clk_b>,
> +                                <&cpg CPG_CORE R8A77995_CLK_ZA2>;
> +                       clock-names = "ssi-all",
> +                                     "ssi.4", "ssi.3",
> +                                     "src.6", "src.5",
> +                                     "mix.1", "mix.0",
> +                                     "ctu.1", "ctu.0",
> +                                     "dvc.0", "dvc.1",
> +                                     "clk_a", "clk_b", "clk_i";
> +                       power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
> +                       resets = <&cpg 1005>,
> +                                <&cpg 1011>, <&cpg 1012>;
> +                       reset-names = "ssi-all",
> +                                     "ssi.4", "ssi.3";
> +                       status = "disabled";
> +
> +                       rcar_sound,ctu {
> +                               ctu00: ctu-0 { };
> +                               ctu01: ctu-1 { };
> +                               ctu02: ctu-2 { };
> +                               ctu03: ctu-3 { };
> +                               ctu10: ctu-4 { };
> +                               ctu11: ctu-5 { };
> +                               ctu12: ctu-6 { };
> +                               ctu13: ctu-7 { };
> +                       };
> +
> +                       rcar_sound,dvc {
> +                               dvc0: dvc-0 {
> +                                       dmas = <&audma0 0xbc>;
> +                                       dma-names = "tx";
> +                               };
> +                               dvc1: dvc-1 {
> +                                       dmas = <&audma0 0xbe>;
> +                                       dma-names = "tx";
> +                               };
> +                       };
> +
> +                       rcar_sound,mix {
> +                               mix0: mix-0 { };
> +                               mix1: mix-1 { };
> +                       };
> +
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

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
