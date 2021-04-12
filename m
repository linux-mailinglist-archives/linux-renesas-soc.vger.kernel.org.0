Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07A5235C0F4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Apr 2021 11:23:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239576AbhDLJS0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Apr 2021 05:18:26 -0400
Received: from mail-vs1-f45.google.com ([209.85.217.45]:36816 "EHLO
        mail-vs1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240331AbhDLJOm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Apr 2021 05:14:42 -0400
Received: by mail-vs1-f45.google.com with SMTP id k124so6297063vsk.3;
        Mon, 12 Apr 2021 02:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RMA9dfTx2fDCdvWiIgA/n2H9xfZQRXkjWDrKCptCOcI=;
        b=Rl8wjxIQxIEzw55HpBAfsJub80L5s4x/OFfj5eoS8o542A4zE5X6KympE4Y6vFifHq
         KG1KKYJetbF93RQ+7nmkGAG8iU65nhNPBvBIJ3ECisAZbsUiNaOa3HGVJxmV6k1GVeCA
         4KB8I+seuUoJCuWsZgQyNOmluPtkR8JrNNrgCo+5iKNKnAWN+TxvMD3iXIixvqoooNaj
         +8wB2M3W3egpqcpkqjhcRH6hvd2/tnKc/dQi+SCJTlLQXqTs+j/Ax6biHMUVPz/UsxDy
         HVw98+r0vU5RP+izZh7UTRhTxEswCYAqjDjPLJ/jB7/9E7r7YeGsJqACIIS0C0eo5ddJ
         aivQ==
X-Gm-Message-State: AOAM532goTnY4HoDtBiy05ZSS81ShBKY4UVETF+ZZiQI2HvhGupfvmMH
        XqE4V2/iEx0RrRTd1M/hQRxV3dMT/QL5a4a0vIc=
X-Google-Smtp-Source: ABdhPJyccA87XencHrCAMYR5yNnNEecqXlW4UfCBCdYDLR1fIpeCPEsdoxJpXqZh+OYmwRKYRilBGtcty1t3aJsEnPc=
X-Received: by 2002:a67:2082:: with SMTP id g124mr4015580vsg.40.1618218862505;
 Mon, 12 Apr 2021 02:14:22 -0700 (PDT)
MIME-Version: 1.0
References: <7a384d02b85cdaac4a0e2b357582c8244b9a6f98.1617282116.git.geert+renesas@glider.be>
 <161786578706.3790633.4008870643384680138@swboyd.mtv.corp.google.com>
In-Reply-To: <161786578706.3790633.4008870643384680138@swboyd.mtv.corp.google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 12 Apr 2021 11:14:11 +0200
Message-ID: <CAMuHMdXXgkjvzUfMHNYjN7HKu8BK7s6xkeq6iULtyPb+PwGMEg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a06g032: Switch to .determine_rate()
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Gareth Williams <gareth.williams.jx@renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Stephen,

On Thu, Apr 8, 2021 at 9:09 AM Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Geert Uytterhoeven (2021-04-01 06:03:24)
> > diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
> > index 71b11443f6fc3801..c99942f0e4d4c751 100644
> > --- a/drivers/clk/renesas/r9a06g032-clocks.c
> > +++ b/drivers/clk/renesas/r9a06g032-clocks.c
> > @@ -630,11 +629,13 @@ r9a06g032_div_round_rate(struct clk_hw *hw,
> >         if (clk->index == R9A06G032_DIV_UART ||
> >             clk->index == R9A06G032_DIV_P2_PG) {
> >                 pr_devel("%s div uart hack!\n", __func__);
> > -               return clk_get_rate(hw->clk);
> > +               req->rate = clk_get_rate(hw->clk);
>
> Can this use clk_hw_get_rate()? Or it needs to be clk_get_rate() to make
> sure the rate doesn't change while querying the framework... from the
> framework? Another patch is preferred if you're interested in making the
> change.

Probably it can.  But as I don't have access to the hardware, I try to
be conservative.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
