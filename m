Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16E343A2BAF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jun 2021 14:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbhFJMgK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 08:36:10 -0400
Received: from mail-vs1-f45.google.com ([209.85.217.45]:38540 "EHLO
        mail-vs1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbhFJMgJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 08:36:09 -0400
Received: by mail-vs1-f45.google.com with SMTP id x8so1764300vso.5;
        Thu, 10 Jun 2021 05:34:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XcGnFi3G5x2Sch7dDLtQQ+JlG+Fv9b3m7v0WJT6/z68=;
        b=Akh/EjBttnjhrWNmv61VH5PsbucjUJ7GNiWrrRGMalNMRJLKC+5vQpKzGr70YfklNe
         6Z0D/cDNbFIYO9pseapfCqc1+vs5FkjYXoG3wVVMXLdNbHbnkUTDzgf4LO7tZU9Kv2mt
         Mkip/rnLoqSQCkjXGRvS1HDYhcDxTIAr8p8Lm4bFCYzMGWrdOQ/6PF1Ymqy80/iZ6Tb3
         o1OZtS9apn70yxX0iVIUUo0vOOkbKd6wAlhZFuw8fuuc2pMrMna+fznMotbGvcKooNz5
         XY8mF0XZrXyeY4J6wS/05P5dJ8/WmxmaUgKwhGHYWkDknM/qGk9cQdaTjpYTZYfa2NEf
         M/Sw==
X-Gm-Message-State: AOAM532zLtJebHqI9gkXx9UBFXd11Yj9kVQQ2hRmxwhsoPduWzwn8ujB
        tnUZm/pgRvNC7nfRd4DWF2XSvneebX6ctliFO7Q=
X-Google-Smtp-Source: ABdhPJzmbjjXRl4XQOFYUcklOmO/KV9+auNrwWvD76LCznklLOeassh4ikQLViK02pST7b2lu6q9V4TGpHzm0BxYk04=
X-Received: by 2002:a05:6102:c4c:: with SMTP id y12mr4173492vss.18.1623328453196;
 Thu, 10 Jun 2021 05:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210609153230.6967-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210609153230.6967-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210609153230.6967-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Jun 2021 14:34:02 +0200
Message-ID: <CAMuHMdVCF2Oq5WVLoKT6r1PT7KASJGGJ2CQz5Xw7twS-NwgC3g@mail.gmail.com>
Subject: Re: [PATCH v3 10/11] arm64: dts: renesas: Add initial DTSI for
 RZ/G2{L,LC} SoC's
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 9, 2021 at 5:33 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add initial DTSI for RZ/G2{L,LC} SoC's.
>
> File structure:
> r9a07g044.dtsi  => RZ/G2L family SoC common parts
> r9a07g044l1.dtsi => RZ/G2L R9A07G044L1 SoC specific parts
> r9a07g044l2.dtsi => RZ/G2L R9A07G044L2 SoC specific parts
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.14.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
