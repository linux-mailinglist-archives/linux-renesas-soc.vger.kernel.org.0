Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62AF8296003
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Oct 2020 15:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2900087AbgJVNaI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Oct 2020 09:30:08 -0400
Received: from mail-oo1-f65.google.com ([209.85.161.65]:34896 "EHLO
        mail-oo1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2900085AbgJVNaH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Oct 2020 09:30:07 -0400
Received: by mail-oo1-f65.google.com with SMTP id f2so349396ooj.2;
        Thu, 22 Oct 2020 06:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CFaQWSOXV9qt2/l1JFdMm791rib9Pg4tPJgreWRaO/U=;
        b=De9w+94zK4pxvOv2Gtwbc9lIDUjG5z0ep8SsF0IyIp8wNXHD0P+EiQOip/o4N+J9Ng
         9yX/qrfFYZrX6BmYZ3PuaENkhehtgtO/2jdAmAVOC83StwC6rZHseTi3aSWo9k4aFy1/
         9v/+pTdlezQJiJcBVLGgiFkoDNogOPsWN0fIqFrdE8QvBeq4RUtxDLIFl+L18wAwfr/F
         nKBZfUxDl3VMqyVvj1djrTB5BQ/fTluc2x4XtrgVELPUtu5etZL00wY7sGQilE5QiW7u
         5C2eWIpn8jQmmaDtsEdSxKdvDW5Pr2ZU3eJ2N/vpMTB4ehvJ0/owqDkILKB5aDVofLi0
         HvXA==
X-Gm-Message-State: AOAM530fILpBPEnNL3jJxdKojX50nrpbrbTifGIvio6mCcEUgYP6d963
        7DfmeDQ1mdxTmW72bgf9nNWigeSdS6LqmsztXJM=
X-Google-Smtp-Source: ABdhPJy5cDPAALrFpc4iA+ABqdhedWKLPxIg1aOR9/kjFKpsAInfU3r5SWBoa102Ex4efGrT7KZCBACH/KmYSx8UhMI=
X-Received: by 2002:a4a:dbd3:: with SMTP id t19mr2021384oou.40.1603373406821;
 Thu, 22 Oct 2020 06:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <20201016121709.8447-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20201016121709.8447-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20201016121709.8447-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 22 Oct 2020 15:29:55 +0200
Message-ID: <CAMuHMdUc56QdWcBb4rNtcN1C7OK8qrWxofo4qGCaEfWz4-bBkQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: renesas: r8a774a1: Add RPC clocks
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Oct 16, 2020 at 2:17 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Describe the RPCSRC internal clock and the RPC[D2] clocks derived from it,
> as well as the RPC-IF module clock, in the RZ/G2M (R8A774A1) CPG/MSSR
> driver.
>
> Inspired by commit 94e3935b5756 ("clk: renesas: r8a77980: Add RPC clocks").
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.11.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
