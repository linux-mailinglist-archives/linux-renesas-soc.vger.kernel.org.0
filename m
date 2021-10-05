Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFBBA422B91
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Oct 2021 16:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbhJEO5u (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Oct 2021 10:57:50 -0400
Received: from mail-vs1-f49.google.com ([209.85.217.49]:34515 "EHLO
        mail-vs1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhJEO5u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Oct 2021 10:57:50 -0400
Received: by mail-vs1-f49.google.com with SMTP id d18so1389088vsh.1;
        Tue, 05 Oct 2021 07:55:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wvgHFbWrViCEKRu6yzuxfkEfhT1uqxh6DDBmzue5eBI=;
        b=3jM6/LVbE0EpFkk/yFVBiVaj8kOqSYBXLSUP1SdEeVR7WCoiSIoYzdL+wq0PMtMGxU
         pVPrpjBKoFgHu3StDEDdLwNdFD/pXd6L/LxWYEAkp+9arMKFETK0khIoUU5rOkeRlHS5
         iHhuf0p9SioQkFlKXBhl96v8ckxYQ7oeAl/CIH2+a9/Iv8hiIzSi6ZEp2v+ZbffunLJL
         7sutsq7JtWRxZAVWCgjt/cJKWr9R/QVGTZB+JmnN1fROXE2ZJrnateYge9FhIpQ5jCUR
         QD39V5qhsZri6mG3JP6himo/ugdryP3+O72ArHHXn01SyX3PwSSHTAnD7yKMB4vfxFwx
         v0mQ==
X-Gm-Message-State: AOAM530uUB0K5YvK7MuK1aSQXDm1FsdBBKoPIN4giYaKb1ck6NjeUz4l
        4CE/4xctMbxoGPPL+sdSSbC3vziDp1V7+u0xkdk=
X-Google-Smtp-Source: ABdhPJzNXRAXsBTqyyR29m7Wc6S+ZaCmOOIMfpnoBh9hLLki5MizcvoylNeXKvoKkGMpd6W/GGbsSjssBr44NS3EQt8=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr19257155vsl.9.1633445759140;
 Tue, 05 Oct 2021 07:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210928155852.32569-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210928155852.32569-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Oct 2021 16:55:47 +0200
Message-ID: <CAMuHMdVg08Ya1RGFWtK9czWwOg3d_60rh-1NkmLoR1DwBYF69Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a07g044: Add SPI Multi I/O Bus
 controller node
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Sep 28, 2021 at 5:59 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add SPI Multi I/O Bus controller node to R9A07G044 (RZ/G2L) SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
