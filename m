Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D522D39F9DA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jun 2021 17:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233598AbhFHPF1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Jun 2021 11:05:27 -0400
Received: from mail-vs1-f47.google.com ([209.85.217.47]:38802 "EHLO
        mail-vs1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233754AbhFHPF1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jun 2021 11:05:27 -0400
Received: by mail-vs1-f47.google.com with SMTP id x8so11035418vso.5;
        Tue, 08 Jun 2021 08:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1tcavaqmFgqNru+gTTtU+o+V3Wc54CY1nbaCwXIhlxU=;
        b=uIRTr4NTIrCrzyP8SpNuCQCiRF7hwTFyAUvth+zNPswaeRmLx6/XiaphAtAhbUog9L
         j8t8l2E/RPGfzVZsJiz1/8wJscJ7eKCfv1STbsgyArkDPfi1xuxIOqPJWwacodinNKTo
         s43JIQiiTCYU+qscWZAN7LBP6HUI0nBNBDpYYE249pr+nzCLSvW48nOx9DV/bPFbfjef
         4RvfEt01SzXnCUfcXV2I0WWsEaJRfmgO35cYy4OFBUqg9m6qBhysEBcyLZaQtTEfbsP2
         NkermI6r+JnN0GhJYntowmK5LNn43wTHS2eGxgb5b1TIkvyTdQxxG7/MdctclT3xnv/I
         ZNgQ==
X-Gm-Message-State: AOAM532JZoBDbkZ8yfxd8nxQJWiS3z36LpuShUvaKieH1sp3w/k/Acfe
        MfLNHlWMzl0JWdBNodry0XkL+fTDmRWkbqH8AxE=
X-Google-Smtp-Source: ABdhPJxLbvwTDX+9ZW5dPiJNBelOmingVkZ8kJ37buiWKcOpa7RYgnef9tMvJgQGeEA/J35nVuqllVSOzmn6Mcy2thE=
X-Received: by 2002:a05:6102:c4c:: with SMTP id y12mr620420vss.18.1623164609788;
 Tue, 08 Jun 2021 08:03:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210603221758.10305-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210603221758.10305-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210603221758.10305-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Jun 2021 17:03:18 +0200
Message-ID: <CAMuHMdVyEEA7q9eKRmVRSFMs8Jcfx-V9QjZJqqnf7mBeaKi8QQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/12] serial: sh-sci: Add support for RZ/G2L SoC
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 4, 2021 at 12:18 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add serial support for RZ/G2L SoC with earlycon and
> extended mode register support.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

FTR,
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
