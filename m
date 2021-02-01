Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E951630A3E5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Feb 2021 10:00:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232520AbhBAI7s (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 1 Feb 2021 03:59:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232482AbhBAI7r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Feb 2021 03:59:47 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36BBDC061574
        for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Feb 2021 00:59:07 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id d2so17950671edz.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 01 Feb 2021 00:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YO7mBFE+tnPFG3MuqP+RM+WeWF+bBTQ2zr7iiZtekbQ=;
        b=RSP/ixQYEtW3D0MCcu+tNTgMGsf2IwC2u33UCCMgjKlXvTI4wzttUmK6LoKgsojdIm
         bm0XLDdxE/xjRG3ZGUXzsWz2S5U2EfjqVqCYP4AwUV/6XCL/WDIKavosiRMHNND1NZSB
         dW5ErpSx/7KGPHwQTE3mnVHWHe3eHAbfl0ZQV3i+wQCxgO7f/qq/aIv67gN1T54Ua0ge
         PIMJLSbDPtpxEPYDwTlajukWWE4zyzSY9FnG+TjfTJAb2KgnSUzpyEWW8yj437Xk7KT8
         a2LJqyRk4i/DN0vRWAQi8fAXl9Kh2bxbaoWUsuUCkzEGGNwTsuhT8240foGgp6Gilk3D
         kThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YO7mBFE+tnPFG3MuqP+RM+WeWF+bBTQ2zr7iiZtekbQ=;
        b=IixmSI/344GtUvNVUMiFfLvWliM4pfdlnAAeCz24ESyyZqtSAWimGwGKUflb6wdQ78
         McUfMTV7hPpDTUifzgmcVec0Jv+Z4+oSxeZqPRZRxAOHCx2BlcxITrP7KH/rJ5xM7F7z
         nWfggXJ4K9EHOaSpBGEBfdxcVaGecfk+BK31XbTQnhbt5Qg6sLyI362o09TUQBSeW9AX
         Vz5QdB6YRWA36Ws8pEZxmvwvLLJnTAdV/Q7o1Bl/zRsZSZJdDiH+3flEfYqEYJfBrJKv
         skAcqWroBtrZozj3T2JeRtiMhIUDUbVRQvTLVvNnJPOPrVJbfecmyJMzZvcuEQj9GcgX
         OjyA==
X-Gm-Message-State: AOAM531wb6ZZjisWZQ/l0J1d3y9SBSVqWTZ+vosxwY6GKv4BmNe7JxRt
        0cspqCbEfKp6yDAPrhRHl6EV+ptEW7dfMkNHMm83aA==
X-Google-Smtp-Source: ABdhPJxsUimNM1ukmldmIBP8S69QEICasyFTYbyT1ZQ+7qzmjRxlGlzUAQrBe0QQu1AvqU/n4owlss0KVc9KEFXpxPo=
X-Received: by 2002:a50:b742:: with SMTP id g60mr17477914ede.113.1612169945982;
 Mon, 01 Feb 2021 00:59:05 -0800 (PST)
MIME-Version: 1.0
References: <20210105105914.13172-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdUT8CEyJ1ERmLr443SuZgemFF40cDviSGwhYM7ZnN_b_g@mail.gmail.com> <20210127103919.GC928@ninjato>
In-Reply-To: <20210127103919.GC928@ninjato>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 1 Feb 2021 09:58:55 +0100
Message-ID: <CAMpxmJWKEHsdHAnQt-ozVPHDcjSPrTo3c7D8gGFiPvwrA8TzwQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpiolib: remove shadowed variable
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jan 27, 2021 at 11:39 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Tue, Jan 05, 2021 at 12:14:34PM +0100, Geert Uytterhoeven wrote:
> > On Tue, Jan 5, 2021 at 12:00 PM Wolfram Sang
> > <wsa+renesas@sang-engineering.com> wrote:
> > > After refactoring, we had two variables for the same thing. Remove the
> > > second declaration, one is enough here. Found by cppcheck.
> > >
> > > drivers/gpio/gpiolib.c:2551:17: warning: Local variable 'ret' shadows outer variable [shadowVariable]
> > >
> > > Fixes: d377f56f34f5 ("gpio: gpiolib: Normalize return code variable name")
> > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Ccing Linus & Bartosz
>

For some reason this is not on patchwork and I also don't have it in
my inbox, can you resend, please?

Bart
