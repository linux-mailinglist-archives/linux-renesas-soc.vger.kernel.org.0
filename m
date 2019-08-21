Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD5B297902
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2019 14:16:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbfHUMQP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Aug 2019 08:16:15 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:43592 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726785AbfHUMQO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Aug 2019 08:16:14 -0400
Received: by mail-ot1-f68.google.com with SMTP id e12so1795198otp.10;
        Wed, 21 Aug 2019 05:16:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JM8+7Ec7A9MDZFRreGMwQwNOR9ozJM3D4xQgDyyrkY8=;
        b=hgRNU+yACEowbjcxbWTnCEEK+U31A9QLlckVkwbHgQ6fQR0vHXqRlS0VVM3LTPat+Z
         kvHbA8rBGMUUYHwXntgh8DyBYrGE82Vk3EEpEJvvQ1jBxvH280MjAniRo9IVk+tcWfWf
         fiP8wGwZhUOZ492PoyEH7J2xypRfg7fGsLHg5G1q+aCDC/jyz6lghD3/l/96SIi8D9wy
         3/KgI+fOoPg1+cfSwWpjgW909LBWcECPOe0jFTPyQEB/zmohKRLUOZn2Pgkopodr3mBL
         uVi0GMWfPu5bo+t+hw9tPZRp7YaWJQZYG4qlJ9HAQUuPPAJOmCMz2qI4UYPpna9C2FEH
         6Chg==
X-Gm-Message-State: APjAAAXfZ+/YNUJrUw/EJrLg08gC78iRUfUjlRhj8Mr0+yWZIVfPJnBr
        UuWqESpWXLmJfBf2cYTMxivIpxR+1si9sP9/5KM=
X-Google-Smtp-Source: APXvYqwp73cyWDJ24i8HRDQI70zVub6GzQTzwRLYNV8E2VXhehGjEEulwajAQyMYsZSNEAJiaw5euZ2SPNlpndY3P2g=
X-Received: by 2002:a9d:5c0c:: with SMTP id o12mr26414408otk.145.1566389774076;
 Wed, 21 Aug 2019 05:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org> <20190706140746.29132-4-jacopo+renesas@jmondi.org>
In-Reply-To: <20190706140746.29132-4-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 21 Aug 2019 14:16:02 +0200
Message-ID: <CAMuHMdVXQaqFg-m3a4xTiKLWQLz+itKQgGEBAQpHtG+MkTNzQw@mail.gmail.com>
Subject: Re: [PATCH v2 03/19] arm64: renesas: Update 'vsps' property
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

On Sat, Jul 6, 2019 at 4:07 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Update the 'vsps' property in the R-Car Gen3 SoC device tree files to
> match what's in in the documentation example.

double in (no worries, I'll fix that up myself)

> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.4.

BTW, any plans to add channel indices to the vsps properties in the
remaining DTS files?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
