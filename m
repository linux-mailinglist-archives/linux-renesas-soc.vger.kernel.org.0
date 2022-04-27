Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F143451193B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Apr 2022 16:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235656AbiD0NTi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Apr 2022 09:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235417AbiD0NTd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Apr 2022 09:19:33 -0400
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E96C1C129;
        Wed, 27 Apr 2022 06:16:03 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id e128so1207474qkd.7;
        Wed, 27 Apr 2022 06:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NWpDKmO96yHGs1kChCwXWQfLDFtY2YOgofhCN7WDdyA=;
        b=KqC+qLOxcvc7iB/gCaWMOwVy4qsxHn5cmXd4W9kam18HJZAMsgTJQ+IbRsOpitwYnU
         bRsaTW6oLodfWgCiY9itCKmAsdJs2zF5FJ3/oAI4S7thmht8/O2ur3QJV6Pl6SDhE55B
         kyh0IJvvPHy0hwWBwWyqbDHS6xuO2cBKGao3BdykYBc/7hAiggxQ+fdkdu8OD6HtGccD
         bqwzy8ncYdVEHgIIj9ZNs3xF1h/KIJU3N81A86oC5VnMJfXVXmGyTTzl6KkRntJb1AJL
         UGnqe/10JoRTV7vo+xlEkHIbZkqxpBIft9/Vgz4Siztqex6lUqP1j2E/6e9Bsv43U60u
         SPGw==
X-Gm-Message-State: AOAM530Hej6RNz7p+S3ijdJvz5G5BcHt3sEolj1uJ/BCD3KmjC3+cv6W
        xboMsdye2CKUhswsZTssMdEH3H1Q2URfpQ==
X-Google-Smtp-Source: ABdhPJwGc8ef7iVzo7D/ZEQKrDRx+i8DdwMWs0dof3p+FfFBymMTbNUzj99kKkc5iPBsgDbpXLb/LA==
X-Received: by 2002:a37:f518:0:b0:680:a811:1ef7 with SMTP id l24-20020a37f518000000b00680a8111ef7mr15841763qkk.765.1651065273447;
        Wed, 27 Apr 2022 06:14:33 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id r83-20020a37a856000000b0069ed4436a49sm8065103qke.87.2022.04.27.06.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 06:14:33 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id w17so3259787ybh.9;
        Wed, 27 Apr 2022 06:14:33 -0700 (PDT)
X-Received: by 2002:a25:9e89:0:b0:63c:ad37:a5de with SMTP id
 p9-20020a259e89000000b0063cad37a5demr25600842ybq.342.1651065272892; Wed, 27
 Apr 2022 06:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220420025450.289578-1-yoshihiro.shimoda.uh@renesas.com> <20220420025450.289578-7-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220420025450.289578-7-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 27 Apr 2022 15:14:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU7_nqwT8J_OKLez9GDU8sCiP_PB1ioZBK5YvevToOsXg@mail.gmail.com>
Message-ID: <CAMuHMdU7_nqwT8J_OKLez9GDU8sCiP_PB1ioZBK5YvevToOsXg@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] arm64: dts: renesas: r8a779f0: Add UFS node
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>, avri.altman@wdc.com,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        scsi <linux-scsi@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Wed, Apr 20, 2022 at 10:31 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add UFS node for R-Car S4-8 (r8a779f0).
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

> --- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> @@ -40,6 +40,13 @@ extalr_clk: extalr {
>                 clock-frequency = <0>;
>         };
>
> +       ufs30_clk: ufs30-clk {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               /* This value must be overridden by the board */
> +               clock-frequency = <0>;
> +       };

This matches what we typically do for the PCIe reference clock,
but relies on the currently-missing clock generator initialization
in the boot loader stack.

> +
>         pmu_a55 {
>                 compatible = "arm,cortex-a55-pmu";
>                 interrupts-extended = <&gic GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> @@ -258,6 +265,18 @@ i2c5: i2c@e66e0000 {
>                         status = "disabled";
>                 };
>
> +               ufs: ufs@e6860000 {
> +                       compatible = "renesas,r8a779f0-ufs";
> +                       reg = <0 0xe6860000 0 0x100>;
> +                       interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_HIGH>;

The R-Car S4-8 interrupt mapping spreadsheet lists two interrupts.

> +                       clocks = <&cpg CPG_MOD 1514>, <&ufs30_clk>;
> +                       clock-names = "fck", "ref_clk";
> +                       freq-table-hz = <200000000 200000000>, <38400000 38400000>;
> +                       power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
> +                       resets = <&cpg 1514>;
> +                       status = "disabled";
> +               };
> +
>                 scif3: serial@e6c50000 {
>                         compatible = "renesas,scif-r8a779f0",
>                                      "renesas,rcar-gen4-scif", "renesas,scif";

The rest LGTM, so with the above resolved:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
