Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6587B4EDBAA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Mar 2022 16:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237534AbiCaO27 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Mar 2022 10:28:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237550AbiCaO25 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Mar 2022 10:28:57 -0400
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B04021DF0E;
        Thu, 31 Mar 2022 07:27:08 -0700 (PDT)
Received: by mail-qv1-f43.google.com with SMTP id a5so19826518qvx.1;
        Thu, 31 Mar 2022 07:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jlIMe9sv+wgzo0JqpzhcxhPs0NywybZMLTd0SfGlhWc=;
        b=a2SqAWg6G3F0HNe6e9582JgYdP/3eHoOQeYqMbiL4jhiDBz4ACFlYUIf6i2sTjcKX2
         HnettJgQo26yPxP6djIFu5Msdo5BtbxgagbjRmsT+NlYHuvOt4Hvk2o0CwLvniq8epQN
         1GilhdmaoUAZ6/EK1llSSyZbVxe0jpfd0JLlxCASO/fsQGUaSAbermaNG11neJv+fqPr
         pGoEhhILOSeYa/3DOWmcNIp5eRFzoY5Z2fzanZGf+jH31k5U3+K0ByCXqUz170uShWBX
         zkuW/+hs40amFAnBJfVdPoHxk4xDyL0j3UTGMm0BxAEQKTifiokTEuxr0HSMtWM9RcAo
         5DZQ==
X-Gm-Message-State: AOAM532HSV4JkLmnwUxxxVtUeiTsrrUWMT3nIeTyCUu5N2SqVJKmcbsI
        wywcZazxMQms4xButGWTZkAvktSnql1PvQ==
X-Google-Smtp-Source: ABdhPJyesV6fO4PnM3RjOoHVdOyvg86dUsSrnCxvbDES9h8+KBsmv10rw55D0LIxLD1ZoZl5kxkOIg==
X-Received: by 2002:a05:6214:c48:b0:440:cded:f2ab with SMTP id r8-20020a0562140c4800b00440cdedf2abmr35563289qvj.18.1648736827365;
        Thu, 31 Mar 2022 07:27:07 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id s11-20020a05620a16ab00b0067b3bc3c35bsm12279825qkj.113.2022.03.31.07.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Mar 2022 07:27:07 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id e203so33763335ybc.12;
        Thu, 31 Mar 2022 07:27:06 -0700 (PDT)
X-Received: by 2002:a05:6902:1146:b0:634:6b3f:4908 with SMTP id
 p6-20020a056902114600b006346b3f4908mr4256212ybu.613.1648736826671; Thu, 31
 Mar 2022 07:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220315142644.17660-1-biju.das.jz@bp.renesas.com> <20220315142644.17660-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220315142644.17660-8-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 31 Mar 2022 16:26:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXE+ighcDngxWzECsNd1bVnb3+RRmrEKWzpmGJFrFYEEQ@mail.gmail.com>
Message-ID: <CAMuHMdXE+ighcDngxWzECsNd1bVnb3+RRmrEKWzpmGJFrFYEEQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] arm64: dts: renesas: Add initial device tree for
 RZ/G2UL Type-1 SMARC EVK
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
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Tue, Mar 15, 2022 at 3:27 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add basic support for RZ/G2UL SMARC EVK (based on R9A07G043U11):
> - memory
> - External input clock
> - CPG
> - DMA
> - SCIF
>
> It shares the same carrier board with RZ/G2L, but the pin mapping is
> different. Disable the device nodes which are not tested and delete the
> corresponding pinctrl definitions.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
> @@ -0,0 +1,111 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/G2UL Type-1 SMARC EVK board
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +#include "r9a07g043.dtsi"
> +#include "rzg2ul-smarc-som.dtsi"
> +#include "rz-smarc-common.dtsi"
> +
> +/ {
> +       model = "Renesas SMARC EVK based on r9a07g043u11";
> +       compatible = "renesas,smarc-evk", "renesas,r9a07g043u11", "renesas,r9a07g043";

Can you please send a patch to add this combination to
Documentation/devicetree/bindings/arm/renesas.yaml?

Thanks!

> +};


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
