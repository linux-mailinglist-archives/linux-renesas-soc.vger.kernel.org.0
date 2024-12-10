Return-Path: <linux-renesas-soc+bounces-11145-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA97B9EAEBB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 11:55:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFD4B28BC71
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 10:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72899212D90;
	Tue, 10 Dec 2024 10:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7SqI4SZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3786212D83
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 10:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733828076; cv=none; b=MuQw3LAow5tZtLCzuo3l3Jxc+pJPGxMbeM0H28e2wSexxHdoDOc1aYiWyBvvSarGShp8xRsUIZehRev2yqFumHhVYtn5Zw6fBcipOiBxy2KQPgYnfvwDAauoIkkp5HtjqqLhhktOgdc3z6wkFrEYhXdjLbEiYkG8jn0kb0U6zzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733828076; c=relaxed/simple;
	bh=69nmD36GZVfAvtUA1NJ/duB1I5aaKgD8W3mY/e9y+7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eDWmaitj5QdvpAu8BqUlsluEyHodrZkUD+4gE9oC524y5qLDR6mHdw2TldGhX+9AqMSGqgA6CmrsJN6ZxJ9xcAmH84m76yqTS288xvtQ6bf5ENJloRyFME6ItNfLeLVAbHajsL5+aFF6HdloWwTcHn/LU/zytfJgpNLzerHgELM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7SqI4SZ; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-51882c83065so751479e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 02:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733828073; x=1734432873; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m5Zr64sDLOmSjkRV/pFhONUwt9wAORZlpoDlLRBOWb0=;
        b=R7SqI4SZqUY8iSxa5t/g8uSsIT1WMhCfPhDuLWeY3Qj8/e/AxScuzsDMxLvqnTSn46
         0wXPxzRAZ4lPq6iGCrcRra9Lgm5BstRXZaXa6+YbW1sJSJxpSt1G4EIkerM+PHa7TKAw
         B6VSnpebP6B6BTihwJoxAyRnL9SN98DyOFmwMwOmjtagiSrQbHNwOhxQvzXpW/oXHkAt
         iTLBOKyURTLiTx/IXCr5fCvjbNEvLZXZaliEhlLzhdWu4skMQLaGCrtGV3FICPOgrQ4V
         i4WyOtsMNbMb511OOzwvAIbKBBqvV3FnTQ0mS5hqvQLLBeghgEWP8fTQHAOrVb4TOR0O
         uNCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733828073; x=1734432873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m5Zr64sDLOmSjkRV/pFhONUwt9wAORZlpoDlLRBOWb0=;
        b=B5uOrC3N4xUzH/9t0RC+Wxp1PP4sMQSFymm83m9Qnu7+62p1ooiTL3VGeLl9vhiASB
         SOR0vtD+mL2oSgwxz6s5/Oevhs+gmus/421x2t5Mh/o/WdoCxU9Dl8ZIH3tu+kOs8oIF
         TEIadUVsk/ufJPdU1S4cvJUY4MBBJOPShyQBQgTDqMX3ynUpm97gYNjENIjLXYPqfB6q
         bTTun4TcfxZpovI+I1a3GEWNM/L/3XwymTLvPWDr50x4azWIh2zG1hURuxI5ztGGOPyj
         OXQIFNeKcmimyeQYWtebmi2Iz1P5OMJzaSVr5lj48YRcztF5csC92SZdtZlxiVvNYDGl
         LisA==
X-Forwarded-Encrypted: i=1; AJvYcCVI3z/vxeWaGTnBjAhdwGvBchqtBAZeGqA/4+LAQY6vAfeiORB/7AHS0SGNM93iusACmEhHZzF0RGQ8OwppSrMQTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPmBO9XJA0HbBtFfHf19DL9YxQzwSOeKk0I91Qyrg1NCrKdYrx
	IjGaZ5XBG5QZ7K7TB5EG6tXYXk3Oe+s/PEsQzaW9FmdQ0fYeHRqlLxB6xS0aEgcdJZXqhGjho31
	0mLH/xGK4FIEOAeFOsfkoUz4b+XYsz6i9
X-Gm-Gg: ASbGncuSntTZUX4p9z+RURjMkD3p49DX9Kk4iWMGbabi30YlTdwhaWeqTTvUHvyq3hK
	WGL1YXOR93eLR/u8vSuRpIuD41NyAAnQD7Q3I
X-Google-Smtp-Source: AGHT+IGvmULrtJZL0iE/Z5AN66lnltcKLsII7zYK/72DsHQY15MABKdDlr/Ij/q44G4vSth3yyRyJklU31Xt36tR8z4=
X-Received: by 2002:a05:6122:3d44:b0:50d:6a43:d525 with SMTP id
 71dfb90a1353d-518882f1044mr4006634e0c.1.1733828073669; Tue, 10 Dec 2024
 02:54:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022082433.32513-1-biju.das.jz@bp.renesas.com> <20241022082433.32513-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241022082433.32513-2-biju.das.jz@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 10 Dec 2024 10:54:07 +0000
Message-ID: <CA+V-a8tr=yYPnPKJ5PRX53EZ5tyDMRJgTsaDqzGX+W7iC2dChQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm: renesas: rz-du: Drop DU_MCR0_DPI_OE macro
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 9:32=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> The DPI_OE bit is removed from the latest RZ/G2UL and RZ/G2L hardware
> manual. So, drop this macro.
>
> Fixes: b330f1480172 ("drm: renesas: rz-du: Add RZ/G2UL DU Support")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Added Fixes tag.
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/=
drm/renesas/rz-du/rzg2l_du_crtc.c
> index c4c1474d487e..6e7aac6219be 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> @@ -28,7 +28,6 @@
>  #include "rzg2l_du_vsp.h"
>
>  #define DU_MCR0                        0x00
> -#define DU_MCR0_DPI_OE         BIT(0)
>  #define DU_MCR0_DI_EN          BIT(8)
>
>  #define DU_DITR0               0x10
> @@ -217,14 +216,9 @@ static void rzg2l_du_crtc_put(struct rzg2l_du_crtc *=
rcrtc)
>
>  static void rzg2l_du_start_stop(struct rzg2l_du_crtc *rcrtc, bool start)
>  {
> -       struct rzg2l_du_crtc_state *rstate =3D to_rzg2l_crtc_state(rcrtc-=
>crtc.state);
>         struct rzg2l_du_device *rcdu =3D rcrtc->dev;
> -       u32 val =3D DU_MCR0_DI_EN;
>
> -       if (rstate->outputs & BIT(RZG2L_DU_OUTPUT_DPAD0))
> -               val |=3D DU_MCR0_DPI_OE;
> -
> -       writel(start ? val : 0, rcdu->mmio + DU_MCR0);
> +       writel(start ? DU_MCR0_DI_EN : 0, rcdu->mmio + DU_MCR0);
>  }
>
>  static void rzg2l_du_crtc_start(struct rzg2l_du_crtc *rcrtc)
> --
> 2.43.0
>
>

