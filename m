Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3EBD2A9738
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Nov 2020 14:45:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727353AbgKFNpM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Nov 2020 08:45:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727342AbgKFNpM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Nov 2020 08:45:12 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EB59C0613CF
        for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Nov 2020 05:45:12 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id s30so1999872lfc.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Nov 2020 05:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tFaaHkEZDXkZw7mcXitvww1WQi+lH9aVg20pXq1ppCQ=;
        b=AzSON4OcTiZTErjvNJ8J0hIanSqC5Az0EoeoKVGuINfoHdHZg5BwdConxyJCa1pKty
         Evwtr2Dh4f6H288yjXruzhm+9dyKcIB2Qi7aPJNC9/wMc3Wg/BniZf75gDvCEgyV83nb
         s2w9/p500HUWRzYnVVFFA2RYyMR0Wb8uk1hKI9aStZSmndNHP/VupUVWpKuWD4r1QYQl
         /wgx+TrVclBVqEvJybXvSYe9Kt/x6uK9Uxh0q+/C/fVByy0jz/ez372HpUOxAQ7HsaHh
         59k5mCm/T8HxQZYyXNmIiLY5fDYHob0qCWWxuC1/kWzvreJSd+TCWhky9TIhri0Ztdjw
         9oyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tFaaHkEZDXkZw7mcXitvww1WQi+lH9aVg20pXq1ppCQ=;
        b=LqZ0znZpSnEz7JHQJytf1YEirghQNjsOVK4/YhpGohtsIkBKjYIDnItVYSrbSc6PQ+
         wEqHBtzXG6z+m/v96iGr+LMWGrkF3tMcWluTLUWEzUia73SM6wl9B0wDL/TlALuMFMMd
         tfgNTYk5rihYTtNNmE0LG19GYvuTtUXH/lXBrHyb9XOmdC4OMRrdRN9Kwixw3I7jbhDB
         sIlStzVC7vTxgQOJ7CS1nD/VieFvFULWv+dIepfEw6CF5r2iazg7JF/dbOjhuFT5w720
         Q9oLhzPp8wIpdPnwlu4TlLiFTtdgbiIDlu2Y1rBCAe5TwoXQqdRIWbZVh9JBchtkfxxX
         z64A==
X-Gm-Message-State: AOAM530yTkAhwTO5dvu84oljlci5tyHJJEKopCer8xxEVt/3yZSgUMJ1
        g5zDXIQUIqqreMlGmlsDiusiST4b8jhUTOThdKsupg==
X-Google-Smtp-Source: ABdhPJyWSHxi1tQV8EQby75x5Z0Et6RvcJdIJRQogh9Gp81MCwEMVm+LRT9B9Zs5gzv1i+Uu1O1U6Y8Bz3sWlTsv7Uk=
X-Received: by 2002:a19:f00b:: with SMTP id p11mr885482lfc.585.1604670310747;
 Fri, 06 Nov 2020 05:45:10 -0800 (PST)
MIME-Version: 1.0
References: <20201030002850.6495-1-linus.walleij@linaro.org> <20201101093654.GC1166694@ravnborg.org>
In-Reply-To: <20201101093654.GC1166694@ravnborg.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 6 Nov 2020 14:45:00 +0100
Message-ID: <CACRpkdbdEVj0stJRbUDb3AVdZ0kVJP=z1-=DzB2J3aY+DgfPMg@mail.gmail.com>
Subject: Re: [PATCH] fbdev/sh_mobile: Drop unused include
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Nov 1, 2020 at 10:36 AM Sam Ravnborg <sam@ravnborg.org> wrote:
> On Fri, Oct 30, 2020 at 01:28:50AM +0100, Linus Walleij wrote:
> > The driver includes <linux/gpio.h> but doesn't use any symbols
> > from this file.
> >
> > Cc: Magnus Damm <magnus.damm@gmail.com>
> > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > Cc: linux-renesas-soc@vger.kernel.org
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> Thanks, I went ahead and applied this to drm-misc-next.
> And then I remembered you have commit right too :-(

Thanks! It is always better if someone else does it anyways!

Yours,
Linus Walleij
