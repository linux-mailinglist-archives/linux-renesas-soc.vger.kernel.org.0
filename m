Return-Path: <linux-renesas-soc+bounces-13457-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA46A3F12C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 10:59:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C09FB1636E9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 09:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B0DA204C0E;
	Fri, 21 Feb 2025 09:57:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8779E1F9F70;
	Fri, 21 Feb 2025 09:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740131870; cv=none; b=LPkXZCzda28aGIozJFQDYlI6wH2wEbzUEfUfPG6JVyjdDejPqbd9aRD+/eYjaGUCq/4Rq977LvhYRI5/jjDWN4exhlsOrWtfAlTk8PX1PHSmb0iaFt0sCacxUKLxDeFrlvyNuAYUs2o1ghCVuW1Apv2bsiLWU0tCvkSqb03iawQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740131870; c=relaxed/simple;
	bh=bsAk0fKMy1E3IDw29e4DwX52DVtBpITBlP4ScSN0CWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EjfBhb7LH4bE8G/MXMITy+tdVYNvvUx7VLBxyRLgnHXYL6N2y2NOWzO+CIK9PcPHVmLlgxTPzXf8jGjo70GFWjITXJwZhDhGqG+YIHUI8dvH96FwK4VKFI+Gwh9lZJ+j7U/4BGNwDvD/e18ol3K2FpC+HqlMeJRZXGCvS7V/jvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4bfb4853c29so418298137.0;
        Fri, 21 Feb 2025 01:57:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740131866; x=1740736666;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VRmDUg88sJqiPwLbbhmS638djtZJpa1TX+xwhTJhivE=;
        b=dHG+DGxRXef/+EPV+gkgSU47bKhUr0Zt6089UL3ii+ov7+2Bq7AowR0NyDeW5grfaD
         7hGpIq2DGKGAqVQp2m0rdoddkQv/eDbjuIOxDdprV60TuOKgsTKe72e4GNHGZyOcP0kw
         06b+4V6wLRnjkNZb9yUeJxtg8LOxoPy/OMGd85QLQKpcSQCbkPn11SMFoWmDRFtaJJxx
         7gkOgVscnjObbxB16fo2EZ2AKIEq7iS0CvTUjhHzR/m6cG5Lj2bi2gwVuNBcGmOR/i8P
         j1UlbtcDjZ6nNMocd+odWgC1K3ZA2W6JvI/npUR3aPfj9qes2JbxdHz4GscRPyi2Qo5k
         E3HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcghH35+eSZus5NgQTi1b3fEB2GmYeLTNzu2HHfA1+DbsjUb+QTLlwTU+KBXPRVGGrEGRe9tYZfLSxaXto@vger.kernel.org, AJvYcCWlFXzAwxvDM6dUcP8ecfLs72XsCap+Fa7hCsjuyJBhABSA/Wgxeg0PZylRjLN+swETPpN/nWO9ueaKNMA=@vger.kernel.org, AJvYcCXJAZinVsoQs3w4vCupkyeOHzEfp5PTRAbOnVFvjdte2026kO8YwELRjP6t5xfzp96fFTWgIystKTJmNlsPpA+vhOM=@vger.kernel.org, AJvYcCXPAZ3ri3tH2z14mxiluzWOW4hLpcibXD59LNonbmLql5qFljWGGl/Z7qrfV10nHS0MvgDLfzdepLHL/KMpEeKvm9E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdZsKinLKVkRLDTxGSxX16ZxOcO1+tciEZnq6/rG8bYtOO/yB1
	4Gsuj/9ioHvmIwLuguDT1kGUYmC9B+3x1q0bvp2+tOMbLJhyoWWEwyJOzeSv
X-Gm-Gg: ASbGncuAgeeP7z+//P9MsvHFRSz4tBn+5MEj7IsoQPUX9zYz7rhpuhdqBQtq6oiX02C
	xBdZvpIrO0Ls4FlU8dMhVJo//cld8EsJqG2iX/Flpr3cHqnM1X+5kcSOFSlj/jQlPWAqrKb1OrL
	vqRu8SH7oGqW6euT3/P+Ox9jS2D8Cumr6Wt+KgXTWuuVM0fTGrCwu7ccniLCRx0jdm6xv7KG5tX
	XCnVKY0JoU9cU6HtwerTFaCef8S1GXc1k7YdUxjDipP82SvuphGqB76gXcjJeEO2bqgwkzekuGI
	4XUWDGCh81hm+UDItENyH4E9coDYdGpzhcMxShnaILmFS1epdFYE1UNyXactsqIdI3e3
X-Google-Smtp-Source: AGHT+IG/fJQCFTZ/33ZBXhi5dXdleZCeKsLQ8TZdVcZ3jN+OyY84+ll8ZDMp3tK3UR5CrJoQzNoZvQ==
X-Received: by 2002:a05:6102:2acb:b0:4bb:d062:43e with SMTP id ada2fe7eead31-4bfbfdc459emr1766234137.0.1740131866209;
        Fri, 21 Feb 2025 01:57:46 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4be5343d084sm2410070137.29.2025.02.21.01.57.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 01:57:45 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-52096b4e163so514471e0c.1;
        Fri, 21 Feb 2025 01:57:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUe2G2Our3HZr1l9tn59pSlfGSY3dXSUoyAyvwx7YOrgDcnMoqw9tfhnALNATcS8DW441ot9JKz0EF7Vv/BrmPtLSY=@vger.kernel.org, AJvYcCVnxpRv/mnYM1Eww2HDGTcmZI+sbfiIyh5wh/UGngt7ebM/gawSJoMbhpDGAS+EShMlv3B5GT7t12Cq+TXB@vger.kernel.org, AJvYcCW9p5pvB8UR0yU3cUIDqTL8qBolVMIcNG6FR4cixJ4TMJFSybQyfASluRbQTXIgmYeuvwRivnNtThzxVkE+KKqnGuk=@vger.kernel.org, AJvYcCWvREXeW7bSPCvTwpdgdE/9Fnu8pmNmWEb8/zoSFwWLYgP03Rz0zYjTi6E+LjkWTaMK3InByFP9o+QOsdc=@vger.kernel.org
X-Received: by 2002:a05:6102:441c:b0:4b1:1eb5:8ee3 with SMTP id
 ada2fe7eead31-4bfc0277734mr1360564137.22.1740131865660; Fri, 21 Feb 2025
 01:57:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218142542.438557-1-tzimmermann@suse.de> <20250218142542.438557-3-tzimmermann@suse.de>
 <dcd59a75-7945-4a2e-99f9-3abbb3e9de14@ideasonboard.com> <355ed315-61fa-4a9d-b72b-8d5bc7b5a16c@suse.de>
 <596b960e-71f8-4c2c-9abe-058206df1dfb@ideasonboard.com> <87ca2b81-a67a-468b-ae2b-30d02a3a64bc@suse.de>
In-Reply-To: <87ca2b81-a67a-468b-ae2b-30d02a3a64bc@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Feb 2025 10:57:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVnZTj-8bqsbbZdhp0H7Bwib8GkEuXPcKNZjdo_jRRXgg@mail.gmail.com>
X-Gm-Features: AWEUYZnV-ULUCYHgs2rYqHTa6wPlfKvTAAqMyxRQ0em_d1IVN8Mw0n8NQD9eWqI
Message-ID: <CAMuHMdVnZTj-8bqsbbZdhp0H7Bwib8GkEuXPcKNZjdo_jRRXgg@mail.gmail.com>
Subject: Re: [PATCH v3 02/25] drm/dumb-buffers: Provide helper to set pitch
 and size
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	nouveau@lists.freedesktop.org, virtualization@lists.linux.dev, 
	spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Fri, 21 Feb 2025 at 10:19, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 20.02.25 um 11:53 schrieb Tomi Valkeinen:
> > This change also first calls the drm_driver_color_mode_format(), which
> > could change the behavior even more, but afaics at the moment does not.
>
> Because currently each driver does its own thing, it can be hard to
> write user space that reliably allocates on all drivers. That's why it's
> important that parameters are not just raw numbers, but have
> well-defined semantics. The raw bpp is meaningless; it's also important
> to know which formats are associated with each value. Otherwise, you
> might get a dumb buffer with a bpp of 15, but it will be displayed
> incorrectly. This patch series finally implements this and clearly
> documents the assumptions behind the interfaces. The assumptions
> themselves have always existed.
>
> The color modes in drm_driver_color_mode_format() are set in stone and
> will not change incompatibly. It's already a user interface. I've taken
> care that the results do not change incompatibly compared to what the
> dumb-buffer ioctl currently assumes. (C1-C4 are special, see below.)
>
> > Although, maybe some platform does width * DIV_ROUND_UP(bpp, 8) even
> > for bpp < 8, and then this series changes it for 1, 2 and 4 bpps (but
> > not for 3, 5, 6, 7, if I'm not mistaken).
>
> True. 1, 2 and 4 would currently over-allocate significantly on some
> drivers and the series will reduce this to actual requirements. Yet our
> most common memory managers, gem-dma and gem-shmem, compute the sizes
> correctly.
>
> But there are currently no drivers that support C4, C2 or C1 formats;
> hence there's likely no user space either. I know that Geert is
> interested in making a driver that uses these formats on very low-end
> hardware (something Atari or Amiga IIRC). Over-allocating on such
> hardware is likely not an option.

Note that the gud and ssd130x drivers do support R1, and I believe
work is underway to add grayscale formats to ssd130x.

> The other values (3, 5, 6, 7) have no meaning I know of. 6 could be
> XRGB2222, but I not aware of anything using that. We don't even have a
> format constant for this.

Yeah, e.g. Amiga supports 3, 5, 6, and 7 bpp, but that is using
bitplanes.  There is already some sort of consensus to not expose
bitplanes to userspace in DRM, so limiting to 1, 2, 4, and 8 bpp
(which can be converted from C[1248]) is fine.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

