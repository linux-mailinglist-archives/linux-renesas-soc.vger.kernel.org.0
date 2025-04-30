Return-Path: <linux-renesas-soc+bounces-16522-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B90AA50D3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 17:52:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C25894C22E8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 15:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70901261589;
	Wed, 30 Apr 2025 15:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oI3QoUE6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4331A5B91
	for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Apr 2025 15:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746028328; cv=none; b=Rh0deZlD0sIXIwkQhNGdl7mC40scttOrVCXUOTAoJXSv1NIbl7X0mTUbmQACHJjwwrcGB9MlbNVzfVS0lLmDX3u5AqonG3v1ElOG9QtNv1JbCBn27hzFGGAuMajuAYz/jzJUp8ugb+oe4aB6GyHFckgRmV4scWMcH13/mRXQJqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746028328; c=relaxed/simple;
	bh=9LtmMorPZzn1CDLSUkR5sDQj/vapTL2vnbBygv/Tdmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oBWCeGRrM3b67y/V92zXLKepsFsDXgZ3WaVewTvD4RKtaxi2tKNcfUHAn4ciRN5pLTMPhPp9rhsD/DhJ0Ui7BGMpeGOkeplcx/EnImeOmv1duRcpj7qL1Rz95d+pjz2jlyoyvbE/u3kUGfwilEPqxW8nALjWJ+oobUiOVeUe8/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oI3QoUE6; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-739525d4e12so56144b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Apr 2025 08:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746028325; x=1746633125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LtmMorPZzn1CDLSUkR5sDQj/vapTL2vnbBygv/Tdmw=;
        b=oI3QoUE6JiwQDf7dYKZtdqiktH8waKlt4mp0JChBH9rwd2clquLsCaIr6iroBnsMLp
         GU56XxocM2WEiTRZBCMgn11U38cTYLYuohCFpWufiE8wCXV3mBlSkhRtl75jMAuSIoSm
         /Z/W/eofnFYo3uBKgzofTCd85m3VA9PW8eKRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746028325; x=1746633125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9LtmMorPZzn1CDLSUkR5sDQj/vapTL2vnbBygv/Tdmw=;
        b=uFCn3krm8JQGJwkG2fiqpQas0WkViY+x8lxPOT/AEy31/RpgDcrmJLEyFCvGvfAU7b
         RS3c/a8gRNxPZ2VIpwYQFwvsqf3FL1/gt6dQ9TWS0YPCCVD49UfK5qIAPbu1eLdo1BDG
         WkzN7RyzMH7qNbtOXEFvNLw5SWv+WtoUP90UDV5eIHR3PFPxp4mf8wgyP6V5g2MkkKgm
         tLvuR+5mcZY9aeMJWer6iPsG4Ub+60dEDi6/ruwi4MU/S0Fvw/I51xiOYo3sxJxaNWLa
         InMorfpEm0ZGjTMOxBsnPTPkLC0YCVytVWPbiiOGx25DHCPwoSSOR/2HQInG9typbO7D
         v8vQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6gj4mb5qQOjbat7wwT9onJqBGrEbCTzvo8kiAy4cAoIOvIwKzTCnaK4KkxowWMeoSofNsQZLWRlTYmrQMkW34zA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZk0t+CHEHMiAWGhBCdb/bfW2lGCKpNINsjvHZGQx+eL/dRu9x
	RGd+1F9XvlObbc01BsdNnznrGPClYUP885OEUxuR8IcfeOhZjv3q0+0o0OGnrFPRS2TPBSErDYc
	=
X-Gm-Gg: ASbGnctWTkvJP3OVhmgvQfS8nf/1enBioKSfFZ7Y92/zGUa5Gya3pSBop5g4p99ydUu
	7ywQTEUO1Z4/QHvbUqiY2uyjhdLpIUsv/j/VEwXQL19BlA/Y35jM+lB/2cVpoqLt2QBrwQKIXRj
	BBslRn1zqgzXgMiSUvCvdJvJ55vdtTNGKsmZ3qa0OQptjhtj9tppMVGIcFuiU0ylcwik0/RctpH
	canmSdKgAguGXsF2ERrvZGcvq0/2uYC+tJwX2amAJ/UX9DKrz1uTj5T/YeV0m06MJhM98jpDSTN
	Gf6Vg//f8vViaPOU90SLkrQu5cNt+1POkax2uAz7QE9SunuDRPBCo37qtKUWtLdktsx4LDveXQT
	kM5tRiF0z
X-Google-Smtp-Source: AGHT+IGrqOKinQIlOb04gpk8LrgZ4gelJksId4NfinrBChnM7NLJLpwdOwjYY4/FbdcQxiz2CQFhQQ==
X-Received: by 2002:a05:6a00:1146:b0:736:7270:4d18 with SMTP id d2e1a72fcca58-740389bbc36mr5420034b3a.14.1746028325095;
        Wed, 30 Apr 2025 08:52:05 -0700 (PDT)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com. [209.85.215.172])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740399234b6sm1881749b3a.66.2025.04.30.08.52.04
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 08:52:04 -0700 (PDT)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-af589091049so5664894a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Apr 2025 08:52:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVw42Gibq6hfwvFmv5AdRsETBIPwe51zZRlNTjp5OANmlB6rqQBuoSCOH25wc11YmLfzpTiAJluJ4brYoCA/k1ACw==@vger.kernel.org
X-Received: by 2002:a17:90b:17d0:b0:2ee:d371:3227 with SMTP id
 98e67ed59e1d1-30a3330bd2amr6121407a91.17.1746028323966; Wed, 30 Apr 2025
 08:52:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
 <CAD=FV=VmV5yb0HWWGTiKyyC8+WNPJpM7vE9PQGh5_=KPk6+HCg@mail.gmail.com> <20250430123557.3d8b1de4@booty>
In-Reply-To: <20250430123557.3d8b1de4@booty>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 30 Apr 2025 08:51:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UBFhCGOUuwtCtdT75nCu_7EzM-SVY-=6Xh6UxUuxKCMw@mail.gmail.com>
X-Gm-Features: ATxdqUFfYEEYqvpO67K1TXBYapYURxE3d7Z_gt9FzIWHk5tUMzE1QBIfnvJL-xI
Message-ID: <CAD=FV=UBFhCGOUuwtCtdT75nCu_7EzM-SVY-=6Xh6UxUuxKCMw@mail.gmail.com>
Subject: Re: [PATCH v2 01/34] drm: convert many bridge drivers from
 devm_kzalloc() to devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com, Adam Ford <aford173@gmail.com>, 
	Adrien Grassein <adrien.grassein@gmail.com>, Aleksandr Mishin <amishin@t-argos.ru>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Christoph Fritz <chf.fritz@googlemail.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Detlev Casanova <detlev.casanova@collabora.com>, 
	Dharma Balasubiramani <dharma.b@microchip.com>, Guenter Roeck <groeck@chromium.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jani Nikula <jani.nikula@intel.com>, Janne Grunau <j@jannau.net>, 
	Jerome Brunet <jbrunet@baylibre.com>, Jesse Van Gavere <jesseevg@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Liu Ying <victor.liu@nxp.com>, 
	Manikandan Muralidharan <manikandan.m@microchip.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Phong LE <ple@baylibre.com>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
	Sugar Zhang <sugar.zhang@rock-chips.com>, Sui Jingfeng <sui.jingfeng@linux.dev>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Vitalii Mordan <mordan@ispras.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 30, 2025 at 3:36=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> Hello Doug,
>
> On Mon, 28 Apr 2025 13:59:50 -0700
> Doug Anderson <dianders@chromium.org> wrote:
>
> [...]
>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org> # parade-ps8640
> > Tested-by: Douglas Anderson <dianders@chromium.org> # parade-ps8640
>
> Thank you for your review!
>
> However I'll be sending v3 with some differences w.r.t. v2, in order to
> fix the 3 bugs reported by Andy Yan plus a similar one I spotted. The
> fix just is replacing PTR_ERR() with ERR_CAST() in the 4 cases where the
> involved function is returning a pointer instead of an int.
>
> Your review/test tags appear global to the whole patch, thus being the
> patch different I think I cannot include your tags in v3.
>
> Let me know if you think I should do differently.
>
> Sorry about that.

It's fine if you want to drop my tag. I didn't have time to review the
whole thing but I felt like I should at least review the drivers I'm
signed up as a reviewer for. That being said, I'm not counting tags or
anything so I'm not offended if they're dropped.

My understanding is that the hashtag at the end is at least a
semi-standard way to say that my tag only applies to a small part of
the patch, so it seems like it would be OK to carry it, though...

-Doug

