Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA2554AB60
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jun 2022 10:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355242AbiFNICf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Jun 2022 04:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355599AbiFNIC3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Jun 2022 04:02:29 -0400
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4D50286CB;
        Tue, 14 Jun 2022 01:02:25 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id u8so5984280qvj.2;
        Tue, 14 Jun 2022 01:02:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W9UAvf0tUKl+bxGZSHlr3XS/QDJWR01UqqeQcMSmb24=;
        b=74/xrNS7d8SNbVdu90A7XZtjTDmeTWfEtCNMPcKg+zzrmADMrRzStONWP+zG/2mPhr
         gb83clmnSZR3UM25MSu7Tbc0x3AG8OcZ4+ONbuSXUls+rdUe4apuYQuF2Mnrvfl/1vii
         Ol7kBf4wX8EAYtFUcOTsKOgMEfp9Dm0XeOKFcogdNE0Y28v5OQoq9UJXzpG7fkOvDh3Z
         65E2trF0dp4ro7SUXSdgF76eBs5FI4cs742rKjsNQpsrVSVhAKpPwPtcQQArUAW+v3YZ
         fKXbNC4tPjDtNELpn6vuZdJ6/6cCVevMO4ZFSmjBr2qHzpBTSxvz5evXoaVtPnb1V71j
         M+wQ==
X-Gm-Message-State: AJIora+f11D4BE55aqBg5mjiY7z1P97vgdiPvfMJtO3fJmOxdSFnYVi4
        qVr1GEnrCPC8AH1b1Fw5bs5AQ9hWq9u6RA==
X-Google-Smtp-Source: AGRyM1sya7stc54mvPuG0bGsIKSSvX2mumiS5+z75pgMs6iuXf5c4exq4NG9lmIHIhWy0mPgajhrUw==
X-Received: by 2002:ad4:5de7:0:b0:46b:c2bd:2b5a with SMTP id jn7-20020ad45de7000000b0046bc2bd2b5amr2607404qvb.110.1655193744027;
        Tue, 14 Jun 2022 01:02:24 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id u16-20020a05620a0c5000b006a785ba0c25sm5985348qki.77.2022.06.14.01.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jun 2022 01:02:23 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id l204so13824767ybf.10;
        Tue, 14 Jun 2022 01:02:23 -0700 (PDT)
X-Received: by 2002:a25:d748:0:b0:65c:6b00:55af with SMTP id
 o69-20020a25d748000000b0065c6b0055afmr3379772ybg.365.1655193743150; Tue, 14
 Jun 2022 01:02:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220603110524.1997825-1-yoshihiro.shimoda.uh@renesas.com> <20220603110524.1997825-7-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220603110524.1997825-7-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 14 Jun 2022 10:02:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXcCvC7T16mEziCgu+ygaempjsXxZ2h6EhjtupGyVYzGA@mail.gmail.com>
Message-ID: <CAMuHMdXcCvC7T16mEziCgu+ygaempjsXxZ2h6EhjtupGyVYzGA@mail.gmail.com>
Subject: Re: [PATCH v6 6/7] arm64: dts: renesas: r8a779f0: Add UFS node
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>, avri.altman@wdc.com,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        scsi <linux-scsi@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Fri, Jun 3, 2022 at 1:05 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add UFS node for R-Car S4-8 (r8a779f0).
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Now the binding/driver parts have been accepted, I will queue this
patch in renesas-devel for v5.20, with the ufs30-clk node moved,
to preserve alphabetical sort order.

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
> +
>         pmu_a55 {
>                 compatible = "arm,cortex-a55-pmu";
>                 interrupts-extended = <&gic GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> @@ -259,6 +266,18 @@ i2c5: i2c@e66e0000 {
>                         status = "disabled";
>                 };
>
> +               ufs: ufs@e6860000 {
> +                       compatible = "renesas,r8a779f0-ufs";
> +                       reg = <0 0xe6860000 0 0x100>;
> +                       interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_HIGH>;
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

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
