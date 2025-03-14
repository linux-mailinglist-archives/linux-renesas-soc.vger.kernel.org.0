Return-Path: <linux-renesas-soc+bounces-14397-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6183FA6224C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Mar 2025 00:54:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9874D42199D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 23:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142DD1ACEC6;
	Fri, 14 Mar 2025 23:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JK0PR+iu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1233F1F4611
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Mar 2025 23:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741996474; cv=none; b=kq/ufmiNDjwbDxnC6ckH662uVUvlKUMAqFDlzE9CH0fqdr7PGYFITgVSPCWetvzakjGWmzwibCGfchXeQagAUFAaG9UHH1pVFpD9qNiHO/1rNL6MvqVriLO57J9h/EIxeNG/fN1zSkQ6YP3g48KNzmhOZA+IAH1XhX81Xx8q2/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741996474; c=relaxed/simple;
	bh=oImMh65Yk4OpqAziS/H+Yu/TZpplevfxk89pWaPXQlI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V1xhn3NOHmnYiT8yojnJyXP/IBh4d0KB4CTgch/PROVL0wqhF+cEM+TMgdJ7CuNj86tmfUIHaQas0UQ9W5zMPcXZNN/6t//fg6uOcyRCBrq1j5uj3vAc6mz9CWqf7lkH1H0KZ9rxgi9T/O5gQfBFQgnMX1xD1Yki1ssn/jnRxs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JK0PR+iu; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ab771575040so711258266b.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Mar 2025 16:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741996470; x=1742601270; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rfs1IApiP78w47mM0JVCd/4nl3GQUErIVjcJVZeb7qw=;
        b=JK0PR+iuHqLSwqc6eDGIgETaDLB0WKYIqIWhTLbsB5LdjXZU2vUifDjzVONjpJt0PY
         UfncMh5tXcLkbiC/myadd53oE3q0nMkxADH6WEw2w+OxjWPhM65i/zQycg3aIYfdqEbR
         /DzqOzuOA4d7MjeYiQ8cUL2u8wy74qv/9U2UY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741996470; x=1742601270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfs1IApiP78w47mM0JVCd/4nl3GQUErIVjcJVZeb7qw=;
        b=OeV5BoQ02guMq8xMTFvJMQhVh01xVDaZwkm5mew8kKNvMR0rsVYbRhs2xUOvEfW28U
         0X+OxKw2SNmQHa5DjaR6KhA9mPRxlABfNJtZYiGnQCVFKvTJTeBF4N7oKM4+v8vWaQ7Y
         uDRKNodysrg24l0pvVbLq0Kgo96/QkuzTGBSXKF5uX4iGWLMoF81hwM8x9f67pek5rfQ
         k8iVmzZUuoRvJ2krX/PnbaMfne1DaVxzvvRwsXjVTycDa3au6qPaA4HjLWGSh+4FAw2X
         5ibqbj2xHhNh+dRqfzFYsEnlIIQXOF6vJ4Od2PKjm3a8uo2XghkDxQ1RiXfzdRr4rlXI
         7zaw==
X-Gm-Message-State: AOJu0YzmMxDns7vEGNhyZ8e0AfD4J6t6ZYdC75uMPgDjnQ82lnlBJ5aD
	dl08OcDIYcyl498CLmvPZWR1jUNDAQAmhbiYYqoSQbHtK5PNAIvnh7q8KtV6Vb7ispfWeHRkEfz
	BwF3j
X-Gm-Gg: ASbGncuPBE9loCPctGInxSmtu29zDlz2q0vHjeA9DS0ZMafx6roFghpWIs94hJYAa7Q
	B3551XowBZ5eAyR+grlqT305qMmRtk4QXWtpSmbk9tTlnvboLEYaRBIdS/EZhM+ulnWYk4pp9YZ
	7kyy0B266zHTVTBE4Xr13B+01vIEujae1zLdcnGBAXLTAGzjAk+Xis0/NzLNRuj2IlCvrhj5903
	8yjBH9r/V55YVPobReU2JhBLhGXfFxY7F71yBdWiXWlncCkjFByx5fRe8k/pgSUU3DU+a7tu/uh
	S/dLEN89pXaH8VbZ4ECAuYpeFCo45LlY40MLAHAZCjHAtFLA05WYRT1LdwMC6GCjjau/gKVb2BJ
	CiSBGfIGC
X-Google-Smtp-Source: AGHT+IEku6Kvsy5iEomp8v/0g3/LwBEjHazlmkuWzrH6cEVeEruBB3aqbvnqyyXBH/2ymV9yrfvqyg==
X-Received: by 2002:a17:906:c10d:b0:ac2:7ce7:cd2b with SMTP id a640c23a62f3a-ac3311afd7cmr509929966b.2.1741996469748;
        Fri, 14 Mar 2025 16:54:29 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a462basm289763166b.133.2025.03.14.16.54.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 16:54:29 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2a089fbbdso478852366b.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Mar 2025 16:54:29 -0700 (PDT)
X-Received: by 2002:a05:6512:280e:b0:548:878b:ccb3 with SMTP id
 2adb3069b0e04-549c3fd2760mr1539605e87.25.1741996118140; Fri, 14 Mar 2025
 16:48:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250314224202.13128-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250314224202.13128-2-wsa+renesas@sang-engineering.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 14 Mar 2025 16:48:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VBHfg+Fgp27ieYVhd0U8kDp2E0ATW+=ueM8EBNOYMoSg@mail.gmail.com>
X-Gm-Features: AQ5f1JrWHr8izY-VcdkQhYodhw89fnaCBiirsjP6pzXxlvUX4vLxnubKrDPCEpA
Message-ID: <CAD=FV=VBHfg+Fgp27ieYVhd0U8kDp2E0ATW+=ueM8EBNOYMoSg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Check bridge connection failure
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Phong Hoang <phong.hoang.wz@renesas.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 14, 2025 at 3:42=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> From: Phong Hoang <phong.hoang.wz@renesas.com>
>
> Add a check to the very first register access function when attaching a
> bridge device, so we can bail out if I2C communication does not work.
>
> Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Build tested only!
>
> Changes since v1:
>
> * rebased to v6.14-rc6
> * add Laurent's tag (Thanks!)
> * update patch description according to Tomi's suggestions (Thanks!)
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index e4d9006b59f1..59508e82a991 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -696,6 +696,7 @@ static struct ti_sn65dsi86 *bridge_to_ti_sn65dsi86(st=
ruct drm_bridge *bridge)
>
>  static int ti_sn_attach_host(struct auxiliary_device *adev, struct ti_sn=
65dsi86 *pdata)
>  {
> +       int ret;
>         int val;
>         struct mipi_dsi_host *host;
>         struct mipi_dsi_device *dsi;
> @@ -720,8 +721,11 @@ static int ti_sn_attach_host(struct auxiliary_device=
 *adev, struct ti_sn65dsi86
>
>         /* check if continuous dsi clock is required or not */
>         pm_runtime_get_sync(dev);
> -       regmap_read(pdata->regmap, SN_DPPLL_SRC_REG, &val);
> +       ret =3D regmap_read(pdata->regmap, SN_DPPLL_SRC_REG, &val);
>         pm_runtime_put_autosuspend(dev);
> +       if (ret)
> +               return ret;

Seems reasonable to me. I would probably put an error message in this
case, though? I don't think regmap_read() necessarily prints an error
so it would just be a mysterious failure for why things didn't probe,
right?

This also only solves the problems for one of the 4 devices in this
file. I think the GPIO device, PWM device, and DP-AUX device will
still confusingly stick around. It's probably better to add a bogus
regmap read in ti_sn65dsi86_probe().

-Doug

