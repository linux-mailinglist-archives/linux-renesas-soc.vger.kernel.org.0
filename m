Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECA5D3F4CD7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Aug 2021 17:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231132AbhHWPBE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Aug 2021 11:01:04 -0400
Received: from mail-vk1-f174.google.com ([209.85.221.174]:35347 "EHLO
        mail-vk1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231534AbhHWPA0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Aug 2021 11:00:26 -0400
Received: by mail-vk1-f174.google.com with SMTP id t11so4319331vkc.2;
        Mon, 23 Aug 2021 07:59:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4bdsI7s+dNrQzHAEMPavVEuBzBOxcxEA4Amk4roI2gU=;
        b=i05hINxrVSWkuDiRKWFn/E6JGm8W+P2KrTBB8VW/Yxb016SYY1ED1lVS1leix5zpRk
         PqagyTz+Os7t46OIV41XXRwHeDuY2j1C89HDdfw7dOm7pvuhb9ZYUTURPRuZFxFDQvOi
         /icW2WRmTI2JMLBraMKDkb2DBX8aAPUdbqqh/9+ck9Xjou2o57zIjhCwsPU1EaQJvYf9
         6eedo0P3yo941gvjQAwKyL2cGTIfuPIHeMlDvOhmd7bkiKA3nEInzvAoaK+yPoIVZ8iS
         hgtg1Yd72WaN1hz6AWuiy5+dW/uwI+sGqC0ml9+HQY55whiCOlk9avjMyJ9RWV1A4MCr
         GrZw==
X-Gm-Message-State: AOAM532p3fVSwPUA9QE+M0Pd+7UtF5qVKqAtH9tNg5AXDocFNg26zyPv
        VxYiydmEVnfFZdB9r9KerTfmvvHeLuGKuS43XC0=
X-Google-Smtp-Source: ABdhPJz8l/ZHoCciL7DPom2nBMezVME1sEwTR+wecbPFFfwyJXCMGGp4HZUhdtV5G38Q70ykeg63QZJ5/u3yuzw8E60=
X-Received: by 2002:ac5:c85c:: with SMTP id g28mr22192038vkm.5.1629730779496;
 Mon, 23 Aug 2021 07:59:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210815103014.21208-1-biju.das.jz@bp.renesas.com> <20210815103014.21208-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210815103014.21208-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 23 Aug 2021 16:59:28 +0200
Message-ID: <CAMuHMdWbHt1nvRucB+NERs0bOMYPUBscTZYc=UdjqimySKJnDg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] clk: renesas: r9a07g044: Add GbEthernet clock/reset
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Aug 15, 2021 at 12:30 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add ETH{0,1} clock/reset entries to CPG driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
