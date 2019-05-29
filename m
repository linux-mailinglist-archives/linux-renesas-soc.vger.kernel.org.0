Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB9B42DC95
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2019 14:22:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbfE2MWA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 May 2019 08:22:00 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36573 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbfE2MWA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 May 2019 08:22:00 -0400
Received: by mail-lj1-f193.google.com with SMTP id m22so2003934ljc.3;
        Wed, 29 May 2019 05:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bBCvXQBWezX5oQnnIF6aj/NHX/gYVuCgmxSnO4uATXY=;
        b=ll6UftQwiKoVzTB87TNt3f22wfV80waytPOMd6Uf76yzisz4wp3UIS2DbJZevKfBiQ
         g9Kkzm6/ArKh70ghIXl81V/yi3A3tiujLAAfUAAihlwIGgV92omipOeUgcAWzfMtseuw
         ChCNdTcbw/OsTyfj5EHSdIKnN0GkLTvZVrcbAu3pVHpWzfuB9i/GBLICBGPC9NKikdo1
         oWr8Yg+XjC5AaGuByA6S7HfXZQ31zzybiZLSuyapNcdgaYKTTABg22wpf+tXMzD5wtB6
         77KZlmrpYa/e2BgCcGVl/FqhhsFVdmCS2j6nTPHqDMCmCRW1FHFyul+dZb36e5PasHdn
         A6xA==
X-Gm-Message-State: APjAAAUnvRnkMGtNWSWY1iUOtqAJ32rta61M0+KiRm7rsjIcxURCjuna
        PxWK1IUGVUEpctjIiGiF1z5FRTbmjyb32QD1A1Y=
X-Google-Smtp-Source: APXvYqzzMEdCKJ43RGgUZ13aXOTWb6ukphKy6nRDrd4SVKFdCq21MudK89FWSlkYrKPxlENrEvekv/QRJ7xCHd/SZs8=
X-Received: by 2002:a2e:6e01:: with SMTP id j1mr171734ljc.135.1559132518318;
 Wed, 29 May 2019 05:21:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190527123514.7198-1-geert+renesas@glider.be>
 <20190529102939.ssdpktlqldexwgkv@verge.net.au> <20190529103521.owcbusdsl6coq52d@verge.net.au>
In-Reply-To: <20190529103521.owcbusdsl6coq52d@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 29 May 2019 14:21:46 +0200
Message-ID: <CAMuHMdVREhppSf2j_qzbf3tZ9kr+EibHA_t9QYS0mKwLCc+zLQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: mstp: Remove error messages on
 out-of-memory conditions
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Wed, May 29, 2019 at 12:35 PM Simon Horman <horms@verge.net.au> wrote:
> On Wed, May 29, 2019 at 12:29:39PM +0200, Simon Horman wrote:
> > On Mon, May 27, 2019 at 02:35:14PM +0200, Geert Uytterhoeven wrote:
> > > pm_clk_create() and pm_clk_add_clk() can fail only when running out of
> > > memory.  Hence there is no need to print error messages on failure, as
> > > the memory allocation core already takes care of that.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
>
> On a closer look, I see that pm_clk_add_clk() can return
> errors for other reasons. Can they never occur in this use-case?

These are the cases where con_id is non-NULL, right?
pm_clk_add_clk() calls __pm_clk_add() with con_id == NULL.

Or do you mean the case where clk is an error pointer? That cannot
happen neither.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
