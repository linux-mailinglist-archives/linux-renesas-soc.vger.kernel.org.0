Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEB944C27AD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Feb 2022 10:13:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbiBXJLX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Feb 2022 04:11:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232755AbiBXJLO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Feb 2022 04:11:14 -0500
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6899D1B3722;
        Thu, 24 Feb 2022 01:10:39 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id b37so559992uad.12;
        Thu, 24 Feb 2022 01:10:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LbWtTNbTjOWP+Sl6jm6eOO1czwhuya4IeIpU5Bfy+cw=;
        b=F9dCvrR637cZOJg19doiyaA7lvf6dqlzNv/1TzYmmSKS61/w7M6pSgt14Nl2Uybfi8
         cXxi+lREiKMwXXFA9fPGmzRK/v42Y/Sig878tA5zhUB9uhDP9Xo3K2mAnM+wNVLVp2ty
         aPCjYUfLmRW9Lo2SRjL897S1cUkvaEc25IuSoi34SWI/m4jtbbyMatgLmbABqle0tcqt
         Sn5Y/+mFInqEupBxHu8S3hhPN/RW36LcpBfG8/eqdgRn9PMgY0FREu4PohzsM2X9zP9Y
         +rX1tf29Cl+TSzPyl3OfQpEAPoxNtbkFGWz5pekmtn3L4cUvcLr0M5U1M9GILovirQRs
         KJ/A==
X-Gm-Message-State: AOAM5337rWqcCORqr7xJTzJEm+PnMgEOoAF/iqOlUIZ89eToBuohwP8f
        ERB/M+U/1BbchMHy3zP34btmWG3qfnzb6w==
X-Google-Smtp-Source: ABdhPJyVHcpOaqQaWiBsiCJO9Q3e5gDmaIHFmKJScc7tGnrMGBng629ACAEXwCKC8ZxUP62Ffdk/yg==
X-Received: by 2002:ab0:3c4:0:b0:341:ef97:dc24 with SMTP id 62-20020ab003c4000000b00341ef97dc24mr698935uau.141.1645693838378;
        Thu, 24 Feb 2022 01:10:38 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id s25sm312268vkm.21.2022.02.24.01.10.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 01:10:38 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id d26so1470117vsh.0;
        Thu, 24 Feb 2022 01:10:37 -0800 (PST)
X-Received: by 2002:a05:6102:4411:b0:31b:6df1:3b80 with SMTP id
 df17-20020a056102441100b0031b6df13b80mr714234vsb.5.1645693837468; Thu, 24 Feb
 2022 01:10:37 -0800 (PST)
MIME-Version: 1.0
References: <20220223165813.24833-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220223165813.24833-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 24 Feb 2022 10:10:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV0CBj-uf5pdyzu8+o3Q3uy5aLz0G_y4xwi4rRLrOWWKg@mail.gmail.com>
Message-ID: <CAMuHMdV0CBj-uf5pdyzu8+o3Q3uy5aLz0G_y4xwi4rRLrOWWKg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzg2lc-smarc-som: Enable watchdog
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
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

On Wed, Feb 23, 2022 at 5:58 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable watchdog{0, 1, 2} interfaces on RZ/G2LC SMARC EVK.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.18.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
