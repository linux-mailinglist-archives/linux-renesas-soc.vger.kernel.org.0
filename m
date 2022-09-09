Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B07E5B3EC6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Sep 2022 20:25:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbiIISZB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Sep 2022 14:25:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbiIISZA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Sep 2022 14:25:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 670345464A
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Sep 2022 11:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662747898;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vKgo9kNM9lmshPVUg8AZgq6yhDB1kDXUMjrFxdhRiKI=;
        b=cNODxEkda7IhT474icufAzHwdOS1D8tF9r/AfU+prFZ/EKzxtdnV+zZnrYABSvsjNb8J4u
        3vNS8rkQ8YexAsWBhKJh01vgFdzgGYuW2Lsg8tJTmO+LjmNsXAQzDe+ONEOVPg8qiyq9Rl
        P9YxZw11cT4x9v8H3mu3M5k8L9KB+9A=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-494-i1ZEtrxzMd-o9atfHjxatA-1; Fri, 09 Sep 2022 14:24:55 -0400
X-MC-Unique: i1ZEtrxzMd-o9atfHjxatA-1
Received: by mail-qv1-f71.google.com with SMTP id ks13-20020a056214310d00b004a7c32300fcso1770981qvb.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Sep 2022 11:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=vKgo9kNM9lmshPVUg8AZgq6yhDB1kDXUMjrFxdhRiKI=;
        b=vuNWrLUTiykgwdTuHEoDnPD/nJQTKoTupfy2yY1Fp3WJZtBt3AtzlzXN3VsHqk4Td9
         hY7BzPRwrVg5r9nLkQGjEbuLgRtlEMfwgToFn3DDHFEbmb/pjoBauDPXz5sromlqb304
         +QC5HeJybeibgkyeHcOQ55WExl2ksj7LE1iJy311WRh9HHK7UGp4FcaNwlS8eteSPJ95
         wsUGW49x7CQs+mXkpepfluejxi4tWgLGJHgSRHDZoc1C9KEdGWhAaPsr+tLHZZktrVyT
         yo3gubLoyYGuO5NByV4IPlVFbmTkgNBjJfF3oPqSpRRzhYvxYTfqZ0V3qWH+9KHlQEOp
         s3vA==
X-Gm-Message-State: ACgBeo030OYNC9CwuwQodgnp4//SfHHbk0x0knOV23+hCvQ8VPyoDfXE
        OCfN7t1/Fw5czH/IrYWbhb0EsazrW/mT9HzooHQ9N1LBVQSymN/4WHG+M63GRK9QZGBcdqptOBU
        3P6mUrwzxE3tAeaf+jAGgefeeDCelWTA=
X-Received: by 2002:a05:6214:29c7:b0:499:1500:4e3 with SMTP id gh7-20020a05621429c700b00499150004e3mr13309417qvb.26.1662747892177;
        Fri, 09 Sep 2022 11:24:52 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7cVG6TZNwwhy926yFDbk2krn0djleQ/6MP15a8oPipRlK43GgxnwTDMH7Q9LinSgE91f7WoA==
X-Received: by 2002:a05:6214:29c7:b0:499:1500:4e3 with SMTP id gh7-20020a05621429c700b00499150004e3mr13309402qvb.26.1662747891925;
        Fri, 09 Sep 2022 11:24:51 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c48:e00::9e6? ([2600:4040:5c48:e00::9e6])
        by smtp.gmail.com with ESMTPSA id bk38-20020a05620a1a2600b006b5d9a1d326sm884388qkb.83.2022.09.09.11.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 11:24:51 -0700 (PDT)
Message-ID: <38f7cab30c2a7efb9eb324fee0ae3ba7e806ba0a.camel@redhat.com>
Subject: Re: [PATCH 1/4] drm/plane: Remove drm_plane_init()
From:   Lyude Paul <lyude@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, bskeggs@redhat.com,
        kherbst@redhat.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jyri.sarha@iki.fi,
        tomba@kernel.org, sam@ravnborg.org
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
Date:   Fri, 09 Sep 2022 14:24:50 -0400
In-Reply-To: <20220909105947.6487-2-tzimmermann@suse.de>
References: <20220909105947.6487-1-tzimmermann@suse.de>
         <20220909105947.6487-2-tzimmermann@suse.de>
Organization: Red Hat Inc.
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Reviewed-by: Lyude Paul <lyude@redhat.com>
for common and nouveau bits

On Fri, 2022-09-09 at 12:59 +0200, Thomas Zimmermann wrote:
> Open-code drm_plane_init() and remove the function from DRM. The
> implementation of drm_plane_init() is a simple wrapper around a call
> to drm_universal_plane_init(), so drivers can just use that instead.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_modeset_helper.c       |  3 +-
>  drivers/gpu/drm/drm_plane.c                | 32 ----------------------
>  drivers/gpu/drm/nouveau/dispnv04/overlay.c | 13 +++++----
>  drivers/gpu/drm/shmobile/shmob_drm_plane.c |  7 +++--
>  drivers/gpu/drm/tilcdc/tilcdc_plane.c      |  9 +++---
>  include/drm/drm_plane.h                    |  8 +-----
>  6 files changed, 17 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/drm_modeset_helper.c
> index bd609a978848..611dd01fb604 100644
> --- a/drivers/gpu/drm/drm_modeset_helper.c
> +++ b/drivers/gpu/drm/drm_modeset_helper.c
> @@ -100,8 +100,7 @@ EXPORT_SYMBOL(drm_helper_mode_fill_fb_struct);
>   * This is the minimal list of formats that seem to be safe for modeset use
>   * with all current DRM drivers.  Most hardware can actually support more
>   * formats than this and drivers may specify a more accurate list when
> - * creating the primary plane.  However drivers that still call
> - * drm_plane_init() will use this minimal format list as the default.
> + * creating the primary plane.
>   */
>  static const uint32_t safe_modeset_formats[] = {
>  	DRM_FORMAT_XRGB8888,
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 726f2f163c26..0f14b4d3bb10 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -482,38 +482,6 @@ void drm_plane_unregister_all(struct drm_device *dev)
>  	}
>  }
>  
> -/**
> - * drm_plane_init - Initialize a legacy plane
> - * @dev: DRM device
> - * @plane: plane object to init
> - * @possible_crtcs: bitmask of possible CRTCs
> - * @funcs: callbacks for the new plane
> - * @formats: array of supported formats (DRM_FORMAT\_\*)
> - * @format_count: number of elements in @formats
> - * @is_primary: plane type (primary vs overlay)
> - *
> - * Legacy API to initialize a DRM plane.
> - *
> - * New drivers should call drm_universal_plane_init() instead.
> - *
> - * Returns:
> - * Zero on success, error code on failure.
> - */
> -int drm_plane_init(struct drm_device *dev, struct drm_plane *plane,
> -		   uint32_t possible_crtcs,
> -		   const struct drm_plane_funcs *funcs,
> -		   const uint32_t *formats, unsigned int format_count,
> -		   bool is_primary)
> -{
> -	enum drm_plane_type type;
> -
> -	type = is_primary ? DRM_PLANE_TYPE_PRIMARY : DRM_PLANE_TYPE_OVERLAY;
> -	return drm_universal_plane_init(dev, plane, possible_crtcs, funcs,
> -					formats, format_count,
> -					NULL, type, NULL);
> -}
> -EXPORT_SYMBOL(drm_plane_init);
> -
>  /**
>   * drm_plane_cleanup - Clean up the core plane usage
>   * @plane: plane to cleanup
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/overlay.c b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
> index 37e63e98cd08..33f29736024a 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/overlay.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
> @@ -296,9 +296,10 @@ nv10_overlay_init(struct drm_device *device)
>  		break;
>  	}
>  
> -	ret = drm_plane_init(device, &plane->base, 3 /* both crtc's */,
> -			     &nv10_plane_funcs,
> -			     formats, num_formats, false);
> +	ret = drm_universal_plane_init(device, &plane->base, 3 /* both crtc's */,
> +				       &nv10_plane_funcs,
> +				       formats, num_formats, NULL,
> +				       DRM_PLANE_TYPE_OVERLAY, NULL);
>  	if (ret)
>  		goto err;
>  
> @@ -475,9 +476,9 @@ nv04_overlay_init(struct drm_device *device)
>  	if (!plane)
>  		return;
>  
> -	ret = drm_plane_init(device, &plane->base, 1 /* single crtc */,
> -			     &nv04_plane_funcs,
> -			     formats, 2, false);
> +	ret = drm_universal_plane_init(device, &plane->base, 1 /* single crtc */,
> +				       &nv04_plane_funcs, formats, 2, NULL,
> +				       DRM_PLANE_TYPE_OVERLAY, NULL);
>  	if (ret)
>  		goto err;
>  
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/shmobile/shmob_drm_plane.c
> index 54228424793a..6c5f0cbe7d95 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_plane.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_plane.c
> @@ -252,9 +252,10 @@ int shmob_drm_plane_create(struct shmob_drm_device *sdev, unsigned int index)
>  	splane->index = index;
>  	splane->alpha = 255;
>  
> -	ret = drm_plane_init(sdev->ddev, &splane->plane, 1,
> -			     &shmob_drm_plane_funcs, formats,
> -			     ARRAY_SIZE(formats), false);
> +	ret = drm_universal_plane_init(sdev->ddev, &splane->plane, 1,
> +				       &shmob_drm_plane_funcs,
> +				       formats, ARRAY_SIZE(formats), NULL,
> +				       DRM_PLANE_TYPE_OVERLAY, NULL);
>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_plane.c b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
> index 0ccf791301cb..cf77a8ce7398 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_plane.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
> @@ -105,11 +105,10 @@ int tilcdc_plane_init(struct drm_device *dev,
>  	struct tilcdc_drm_private *priv = dev->dev_private;
>  	int ret;
>  
> -	ret = drm_plane_init(dev, plane, 1,
> -			     &tilcdc_plane_funcs,
> -			     priv->pixelformats,
> -			     priv->num_pixelformats,
> -			     true);
> +	ret = drm_universal_plane_init(dev, plane, 1, &tilcdc_plane_funcs,
> +				       priv->pixelformats,
> +				       priv->num_pixelformats,
> +				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
>  	if (ret) {
>  		dev_err(dev->dev, "Failed to initialize plane: %d\n", ret);
>  		return ret;
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 89ea54652e87..910cb941f3d5 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -631,7 +631,7 @@ struct drm_plane {
>  	unsigned int format_count;
>  	/**
>  	 * @format_default: driver hasn't supplied supported formats for the
> -	 * plane. Used by the drm_plane_init compatibility wrapper only.
> +	 * plane. Used by the non-atomic driver compatibility wrapper only.
>  	 */
>  	bool format_default;
>  
> @@ -762,12 +762,6 @@ int drm_universal_plane_init(struct drm_device *dev,
>  			     const uint64_t *format_modifiers,
>  			     enum drm_plane_type type,
>  			     const char *name, ...);
> -int drm_plane_init(struct drm_device *dev,
> -		   struct drm_plane *plane,
> -		   uint32_t possible_crtcs,
> -		   const struct drm_plane_funcs *funcs,
> -		   const uint32_t *formats, unsigned int format_count,
> -		   bool is_primary);
>  void drm_plane_cleanup(struct drm_plane *plane);
>  
>  __printf(10, 11)

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

