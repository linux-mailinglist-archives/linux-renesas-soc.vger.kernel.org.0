Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF50A42891C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Oct 2021 10:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235301AbhJKIus (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Oct 2021 04:50:48 -0400
Received: from mail-vk1-f180.google.com ([209.85.221.180]:45666 "EHLO
        mail-vk1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235276AbhJKIus (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Oct 2021 04:50:48 -0400
Received: by mail-vk1-f180.google.com with SMTP id n201so6352970vkn.12;
        Mon, 11 Oct 2021 01:48:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1aeFD4VCEtvpntedXN2wonuONFnslI2U6PG159VE9/Q=;
        b=fqB3MrqcpIyjLVEKZaGccURpBYpgHwgAyFL6pGCQyb2MVJY6NdAERPqq6GAYWnCq4G
         YW3XizHlLOHWrwJQYC2LWcaB8hdFxiu4k6y5l8KJVRdBViF17dB/r2rI9zGfpTsO72xt
         pMuwuTEHXmaHaM5XW8a1zhQPky05PG0rxsyJwmTMkwj11t2Csf53iIzfrTZeou7xBWwD
         8H63YvVggSBHBozMjPEJLyi7XW3Ia7UBPevQLe1jHPYkfSuO/OJdDy6uZqnkABtEKSdC
         voSjU548MNt31f66PRAim3nxwft5rriKSxxmeclWO/4kTLGDHjQKce4KqykXcxAlDzDj
         +7aQ==
X-Gm-Message-State: AOAM533B22a4NADQtDeqpPuNyiteqy3UlYihDhNZg+uop/qCYdvN2Vbb
        dvmUrHUjJxuWauiG910hnu4ZkoATorlzU/AkUIc=
X-Google-Smtp-Source: ABdhPJwuqAHBqYXH6Th+PlMd8EcB7KdduSUPW8099X4Dfi50op/Nix3HkgVAzrDvQ0PGVSl6ojV0JE5z934i/BvjW+I=
X-Received: by 2002:a1f:1604:: with SMTP id 4mr2295126vkw.11.1633942128083;
 Mon, 11 Oct 2021 01:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211010142520.21976-1-biju.das.jz@bp.renesas.com> <20211010142520.21976-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211010142520.21976-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Oct 2021 10:48:37 +0200
Message-ID: <CAMuHMdXV72=c6WSQnohp8T0F_tctR-n9eNY+wAwGcf-Asvpjkg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] arm64: dts: renesas: rzg2l-smarc-som: Enable eMMC
 on SMARC platform
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
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Oct 10, 2021 at 4:25 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> RZ/G2L SoM has both 64 GB eMMC and microSD connected to SDHI0.
>
> Both these interfaces are mutually exclusive and the SD0 device
> selection is based on the XOR between GPIO_SD0_DEV_SEL and SW1[2]
> switch position.
>
> This patch sets GPIO_SD0_DEV_SEL to high in DT. Use the below switch
> setting logic for device selection between eMMC and microSD slot
> connected to SDHI0.
>
> Set SW1[2] to position 2/OFF for selecting eMMC
> Set SW1[2] to position 3/ON for selecting microSD
>
> This patch enables eMMC on RZ/G2L SMARC platform by default.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Sorted gpio-sd0-pwr-en-hog node
> v2->v3:
>  * Fixed typo 64Gb to 64 GB in commit message and comment
>  * Fixed typo SDO->SD0 in comment.
> v1->v2:
>  * Updated the comment from 64Gb to 64 GB for eMMC size
>  * Added angular brackets for states
>  * Fix the gpio-hog node names
>  * Fixed label names to match with the schematics

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
