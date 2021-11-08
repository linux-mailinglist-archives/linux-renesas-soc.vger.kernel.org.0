Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E7244499A4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Nov 2021 17:26:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237516AbhKHQ3P (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Nov 2021 11:29:15 -0500
Received: from mail-ua1-f47.google.com ([209.85.222.47]:35601 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbhKHQ3P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Nov 2021 11:29:15 -0500
Received: by mail-ua1-f47.google.com with SMTP id q13so32651250uaq.2;
        Mon, 08 Nov 2021 08:26:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eWJ2swXUu5OhqsdPd5HpXfuzp1W1w8o29xoQZwB53+8=;
        b=aqN6EP0nbj5oWwD6Vrf/9hnKM94i51wBCzCwbcEkmxqME0n135o2LV3IJxDvd+QB32
         RplPao7VakJAUZinWG5bybFOriDg1sigfAXzzL/YubASvDDSqekA9xnwBH+T8NB2NeHz
         8aAdFPpbUtwJ4HlRFBRHvWkjXB7N+Ni3Eqjd4xAkU1rxrteK2p40gVWqTCL3aUgi7Co8
         8hDtLTPMthJfTsbMiJ4KBVSppm1FS/WRTXyeKm+07HgQMuf5GKk82Ss+REeJYv7x0gVu
         eDsO/mBHjTVsfDYrAcZLB/kteYhPSPmyI9BUj4MpPfykptMEhilOz9X6JHbihzQiPsNK
         hREA==
X-Gm-Message-State: AOAM531/jkpcMkAtU1Ljxr85doAJPzGxH2PNRqlWyqyeyn/puxjzliZc
        DYgBrRq1Ri1DUe6c6FgsX7J602giX3pOj2dk
X-Google-Smtp-Source: ABdhPJyIJSEuKEqO1tzzjZxsAyvjJ7HoLYOcJ18+rs3kV6RCVScLbhlfeF6D+o8Bvhhac8E+wdRLgw==
X-Received: by 2002:a05:6102:3912:: with SMTP id e18mr930216vsu.36.1636388790004;
        Mon, 08 Nov 2021 08:26:30 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id r11sm2905392uad.7.2021.11.08.08.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 08:26:29 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id p37so31471937uae.8;
        Mon, 08 Nov 2021 08:26:29 -0800 (PST)
X-Received: by 2002:a05:6102:1354:: with SMTP id j20mr29931929vsl.41.1636388789364;
 Mon, 08 Nov 2021 08:26:29 -0800 (PST)
MIME-Version: 1.0
References: <20211103195600.23964-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211103195600.23964-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211103195600.23964-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Nov 2021 17:26:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVjXrAhOm0JvE=RH5nARjuv03UKmo45vzRECDSWoXNbtw@mail.gmail.com>
Message-ID: <CAMuHMdVjXrAhOm0JvE=RH5nARjuv03UKmo45vzRECDSWoXNbtw@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r9a07g044: Add SCI[0-1] nodes
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

On Wed, Nov 3, 2021 at 8:56 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add SCI[0-1] nodes to r9a07g044 (RZ/G2L) SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

> --- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> @@ -176,6 +176,36 @@
>                         status = "disabled";
>                 };
>
> +               sci0: serial@1004d000 {

Please keep sort order (by unit address, but grouped by type).

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
