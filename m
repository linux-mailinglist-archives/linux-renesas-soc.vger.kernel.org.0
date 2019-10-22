Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95E35E0CCE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2019 21:52:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732980AbfJVTwn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Oct 2019 15:52:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:54830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727851AbfJVTwn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Oct 2019 15:52:43 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D852C21D7B
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Oct 2019 19:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571773962;
        bh=lVep/kGw+Qm/9BH6yFF5Ta8I/nos5oV6cOnqMoFM8O4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=SbSsk/ekDVLBB454r0f1fvmvvTfmN03c5NGb9PdZ9IvpRX8d1DtgQ08Z0bcIFwtzs
         VJWkSkAkUUYtQwyf9KuPhqlpVOF4v4w2h5TXmW4XmSDy7Bzdam3XJW9stl7dqdpFvB
         VeMeIZqvsNaRGBObR2DhS1fZ9eyDJP3dVFLqhiSw=
Received: by mail-qt1-f174.google.com with SMTP id g50so14509555qtb.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Oct 2019 12:52:41 -0700 (PDT)
X-Gm-Message-State: APjAAAUaEySbGFI0zOoTrfUTKzMECZC2fSH8mjiJqMOlbI257jRn31I6
        YIg+TioFj7YYh0qKA1nSHEAR0LQp4OPGTQtxGg==
X-Google-Smtp-Source: APXvYqwfTFQvEWZsi+fmlXq4bJ/93h8u27YyErOcN6+jtvSG/aNt4UCbC5GoUws1bleVICB9W55vYXnUR58eU0hZLWI=
X-Received: by 2002:ac8:741a:: with SMTP id p26mr5266590qtq.143.1571773960946;
 Tue, 22 Oct 2019 12:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20191021214550.1461-1-robh@kernel.org> <20191021214550.1461-5-robh@kernel.org>
 <20191022113001.GG4756@pendragon.ideasonboard.com> <CAMuHMdXCq9urRDCSmLueVpsv9-FxJ6pxQf-9Ua=vT-TrRs++fQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXCq9urRDCSmLueVpsv9-FxJ6pxQf-9Ua=vT-TrRs++fQ@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 22 Oct 2019 14:52:29 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJwJgNHy4wr0as0n-R3ist_yKp3ytyBw4bPXjtSOSMOXQ@mail.gmail.com>
Message-ID: <CAL_JsqJwJgNHy4wr0as0n-R3ist_yKp3ytyBw4bPXjtSOSMOXQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/cma-helper: Support DRM_MODE_DUMB_KERNEL_MAP flag
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
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

On Tue, Oct 22, 2019 at 6:40 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Laurent,
>
> On Tue, Oct 22, 2019 at 1:30 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Mon, Oct 21, 2019 at 04:45:48PM -0500, Rob Herring wrote:
>
> > > --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> > > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> > > @@ -419,6 +419,7 @@ int rockchip_gem_dumb_create(struct drm_file *file_priv,
> > >        * align to 64 bytes since Mali requires it.
> > >        */
> > >       args->pitch = ALIGN(min_pitch, 64);
> > > +     args->flags = DRM_MODE_DUMB_KERNEL_MAP;
> > >       args->size = args->pitch * args->height;
> >
> > My OCD gets triggered by flags appearing in the middle here while it is
> > at the end in other drivers :-)
>
> ... while "flags" appears before "pitch" and "size" in the actual struct
> definition... Aaarghl ;-)

There was some reasoning here as my CMA helper conversion patch is
going to insert code between flags and size.

But to keep everyone's OCD in check, I can set flags first.

Rob
