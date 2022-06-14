Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEAD954AB6D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jun 2022 10:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355562AbiFNIGg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Jun 2022 04:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355344AbiFNIGc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Jun 2022 04:06:32 -0400
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5ACD38DA7;
        Tue, 14 Jun 2022 01:06:30 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id p31so4809192qvp.5;
        Tue, 14 Jun 2022 01:06:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nM18gvUSvYfy4DDyIOtyYW8MzMYh3/ri7inx/AlLLP4=;
        b=s4EvGhfyUExslsn09i+wq5QbHnnIRTT2xeR8cx64KkiYTVZZ+go2k0AjoD38fyfSR1
         Mh8D8feZE8npN0/Q5zgEijBMKUQ7rzAxW3eJs2/PvwDA338H4EXmuMMVfxldoNv4PesZ
         y61sNaKAnsyM6YHsrWaZOGpWEEROY3iQK4FL305NVzoRWcybPml/QC0auZ8sCNDFpO6p
         HA5UuKGpFh515UhTDQGDr3kkibhfLDKtMJR9tJGJE1yzDvKOhzZX+r4BPdqgWLBuvkF+
         UEDb4fnmI0Sl5LeEo4lf0bMD+8+4h+jx7Oy4A5c0KCa6IplTQFgD03li9LUuPpazKDQE
         QF+A==
X-Gm-Message-State: AJIora+t1I5YS0nDhjVQfi2MStIYY7xzzvvzchB8cM7Pqcsyicvl15xc
        80dV5aaTzFMx45V3rEvms36wbC/rGgfS+Q==
X-Google-Smtp-Source: AGRyM1s1I+MLIjMwTPItgh5PW89IsD9JXZAmcCiwjuF54C7OshqLqMkQxROljnvmBEH3b2XN6bHi0A==
X-Received: by 2002:a05:6214:a0c:b0:467:d578:4934 with SMTP id dw12-20020a0562140a0c00b00467d5784934mr2456725qvb.50.1655193989917;
        Tue, 14 Jun 2022 01:06:29 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id h127-20020a37b785000000b006a3325fd985sm8569754qkf.13.2022.06.14.01.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jun 2022 01:06:29 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id r3so13883605ybr.6;
        Tue, 14 Jun 2022 01:06:28 -0700 (PDT)
X-Received: by 2002:a25:7307:0:b0:65c:b98a:f592 with SMTP id
 o7-20020a257307000000b0065cb98af592mr3584597ybc.380.1655193988430; Tue, 14
 Jun 2022 01:06:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220603110524.1997825-1-yoshihiro.shimoda.uh@renesas.com> <20220603110524.1997825-8-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220603110524.1997825-8-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 14 Jun 2022 10:06:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXiVds4Yd+p=6WfUDX6VGr4nrLiZeN=atQ7NqeFoTFEsA@mail.gmail.com>
Message-ID: <CAMuHMdXiVds4Yd+p=6WfUDX6VGr4nrLiZeN=atQ7NqeFoTFEsA@mail.gmail.com>
Subject: Re: [PATCH v6 7/7] arm64: dts: renesas: r8a779f0: spider-cpu: Enable
 UFS device
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
> Enable UFS device for R-Car S4-8 Spider CPU board.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
> @@ -82,3 +82,11 @@ &scif3 {
>  &scif_clk {
>         clock-frequency = <24000000>;
>  };
> +
> +&ufs {
> +       status = "okay";
> +};
> +
> +&ufs30_clk {
> +       clock-frequency = <38400000>;
> +};

Given this relies on either the boot loader setting up ufs30_clk,
like is usually done for the PCIe bus clock, or on adding a proper
clock driver to Linux, I think this patch should be postponed.

Or perhaps the latest firmware stack has fixed the issue?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
