Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A21AE25C15A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Sep 2020 14:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728812AbgICMvd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Sep 2020 08:51:33 -0400
Received: from mail-oo1-f67.google.com ([209.85.161.67]:46272 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728875AbgICMud (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 08:50:33 -0400
Received: by mail-oo1-f67.google.com with SMTP id r6so726857oon.13;
        Thu, 03 Sep 2020 05:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1yBWyc30bteRaNTbWi/EHvxP4KqoZ2tFWWNTbRmlkVg=;
        b=LBQe1SCYwo2RDdltUNQaSMxBfC+8NEmVEbLDKnf9raanYm12UtLTQcxzibdr1M5Zq2
         hDjw3yGtAaKFPgL1+Jr5oLXT/cOnln2rTpIIPpFB7i5J9ZIR+jiwNTYjSTqoXE+dsjK0
         7EifohrWpnTeRfrm9JbqsLvzkE502g0lKvSJxRQA+Dj0LvzzaUpsleNrxmGqcX9ny7Xf
         Vom9FwrDh3zL+QM60bF2ud8UdJ18EzQOdDrTwoZMEpYUUlf9X08UaB2PN2u/KSK/LIgR
         OSEPDF4Vb9vOEnBhJ+GkcQM7Fob1dXwvRup9o1lYo7Fvz2pURSESM4edFGwK9sZLrrnc
         EOlA==
X-Gm-Message-State: AOAM530uCZoi+7Pd260eGG0XXN/uVoJvBLMgNcpE09g3ICnf9Zkn5XO1
        dTaR/ifPaWN9FEb1gjlQymRpeBr5uZuNTZJ9eRg=
X-Google-Smtp-Source: ABdhPJwgUA8/9dTAUlU6cdfP4MyPR6AGrwuHJomj48EOQHbXLlXOR6xpU06maOKGZ+lkXERSWteneVva1v5pLewTTtE=
X-Received: by 2002:a4a:5403:: with SMTP id t3mr1634127ooa.11.1599137432385;
 Thu, 03 Sep 2020 05:50:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200831183722.8165-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200831183722.8165-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 3 Sep 2020 14:50:21 +0200
Message-ID: <CAMuHMdUnOuEppcU5XYeD0inMErPErrWZ7Ufrno4fg=VBYtc76w@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Rename vsp1-(sy|rt) clocks to vsp(s|r)
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Aug 31, 2020 at 8:37 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> VSP1 instances VSPS (which stands for "VSP Standard") and VSPR (which
> stands for "VSP for Resizing") were wrongly named as "vsp1-sy" and
> "vsp1-rt". The clock section in the SoC datasheets misunderstood the
> abbreviations as meaning VSP System and VSP Realtime, and named the
> corresponding clocks VSP1(SY) and VSP1(RT). This mistake has been
> carried over to the kernel code.
>
> This patch fixes this by renaming the clock names to "vsps" and "vspr".
>
> Inspired from commit 79ea9934b8df ("ARM: shmobile: r8a7790: Rename
> VSP1_(SY|RT) clocks to VSP1_(S|R)")
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
