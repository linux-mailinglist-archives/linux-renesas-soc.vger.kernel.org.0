Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1979E1E1B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2019 16:27:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731524AbfJWO1T (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Oct 2019 10:27:19 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38590 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389521AbfJWO1S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Oct 2019 10:27:18 -0400
Received: from pendragon.ideasonboard.com (143.121.2.93.rev.sfr.net [93.2.121.143])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 731022BA;
        Wed, 23 Oct 2019 16:27:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571840836;
        bh=JXqWjdiLubVy5sWaPNoZEJWjeRj39puPI4yetjR1u3s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HfNC5+1MHn6TRNR/YN4P3LSQWxmv4uJMWJfnz3zLtGa9GRuZYMbfPcxvaKa+bb9NU
         wP52IcWvP/OGLU8sYfrkecNBWS8mZXpK2+j1kNIqKu4qY0NrrFttxCF2qbOmql2fRV
         MDKrV52IHE9CnQrlhyeFyAv29V4Y+zLzh06EHEp4=
Date:   Wed, 23 Oct 2019 17:27:11 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Herring <robh@kernel.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Chen Feng <puck.chen@hisilicon.com>,
        Chen-Yu Tsai <wens@csie.org>, CK Hu <ck.hu@mediatek.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        "James (Qian) Wang" <james.qian.wang@arm.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
        Philippe Cornu <philippe.cornu@st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rongrong Zou <zourongrong@gmail.com>,
        Sandy Huang <hjc@rock-chips.com>, Sean Paul <sean@poorly.run>,
        Vincent Abriou <vincent.abriou@st.com>,
        Xinliang Liu <z.liuxinliang@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Yannick Fertre <yannick.fertre@st.com>,
        Brian Starkey <brian.starkey@arm.com>,
        linux-amlogic@lists.infradead.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 4/6] drm/cma-helper: Support DRM_MODE_DUMB_KERNEL_MAP flag
Message-ID: <20191023142711.GB1904@pendragon.ideasonboard.com>
References: <20191021214550.1461-1-robh@kernel.org>
 <20191021214550.1461-5-robh@kernel.org>
 <20191022113001.GG4756@pendragon.ideasonboard.com>
 <CAL_JsqJk4xeFCHPqpXUSW4XJ=eQ+EYPUpjX_4UL9Pw_OAcqLdA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqJk4xeFCHPqpXUSW4XJ=eQ+EYPUpjX_4UL9Pw_OAcqLdA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On Tue, Oct 22, 2019 at 03:02:06PM -0500, Rob Herring wrote:
> On Tue, Oct 22, 2019 at 6:30 AM Laurent Pinchart wrote:
> > On Mon, Oct 21, 2019 at 04:45:48PM -0500, Rob Herring wrote:
> >> Add support in CMA helpers to handle callers specifying
> >> DRM_MODE_DUMB_KERNEL_MAP flag. Existing behavior is maintained with this
> >> change. drm_gem_cma_dumb_create() always creates a kernel mapping as
> >> before. drm_gem_cma_dumb_create_internal() lets the caller set the flags
> >> as desired. Therefore, update all the existing callers of
> >> drm_gem_cma_dumb_create_internal() to also set the
> >> DRM_MODE_DUMB_KERNEL_MAP flag.
> >>
> >> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >> Cc: Maxime Ripard <mripard@kernel.org>
> >> Cc: Sean Paul <sean@poorly.run>
> >> Cc: David Airlie <airlied@linux.ie>
> >> Cc: Daniel Vetter <daniel@ffwll.ch>
> >> Cc: "James (Qian) Wang" <james.qian.wang@arm.com>
> >> Cc: Liviu Dudau <liviu.dudau@arm.com>
> >> Cc: Brian Starkey <brian.starkey@arm.com>
> >> Cc: Neil Armstrong <narmstrong@baylibre.com>
> >> Cc: Kevin Hilman <khilman@baylibre.com>
> >> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >> Cc: Sandy Huang <hjc@rock-chips.com>
> >> Cc: "Heiko Stübner" <heiko@sntech.de>
> >> Cc: Yannick Fertre <yannick.fertre@st.com>
> >> Cc: Philippe Cornu <philippe.cornu@st.com>
> >> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> >> Cc: Vincent Abriou <vincent.abriou@st.com>
> >> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> >> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> >> Cc: Chen-Yu Tsai <wens@csie.org>
> >> Cc: linux-amlogic@lists.infradead.org
> >> Cc: linux-arm-kernel@lists.infradead.org
> >> Cc: linux-renesas-soc@vger.kernel.org
> >> Cc: linux-rockchip@lists.infradead.org
> >> Cc: linux-stm32@st-md-mailman.stormreply.com
> >> Signed-off-by: Rob Herring <robh@kernel.org>
> >> ---
> >>  .../gpu/drm/arm/display/komeda/komeda_kms.c   |  1 +
> >>  drivers/gpu/drm/arm/malidp_drv.c              |  1 +
> >>  drivers/gpu/drm/drm_gem_cma_helper.c          | 48 +++++++++++--------
> >>  drivers/gpu/drm/meson/meson_drv.c             |  1 +
> >>  drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  1 +
> >>  drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |  1 +
> >>  drivers/gpu/drm/stm/drv.c                     |  1 +
> >>  drivers/gpu/drm/sun4i/sun4i_drv.c             |  1 +
> >>  8 files changed, 36 insertions(+), 19 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> >> index d49772de93e0..7cf0dc4cbfc1 100644
> >> --- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> >> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> >> @@ -31,6 +31,7 @@ static int komeda_gem_cma_dumb_create(struct drm_file *file,
> >>       u32 pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
> >>
> >>       args->pitch = ALIGN(pitch, mdev->chip.bus_width);
> >> +     args->flags = DRM_MODE_DUMB_KERNEL_MAP;
> >>
> >>       return drm_gem_cma_dumb_create_internal(file, dev, args);
> >>  }
> >> diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
> >> index 8a76315aaa0f..aeb1a779ecc1 100644
> >> --- a/drivers/gpu/drm/arm/malidp_drv.c
> >> +++ b/drivers/gpu/drm/arm/malidp_drv.c
> >> @@ -465,6 +465,7 @@ static int malidp_dumb_create(struct drm_file *file_priv,
> >>       u8 alignment = malidp_hw_get_pitch_align(malidp->dev, 1);
> >>
> >>       args->pitch = ALIGN(DIV_ROUND_UP(args->width * args->bpp, 8), alignment);
> >> +     args->flags = DRM_MODE_DUMB_KERNEL_MAP;
> >>
> >>       return drm_gem_cma_dumb_create_internal(file_priv, drm, args);
> >>  }
> >> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
> >> index 4cebfe01e6ea..f91e9e8adeaf 100644
> >> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> >> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
> >> @@ -78,21 +78,8 @@ __drm_gem_cma_create(struct drm_device *drm, size_t size)
> >>       return ERR_PTR(ret);
> >>  }
> >>
> >> -/**
> >> - * drm_gem_cma_create - allocate an object with the given size
> >> - * @drm: DRM device
> >> - * @size: size of the object to allocate
> >> - *
> >> - * This function creates a CMA GEM object and allocates a contiguous chunk of
> >> - * memory as backing store. The backing memory has the writecombine attribute
> >> - * set.
> >> - *
> >> - * Returns:
> >> - * A struct drm_gem_cma_object * on success or an ERR_PTR()-encoded negative
> >> - * error code on failure.
> >> - */
> >> -struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
> >> -                                           size_t size)
> >> +static struct drm_gem_cma_object *
> >> +drm_gem_cma_create_flags(struct drm_device *drm, size_t size, u32 flags)
> >>  {
> >>       struct drm_gem_cma_object *cma_obj;
> >>       int ret;
> >> @@ -103,6 +90,9 @@ struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
> >>       if (IS_ERR(cma_obj))
> >>               return cma_obj;
> >>
> >> +     if (!(flags & DRM_MODE_DUMB_KERNEL_MAP))
> >> +             cma_obj->dma_attrs |= DMA_ATTR_NO_KERNEL_MAPPING;
> >> +
> >>       cma_obj->vaddr = dma_alloc_attrs(drm->dev, size, &cma_obj->paddr,
> >>                                        GFP_KERNEL | __GFP_NOWARN,
> >>                                        cma_obj->dma_attrs);
> >> @@ -119,6 +109,25 @@ struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
> >>       drm_gem_object_put_unlocked(&cma_obj->base);
> >>       return ERR_PTR(ret);
> >>  }
> >> +
> >> +/**
> >> + * drm_gem_cma_create - allocate an object with the given size
> >> + * @drm: DRM device
> >> + * @size: size of the object to allocate
> >> + *
> >> + * This function creates a CMA GEM object and allocates a contiguous chunk of
> >> + * memory as backing store. The backing memory has the writecombine attribute
> >> + * set.
> >> + *
> >
> > Shouldn't you mention here that the function always creates a kernel
> > mapping, and that callers that don't need the mapping should use
> > drm_gem_cma_dumb_create_internal() instead ?
> 
> Are you confusing drm_gem_cma_create with drm_gem_cma_dumb_create?
> drm_gem_cma_dumb_create() uses defaults and
> drm_gem_cma_dumb_create_internal() allows the caller to tweak
> parameters. Nothing new there other than an additional param to tweak.
> 
> > drm_gem_cma_dumb_create_internal() operates at a different level though,
> > and drm_gem_cma_create() is only exported for a single driver. There's
> > no equivalent to drm_gem_cma_create() that can skip the kernel mapping.
> 
> Because we don't yet need one. drm_gem_cma_create_flags() can be made
> public when we do. I could do that now I guess and make
> drm_gem_cma_create an inline wrapper.

I don't mind not having drm_gem_cma_create_flags() made public (but you
can do so already if you prefer) if there's no user. My point is that we
now have a mechanism to skip creation of kernel mappings, and that
drm_gem_cma_create() will always result in the creation of a kernel
mapping. I thought it was worth mentioning it, but if you think that's
not needed, feel free to ignore the comment.

-- 
Regards,

Laurent Pinchart
