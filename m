Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 448471FF0E9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2020 13:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728373AbgFRLqt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Jun 2020 07:46:49 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:45197 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726946AbgFRLqs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Jun 2020 07:46:48 -0400
Received: by mail-oi1-f193.google.com with SMTP id p70so4750563oic.12;
        Thu, 18 Jun 2020 04:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IfSQztYSPvnNTRTHNXQ8aizcfc8xAWVkgC98ujeiDUM=;
        b=hxsRupqRQulf8Jh0UILooU4/psNIkzpZsb1eZccJKdIM/1LZPNvQRz67eNiV1nfdNk
         PVLY0suhxh4jFjeaNNwieBHVtctJC9c9kXcU99iUn3uAbXW9DRsVEcc7NCt1+qus8LJU
         wt/j/s/CoYFSz1kkh1fRKuXnJdE8ZVEXj42tZp6bWdk4OKjYBySoXws7U1vL7q0oKE8g
         DTXy4On+O6G7MONUcCls1vyN1MDGrAv3vCy0jayS/R7YW85QMvW02HZ5DSLygCLjxMAI
         Ilu+4zj8QQ4NvK2AO9ie+A0KKMykBcjuA+Q4T4sce4TJTaXiTfx+gbthOrz7Yd2JO6M5
         D4dw==
X-Gm-Message-State: AOAM532dBT9rcIGXe8q4BOuHx6VYru+5KNZXJPPWVWezgRCnNzp+cTpk
        PvmyMG1WsofKQH9mcA0YWL7x+pVUXqi3Hqm81OXuzg==
X-Google-Smtp-Source: ABdhPJwzX8tLwqS1A0bMxxdu7tTeBNInb4j/BCF68g6VrUw68OfyBRmbuffZmFERhb0utdaSzVyGWjaNBNG5JThwmvw=
X-Received: by 2002:a54:4006:: with SMTP id x6mr2423596oie.148.1592480807406;
 Thu, 18 Jun 2020 04:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200616162626.27944-1-uli+renesas@fpond.eu> <20200616162626.27944-2-uli+renesas@fpond.eu>
In-Reply-To: <20200616162626.27944-2-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Jun 2020 13:46:35 +0200
Message-ID: <CAMuHMdVyya9g4T-AJDXCkNB70H58N-yHVFSYMMvYA24+YmU--A@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] clk: renesas: cpg-mssr: mark clocks as critical
 only if on at boot
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jun 16, 2020 at 6:26 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> This allows us to add the RWDT clock to the list of critical clocks without
> keeping it enabled needlessly if not used.
>
> Changing the semantics of crit_mod_clks in this way is safe for the current
> user (INTC-AP) because it is never off at boot time.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v5.9.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
