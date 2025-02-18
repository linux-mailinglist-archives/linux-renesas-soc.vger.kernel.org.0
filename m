Return-Path: <linux-renesas-soc+bounces-13295-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86099A3A7AE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 20:34:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D26B3189258B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 19:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9FB11E835B;
	Tue, 18 Feb 2025 19:32:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB201E8338;
	Tue, 18 Feb 2025 19:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739907168; cv=none; b=UyzqLvAhiSGyZWCUmzC3CUi51KgbvEgEiT8LlMgixh2uRiZvJ3a/vw9zp5bOHx+hq8UqhuT+qDVodKMmjwwE59VXG48wtMNdng57B/VdRMcOr0oYCHjD44iJQtjyyoo6scB5mz4GJGuT02eQ3SOR36Cx3pvtDgD3g7DlsDjywOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739907168; c=relaxed/simple;
	bh=K639qySusfhqWVzkmR1NrpWaIuD4POoCyjA6d1Oq07g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PEM3ujJTjd8p5N7bTjkcrU/Pyxzt8WJJTCsgF3KEKD736RRUseltnnZ5ZPD9LmjBbixxBBYkdihtqkFHDW/BWRWDUR52kHx0hWfy3ph++wNzYN6rS5oyg0XaJBJ+wfAGbbOYLz9JKj6WXQarQf8JEQe/s5kItEAlh2CZqNlMzl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5209ca3e9a6so1115450e0c.2;
        Tue, 18 Feb 2025 11:32:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739907163; x=1740511963;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yb7jRjd6uguB9cG41rTvHpSN+ZVtgW/KmSvyau5JmeE=;
        b=rjqWmTb+726NERGirauhqdhJ1ECVSMt9jfS6SsjzkyMzDoUQBGnTr0pXzbwep6OO4T
         7qwusH/fPj8BGaxDwm3ZZL5p1Usq4UEIObOl1PC7sSFV7a7GpT1cXDwXbV1vkH430nSN
         OIFC69T2H/KMNZZW+HMu7XZSGciY582HyVpvHr04LYQtpJmolW4zYncYF8TXd07GS3Dc
         xTirNPNeKcpGBcgqhr6OWsTnBm8zDV79DIFMYld+JZTz3jZKpHUVZrksyUudEspXdHFG
         3eiQJW3di/uaza3yWv1OUtG8s5nCbIdcNYlBBTQ5NS0ufTL255sk681EbRH/7xOTD3MR
         yXIA==
X-Forwarded-Encrypted: i=1; AJvYcCUvmij3GiYOl2dOcjFQpJoPc8+VF4VMBVvezIpqW4lMpCmV+bCnMXW6mWwEbo4aaj70PQTU3wnwn5ovv4I=@vger.kernel.org, AJvYcCVH2wW3TKGxiWLNWEFFQXLkOAGSiG4K401bc+kHHjUVuC9BMZGR8SEisOzxBaP1hDFBMGot2O8KcTmsdAeSaQ46wsY=@vger.kernel.org, AJvYcCWFS4x3ESDE1cDV/VoL4KDdTF2v45RVmrlVN7gpJU24+05/kyvE1ymTYX07fdZ2qxdgCDCxWs7k9z2xG7LA4rPYJWg=@vger.kernel.org, AJvYcCXae97kRmIs1JQ9xDD7d3CtdekMLTzp6PlyJJ+NJGOuEB+tjqUBeWHe8DFWVCLbarM9XYjnA46ATvvycmbh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1SiVVbr79f7LwN0h1jcFMOjUcIuq8ym3gHlTspcM3auFm2CEI
	yWQZuL6Y+pusr9el9LJoeJKXtM3JL/ov08b9KxlorSnwvIBHS7bzYPE3bfwZ
X-Gm-Gg: ASbGncs2b8gk+p1Lv36jX93BvRbWEAOGkJsSlE58hOXgmZqmsbvllI78fRNokfib+ni
	39zA0uLKxlqfEuYGtK5bsvVO72g9Jbx8eYQp2ccq6SJoApErgOyHbSsglINsL+zCk2PaX/qUtfv
	aQjmDywSRo72EqSSiKiDpERwCFUto4dUvQsWxVhHoE+LGMbPM/7zzwlhR/cdgd0+0r5yMH2hw78
	3lfuxBOpQJoyeMADv/fj/n5SzACghhxPg7iqalaNXcrM5VhhaP//P3ZG0NnX12n/Gn+9fl26V+Y
	TDabG+yveHupj3yqVp7aw6MGuwunl/zayiqDPwc5FHFHtj5fpORe8g==
X-Google-Smtp-Source: AGHT+IGfJAwFjAoDydTJzePAPfD6wVMVF3T64exnojHFQGgbaybg3dZcYd0IBnNW70mT4MJT0woGkg==
X-Received: by 2002:a05:6122:218d:b0:520:62ce:990f with SMTP id 71dfb90a1353d-521c4694818mr547033e0c.11.1739907161646;
        Tue, 18 Feb 2025 11:32:41 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52098805834sm2222249e0c.26.2025.02.18.11.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 11:32:40 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4be5b33ff91so631733137.1;
        Tue, 18 Feb 2025 11:32:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUbrIXYcc+mqlqWNdTBrpAAtPxPRoCOcwoUYupKK0AHfWhxI1FkYOvvSjhuJgd0KMeu4+1Uz4MIuyHqkjMT@vger.kernel.org, AJvYcCWDGGIWDShcWf52HRFdXaQu/o3p/9c1uOA8ARE7rzyesBBcfApUA6jnSXMYOtHdtP2rI5tOK4XeHUGo9pDWeQE0TGg=@vger.kernel.org, AJvYcCXEAdinysuxI3FcT2jT1B49zR966bncMWEEAueN5rhm9P7qAYlpHiIVB5EKwo21qRtJbxM6IWHFWjTpxKU9cc0eSz0=@vger.kernel.org, AJvYcCXoWZwWQcZQ3JZKakY5CBn0ZAciNayE4Eo9Mr2HqOqzJV2jxIyDYvI7QDlt/b/IkXmOpLcXVvzYkn5kNL8=@vger.kernel.org
X-Received: by 2002:a05:6102:b10:b0:4bb:d394:46c5 with SMTP id
 ada2fe7eead31-4be85bb8970mr656557137.9.1739907160582; Tue, 18 Feb 2025
 11:32:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218142542.438557-1-tzimmermann@suse.de> <20250218142542.438557-3-tzimmermann@suse.de>
In-Reply-To: <20250218142542.438557-3-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Feb 2025 20:32:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV939ibJTRSaO-oW2Jz4zbkXGRpUYrmA7e=yQfF7W-k_g@mail.gmail.com>
X-Gm-Features: AWEUYZnARFSxvjPUxC-uDBDfMGz-IvL-HNvEMBPwKo8soOA7GylWEHj75pA7v34
Message-ID: <CAMuHMdV939ibJTRSaO-oW2Jz4zbkXGRpUYrmA7e=yQfF7W-k_g@mail.gmail.com>
Subject: Re: [PATCH v3 02/25] drm/dumb-buffers: Provide helper to set pitch
 and size
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
	simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org, 
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Tue, 18 Feb 2025 at 15:26, Thomas Zimmermann <tzimmermann@suse.de> wrote:
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

Thanks for your patch!

> --- a/drivers/gpu/drm/drm_dumb_buffers.c
> +++ b/drivers/gpu/drm/drm_dumb_buffers.c
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
> +                      struct drm_mode_create_dumb *args,
> +                      unsigned long pitch_align,
> +                      unsigned long size_align)
> +{
> +       u64 pitch = 0;
> +       u32 fourcc;
> +
> +       /*
> +        * The scanline pitch depends on the buffer width and the color
> +        * format. The latter is specified as a color-mode constant for
> +        * which we first have to find the corresponding color format.
> +        *
> +        * Different color formats can have the same color-mode constant.
> +        * For example XRGB8888 and BGRX8888 both have a color mode of 32.
> +        * It is possible to use different formats for dumb-buffer allocation
> +        * and rendering as long as all involved formats share the same
> +        * color-mode constant.
> +        */
> +       fourcc = drm_driver_color_mode_format(dev, args->bpp);
> +       if (fourcc != DRM_FORMAT_INVALID) {
> +               const struct drm_format_info *info = drm_format_info(fourcc);
> +
> +               if (!info)
> +                       return -EINVAL;
> +               pitch = drm_format_info_min_pitch(info, 0, args->width);
> +       } else if (args->bpp) {
> +               /*
> +                * Some userspace throws in arbitrary values for bpp and
> +                * relies on the kernel to figure it out. In this case we
> +                * fall back to the old method of using bpp directly. The
> +                * over-commitment of memory from the rounding is acceptable
> +                * for compatibility with legacy userspace. We have a number
> +                * of deprecated legacy values that are explicitly supported.
> +                */
> +               switch (args->bpp) {
> +               default:
> +                       drm_warn(dev, "Unknown color mode %d; guessing buffer size.\n",

%u

> +                                args->bpp);
> +                       fallthrough;
> +               case 12:
> +               case 15:
> +               case 30: /* see drm_gem_afbc_get_bpp() */
> +               case 10:

Perhaps keep them sorted numerically?

> +               case 64: /* used by Mesa */
> +                       pitch = args->width * DIV_ROUND_UP(args->bpp, SZ_8);
> +                       break;
> +               }
> +       }
> +
> +       if (!pitch || pitch > U32_MAX)
> +               return -EINVAL;
> +
> +       args->pitch = pitch;
> +
> +       return drm_mode_align_dumb(args, pitch_align, size_align);
> +}
> +EXPORT_SYMBOL(drm_mode_size_dumb);
> +
>  int drm_mode_create_dumb(struct drm_device *dev,
>                          struct drm_mode_create_dumb *args,
>                          struct drm_file *file_priv)
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
> +                      struct drm_mode_create_dumb *args,
> +                      unsigned long pitch_align,
> +                      unsigned long size_align);
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

+ DRM_FORMAT_D8? (and 4/2/1 below)

And DRM_FORMAT_Y8, if/when Tomi's series introducing that is accepted...

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
>         __u32 height;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

