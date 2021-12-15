Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3A0B4755EF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Dec 2021 11:12:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbhLOKMr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Dec 2021 05:12:47 -0500
Received: from mail-ua1-f49.google.com ([209.85.222.49]:45612 "EHLO
        mail-ua1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236695AbhLOKMq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Dec 2021 05:12:46 -0500
Received: by mail-ua1-f49.google.com with SMTP id ay21so39963933uab.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Dec 2021 02:12:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oYyudWNRvP8Hla1hFk2l+R+UaR2deY6N33lbhAdimyI=;
        b=LRQNi85hfxA9qiZWYThxMl++Xy0SpuhTbhvEujTArcTYPufXRYM+HP5va2iR5lGxcy
         R2LySaZ3UZ1YCl0Qv3TwBUo4NEkQkK8ke8ABNudCao5+IxJh8gd05druTUxWpAmeUvu+
         IiZuK0ZZMlOrTqQgjadLePL/ETQsBOGJqIHI3eLtqjgi8ZQLKkYRK72/1iKYqu9atbBx
         5dS/d86h101RxQgntr2MQeufdiJeofFaZjmf4EksDmEkyKSs9GP6hLFeZHJJ4a4Aq867
         BEGbXlhAlu6qNvbiC4n1erFI8eGFdIi6qoXeBVYEM0CKjcypr2WgdaT7ucoETxOJQo5v
         6PTg==
X-Gm-Message-State: AOAM530I9F/Aj/EMn93Akcu4ZwzsCCqLqxj0uecCI1COVChz4okBydmZ
        wJqTicowNpEt8H34V0bjKM6QKDYXdxTX5A==
X-Google-Smtp-Source: ABdhPJxgAc1WM4gcXxsoDP964arSYXvrsN8miUJf4MsnrjzdRAFGJjhesJtUd6Nt7cQpVEjkk5Gjhw==
X-Received: by 2002:ab0:66c7:: with SMTP id d7mr9126111uaq.94.1639563165625;
        Wed, 15 Dec 2021 02:12:45 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id l28sm360111vkn.45.2021.12.15.02.12.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 02:12:45 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id p37so40002604uae.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Dec 2021 02:12:44 -0800 (PST)
X-Received: by 2002:a05:6102:21dc:: with SMTP id r28mr2373758vsg.57.1639563164657;
 Wed, 15 Dec 2021 02:12:44 -0800 (PST)
MIME-Version: 1.0
References: <cover.1639559338.git.geert+renesas@glider.be> <Ybm4oFaYgtl5+MRk@pendragon.ideasonboard.com>
In-Reply-To: <Ybm4oFaYgtl5+MRk@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Dec 2021 11:12:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWKdWvTPQ=9EHpEr5Rb_sSAQ=3cgchmeSFpEXs2_we4wA@mail.gmail.com>
Message-ID: <CAMuHMdWKdWvTPQ=9EHpEr5Rb_sSAQ=3cgchmeSFpEXs2_we4wA@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm: rcar-du: Add missing dependencies
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Arnd Bergmann <arnd@arndb.de>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Wed, Dec 15, 2021 at 10:43 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Dec 15, 2021 at 10:27:44AM +0100, Geert Uytterhoeven wrote:
> > This patch series adds missing dependencies to Kconfig symbols related
> > to the R-Car Display Unit.  These dependencies prevent asking the user
> > about R-Car display drivers when configuring a kernel without Renesas
> > SoC support, or when the answer wouldn't have any impact on the kernel
> > build.
>
> Won't this have an impact when someone will regenerate an ARM64
> defconfig, given that we want to keep those options enabled in
> arch/arm64/configs/defconfig ?

arch/arm64/configs/defconfig has CONFIG_ARCH_RENESAS=y, so it is
not impacted.

> > Geert Uytterhoeven (3):
> >   drm: rcar-du: DRM_RCAR_DW_HDMI should depend on ARCH_RENESAS
> >   drm: rcar-du: DRM_RCAR_USE_LVDS should depend on DRM_RCAR_DU
> >   drm: rcar-du: DRM_RCAR_MIPI_DSI should depend on ARCH_RENESAS

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
