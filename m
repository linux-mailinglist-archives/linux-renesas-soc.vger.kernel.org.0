Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E6B9415AA7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Sep 2021 11:14:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239946AbhIWJPe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Sep 2021 05:15:34 -0400
Received: from mail-vk1-f170.google.com ([209.85.221.170]:35619 "EHLO
        mail-vk1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239801AbhIWJPd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Sep 2021 05:15:33 -0400
Received: by mail-vk1-f170.google.com with SMTP id x207so2320179vke.2;
        Thu, 23 Sep 2021 02:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N8Y5RGfhMXkz6CFprn5sYICY7H7gqXWGsHvuUWQjn2s=;
        b=ur9Y8up5PVICRVWy5TJl/Ps0zY57s0Yct6ATJboSDOcweaJRHX8al2hH9FgwNxSg5B
         iBrwHQGMuDOLS9iZVgZyfC7kUxjQmkovY0/xk3yG9oPfcA4JWXefp6N9se75aAB3Tlio
         Xi95m6hRQ1Rrh/jMgQrnmMUrB3q+OloI8Wjv03xF+wRU4Gvcvljj7FjL7YeyPLodBPto
         JV28bG09LkpUkXdXLVqyn+zj2l4+YC+JNCmS2p04hEwyZgiBKoHXY+I3VX2wlMdwhJ22
         ZcyHZ8SppIeyid/KNpb3tePBitrlm6Z21zX/MhcRxhRxbT8ZYgjok5/IM3VLJaNbA3a4
         PScg==
X-Gm-Message-State: AOAM533Vjj6841rSZ+3HZzyfJ/OSoxbAvhm+PTFBJhCmSgvgH1cTSuho
        l1wWVSva+qHAC2fMalYEsK6Jn5Htj1HNNCY0M8t1n8WtOHo=
X-Google-Smtp-Source: ABdhPJz9LWhHl5jNMvedYUlpGY6A4Sni9dnP9b8rYiXU04lUQVatj2FNhmWhh/Qr9QBuM143xHT50/9050f6eT0JYso=
X-Received: by 2002:a1f:1841:: with SMTP id 62mr2269385vky.26.1632388442213;
 Thu, 23 Sep 2021 02:14:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210922112405.26413-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210922112405.26413-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Sep 2021 11:13:51 +0200
Message-ID: <CAMuHMdXGyC0ksEd6ksOMbDD+um9Zv35uZ5NXtwTfvOx3hsELwA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: renesas: r9a07g044: Add IA55_CLK and DMAC_ACLK
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Sep 22, 2021 at 1:36 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add IA55_CLK and DMAC_ACLK as critical clocks.
>
> Previously it worked ok, because of a bug in clock status function
> and the following patch in this series fixes the original bug.
>
> Fixes: c3e67ad6f5a2 ("dt-bindings: clock: r9a07g044-cpg: Update clock/reset definitions")
> Fixes: eb829e549ba6 ("clk: renesas: r9a07g044: Add DMAC clocks/resets")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue as a fix in renesas-clk-for-v5.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
