Return-Path: <linux-renesas-soc+bounces-10582-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E229D2791
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 15:02:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D21961F21246
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 14:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91390137775;
	Tue, 19 Nov 2024 14:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kMzGwVIB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C571798C;
	Tue, 19 Nov 2024 14:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732024941; cv=none; b=bT2p3u8bPozf5NruOsA/RIkOPWmZ7hrqAy+cfXul47fFgInQZ0dvjy+P/ze3VXOkbE3942OrjvZ+BUC5RfWr8v3DY6cxuJKBmPb72WHODO0viw+l1GFJ4ERSc+DLN+IBVGgiug9IKeBeVbzMnBQ2hPLHg6scPWTzDpOA+KFgniY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732024941; c=relaxed/simple;
	bh=XbZk3XjpdM2VlWc+ZeEUx4J310cPGZT7dNNsQkKCJxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vmr08QiuehFpOEZAc0Bp3LHGvsBS4VMPVOxt2zRbDCMWosn4N5UCovoPHMbAeGJ9bX2eh0RrrGAlCmXfxlcRSSgW0Maw1LaasE/bACLmeYZk7I/2g08x001fBpU6gGGx0TFV1VdT337qrWvVyAgZhEA52VpoWQb1buCL7ByG/QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kMzGwVIB; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ea49a1b4c8so1987096a91.2;
        Tue, 19 Nov 2024 06:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732024938; x=1732629738; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DlUzxlF1PUXNfQmZrIkZVQMb4L5okiGxa85+pUVs/qQ=;
        b=kMzGwVIBHouo/khvldG7TGK0wE6NqIh95gTWyUVSPUb4TeagzyTwO5KV5MO3cSvku/
         nRnreO7lspWNz5rh6Na2TD+5a9Z/Kjh8RpL5WSh5NmHqD/+uoEf8TZBRB2QV9SqzRevz
         F5kXIsYU9wqQwgvpZfl4N5XQLewuCnR6HGIMmPWvyTpKg3AFXAmv0JcP2Zv/W1dQfsP8
         mZE55bX7w1gnmz+awZhEgjiBzQW0Zfjg+MzAhgtFboaKnTyOqsFb+T6xscz0I+V7rr+4
         /76H/2e72d+Fe+DNJWRqRy5Cfvah06c2Gjg3byVssat9AHA3PJrK5K7Zd7/lVZ3GbMVF
         d7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732024938; x=1732629738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DlUzxlF1PUXNfQmZrIkZVQMb4L5okiGxa85+pUVs/qQ=;
        b=dF8J1pFxh3tGrKs7Og4thEIJwryGALTdE/E52BAIXykAcStaXVjzJeGY6k1EcD7KS9
         3Q2TscNZIR2hnHxj/KwQPQbEV8zLdFoumAS2Ho8MYk8DZhpi+BlmFDY+ggAdgIxVzXAC
         vylwp/+8Jb2/XXIUynEHLUnmV75GuaRNV9JJ86fmjatc0jEVDFHReY8AoLAl9aHXLk4f
         OKJqaRdcAB95BTgwpk6YuTqRtaclMzwYJskyMdmC8iJB04kXeFF11JQle2OYrcUIweEf
         G+O9U3iSPKiQjH1zqThNyAa9NaqfFzef/ZnHN2l/kS2XsOXODT/+cPwXr9lsGfKqtPCf
         BW3g==
X-Forwarded-Encrypted: i=1; AJvYcCUFoBxR5jsVzFWRVN9fpmqNrySsYFW/L5ZBwIe/Y1K1NOPvKVlSfU4jJoDVeXM9gIkj3ZGGqeicWkHvEw4LUFrtvw==@vger.kernel.org, AJvYcCWUqt5zwbkeBuzOB/csN6mV/MFRwV4KvXEirm0rABE7Dbf/rPZ8myPYall4oXNjgSBl3XH0dyNd@vger.kernel.org
X-Gm-Message-State: AOJu0YxgPZQWaWqC4O3vQheO/MP1q7Wf290m8ShPwcl8MaL2kdHo/0p4
	45RCzyTdJ5xUoqldKX5psta4AeErRk06KlXB/uMnR5q7Sde9NZFJ1I7RDRFwn4OaqbtvsdzVOFq
	TyJSP0FUkOu/DawuScDaxit+yCLE=
X-Google-Smtp-Source: AGHT+IETOnUQoEfkSl52TbGnBKsD+KfkdHKA4Y+pOGnn2BmyQFEf6CaJnL+U/kcEUWnBFzPPmspJb8ccoSu7Ld25T1o=
X-Received: by 2002:a17:90b:1b43:b0:2ea:8b06:ffcb with SMTP id
 98e67ed59e1d1-2ea8b07052bmr7789896a91.14.1732024938180; Tue, 19 Nov 2024
 06:02:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241119131011.105359-1-biju.das.jz@bp.renesas.com> <20241119131011.105359-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241119131011.105359-4-biju.das.jz@bp.renesas.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 19 Nov 2024 08:02:07 -0600
Message-ID: <CAHCN7xJL6eMgKYOwuGzm9z1h=kdaBHRwesZ+zcQ98HmQDS74KQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] drm: adv7511: Drop dsi single lane support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, Hien Huynh <hien.huynh.px@renesas.com>, 
	stable@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 7:50=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> As per [1] and [2], ADV7535/7533 supports only 2-, 3-, or 4-lane. Drop
> unsupported 1-lane.
>
> [1] https://www.analog.com/media/en/technical-documentation/data-sheets/A=
DV7535.pdf
> [2] https://www.analog.com/media/en/technical-documentation/data-sheets/A=
DV7533.pdf

Thanks for doing that. I never noticed it only supported 2,3 or 4
lanes, but this patch makes sense to me.
>
> Fixes: 1e4d58cd7f88 ("drm/bridge: adv7533: Create a MIPI DSI device")
> Reported-by: Hien Huynh <hien.huynh.px@renesas.com>
> Cc: stable@vger.kernel.org

Reviewed-by: Adam Ford <aford173@gmail.com>

> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Changes in v5:
>  - No change.
> Changes in v4:
>  - Added link to ADV7533 data sheet.
>  - Collected tags
> Changes in v3:
>  - Updated commit header and description
>  - Updated fixes tag
>  - Dropped single lane support
> Changes in v2:
>  - Added the tag "Cc: stable@vger.kernel.org" in the sign-off area.
>  - Dropped Archit Taneja invalid Mail address
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7533.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/b=
ridge/adv7511/adv7533.c
> index 5f195e91b3e6..122ad91e8a32 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> @@ -172,7 +172,7 @@ int adv7533_parse_dt(struct device_node *np, struct a=
dv7511 *adv)
>
>         of_property_read_u32(np, "adi,dsi-lanes", &num_lanes);
>
> -       if (num_lanes < 1 || num_lanes > 4)
> +       if (num_lanes < 2 || num_lanes > 4)
>                 return -EINVAL;
>
>         adv->num_dsi_lanes =3D num_lanes;
> --
> 2.43.0
>
>

