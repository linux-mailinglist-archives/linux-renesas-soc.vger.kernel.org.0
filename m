Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2967D41E19
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 09:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406681AbfFLHoG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 03:44:06 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36045 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406598AbfFLHoG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 03:44:06 -0400
Received: by mail-lf1-f65.google.com with SMTP id q26so11300763lfc.3;
        Wed, 12 Jun 2019 00:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FJx8u6P0hBbbSm0i3xS5/ivknGurjcnK61cV5tUoLhs=;
        b=ST1r3LpIBFqBzoY9t9Zlo7eBAD5ezs8on0NuW+oPDCoFjrglLb6uqJgVG6yKbVQBBO
         dEfwk2mdMA0cJsqoA7zGoTm/1sj77mCWEWTfZZW5UTgzAXgbN5e7CXuYW6RiBetSCUUB
         PO21CQcsXSNebjWatme1h06/0H0IDxIJqaFv24B8lLJby1Tph4nQlUk7bQ0NxxQm14j6
         f+cAa0EZC5DY+TST0oxo6e3v/IcSpkj/jAJmOKXTY9wVWIA2QDReppq7upUXhx0QqEh2
         ejP9OTi72HgFrE8ZQMpVXkYWczzrdJhAC5IzFY6ctAxuo8wGXAfmLlwmrKeYwgYNEpIL
         e8Ew==
X-Gm-Message-State: APjAAAV+xh1dpncH5nlH8CcTNcCf1aYn1W1U8orgH2Dlb1qb1isvXIH7
        Mo/Dqs3hp6vO3kdT+w25gYpcgfQLHLz/8eRX5zE=
X-Google-Smtp-Source: APXvYqxF6hhnbaCtmV+hKyaw3zTnE02ygJ/YA3cG2hs70YnjKeXj++vsLZQrdyYYnQUsSMeN7rVTULCGrRiNHPpf3Fk=
X-Received: by 2002:a19:6e41:: with SMTP id q1mr32791062lfk.20.1560325444170;
 Wed, 12 Jun 2019 00:44:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org> <20190606142220.1392-8-jacopo+renesas@jmondi.org>
In-Reply-To: <20190606142220.1392-8-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 12 Jun 2019 09:43:51 +0200
Message-ID: <CAMuHMdVxm8KcYr3EebKJ-DFeuE3=UW_yNvTMBbV7c6DyGr6HyQ@mail.gmail.com>
Subject: Re: [PATCH 07/20] clk: renesas: r8a77990: Add CMM clocks
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jun 6, 2019 at 4:25 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Add clock definitions for CMM units on Renesas R-Car Gen3 E3.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v5.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
