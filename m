Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BF3A5BCF72
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Sep 2022 16:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbiISOp7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Sep 2022 10:45:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbiISOp6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Sep 2022 10:45:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FFB41AF15
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Sep 2022 07:45:56 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC12A499;
        Mon, 19 Sep 2022 16:45:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1663598755;
        bh=aabepc7nb0ngyChlkM6UJlwgKnZ9OU5G0U7VXy3ehjU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nScVJsapKy+O4QEW0uqFnYQ4do05LXITXiWk5S3og/+DBPerGPce88+x0hGYR1CDJ
         gafEsAayXMejbQe380YouukosvV8M0q1A3zmrNI2rOm9mSB/3emrWI6qmEaTHng+ch
         XEFLtjWIfOTeZ7WWnLpH7Z7uZSTaI30LWQr2iPmE=
Date:   Mon, 19 Sep 2022 17:45:41 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     tomba@kernel.org, kherbst@redhat.com, airlied@linux.ie,
        sam@ravnborg.org, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        kieran.bingham+renesas@ideasonboard.com, bskeggs@redhat.com,
        nouveau@lists.freedesktop.org, jyri.sarha@iki.fi
Subject: Re: [PATCH 2/4] drm/plane: Allocate planes with
 drm_universal_plane_alloc()
Message-ID: <YyiAlRETd92wGxLn@pendragon.ideasonboard.com>
References: <20220909105947.6487-1-tzimmermann@suse.de>
 <20220909105947.6487-3-tzimmermann@suse.de>
 <YyRYzpyjpmtOKnIW@pendragon.ideasonboard.com>
 <8de43ecf-530e-0661-b4d3-60712b31e8c8@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8de43ecf-530e-0661-b4d3-60712b31e8c8@suse.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Thomas,

On Fri, Sep 16, 2022 at 01:31:25PM +0200, Thomas Zimmermann wrote:
> Am 16.09.22 um 13:06 schrieb Laurent Pinchart:
> > On Fri, Sep 09, 2022 at 12:59:45PM +0200, Thomas Zimmermann wrote:
> >> Provide drm_univeral_plane_alloc(), which allocated an initializes a
> >> plane. Code for non-atomic drivers uses this pattern. Convert it to
> >> the new function. The modeset helpers contain a quirk for handling their
> >> color formats differently. Set the flag outside plane allocation.
> >>
> >> The new function is already deprecated to some extend. Drivers should
> >> rather use drmm_univeral_plane_alloc() or drm_universal_plane_init().
> > 
> > If this is already deprecated and used by a single driver, what is the
> > point ?
> 
> It's used by nouveau and drm_modeset_helper.c. Since the code is 
> duplicated, it seems generally better to have it located and documented 
> in a central place.
> 
> Although it may look somewhat pointless now, the helper will get useful 
> in the future. The affected code in drm_modeset_helper is in 
> drm_crtc_init(), which is also a deprecated interface; only used by 
> non-atomic drivers. The function is a good candidate to be inlined into 
> calling drivers. Getting drm_crtc_init() removed will allow us to 
> correct these drivers' color-format handling. Once that happened, 
> several more drivers will call drm_univeral_plane_alloc().

OK, works for me.

> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> ---
> >>   drivers/gpu/drm/drm_modeset_helper.c    | 61 +++++++++++--------------
> >>   drivers/gpu/drm/drm_plane.c             | 38 +++++++++++++++
> >>   drivers/gpu/drm/nouveau/dispnv04/crtc.c | 41 ++++++-----------
> >>   include/drm/drm_plane.h                 | 44 ++++++++++++++++++
> >>   4 files changed, 121 insertions(+), 63 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/drm_modeset_helper.c
> >> index 611dd01fb604..38040eebfa16 100644
> >> --- a/drivers/gpu/drm/drm_modeset_helper.c
> >> +++ b/drivers/gpu/drm/drm_modeset_helper.c
> >> @@ -113,38 +113,6 @@ static const struct drm_plane_funcs primary_plane_funcs = {
> >>   	.destroy = drm_plane_helper_destroy,
> >>   };
> >>   
> >> -static struct drm_plane *create_primary_plane(struct drm_device *dev)
> >> -{
> >> -	struct drm_plane *primary;
> >> -	int ret;
> >> -
> >> -	primary = kzalloc(sizeof(*primary), GFP_KERNEL);
> >> -	if (primary == NULL) {
> >> -		DRM_DEBUG_KMS("Failed to allocate primary plane\n");
> >> -		return NULL;
> >> -	}
> >> -
> >> -	/*
> >> -	 * Remove the format_default field from drm_plane when dropping
> >> -	 * this helper.
> >> -	 */
> >> -	primary->format_default = true;
> >> -
> >> -	/* possible_crtc's will be filled in later by crtc_init */
> >> -	ret = drm_universal_plane_init(dev, primary, 0,
> >> -				       &primary_plane_funcs,
> >> -				       safe_modeset_formats,
> >> -				       ARRAY_SIZE(safe_modeset_formats),
> >> -				       NULL,
> >> -				       DRM_PLANE_TYPE_PRIMARY, NULL);
> >> -	if (ret) {
> >> -		kfree(primary);
> >> -		primary = NULL;
> >> -	}
> >> -
> >> -	return primary;
> >> -}
> >> -
> >>   /**
> >>    * drm_crtc_init - Legacy CRTC initialization function
> >>    * @dev: DRM device
> >> @@ -176,10 +144,33 @@ int drm_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> >>   		  const struct drm_crtc_funcs *funcs)
> >>   {
> >>   	struct drm_plane *primary;
> >> +	int ret;
> >> +
> >> +	/* possible_crtc's will be filled in later by crtc_init */
> >> +	primary = __drm_universal_plane_alloc(dev, sizeof(*primary), 0, 0,
> >> +					      &primary_plane_funcs,
> >> +					      safe_modeset_formats,
> >> +					      ARRAY_SIZE(safe_modeset_formats),
> >> +					      NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
> >> +	if (IS_ERR(primary))
> >> +		return PTR_ERR(primary);
> >>   
> >> -	primary = create_primary_plane(dev);
> >> -	return drm_crtc_init_with_planes(dev, crtc, primary, NULL, funcs,
> >> -					 NULL);
> >> +	/*
> >> +	 * Remove the format_default field from drm_plane when dropping
> >> +	 * this helper.
> >> +	 */
> >> +	primary->format_default = true;
> >> +
> >> +	ret = drm_crtc_init_with_planes(dev, crtc, primary, NULL, funcs, NULL);
> >> +	if (ret)
> >> +		goto err_drm_plane_cleanup;
> >> +
> >> +	return 0;
> >> +
> >> +err_drm_plane_cleanup:
> >> +	drm_plane_cleanup(primary);
> >> +	kfree(primary);
> >> +	return ret;
> >>   }
> >>   EXPORT_SYMBOL(drm_crtc_init);
> >>   
> >> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> >> index 0f14b4d3bb10..33357629a7f5 100644
> >> --- a/drivers/gpu/drm/drm_plane.c
> >> +++ b/drivers/gpu/drm/drm_plane.c
> >> @@ -448,6 +448,44 @@ void *__drmm_universal_plane_alloc(struct drm_device *dev, size_t size,
> >>   }
> >>   EXPORT_SYMBOL(__drmm_universal_plane_alloc);
> >>   
> >> +void *__drm_universal_plane_alloc(struct drm_device *dev, size_t size,
> >> +				  size_t offset, uint32_t possible_crtcs,
> >> +				  const struct drm_plane_funcs *funcs,
> >> +				  const uint32_t *formats, unsigned int format_count,
> >> +				  const uint64_t *format_modifiers,
> >> +				  enum drm_plane_type type,
> >> +				  const char *name, ...)
> >> +{
> >> +	void *container;
> >> +	struct drm_plane *plane;
> >> +	va_list ap;
> >> +	int ret;
> >> +
> >> +	if (drm_WARN_ON(dev, !funcs))
> >> +		return ERR_PTR(-EINVAL);
> >> +
> >> +	container = kzalloc(size, GFP_KERNEL);
> >> +	if (!container)
> >> +		return ERR_PTR(-ENOMEM);
> >> +
> >> +	plane = container + offset;
> >> +
> >> +	va_start(ap, name);
> >> +	ret = __drm_universal_plane_init(dev, plane, possible_crtcs, funcs,
> >> +					 formats, format_count, format_modifiers,
> >> +					 type, name, ap);
> >> +	va_end(ap);
> >> +	if (ret)
> >> +		goto err_kfree;
> >> +
> >> +	return container;
> >> +
> >> +err_kfree:
> >> +	kfree(container);
> >> +	return ERR_PTR(ret);
> >> +}
> >> +EXPORT_SYMBOL(__drm_universal_plane_alloc);
> >> +
> >>   int drm_plane_register_all(struct drm_device *dev)
> >>   {
> >>   	unsigned int num_planes = 0;
> >> diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> >> index 660c4cbc0b3d..6b8a014b5e97 100644
> >> --- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> >> +++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> >> @@ -1281,32 +1281,6 @@ static const struct drm_plane_funcs nv04_primary_plane_funcs = {
> >>   	.destroy = drm_plane_helper_destroy,
> >>   };
> >>   
> >> -static struct drm_plane *
> >> -create_primary_plane(struct drm_device *dev)
> >> -{
> >> -        struct drm_plane *primary;
> >> -        int ret;
> >> -
> >> -        primary = kzalloc(sizeof(*primary), GFP_KERNEL);
> >> -        if (primary == NULL) {
> >> -                DRM_DEBUG_KMS("Failed to allocate primary plane\n");
> >> -                return NULL;
> >> -        }
> >> -
> >> -        /* possible_crtc's will be filled in later by crtc_init */
> >> -        ret = drm_universal_plane_init(dev, primary, 0,
> >> -				       &nv04_primary_plane_funcs,
> >> -                                       modeset_formats,
> >> -                                       ARRAY_SIZE(modeset_formats), NULL,
> >> -                                       DRM_PLANE_TYPE_PRIMARY, NULL);
> >> -        if (ret) {
> >> -                kfree(primary);
> >> -                primary = NULL;
> >> -        }
> >> -
> >> -        return primary;
> >> -}
> >> -
> >>   static int nv04_crtc_vblank_handler(struct nvif_notify *notify)
> >>   {
> >>   	struct nouveau_crtc *nv_crtc =
> >> @@ -1321,6 +1295,7 @@ nv04_crtc_create(struct drm_device *dev, int crtc_num)
> >>   {
> >>   	struct nouveau_display *disp = nouveau_display(dev);
> >>   	struct nouveau_crtc *nv_crtc;
> >> +	struct drm_plane *primary;
> >>   	int ret;
> >>   
> >>   	nv_crtc = kzalloc(sizeof(*nv_crtc), GFP_KERNEL);
> >> @@ -1335,8 +1310,18 @@ nv04_crtc_create(struct drm_device *dev, int crtc_num)
> >>   	nv_crtc->save = nv_crtc_save;
> >>   	nv_crtc->restore = nv_crtc_restore;
> >>   
> >> -	drm_crtc_init_with_planes(dev, &nv_crtc->base,
> >> -                                  create_primary_plane(dev), NULL,
> >> +	primary = __drm_universal_plane_alloc(dev, sizeof(*primary), 0, 0,
> >> +					      &nv04_primary_plane_funcs,
> >> +					      modeset_formats,
> >> +					      ARRAY_SIZE(modeset_formats), NULL,
> >> +					      DRM_PLANE_TYPE_PRIMARY, NULL);
> >> +	if (IS_ERR(primary)) {
> >> +		ret = PTR_ERR(primary);
> >> +		kfree(nv_crtc);
> >> +		return ret;
> >> +	}
> >> +
> >> +	drm_crtc_init_with_planes(dev, &nv_crtc->base, primary, NULL,
> >>                                     &nv04_crtc_funcs, NULL);
> >>   	drm_crtc_helper_add(&nv_crtc->base, &nv04_crtc_helper_funcs);
> >>   	drm_mode_crtc_set_gamma_size(&nv_crtc->base, 256);
> >> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> >> index 910cb941f3d5..21dfa7f97948 100644
> >> --- a/include/drm/drm_plane.h
> >> +++ b/include/drm/drm_plane.h
> >> @@ -809,6 +809,50 @@ void *__drmm_universal_plane_alloc(struct drm_device *dev,
> >>   					      format_count, format_modifiers, \
> >>   					      plane_type, name, ##__VA_ARGS__))
> >>   
> >> +__printf(10, 11)
> >> +void *__drm_universal_plane_alloc(struct drm_device *dev,
> >> +				  size_t size, size_t offset,
> >> +				  uint32_t possible_crtcs,
> >> +				  const struct drm_plane_funcs *funcs,
> >> +				  const uint32_t *formats,
> >> +				  unsigned int format_count,
> >> +				  const uint64_t *format_modifiers,
> >> +				  enum drm_plane_type plane_type,
> >> +				  const char *name, ...);
> >> +
> >> +/**
> >> + * drm_universal_plane_alloc - Allocate and initialize an universal plane object
> >> + * @dev: DRM device
> >> + * @type: the type of the struct which contains struct &drm_plane
> >> + * @member: the name of the &drm_plane within @type
> >> + * @possible_crtcs: bitmask of possible CRTCs
> >> + * @funcs: callbacks for the new plane
> >> + * @formats: array of supported formats (DRM_FORMAT\_\*)
> >> + * @format_count: number of elements in @formats
> >> + * @format_modifiers: array of struct drm_format modifiers terminated by
> >> + *                    DRM_FORMAT_MOD_INVALID
> >> + * @plane_type: type of plane (overlay, primary, cursor)
> >> + * @name: printf style format string for the plane name, or NULL for default name
> >> + *
> >> + * Allocates and initializes a plane object of type @type. The caller
> >> + * is responsible for releasing the allocated memory with kfree().
> >> + *
> >> + * Drivers are encouraged to use drmm_universal_plane_alloc() instead.
> >> + *
> >> + * Drivers that only support the DRM_FORMAT_MOD_LINEAR modifier support may set
> >> + * @format_modifiers to NULL. The plane will advertise the linear modifier.
> >> + *
> >> + * Returns:
> >> + * Pointer to new plane, or ERR_PTR on failure.
> >> + */
> >> +#define drm_universal_plane_alloc(dev, type, member, possible_crtcs, funcs, formats, \
> >> +				   format_count, format_modifiers, plane_type, name, ...) \
> >> +	((type *)__drm_universal_plane_alloc(dev, sizeof(type), \
> >> +					     offsetof(type, member), \
> >> +					     possible_crtcs, funcs, formats, \
> >> +					     format_count, format_modifiers, \
> >> +					     plane_type, name, ##__VA_ARGS__))
> >> +
> >>   /**
> >>    * drm_plane_index - find the index of a registered plane
> >>    * @plane: plane to find index for

-- 
Regards,

Laurent Pinchart
