Return-Path: <linux-renesas-soc+bounces-14135-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC571A568C2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Mar 2025 14:20:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39B3D188BF4A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Mar 2025 13:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75C921A45F;
	Fri,  7 Mar 2025 13:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="VOvmr3uN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E829219EB6
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Mar 2025 13:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741353560; cv=none; b=o/Le4bFtFdLsdiLDxZOuGnNLjnaVAVR8QPh3r0oMTKAri+64PasCImj7aV4Si4/9e/YUzyieCEaXggUKESdJojSadB+U41NKszlLi7JoeBN67jF8S3mcp9Yp6AjvkXCAGVG683uKBTr+y1XuqoKxMf+V1QW0GBW1gb7aME+TgKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741353560; c=relaxed/simple;
	bh=jt+9rA9ZPCCaYRIrwyfR3Op0oyoIsDZhOFigxKin82U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RoW/OdDdlJiB+3zEQQVszWQoBp/NUlzOHocMfli/rF8XEOnPbXGz3dvJifNN0IVBsOK4XAXH0ASGOt1IIpRcKimHrXdzhCqkV9uNvho6pvmhelRYbquP4u0cb0X8ntEAVDQsm0bUZpdf8FIG7ZxVITn+uhzLQvKNf5Qgi/q3+rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=VOvmr3uN; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-abf5e1a6cd3so337726766b.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Mar 2025 05:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1741353556; x=1741958356; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GmXXr/GHvAGv2swMlIkbl+Www19HcX8d7ze1AMoIM9w=;
        b=VOvmr3uN5yuFAP7jsmQaIjjt6EjSI5vHPJ2bPVQurpz/9bFA9L4kY7Dug9TNe4h/Z2
         SJPn0UXR+ZjajyDBuAgUz9pbLvf37vos0vGtOMxpRVrS5sZmT4h6RAg0aNEr8+dtwpum
         P4s7CyJJ6uiK1iN35KtAMuA0oUBZj/O0pFHm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741353556; x=1741958356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmXXr/GHvAGv2swMlIkbl+Www19HcX8d7ze1AMoIM9w=;
        b=HpyCdHYsNVMGDh4sNLfamTjiuWWwvj+2czSNnqqgbD6KK3yi4b+MdkwQ0KpP1zkG3K
         mpe2wvk3Ux2FfpfuUOQd8Xra3QB+9+47WO0dHEgx6MPVWWEEcX+ZbqR0FjAPOJdO6AZ5
         H8GU+vPSRjW30M3efn8bbpXObiM2u2kNY4W2VYGLzFeFqC/5r1LC7y8pZ4AThfuPDBtL
         VxpHhwgXBqNfNWmgDiEbjVH8ymXuAdPNCkssuPEoDxLeohhgMQJQFTgHJneL4sha8O47
         97QsGJW91Gbw8Vwa6x1+vE2y2hXzG4Tr3xKY0UQcZy7NLXKtyUptHbTwzmnZ/xwZUMUZ
         QhFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlAM+8BDUmSVXFh57D6eLF4/TJGdJHYrz4LwBaG48HPaDWaAbFoPViff2Wnlo/CQWRnE4+XNht8TMIxSwORuKUJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+cNOrufU8SciZShO/d7woybsTHxjNAREJS4lg7ME5KQvnGsyT
	2lcccSs1bHiJez+tzXtURIh8QoKCcQnP+pVUag9gZUnfw7ADNdjrcoS0lNz0OG4=
X-Gm-Gg: ASbGnctNwPknC0ACO1PlcOxwjCs8SpYDH4XPtarvjpCtMCXY9PkCPZJh22i9gd3zyNz
	W1/RsnvRxJk1Ic5B/roOIrJuY/LucqrnDF0CvXvVbkP01Sg3fk39CqdbgtjHKRv1ZlWxvvkOI6o
	fvPkYa4xDExcSxR3zddw+TQHybWrQXTYSXp707q9kws2C46licHd6UxVoRQGL/YAFAg3cx1alTC
	Ly5qcZitxNk7B51/yF4xBelA7GyqmA3aWtq8OSMJLu63iY2Lhr4rXuLETVOcx6fQLfn+rKbUOFO
	PuQEehmU+XXblU7CqRfY09qcIvCrNYCltxpk3HEDUx6vvYUVpH5VGJu/
X-Google-Smtp-Source: AGHT+IGWJEXpT4oFObUhXEX1baZSA5ka+RDW0BObeZF31pqEHYIrQhNdRsTwmr/EHhhCwd6ldgP0tQ==
X-Received: by 2002:a17:907:7ea9:b0:abf:6b30:7a94 with SMTP id a640c23a62f3a-ac252f4c9eamr387695566b.45.1741353555414;
        Fri, 07 Mar 2025 05:19:15 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2399d2dd8sm272788966b.166.2025.03.07.05.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 05:19:14 -0800 (PST)
Date: Fri, 7 Mar 2025 14:19:12 +0100
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
Message-ID: <Z8ryUGgxqVTEw9pe@phenom.ffwll.local>
References: <20250218142542.438557-1-tzimmermann@suse.de>
 <20250218142542.438557-3-tzimmermann@suse.de>
 <Z8qxcTIcD4W5OGwL@phenom.ffwll.local>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8qxcTIcD4W5OGwL@phenom.ffwll.local>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Fri, Mar 07, 2025 at 09:42:25AM +0100, Simona Vetter wrote:
> On Tue, Feb 18, 2025 at 03:23:25PM +0100, Thomas Zimmermann wrote:
> > Add drm_modes_size_dumb(), a helper to calculate the dumb-buffer
> > scanline pitch and allocation size. Implementations of struct
> > drm_driver.dumb_create can call the new helper for their size
> > computations.
> > 
> > There is currently quite a bit of code duplication among DRM's
> > memory managers. Each calculates scanline pitch and buffer size
> > from the given arguments, but the implementations are inconsistent
> > in how they treat alignment and format support. Later patches will
> > unify this code on top of drm_mode_size_dumb() as much as possible.
> > 
> > drm_mode_size_dumb() uses existing 4CC format helpers to interpret
> > the given color mode. This makes the dumb-buffer interface behave
> > similar the kernel's video= parameter. Current per-driver implementations
> > again likely have subtle differences or bugs in how they support color
> > modes.
> > 
> > The dumb-buffer UAPI is only specified for known color modes. These
> > values describe linear, single-plane RGB color formats or legacy index
> > formats. Other values should not be specified. But some user space
> > still does. So for unknown color modes, there are a number of known
> > exceptions for which drm_mode_size_dumb() calculates the pitch from
> > the bpp value, as before. All other values work the same but print
> > an error.
> > 
> > v3:
> > - document the UAPI semantics
> > - compute scanline pitch from for unknown color modes (Andy, Tomi)
> > 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > ---
> >  drivers/gpu/drm/drm_dumb_buffers.c | 116 +++++++++++++++++++++++++++++
> >  include/drm/drm_dumb_buffers.h     |  14 ++++
> >  include/uapi/drm/drm_mode.h        |  46 +++++++++++-
> >  3 files changed, 175 insertions(+), 1 deletion(-)
> >  create mode 100644 include/drm/drm_dumb_buffers.h
> > 
> > diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
> > index 9916aaf5b3f2..600ab281712b 100644
> > --- a/drivers/gpu/drm/drm_dumb_buffers.c
> > +++ b/drivers/gpu/drm/drm_dumb_buffers.c
> > @@ -25,6 +25,8 @@
> >  
> >  #include <drm/drm_device.h>
> >  #include <drm/drm_drv.h>
> > +#include <drm/drm_dumb_buffers.h>
> > +#include <drm/drm_fourcc.h>
> >  #include <drm/drm_gem.h>
> >  #include <drm/drm_mode.h>
> >  
> > @@ -57,6 +59,120 @@
> >   * a hardware-specific ioctl to allocate suitable buffer objects.
> >   */
> >  
> > +static int drm_mode_align_dumb(struct drm_mode_create_dumb *args,
> > +			       unsigned long pitch_align,
> > +			       unsigned long size_align)
> > +{
> > +	u32 pitch = args->pitch;
> > +	u32 size;
> > +
> > +	if (!pitch)
> > +		return -EINVAL;
> > +
> > +	if (pitch_align)
> > +		pitch = roundup(pitch, pitch_align);
> > +
> > +	/* overflow checks for 32bit size calculations */
> > +	if (args->height > U32_MAX / pitch)
> > +		return -EINVAL;
> > +
> > +	if (!size_align)
> > +		size_align = PAGE_SIZE;
> > +	else if (!IS_ALIGNED(size_align, PAGE_SIZE))
> > +		return -EINVAL;
> > +
> > +	size = ALIGN(args->height * pitch, size_align);
> > +	if (!size)
> > +		return -EINVAL;
> > +
> > +	args->pitch = pitch;
> > +	args->size = size;
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * drm_mode_size_dumb - Calculates the scanline and buffer sizes for dumb buffers
> > + * @dev: DRM device
> > + * @args: Parameters for the dumb buffer
> > + * @pitch_align: Scanline alignment in bytes
> > + * @size_align: Buffer-size alignment in bytes
> > + *
> > + * The helper drm_mode_size_dumb() calculates the size of the buffer
> > + * allocation and the scanline size for a dumb buffer. Callers have to
> > + * set the buffers width, height and color mode in the argument @arg.
> > + * The helper validates the correctness of the input and tests for
> > + * possible overflows. If successful, it returns the dumb buffer's
> > + * required scanline pitch and size in &args.
> > + *
> > + * The parameter @pitch_align allows the driver to specifies an
> > + * alignment for the scanline pitch, if the hardware requires any. The
> > + * calculated pitch will be a multiple of the alignment. The parameter
> > + * @size_align allows to specify an alignment for buffer sizes. The
> > + * returned size is always a multiple of PAGE_SIZE.
> > + *
> > + * Returns:
> > + * Zero on success, or a negative error code otherwise.
> > + */
> > +int drm_mode_size_dumb(struct drm_device *dev,
> > +		       struct drm_mode_create_dumb *args,
> > +		       unsigned long pitch_align,
> > +		       unsigned long size_align)
> > +{
> > +	u64 pitch = 0;
> > +	u32 fourcc;
> > +
> > +	/*
> > +	 * The scanline pitch depends on the buffer width and the color
> > +	 * format. The latter is specified as a color-mode constant for
> > +	 * which we first have to find the corresponding color format.
> > +	 *
> > +	 * Different color formats can have the same color-mode constant.
> > +	 * For example XRGB8888 and BGRX8888 both have a color mode of 32.
> > +	 * It is possible to use different formats for dumb-buffer allocation
> > +	 * and rendering as long as all involved formats share the same
> > +	 * color-mode constant.
> > +	 */
> > +	fourcc = drm_driver_color_mode_format(dev, args->bpp);
> > +	if (fourcc != DRM_FORMAT_INVALID) {
> > +		const struct drm_format_info *info = drm_format_info(fourcc);
> > +
> > +		if (!info)
> > +			return -EINVAL;
> > +		pitch = drm_format_info_min_pitch(info, 0, args->width);
> > +	} else if (args->bpp) {
> > +		/*
> > +		 * Some userspace throws in arbitrary values for bpp and
> > +		 * relies on the kernel to figure it out. In this case we
> > +		 * fall back to the old method of using bpp directly. The
> > +		 * over-commitment of memory from the rounding is acceptable
> > +		 * for compatibility with legacy userspace. We have a number
> > +		 * of deprecated legacy values that are explicitly supported.
> > +		 */
> > +		switch (args->bpp) {
> > +		default:
> > +			drm_warn(dev, "Unknown color mode %d; guessing buffer size.\n",
> > +				 args->bpp);
> > +			fallthrough;
> 
> We cannot let userspace trigger dmesg warnings (or anything else really
> that spams logs). Also I think for future proofing it would be good if we
> just reject anything we don't currently know about instead of silently
> letting this mess become worse. Hence my vote is to reject unknown bpp
> hack values.
> 
> > +		case 12:
> > +		case 15:
> > +		case 30: /* see drm_gem_afbc_get_bpp() */
> 
> This is a bit too cryptic to me, I think if you want to do comments I'd
> just put a long-form one above each value that explains where we've found
> it and why it happens. I'm also assuming these all have depth = 0, which I
> guess is something we should check just to keep this as strict as
> possible? Or do they have matching depth?

Correction from irc: Thomas pointed out that there's no depth in the
create_dumb ioctl, I was mixing this up with addfb and failed to check. So
please disregard this part, I was fabricating stuff out of some very thin
air (and probably not enough coffee in the brain too).
-Sima

> 
> Cheers, Sima
> 
> > +		case 10:
> > +		case 64: /* used by Mesa */
> > +			pitch = args->width * DIV_ROUND_UP(args->bpp, SZ_8);
> > +			break;
> > +		}
> > +	}
> > +
> > +	if (!pitch || pitch > U32_MAX)
> > +		return -EINVAL;
> > +
> > +	args->pitch = pitch;
> > +
> > +	return drm_mode_align_dumb(args, pitch_align, size_align);
> > +}
> > +EXPORT_SYMBOL(drm_mode_size_dumb);
> > +
> >  int drm_mode_create_dumb(struct drm_device *dev,
> >  			 struct drm_mode_create_dumb *args,
> >  			 struct drm_file *file_priv)
> > diff --git a/include/drm/drm_dumb_buffers.h b/include/drm/drm_dumb_buffers.h
> > new file mode 100644
> > index 000000000000..6fe36004b19d
> > --- /dev/null
> > +++ b/include/drm/drm_dumb_buffers.h
> > @@ -0,0 +1,14 @@
> > +/* SPDX-License-Identifier: MIT */
> > +
> > +#ifndef __DRM_DUMB_BUFFERS_H__
> > +#define __DRM_DUMB_BUFFERS_H__
> > +
> > +struct drm_device;
> > +struct drm_mode_create_dumb;
> > +
> > +int drm_mode_size_dumb(struct drm_device *dev,
> > +		       struct drm_mode_create_dumb *args,
> > +		       unsigned long pitch_align,
> > +		       unsigned long size_align);
> > +
> > +#endif
> > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> > index c082810c08a8..eea09103b1a6 100644
> > --- a/include/uapi/drm/drm_mode.h
> > +++ b/include/uapi/drm/drm_mode.h
> > @@ -1058,7 +1058,7 @@ struct drm_mode_crtc_page_flip_target {
> >   * struct drm_mode_create_dumb - Create a KMS dumb buffer for scanout.
> >   * @height: buffer height in pixels
> >   * @width: buffer width in pixels
> > - * @bpp: bits per pixel
> > + * @bpp: color mode
> >   * @flags: must be zero
> >   * @handle: buffer object handle
> >   * @pitch: number of bytes between two consecutive lines
> > @@ -1066,6 +1066,50 @@ struct drm_mode_crtc_page_flip_target {
> >   *
> >   * User-space fills @height, @width, @bpp and @flags. If the IOCTL succeeds,
> >   * the kernel fills @handle, @pitch and @size.
> > + *
> > + * The value of @bpp is a color-mode number describing a specific format
> > + * or a variant thereof. The value often corresponds to the number of bits
> > + * per pixel for most modes, although there are exceptions. Each color mode
> > + * maps to a DRM format plus a number of modes with similar pixel layout.
> > + * Framebuffer layout is always linear.
> > + *
> > + * Support for all modes and formats is optional. Even if dumb-buffer
> > + * creation with a certain color mode succeeds, it is not guaranteed that
> > + * the DRM driver supports any of the related formats. Most drivers support
> > + * a color mode of 32 with a format of DRM_FORMAT_XRGB8888 on their primary
> > + * plane.
> > + *
> > + * +------------+------------------------+------------------------+
> > + * | Color mode | Framebuffer format     | Compatibles            |
> > + * +============+========================+========================+
> > + * |     32     |  * DRM_FORMAT_XRGB8888 |  * DRM_FORMAT_XBGR8888 |
> > + * |            |                        |  * DRM_FORMAT_RGBX8888 |
> > + * |            |                        |  * DRM_FORMAT_BGRX8888 |
> > + * +------------+------------------------+------------------------+
> > + * |     24     |  * DRM_FORMAT_RGB888   |  * DRM_FORMAT_BGR888   |
> > + * +------------+------------------------+------------------------+
> > + * |     16     |  * DRM_FORMAT_RGB565   |  * DRM_FORMAT_BGR565   |
> > + * +------------+------------------------+------------------------+
> > + * |     15     |  * DRM_FORMAT_XRGB1555 |  * DRM_FORMAT_XBGR1555 |
> > + * |            |                        |  * DRM_FORMAT_RGBX1555 |
> > + * |            |                        |  * DRM_FORMAT_BGRX1555 |
> > + * +------------+------------------------+------------------------+
> > + * |      8     |  * DRM_FORMAT_C8       |  * DRM_FORMAT_R8       |
> > + * +------------+------------------------+------------------------+
> > + * |      4     |  * DRM_FORMAT_C4       |  * DRM_FORMAT_R4       |
> > + * +------------+------------------------+------------------------+
> > + * |      2     |  * DRM_FORMAT_C2       |  * DRM_FORMAT_R2       |
> > + * +------------+------------------------+------------------------+
> > + * |      1     |  * DRM_FORMAT_C1       |  * DRM_FORMAT_R1       |
> > + * +------------+------------------------+------------------------+
> > + *
> > + * Color modes of 10, 12, 15, 30 and 64 are only supported for use by
> > + * legacy user space. Please don't use them in new code. Other modes
> > + * are not support.
> > + *
> > + * Do not attempt to allocate anything but linear framebuffer memory
> > + * with single-plane RGB data. Allocation of other framebuffer
> > + * layouts requires dedicated ioctls in the respective DRM driver.
> >   */
> >  struct drm_mode_create_dumb {
> >  	__u32 height;
> > -- 
> > 2.48.1
> > 
> 
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

