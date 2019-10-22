Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39108E032E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2019 13:40:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388462AbfJVLku (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Oct 2019 07:40:50 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:41253 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387871AbfJVLku (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Oct 2019 07:40:50 -0400
Received: by mail-oi1-f195.google.com with SMTP id g81so13850732oib.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Oct 2019 04:40:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MTkUrxhJaaygKpYFG6XKyORLB/6UsrnNnAcZ2HEl3vA=;
        b=Y543Ytqx6anR+xSPC1E7zb4GYT19GjIHl9HKA5ZPQLFmR3QB6z8ttSjVme7V1S45ec
         u0EonI2H+R6o3K5ldHDs7S8LPfIHFrVRKWT155ZTQrnO2AIjgsvnG8rZ/SgGt0HP8HDH
         1eIY0FYauZzeTkYUYXNBUa2KBQ7o0MvKMaXRyjlet5/LUPhQF2p171y9oVWkA6YR3ABV
         1oxP/ujCzJVNaD5SL/PHG8zrISbhGmBU69NRBEOUmkW6qExFkdkA8mLNVXP1tZNf4VtS
         3rflLciKkbVQrjHPIVzGmEmWj+WaKxwGAjQf2u0LiEcNjBU4zyXGQ9vXv5BgcISXKq/X
         Nw+g==
X-Gm-Message-State: APjAAAUKd0FmlwkA9+pQ2gdK8l5WY0cwZgeKfqf6h5yVMFGV56KAlqQS
        eMaPtCCBq01F50zi36oEPvKhl00gBUT01W197sg=
X-Google-Smtp-Source: APXvYqzhQ8cZ06PtyQQYS8VBvz7ZAfya04dDgTKpedBCyvYLKvYUP4z21wflkhBwZ+Lx/Betkfre5JCQCLddcCfBX8w=
X-Received: by 2002:aca:882:: with SMTP id 124mr2542881oii.54.1571744447771;
 Tue, 22 Oct 2019 04:40:47 -0700 (PDT)
MIME-Version: 1.0
References: <20191021214550.1461-1-robh@kernel.org> <20191021214550.1461-5-robh@kernel.org>
 <20191022113001.GG4756@pendragon.ideasonboard.com>
In-Reply-To: <20191022113001.GG4756@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Oct 2019 13:40:36 +0200
Message-ID: <CAMuHMdXCq9urRDCSmLueVpsv9-FxJ6pxQf-9Ua=vT-TrRs++fQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/cma-helper: Support DRM_MODE_DUMB_KERNEL_MAP flag
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Rob Herring <robh@kernel.org>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Liviu Dudau <liviu.dudau@arm.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Sandy Huang <hjc@rock-chips.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Yannick Fertre <yannick.fertre@st.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Xinliang Liu <z.liuxinliang@hisilicon.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Chen-Yu Tsai <wens@csie.org>,
        =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
        "James (Qian) Wang" <james.qian.wang@arm.com>,
        CK Hu <ck.hu@mediatek.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Chen Feng <puck.chen@hisilicon.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Philippe Cornu <philippe.cornu@st.com>,
        Vincent Abriou <vincent.abriou@st.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Rongrong Zou <zourongrong@gmail.com>,
        Brian Starkey <brian.starkey@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Tue, Oct 22, 2019 at 1:30 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Oct 21, 2019 at 04:45:48PM -0500, Rob Herring wrote:

> > --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> > @@ -419,6 +419,7 @@ int rockchip_gem_dumb_create(struct drm_file *file_priv,
> >        * align to 64 bytes since Mali requires it.
> >        */
> >       args->pitch = ALIGN(min_pitch, 64);
> > +     args->flags = DRM_MODE_DUMB_KERNEL_MAP;
> >       args->size = args->pitch * args->height;
>
> My OCD gets triggered by flags appearing in the middle here while it is
> at the end in other drivers :-)

... while "flags" appears before "pitch" and "size" in the actual struct
definition... Aaarghl ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
