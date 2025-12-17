Return-Path: <linux-renesas-soc+bounces-25832-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FAACC58AB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Dec 2025 01:02:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76559301637F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Dec 2025 00:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC882E56A;
	Wed, 17 Dec 2025 00:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="DPNTeLVd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B454C81
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Dec 2025 00:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765929714; cv=none; b=I3UBIGtU66YgiXsvY6pYMVhkkVU8Bc3lUPkMoiNawjB3JySuIbSV+zNZc+amvlIVechqjfPteshoF6N+SZeOJmmgtNn2OwDISRPR0W6owCK2OrZWwmbrOhHogDKqkU3Kzeq77ExjrA4Ymc3pP0CsEcKJbvvdJNZT017z6T5HHpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765929714; c=relaxed/simple;
	bh=O5eCzl8UBxQzsjN75O8DpTQOlVvtN45HumiW/nT7Mrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g6MCpUcMy9TY6OVl/7WOenpL+brhcijCFSOBpHcC5F4LJL7C9bs1eVBma4bX2GAL6fgJtOav89vQLHN8d7tSD8YPFwDu8VRzZI5VEgBnalpdfrrvWYzKtpm9wrr3IG5JH2K2NAOdUh4TAnEumuSY/dDczjmmbBbuOm7Yaz9BRPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=DPNTeLVd; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a0833b5aeeso56135095ad.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Dec 2025 16:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1765929712; x=1766534512; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5eCzl8UBxQzsjN75O8DpTQOlVvtN45HumiW/nT7Mrc=;
        b=DPNTeLVdj6Yg78EERLmeJ/omTSXwJVJF/IH/5lX07mRuYY0gbR69nkDm6u15+2tOxm
         3ki+cO1XlzRvuFqY0c6FP0RzLSSB7wPTurU7bf2ztXdvEjojvFsIYqhMIYh062QBpy0q
         8L2Dq7b5ioHl6dbGYPXw/meGF8fa7b3ZPAgGLbOaePF/MYQe7nIzCzF2FMSqZeGiS0BV
         RtZu3szHewiclrSIFnbfLoAT7iiTzh97i3DJgiHzDfPWpxCXBAbCj190wpSXzQCy94p6
         ag17cKvnE7guHvy6tUazTT/WHqy1I/h/7debstrh1OIa4eA2D7tSke3WvGNNz6nY8l9g
         bTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765929712; x=1766534512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O5eCzl8UBxQzsjN75O8DpTQOlVvtN45HumiW/nT7Mrc=;
        b=SNPvWrjDucKz49nWKvYLUdTgc1xe0+F/2SzE72qRPY+TW4YV86X8aDJWKE3X0VYQ5F
         icf+qRtAtdcQdj9W4g9ZgApNtnjVpHoLzcpUwEXCMx9HD8l/7ehnM60Qc9ta2mGZ2c7w
         4hqWZ9hKhFUfB0QMD0m/BZvzfNftrNI0iHB+XxRD51QEvoZkB00K0qd9F2NBx8E+Ozkp
         hmFm6D7cr/mS6e5ODD15fA+24hBj/d+xvpYd5g2DntbT1HmA9dTyBmT2p+faCyCesNft
         Df82S3UFZpfcIOtMWsVseffZBoGyL4G0e1bHiX1fLaeKD5o4cLBq5SPCJ/nqQJkpGgEf
         Pr1w==
X-Forwarded-Encrypted: i=1; AJvYcCUIHN+AHwXpC4T3OH3PptYWKhiKV4P/xk/kHx4tIGaHCqYXqzy+rVFwGWmRJA0i1Lnay1SFrm6kkg4lio3OuTwcXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yza1MOm+/gjiy8ezqP29Q66dx9TkFOeVEac4HeCJ8jzBOnXOjkw
	MFrEXzIJKjk/4+jdj4qF6KgnOjktC+NejAbXH9aUYPsVmcJyWjhIoDEhGDhHqNgANT/7ipVN6ab
	GuIQIHMZfMXJ6bx8HvI2cwM1jcWW6wHg=
X-Gm-Gg: AY/fxX7QA/XiZhOlB+u7C84C2PhVs/6sSUHufwyPsmSVEnzDXze+22lyDfKvnq9HpPl
	iYIM0EW7kFmggNGvxG7yc48SyveU/W8c8FIAL2A2eZDKmt4tvFrp6KobjM8JlA/nwymVsThpT6S
	zlFfDozitPZiOmnzvmb2VrJpGLwXRVx5LEq4GJzn7te90DPcK8/CifzOucmAslBftIINkkWGYMC
	ItlCEVXlwoSSI78GchDx0cNNIZewyyFM3hE9vbCQrbS27ADb4wHneAy/vfeagw+cxI9Nw1FwEui
	cj58iqwEaTJDJz2uzlpHLoeCVmo=
X-Google-Smtp-Source: AGHT+IGJCumVLPI6LXTb+R3wbQ5b6SSgqQC0QLByiXYYrEmbkjlG0jzydWOiaHp0sl9AgFqwMi+afZ8/iOgSdsy9IWU=
X-Received: by 2002:a17:903:1446:b0:295:425a:350e with SMTP id
 d9443c01a7336-29f23de66ebmr152982955ad.8.1765929712310; Tue, 16 Dec 2025
 16:01:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-0-88f8a107eca2@bootlin.com>
 <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-17-88f8a107eca2@bootlin.com>
 <CAFBinCCQjeUu7pgfwViH6b0-M6S_sKgfvz9VAP1hpqLRj=bL_g@mail.gmail.com> <DEZNGU4VJFK8.Y1LKWVTD7O8K@bootlin.com>
In-Reply-To: <DEZNGU4VJFK8.Y1LKWVTD7O8K@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 17 Dec 2025 01:01:40 +0100
X-Gm-Features: AQt7F2qigiuBf-2umKIaZyZh98eVY_wIo1vz8CYcqmMw3ZJiZleOgoOUFsOFlyM
Message-ID: <CAFBinCBaXRNBHpY2uYy4FxyAOnRA4NxJtHbraG0=j_U6Dzz2=A@mail.gmail.com>
Subject: Re: [PATCH v2 17/26] drm/meson: encoder_*: use devm_of_drm_get_bridge()
 to put the next bridge
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, Phong LE <ple@baylibre.com>, 
	Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Adrien Grassein <adrien.grassein@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Louis Chauvet <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luca,

On Tue, Dec 16, 2025 at 1:46=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
[...]
> > What I'm not sure about is how this series interacts with
> > devm_drm_of_get_bridge() which is why I'm asking before cooking a
> > patch.
>
> Apologies for the long delay in getting back to you. You might have notic=
ed
> some discussion about the overall approach, and I waited for it to settle=
.
That hasn't gone unnoticed!

> About devm_drm_of_get_bridge(), it is a very different function so it doe=
s
> not affect this series. The name similarity is confusing indeed, but
> devm_of_drm_get_bridge() has been removed from my approach, so one less
> source of confusion.
I have to confess that I'm still confused. drivers/gpu/drm/drm_bridge.c sta=
tes:
"Display drivers are responsible for linking encoders with the first bridge
 in the chains. This is done by acquiring the appropriate bridge with
 devm_drm_of_get_bridge(). Once acquired, the bridge shall be attached to t=
he
 encoder with a call to drm_bridge_attach().

 Bridges are responsible for linking themselves with the next bridge in the
 chain, if any. This is done the same way as for encoders, with the call to
 drm_bridge_attach() occurring in the &drm_bridge_funcs.attach operation."
Does this mean your series effectively deprecates devm_drm_of_get_bridge()?

> I'm soon sending v3, and I have updated my patch to
> eson_encoder_{cvbs,dsi,hdmi}.c, actually splitting it in 3. I'd be gratef=
ul
> if you could reviewd and/ot test them when I send v3. But I don't think
> there is a need for you to send any patches related to this topic.
Regardless of the questions I still have around
devm_drm_of_get_bridge(): I'll give your patches a go in the next
days.


Best regards,
Martin

