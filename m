Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C47CC3C5B81
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jul 2021 13:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbhGLLif (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Jul 2021 07:38:35 -0400
Received: from mail-ua1-f54.google.com ([209.85.222.54]:45722 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230144AbhGLLif (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jul 2021 07:38:35 -0400
Received: by mail-ua1-f54.google.com with SMTP id c20so7048156uar.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jul 2021 04:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cQ1JcOSd2nH0AIAAU2+c6vcRfXQAJ25/l6vYO8FQ9nM=;
        b=BhBgvk2m7dwGAaqdqzK/3toGM7CCRwx65j5D6sLwmTV7vk3nCnKYEgSZzNjsTWZPUr
         u5fQxGGIaYaKsZ4R3y+vvSch8bx/1ulidsG+6ew4ZeD6uWl9Rdit+qIXIWRCywov4Wdr
         qDVCyAtN1SwgCwuI043zwoyvggqBxJw8vzyCFEwN1yGccaD2Ixhew8TE/SOEGlYhP5vA
         2/H60CNJkPpBIap1Y2xXINr6ZfehVok1JfqCiWWJ/YOa9A7RNpVjy9f/xbUHudBE6VaD
         dKLA03Dphh4Z8NU3rLlDFYi1QR2NvkTW1Vz9r+bIDJz+p2VjG0s+JJ6m3bMijS6WHmx2
         Rq3A==
X-Gm-Message-State: AOAM530HnkROF0ivcW9oe7tRLLvLUsFOD5INKS2FNH9lhWZbH802NdEf
        fj0/ZnfT4rBs+GbQhsXbWISEoSewUJnOvJFRN6k=
X-Google-Smtp-Source: ABdhPJyeTD1eXCp/CjevZG+yi8lfOIOpSpSRqF083OiPHiF5h3TBv1aMA3/e0aHcYjxgG3/KObbP9oqUAtEjhv3o6qM=
X-Received: by 2002:a9f:3f0d:: with SMTP id h13mr45267390uaj.100.1626089745624;
 Mon, 12 Jul 2021 04:35:45 -0700 (PDT)
MIME-Version: 1.0
References: <2a4474be1d2c00c6ca97c2714844ea416a9ea9a9.1626084948.git.geert+renesas@glider.be>
 <YOwmfqZnVzcsp+T/@pendragon.ideasonboard.com>
In-Reply-To: <YOwmfqZnVzcsp+T/@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 12 Jul 2021 13:35:34 +0200
Message-ID: <CAMuHMdU2JKtnRWj-TsS+NxRN5hoapRRMgrmmZJY5agN6G-z_NQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: defconfig: Restore graphical consoles
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Mon, Jul 12, 2021 at 1:25 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Jul 12, 2021 at 12:16:57PM +0200, Geert Uytterhoeven wrote:
> > As of commit f611b1e7624ccdbd ("drm: Avoid circular dependencies for
> > CONFIG_FB"), CONFIG_FB is no longer auto-enabled.  While CONFIG_FB may
> > be considered unneeded for systems where graphics is provided by a DRM
> > driver, R-Mobile A1 still relies on a frame buffer device driver for
> > graphics support.
> >
> > Restore support for graphics on R-Mobile A1 and graphical consoles on
> > DRM-based systems by explicitly enabling CONFIG_FB in the defconfig for
> > Renesas ARM systems.
>
> Does anyone still care about the Armadillo board ?

I do. It's my only Renesas board with graphical output ;-)

> This being said, I think CONFIG_FB should be added , but for a different
> reason. There's no KMS console driver, so the only option we have today,
> even when a KMS driver is available, is to go through FBDEV emulation,
> which requires CONFIG_FB to be enabled.

That's covered by "Restore [...] graphical consoles on DRM-based
systems", right?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
