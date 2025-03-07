Return-Path: <linux-renesas-soc+bounces-14133-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB94A562C8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Mar 2025 09:42:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8A4B16B948
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Mar 2025 08:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 768061DF990;
	Fri,  7 Mar 2025 08:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="AEyPq33P"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8D71C84CA
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Mar 2025 08:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741336953; cv=none; b=uXhLXSttO6dvAy82P0n4X+Cm3ASZgMdcJSzoEoJBXJ2ktQjDqbVa/WwyVANwCjQ+9x1Ez82XAbAA7zV4ThEFuGu8o1CloQPmvTkDYUIHf/FOYy42oGfBAIER+YR2csasJ0YwJi//BwPd/V6C/ri/Hb3yTk+mXC2qi2EhFkB8c64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741336953; c=relaxed/simple;
	bh=NezRrEajn89sTmk3UPPm40W2iyvWDVfpdziorgHF5oo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IWEmONP0P5av09981ChNUuge7CYry/bsbrvjI/us9lztufapXwcLwTJgpObO3wRWUYYEzqG5evUohtqVVKHFXtMuE4ZdkdCeEPri7jzQTCS+x+UYaIfoXUhoranXiHWnqyICKrj+Ibp4nDMnVg+vNDDhuoDtkdCo0GJXNWqCWds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=AEyPq33P; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43bc4b16135so9212945e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Mar 2025 00:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1741336948; x=1741941748; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=US2Wc6icG0i9/47aJ/pkH3GP4es8yYK0BFMiCt7We04=;
        b=AEyPq33Pc2bAO8iXb4AUyeLSFg7bM6BOrMiyihxquqbk5Q/t9nfXFO/GAFtvda0iOL
         U2tdVcIFSTivP57mQ/hjXg+QqVzYbaqCv+Zzpaz9XAHl/7Dy4WAHB3xaJcv472+yAuPu
         8hD4I+KbT4dYL5G5E4anBmyma6WKotw/ypl/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741336948; x=1741941748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=US2Wc6icG0i9/47aJ/pkH3GP4es8yYK0BFMiCt7We04=;
        b=eqQ8K9cjeqS5Mm1ACkRCGFwD1ClZj3MVW4oiklaj6yiNAqrk8mb/RTY5/YtXU76OY6
         Ham+Wfqzi3Rcx/K8tPjeO0bkbHV8uxxaQSir81EcKjtdkovQgdvZngblrGxNikMs4XnF
         DS27x0nGCVTMW1PtOORSDT9iPYhkCwjsZvGztR7DcsFBEOj18OL9Gd+CUPfV/UIn60Cu
         3obM0YIErMtzb5SmDDahigHAggZw2YBRsvzoCWJAhSzOOTi+3eJxWIMpOxqlPwAFwQtb
         z0mMp1lKNkX+qHDTKpqq/WwBViakXx6EzDR4zv7m1iH7Ip3Zu6qkgtMQWYVrY3u/IXSU
         nGTw==
X-Forwarded-Encrypted: i=1; AJvYcCWm4pDDY5AFXZ+PDAgp0EdtinMiTwMCjs/Se3fw94PUS3HDE+MfXd6UUQY1i9jA3cLfkx1iztut2+XGoYBCnYtBLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2AHBHhut8bsZwXrIjWzarv/TNHtWTggffPbOlckOePB8EAb3e
	xkNm2mgVI3UV6AbNuOh/1TYvCAsirLE8YGHi/XH0N1ptmN69iZ0WuefIFnHlzubIJJQb55Sde2Q
	S
X-Gm-Gg: ASbGncvCOGfsWyqqkjhW61o3KkmOdh1faLR2jJg6waDyjiGwOfXbhMr4DhYZ8dFLmuI
	X2iJntTeqcvHSGTl52PdBgXS0wnRvgol1I22XGzQjkQz8OMtqMC+giHjKCwgG4Kj3uhwyO/Ma3A
	USK6Dqcf7btlot/D9ciNC+8C804LRUbKi5UuX1uSthTQMt67/Wl5mm/teHThYCQeOesnT81YgeC
	KFoWRK/HF5h+dHye/O0DAVAzn9iLR4su1oZp04xEkpqw0NiBEuI1A+qIEJgtcjuW6q8J8GHCdGY
	gSYM0tfqytOqSGQhADK5hhfhqup38Rb1C39LY2hFkmmwzuvdqDuu2/Uz
X-Google-Smtp-Source: AGHT+IHeHcCAYfYIfg5Jap/0uuzQ6Oi2iytybYQTlJnuwARBxYqbc0PxFDylyktyJP3I4EPX9/4QPQ==
X-Received: by 2002:a05:600c:1c19:b0:439:a1ef:c238 with SMTP id 5b1f17b1804b1-43c601e1162mr16070975e9.13.1741336948296;
        Fri, 07 Mar 2025 00:42:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0194f2sm4703188f8f.54.2025.03.07.00.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 00:42:27 -0800 (PST)
Date: Fri, 7 Mar 2025 09:42:25 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 02/25] drm/dumb-buffers: Provide helper to set pitch
 and size
Message-ID: <Z8qxcTIcD4W5OGwL@phenom.ffwll.local>
References: <20250218142542.438557-1-tzimmermann@suse.de>
 <20250218142542.438557-3-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218142542.438557-3-tzimmermann@suse.de>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Tue, Feb 18, 2025 at 03:23:25PM +0100, Thomas Zimmermann wrote:
> Add drm_modes_size_dumb(), a helper to calculate the dumb-buffer
> scanline pitch and allocation size. Implementations of struct
> drm_driver.dumb_create can call the new helper for their size
> computations.
> 
> There is currently quite a bit of code duplication among DRM's
> memory managers. Each calculates scanline pitch and buffer size
> from the given arguments, but the implementations are inconsistent
> in how they treat alignment and format support. Later patches will
> unify this code on top of drm_mode_size_dumb() as much as possible.
> 
> drm_mode_size_dumb() uses existing 4CC format helpers to interpret
> the given color mode. This makes the dumb-buffer interface behave
> similar the kernel's video= parameter. Current per-driver implementations
> again likely have subtle differences or bugs in how they support color
> modes.
> 
> The dumb-buffer UAPI is only specified for known color modes. These
> values describe linear, single-plane RGB color formats or legacy index
> formats. Other values should not be specified. But some user space
> still does. So for unknown color modes, there are a number of known
> exceptions for which drm_mode_size_dumb() calculates the pitch from
> the bpp value, as before. All other values work the same but print
> an error.
> 
> v3:
> - document the UAPI semantics
> - compute scanline pitch from for unknown color modes (Andy, Tomi)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_dumb_buffers.c | 116 +++++++++++++++++++++++++++++
>  include/drm/drm_dumb_buffers.h     |  14 ++++
>  include/uapi/drm/drm_mode.h        |  46 +++++++++++-
>  3 files changed, 175 insertions(+), 1 deletion(-)
>  create mode 100644 include/drm/drm_dumb_buffers.h
> 
> diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
> index 9916aaf5b3f2..600ab281712b 100644
> --- a/drivers/gpu/drm/drm_dumb_buffers.c
> +++ b/drivers/gpu/drm/drm_dumb_buffers.c
> @@ -25,6 +25,8 @@
>  
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
> +#include <drm/drm_dumb_buffers.h>
> +#include <drm/drm_fourcc.h>
>  #include <drm/drm_gem.h>
>  #include <drm/drm_mode.h>
>  
> @@ -57,6 +59,120 @@
>   * a hardware-specific ioctl to allocate suitable buffer objects.
>   */
>  
> +static int drm_mode_align_dumb(struct drm_mode_create_dumb *args,
> +			       unsigned long pitch_align,
> +			       unsigned long size_align)
> +{
> +	u32 pitch = args->pitch;
> +	u32 size;
> +
> +	if (!pitch)
> +		return -EINVAL;
> +
> +	if (pitch_align)
> +		pitch = roundup(pitch, pitch_align);
> +
> +	/* overflow checks for 32bit size calculations */
> +	if (args->height > U32_MAX / pitch)
> +		return -EINVAL;
> +
> +	if (!size_align)
> +		size_align = PAGE_SIZE;
> +	else if (!IS_ALIGNED(size_align, PAGE_SIZE))
> +		return -EINVAL;
> +
> +	size = ALIGN(args->height * pitch, size_align);
> +	if (!size)
> +		return -EINVAL;
> +
> +	args->pitch = pitch;
> +	args->size = size;
> +
> +	return 0;
> +}
> +
> +/**
> + * drm_mode_size_dumb - Calculates the scanline and buffer sizes for dumb buffers
> + * @dev: DRM device
> + * @args: Parameters for the dumb buffer
> + * @pitch_align: Scanline alignment in bytes
> + * @size_align: Buffer-size alignment in bytes
> + *
> + * The helper drm_mode_size_dumb() calculates the size of the buffer
> + * allocation and the scanline size for a dumb buffer. Callers have to
> + * set the buffers width, height and color mode in the argument @arg.
> + * The helper validates the correctness of the input and tests for
> + * possible overflows. If successful, it returns the dumb buffer's
> + * required scanline pitch and size in &args.
> + *
> + * The parameter @pitch_align allows the driver to specifies an
> + * alignment for the scanline pitch, if the hardware requires any. The
> + * calculated pitch will be a multiple of the alignment. The parameter
> + * @size_align allows to specify an alignment for buffer sizes. The
> + * returned size is always a multiple of PAGE_SIZE.
> + *
> + * Returns:
> + * Zero on success, or a negative error code otherwise.
> + */
> +int drm_mode_size_dumb(struct drm_device *dev,
> +		       struct drm_mode_create_dumb *args,
> +		       unsigned long pitch_align,
> +		       unsigned long size_align)
> +{
> +	u64 pitch = 0;
> +	u32 fourcc;
> +
> +	/*
> +	 * The scanline pitch depends on the buffer width and the color
> +	 * format. The latter is specified as a color-mode constant for
> +	 * which we first have to find the corresponding color format.
> +	 *
> +	 * Different color formats can have the same color-mode constant.
> +	 * For example XRGB8888 and BGRX8888 both have a color mode of 32.
> +	 * It is possible to use different formats for dumb-buffer allocation
> +	 * and rendering as long as all involved formats share the same
> +	 * color-mode constant.
> +	 */
> +	fourcc = drm_driver_color_mode_format(dev, args->bpp);
> +	if (fourcc != DRM_FORMAT_INVALID) {
> +		const struct drm_format_info *info = drm_format_info(fourcc);
> +
> +		if (!info)
> +			return -EINVAL;
> +		pitch = drm_format_info_min_pitch(info, 0, args->width);
> +	} else if (args->bpp) {
> +		/*
> +		 * Some userspace throws in arbitrary values for bpp and
> +		 * relies on the kernel to figure it out. In this case we
> +		 * fall back to the old method of using bpp directly. The
> +		 * over-commitment of memory from the rounding is acceptable
> +		 * for compatibility with legacy userspace. We have a number
> +		 * of deprecated legacy values that are explicitly supported.
> +		 */
> +		switch (args->bpp) {
> +		default:
> +			drm_warn(dev, "Unknown color mode %d; guessing buffer size.\n",
> +				 args->bpp);
> +			fallthrough;

We cannot let userspace trigger dmesg warnings (or anything else really
that spams logs). Also I think for future proofing it would be good if we
just reject anything we don't currently know about instead of silently
letting this mess become worse. Hence my vote is to reject unknown bpp
hack values.

> +		case 12:
> +		case 15:
> +		case 30: /* see drm_gem_afbc_get_bpp() */

This is a bit too cryptic to me, I think if you want to do comments I'd
just put a long-form one above each value that explains where we've found
it and why it happens. I'm also assuming these all have depth = 0, which I
guess is something we should check just to keep this as strict as
possible? Or do they have matching depth?

Cheers, Sima

> +		case 10:
> +		case 64: /* used by Mesa */
> +			pitch = args->width * DIV_ROUND_UP(args->bpp, SZ_8);
> +			break;
> +		}
> +	}
> +
> +	if (!pitch || pitch > U32_MAX)
> +		return -EINVAL;
> +
> +	args->pitch = pitch;
> +
> +	return drm_mode_align_dumb(args, pitch_align, size_align);
> +}
> +EXPORT_SYMBOL(drm_mode_size_dumb);
> +
>  int drm_mode_create_dumb(struct drm_device *dev,
>  			 struct drm_mode_create_dumb *args,
>  			 struct drm_file *file_priv)
> diff --git a/include/drm/drm_dumb_buffers.h b/include/drm/drm_dumb_buffers.h
> new file mode 100644
> index 000000000000..6fe36004b19d
> --- /dev/null
> +++ b/include/drm/drm_dumb_buffers.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +#ifndef __DRM_DUMB_BUFFERS_H__
> +#define __DRM_DUMB_BUFFERS_H__
> +
> +struct drm_device;
> +struct drm_mode_create_dumb;
> +
> +int drm_mode_size_dumb(struct drm_device *dev,
> +		       struct drm_mode_create_dumb *args,
> +		       unsigned long pitch_align,
> +		       unsigned long size_align);
> +
> +#endif
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index c082810c08a8..eea09103b1a6 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -1058,7 +1058,7 @@ struct drm_mode_crtc_page_flip_target {
>   * struct drm_mode_create_dumb - Create a KMS dumb buffer for scanout.
>   * @height: buffer height in pixels
>   * @width: buffer width in pixels
> - * @bpp: bits per pixel
> + * @bpp: color mode
>   * @flags: must be zero
>   * @handle: buffer object handle
>   * @pitch: number of bytes between two consecutive lines
> @@ -1066,6 +1066,50 @@ struct drm_mode_crtc_page_flip_target {
>   *
>   * User-space fills @height, @width, @bpp and @flags. If the IOCTL succeeds,
>   * the kernel fills @handle, @pitch and @size.
> + *
> + * The value of @bpp is a color-mode number describing a specific format
> + * or a variant thereof. The value often corresponds to the number of bits
> + * per pixel for most modes, although there are exceptions. Each color mode
> + * maps to a DRM format plus a number of modes with similar pixel layout.
> + * Framebuffer layout is always linear.
> + *
> + * Support for all modes and formats is optional. Even if dumb-buffer
> + * creation with a certain color mode succeeds, it is not guaranteed that
> + * the DRM driver supports any of the related formats. Most drivers support
> + * a color mode of 32 with a format of DRM_FORMAT_XRGB8888 on their primary
> + * plane.
> + *
> + * +------------+------------------------+------------------------+
> + * | Color mode | Framebuffer format     | Compatibles            |
> + * +============+========================+========================+
> + * |     32     |  * DRM_FORMAT_XRGB8888 |  * DRM_FORMAT_XBGR8888 |
> + * |            |                        |  * DRM_FORMAT_RGBX8888 |
> + * |            |                        |  * DRM_FORMAT_BGRX8888 |
> + * +------------+------------------------+------------------------+
> + * |     24     |  * DRM_FORMAT_RGB888   |  * DRM_FORMAT_BGR888   |
> + * +------------+------------------------+------------------------+
> + * |     16     |  * DRM_FORMAT_RGB565   |  * DRM_FORMAT_BGR565   |
> + * +------------+------------------------+------------------------+
> + * |     15     |  * DRM_FORMAT_XRGB1555 |  * DRM_FORMAT_XBGR1555 |
> + * |            |                        |  * DRM_FORMAT_RGBX1555 |
> + * |            |                        |  * DRM_FORMAT_BGRX1555 |
> + * +------------+------------------------+------------------------+
> + * |      8     |  * DRM_FORMAT_C8       |  * DRM_FORMAT_R8       |
> + * +------------+------------------------+------------------------+
> + * |      4     |  * DRM_FORMAT_C4       |  * DRM_FORMAT_R4       |
> + * +------------+------------------------+------------------------+
> + * |      2     |  * DRM_FORMAT_C2       |  * DRM_FORMAT_R2       |
> + * +------------+------------------------+------------------------+
> + * |      1     |  * DRM_FORMAT_C1       |  * DRM_FORMAT_R1       |
> + * +------------+------------------------+------------------------+
> + *
> + * Color modes of 10, 12, 15, 30 and 64 are only supported for use by
> + * legacy user space. Please don't use them in new code. Other modes
> + * are not support.
> + *
> + * Do not attempt to allocate anything but linear framebuffer memory
> + * with single-plane RGB data. Allocation of other framebuffer
> + * layouts requires dedicated ioctls in the respective DRM driver.
>   */
>  struct drm_mode_create_dumb {
>  	__u32 height;
> -- 
> 2.48.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

