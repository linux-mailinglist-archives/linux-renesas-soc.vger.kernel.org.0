Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFB9F4214FA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Oct 2021 19:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233520AbhJDRQf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Oct 2021 13:16:35 -0400
Received: from mail-vs1-f43.google.com ([209.85.217.43]:35684 "EHLO
        mail-vs1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233437AbhJDRQf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Oct 2021 13:16:35 -0400
Received: by mail-vs1-f43.google.com with SMTP id w13so2432131vsa.2;
        Mon, 04 Oct 2021 10:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SBkLa/4MTN2AV7Ayi5b9WkAAkgh6llV494VW2u23y8M=;
        b=gm5IwCa8yDWqbfORMl6okiy3cg46UMkjZ75a0LToEUDD/O/OgJtLroYKzVdRwAX5bZ
         DqKJ3RT2LZPozMjJGgPiwS7HWiOqVZNTS841E/VRrBglbOMJ6s1WfPzMaU2ij2YntUAM
         xStSnkencrjxZIVZrJbXLq2A4D1+eMhFyicgh6Z1Rb/bmUDQlb+PKemQ1qCQPAl/qanY
         rEJI+KNpChlfWwB8PYAx6SfELysfpnWjlxTJHmaxRbK/vPfyww7NHD+e+TrJ2H/QtAho
         orEaqBWu+NeEGfZ8IjmBV4cyb+gUqNa8WcB/j9MGzwnoZdtXCUHNEIt1uNvJPgX2fnq0
         B3NQ==
X-Gm-Message-State: AOAM530H6pb0nE185Auvls7APEnfLaYbLWRP3hsIURsh3NbWplF/bpXa
        oDVDEEnkGpnA4IOBA68LSTmhUDMJKnJx8iIUegE=
X-Google-Smtp-Source: ABdhPJzAKXaRAKp8VeLwihf2bO6s9nPybnMNdkmRdoDft3Mi8PGfDtP6R7h0/ORYrFJkE1nuoq5c2ZdYEpvBhstP0DQ=
X-Received: by 2002:a67:ac04:: with SMTP id v4mr5352188vse.50.1633367683989;
 Mon, 04 Oct 2021 10:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211004092100.1.Ic90a5ebd44c75db963112be167a03cc96f9fb249@changeid>
In-Reply-To: <20211004092100.1.Ic90a5ebd44c75db963112be167a03cc96f9fb249@changeid>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Oct 2021 19:14:32 +0200
Message-ID: <CAMuHMdUsoBO2hjd0tAecAjnwCUbp=d8i8vaUFDT6Yn3emw2s9Q@mail.gmail.com>
Subject: Re: [PATCH] drm/edid: Fix crash with zero/invalid EDID
To:     Douglas Anderson <dianders@chromium.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        oliver.sang@intel.com, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Douglas,

On Mon, Oct 4, 2021 at 6:22 PM Douglas Anderson <dianders@chromium.org> wrote:
> In the commit bac9c2948224 ("drm/edid: Break out reading block 0 of
> the EDID") I broke out reading the base block of the EDID to its own
> function. Unfortunately, when I did that I messed up the handling when
> drm_edid_is_zero() indicated that we had an EDID that was all 0x00 or
> when we went through 4 loops and didn't get a valid EDID. Specifically
> I needed to pass the broken EDID to connector_bad_edid() but now I was
> passing an error-pointer.
>
> Let's re-jigger things so we can pass the bad EDID in properly.
>
> Fixes: bac9c2948224 ("drm/edid: Break out reading block 0 of the EDID")
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

The crash is was seeing is gone, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
