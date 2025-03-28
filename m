Return-Path: <linux-renesas-soc+bounces-15029-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD31A750EA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 20:40:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCBB2163F6B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 19:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605361E3DCD;
	Fri, 28 Mar 2025 19:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JycanQjp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B031E2821;
	Fri, 28 Mar 2025 19:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743190769; cv=none; b=l/znV50PznN4TM7W0Ask4R0pl4WvkPCbnIxo53QmYyXAVYKqV0XBQhqD64xG+07AbtMXaXra0HlG+kdrkKCGN3h3qNZLW2fWeDQOIsPWcIYFGVQD3rDkGVPj4TvOHJ8Q4VXnMdSQZXzjAX5KfZSAi19ESuFiN0GPCW0U92EX3rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743190769; c=relaxed/simple;
	bh=P8jYFcEkNGQSyDdgUnJj/SlAYRpr/xjmBx9RJBUTkhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KlL1YDv9j+PZdcJaj28svLLYUsZquYaDWTNkClseT90eAVDUNOzie8tAafQbiG1JteNfiknXI3BqE4sZNLcDj2jP0aY2UOsHYleWM54OZU8N+D7lXNTFGV43tmgxDNdr4R14r5ZOpSegmMEb1nh6vVXN6JFYCaxZtgRntsjXQKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JycanQjp; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-523de5611a3so1192876e0c.1;
        Fri, 28 Mar 2025 12:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743190766; x=1743795566; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EgkjJnqFEchC7Uw8U+7qjzija67PQT0tBgVkDWBcANc=;
        b=JycanQjp7eyOo4hHEZdBGnAtmYA7s/OydRKlbjw5a5xpskh/1ln51BJ/UnSvu5dnEo
         lKwwnaqMGCZLuyPVphx/GejgW0c0Z58z+rQ7EUC+P3im1oY7k8tGCu3HEetvtMb1xoim
         MXNSnIgzGqvOomCh54a/6KbO366BCeCKz1iKXMJBtbNHeoPDngmcots1hhpRhAh8FPmj
         qBUlYRcZyNIhJ6KngiCsN0HGfjtsy+p2JisILB0OKvfEnwCGbysXqDBl/R+WsB7i0KCK
         SXLLYxf0q05U8l0i2z0fScaVfrKziPZTWWM2ZYTUmlO8h8n1jX0v2UAXAcgok7OeOwID
         hK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743190766; x=1743795566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EgkjJnqFEchC7Uw8U+7qjzija67PQT0tBgVkDWBcANc=;
        b=uI36ifsICAfy1+6RaelwYjp+iSR2s83VAXx+7Ujkg2MZJhlCWuV9dbiZ6BRqSK+ffX
         svV0FJAs0pY6/LV2wiBc/1YH1vUMyRj4WuYcReKaLf3G/vP50CuKy/IRgQq8EBdUiRW5
         4txoMmEOH+7umDHus/4uyutu9roA1ihSxd0SD4udBTtf1h3NQdpSvb2hqzMxZHYPQVCq
         SbePhvyLXCR6NDRhTWqXeM87ZonQm2+xWfOUP/fSS3fgFi2xqbxnhOPoByf11h+Ys5LU
         wn8QtFURbXZkhwkKEJ/f1QQnGGMnGvwPzf3/XZwlgOKAGe+m8Wvar55auhM5NW+7vTb5
         vsjw==
X-Forwarded-Encrypted: i=1; AJvYcCWYRndhN1HBsI2mKR7DBgcMXReZFVnWwxbo/WmIbLG3WanZDVFx8bWIvyoE/YN1PxHwKiN/6kq7tGni5+aaPM7VvAU=@vger.kernel.org, AJvYcCX7wy1bJICgnGFXsQg7SsRlPQ9mSAixmhN4fu3/fJQmYqpXfCZg6YKsRew67ePQw5LRJ8bBI+jmBwEFkUs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0+ur7w0R9DICU/L7v39Bod1wnrbJLFCOdxGoQT2apwWXbOpvF
	W1X7aWYx0FTlMSCRaGbowBwBB47fzr6va/S3X1gcSkrHPCxY6DNVnD14zH5j3IlOoOisOzjU7J2
	WlAChT9suxNVG7e5GGt1qO9b6nw4=
X-Gm-Gg: ASbGncsy8Cd5EfOPFbvIeaXYJtowD2z04peVAiWKCdubX8hzoeb2yNUIAq9EoCG5O/U
	0Kt3eHtTF3F1Chw86msFUhZjZaA3z8CoRIqfJn1McQC/38GykzSRL93rmCW3ln/clIhrngt1Rpb
	wUPx7YKZzhtZ786zk9tuMT41tVVQ==
X-Google-Smtp-Source: AGHT+IHpbv/U6+6YJj2QWHGtfTHwI7olzX0av85GpYULMDGfxNi3i/m6tL4/MfzJRKc2TR0lPZOn7qHt0I0UKXgWnpA=
X-Received: by 2002:a05:6122:792:b0:524:2fe2:46ba with SMTP id
 71dfb90a1353d-5261d4e2574mr768217e0c.11.1743190766048; Fri, 28 Mar 2025
 12:39:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321172220.867165-1-kieran.bingham@ideasonboard.com>
In-Reply-To: <20250321172220.867165-1-kieran.bingham@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 28 Mar 2025 19:38:59 +0000
X-Gm-Features: AQ5f1Jr18tSjXNGROtwo7_8R3cPpi44uQxITRU3021Auc94cuA2FHXiWLRc0qLg
Message-ID: <CA+V-a8tFFWwOBNgXv2JhAKFi0e6pDt3_w75L_H7cOhu61aZVMg@mail.gmail.com>
Subject: Re: [PATCH] drm: renesas: Extend RZ/G2L supported KMS formats
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 5:22=E2=80=AFPM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> The RZ/G2L driver utilises the VSPD to read data from input sources.
>
> The rzg2l_du_kms component lists a restricted subset of the capabilities
> of the VSPd which prevents additional formats from being used for
> display planes.
>
> The supported display plane formats are mapped in rzg2l_du_vsp_formats[].
>
> Extend the rzg2l_du_format_infos[] table with the corresponding mappings
> between the supported DRM formats and the formats exposed by the VSP in
> rzg2l_du_vsp_formats, maintaining the same ordering in both tables.
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c | 141 ++++++++++++++++++-
>  1 file changed, 136 insertions(+), 5 deletions(-)
>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> Prior to this patch, kmstest reports all of these formats as supported
> by the Planes, but using them fails during rzg2l_du_fb_create() as the
> corresponding format isn't found in rzg2l_du_format_info.
>
> This patch now lets me capture and render pixelformats from the Mali-C55
> direct to an attached DSI panel on the Kakip board.
>
> Patch tested with kms-tests:
>
> PYTHONPATH=3D/usr/lib/aarch64-linux-gnu/python3.11/site-packages ./tests/=
kms-test-formats.py
> Testing plane formats: SUCCESS
>
> admin@kakip:~/kms-tests$ cat FormatsTest.log
> U [66.967523] Testing plane formats
> U [66.975763] Testing connector DSI-1, CRTC 36, mode 720x1280
> U [66.978480] Testing format PixelFormat.RGB332
> U [70.143998] Testing format PixelFormat.ARGB4444
> U [73.357056] Testing format PixelFormat.XRGB4444
> U [76.574944] Testing format PixelFormat.ARGB1555
> U [79.805636] Testing format PixelFormat.XRGB1555
> U [83.016599] Testing format PixelFormat.RGB565
> U [86.230362] Testing format PixelFormat.BGR888
> U [89.444673] Testing format PixelFormat.RGB888
> U [92.677093] Testing format PixelFormat.BGRA8888
> U [95.904745] Testing format PixelFormat.BGRX8888
> U [99.119926] Testing format PixelFormat.ARGB8888
> U [102.350298] Testing format PixelFormat.XRGB8888
> U [105.579499] Testing format PixelFormat.UYVY
> U [108.878654] Testing format PixelFormat.YUYV
> U [112.176515] Testing format PixelFormat.YVYU
> U [115.470090] Testing format PixelFormat.NV12
> U [118.767513] Testing format PixelFormat.NV21
> U [122.065851] Testing format PixelFormat.NV16
> U [125.364001] Testing format PixelFormat.NV61
> U [128.662145] Testing format PixelFormat.YUV420
> U [131.978102] Testing format PixelFormat.YVU420
> U [135.292284] Testing format PixelFormat.YUV422
> U [138.623485] Testing format PixelFormat.YVU422
> U [141.955083] Testing format PixelFormat.YUV444
> U [145.336759] Testing format PixelFormat.YVU444
> U [148.761832] Test completed successfully
>
>
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu/d=
rm/renesas/rz-du/rzg2l_du_kms.c
> index b1266fbd9598..a5e96f863172 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> @@ -36,8 +36,61 @@
>
>  static const struct rzg2l_du_format_info rzg2l_du_format_infos[] =3D {
>         {
> -               .fourcc =3D DRM_FORMAT_XRGB8888,
> -               .v4l2 =3D V4L2_PIX_FMT_XBGR32,
> +               .fourcc =3D DRM_FORMAT_RGB332,
> +               .v4l2 =3D V4L2_PIX_FMT_RGB332,
> +               .bpp =3D 8,
> +               .planes =3D 1,
> +               .hsub =3D 1,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_ARGB4444,
> +               .v4l2 =3D V4L2_PIX_FMT_ARGB444,
> +               .bpp =3D 16,
> +               .planes =3D 1,
> +               .hsub =3D 1,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_XRGB4444,
> +               .v4l2 =3D V4L2_PIX_FMT_XRGB444,
> +               .bpp =3D 16,
> +               .planes =3D 1,
> +               .hsub =3D 1,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_ARGB1555,
> +               .v4l2 =3D V4L2_PIX_FMT_ARGB555,
> +               .bpp =3D 16,
> +               .planes =3D 1,
> +               .hsub =3D 1,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_XRGB1555,
> +               .v4l2 =3D V4L2_PIX_FMT_XRGB555,
> +               .bpp =3D 16,
> +               .planes =3D 1,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_RGB565,
> +               .v4l2 =3D V4L2_PIX_FMT_RGB565,
> +               .bpp =3D 16,
> +               .planes =3D 1,
> +               .hsub =3D 1,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_BGR888,
> +               .v4l2 =3D V4L2_PIX_FMT_RGB24,
> +               .bpp =3D 24,
> +               .planes =3D 1,
> +               .hsub =3D 1,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_RGB888,
> +               .v4l2 =3D V4L2_PIX_FMT_BGR24,
> +               .bpp =3D 24,
> +               .planes =3D 1,
> +               .hsub =3D 1,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_BGRA8888,
> +               .v4l2 =3D V4L2_PIX_FMT_ARGB32,
> +               .bpp =3D 32,
> +               .planes =3D 1,
> +               .hsub =3D 1,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_BGRX8888,
> +               .v4l2 =3D V4L2_PIX_FMT_XRGB32,
>                 .bpp =3D 32,
>                 .planes =3D 1,
>                 .hsub =3D 1,
> @@ -48,11 +101,89 @@ static const struct rzg2l_du_format_info rzg2l_du_fo=
rmat_infos[] =3D {
>                 .planes =3D 1,
>                 .hsub =3D 1,
>         }, {
> -               .fourcc =3D DRM_FORMAT_RGB888,
> -               .v4l2 =3D V4L2_PIX_FMT_BGR24,
> -               .bpp =3D 24,
> +               .fourcc =3D DRM_FORMAT_XRGB8888,
> +               .v4l2 =3D V4L2_PIX_FMT_XBGR32,
> +               .bpp =3D 32,
>                 .planes =3D 1,
>                 .hsub =3D 1,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_UYVY,
> +               .v4l2 =3D V4L2_PIX_FMT_UYVY,
> +               .bpp =3D 16,
> +               .planes =3D 1,
> +               .hsub =3D 2,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_YUYV,
> +               .v4l2 =3D V4L2_PIX_FMT_YUYV,
> +               .bpp =3D 16,
> +               .planes =3D 1,
> +               .hsub =3D 2,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_YVYU,
> +               .v4l2 =3D V4L2_PIX_FMT_YVYU,
> +               .bpp =3D 16,
> +               .planes =3D 1,
> +               .hsub =3D 2,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_NV12,
> +               .v4l2 =3D V4L2_PIX_FMT_NV12M,
> +               .bpp =3D 12,
> +               .planes =3D 2,
> +               .hsub =3D 2,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_NV21,
> +               .v4l2 =3D V4L2_PIX_FMT_NV21M,
> +               .bpp =3D 12,
> +               .planes =3D 2,
> +               .hsub =3D 2,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_NV16,
> +               .v4l2 =3D V4L2_PIX_FMT_NV16M,
> +               .bpp =3D 16,
> +               .planes =3D 2,
> +               .hsub =3D 2,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_NV61,
> +               .v4l2 =3D V4L2_PIX_FMT_NV61M,
> +               .bpp =3D 16,
> +               .planes =3D 2,
> +               .hsub =3D 2,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_YUV420,
> +               .v4l2 =3D V4L2_PIX_FMT_YUV420M,
> +               .bpp =3D 12,
> +               .planes =3D 3,
> +               .hsub =3D 2,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_YVU420,
> +               .v4l2 =3D V4L2_PIX_FMT_YVU420M,
> +               .bpp =3D 12,
> +               .planes =3D 3,
> +               .hsub =3D 2,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_YUV422,
> +               .v4l2 =3D V4L2_PIX_FMT_YUV422M,
> +               .bpp =3D 16,
> +               .planes =3D 3,
> +               .hsub =3D 2,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_YVU422,
> +               .v4l2 =3D V4L2_PIX_FMT_YVU422M,
> +               .bpp =3D 16,
> +               .planes =3D 3,
> +               .hsub =3D 2,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_YUV444,
> +               .v4l2 =3D V4L2_PIX_FMT_YUV444M,
> +               .bpp =3D 24,
> +               .planes =3D 3,
> +               .hsub =3D 1,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_YVU444,
> +               .v4l2 =3D V4L2_PIX_FMT_YVU444M,
> +               .bpp =3D 24,
> +               .planes =3D 3,
> +               .hsub =3D 1,
>         }
>  };
>
> --
> 2.48.1
>
>

