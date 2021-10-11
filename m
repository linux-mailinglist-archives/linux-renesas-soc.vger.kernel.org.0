Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D29B3429659
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Oct 2021 20:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233000AbhJKSGH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Oct 2021 14:06:07 -0400
Received: from mail-vk1-f176.google.com ([209.85.221.176]:42876 "EHLO
        mail-vk1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbhJKSGG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Oct 2021 14:06:06 -0400
Received: by mail-vk1-f176.google.com with SMTP id o42so6174vkf.9;
        Mon, 11 Oct 2021 11:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AmnuAZqsMepyH3M2sGG04fkksvVXn4AOD83h0URBDgg=;
        b=VsfdI20tUE7ZKIgVdtYnO+IQWTkI/hkPwJ+DZI2BiRILxHOfRdX2T4iEHiMMeGQrzK
         q9HbJhU5Iupz2prs7kgVFtwh8mkbI2ga/Q5XPumWaQbQ3q5ouDgUT5uD2BmZkAUDopcT
         +6osr/z9xyF9TWC2uL7dem9B8KvQ90XmsYx+ddhp3X2l9Rkhvqtz0mmwZAWuXUqYN6rG
         aH5bj8l+k6iIQePwZ/th1tmkGxSFc3MOw76b3Z0wyI100QbzeA//PcZr6JRzMz3Zis3Z
         bacnIwr0+ASySy6mFmC9jpODrQuaVZElwMAvxL+QpMtgStensLu/GDAxFpDfF/vI28Sf
         n6yg==
X-Gm-Message-State: AOAM533wuUSUlAHhEqwhFuwmVNG78WE9Psf41j5ayyNjkHAVjfeRGU6l
        VGNEXqwC2LkS5+DmYSJ8lLbQ0p17hByzjj56xaM=
X-Google-Smtp-Source: ABdhPJz4Fvm6IlRx/lLL+BUxSablZZ1rGXQg99sTDsFN8DSXC9i06AKHDuaQxPTRh2dgGzLSrGuTiczVCBZeR2PhGx8=
X-Received: by 2002:a1f:1841:: with SMTP id 62mr21240915vky.26.1633975445911;
 Mon, 11 Oct 2021 11:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210928200804.50922-1-wsa+renesas@sang-engineering.com> <20210928200804.50922-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210928200804.50922-6-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Oct 2021 20:03:54 +0200
Message-ID: <CAMuHMdW+Rw3c1gttYJ+LCOkKsDuOaP0mkNab3RmtscEQXV5rMg@mail.gmail.com>
Subject: Re: [RFC PATCH 5/9] clk: renesas: gen3-cpg: remove outdated SD_SKIP_FIRST
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

clk: renesas: rcar-gen3: ...

On Tue, Sep 28, 2021 at 10:08 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> We handle it differently meanwhile.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Perhaps this should be folded into the previous patch?

Regardless:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
