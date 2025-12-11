Return-Path: <linux-renesas-soc+bounces-25708-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 95158CB6CC1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Dec 2025 18:50:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 155F8304C2B8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Dec 2025 17:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF60F31BCB6;
	Thu, 11 Dec 2025 17:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="N/APjRAu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1A9313265;
	Thu, 11 Dec 2025 17:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765475317; cv=none; b=Lc+KrWTpFHcGgQArgSn57e6EE2Gm6GQzaDdiZa6TBRer7xK7i9OgIjPb3duEnrwR9VWDB+J8bvJ5D3NsOdf7O5AA3D2jr/DKTdMu61i8yz0J8SegKWWbCyk61BisyBMCkxloujM8Pd4b5+o/hIicHcwKpO01MbBf0h9QxxrauMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765475317; c=relaxed/simple;
	bh=JdMujCpfMDsauoGRdezM3N4cIRdRlpVSTZ0VL4qIJ0k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=K2WQih2yeYEMZ7YdK9umSY1OUZ+cNa5g08oxAw3/o1rmu8LOs4b/B3SgN6UBUjiLd4iAlGDwWemWl0b1TNHgPPDiTuYircT2ksooBfe4s2fww5/W/CcTye4GjtQYRw6vRawOtXPUXYm3jKa+PN/l8RL+nlCx8EFn8rxijsaxWfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=N/APjRAu; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 502F61A20F0;
	Thu, 11 Dec 2025 17:48:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2267B606AD;
	Thu, 11 Dec 2025 17:48:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 617BE103C8DF5;
	Thu, 11 Dec 2025 18:48:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765475312; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JdMujCpfMDsauoGRdezM3N4cIRdRlpVSTZ0VL4qIJ0k=;
	b=N/APjRAuZRjcepImCR5G2n0aklAPp0QVq+Xp2siA7jweLGkdyHaQZ9ed1h7Z2KQ/B/s8oo
	w1bnUgTXF+F0xx+rLlvjNK5R4AMYiX8jWbhZnk+qbWviSBpOs/KxyPy49grVjAncDSKHwm
	dq7t9bGV0iZ8j+h3cSc+jFPQBuuErDwOLHcR952kApoPm0210VuZZdJxTU+NME4GeWm2xI
	Fhr6WO8MojPTEn8vlpd0uHAACCjJ6ztebwi/aqRS9ARnbac4d69hfu0UMvYqriANXqYIy4
	Vk27ZayUl0h+sdJhHl0P77wzQaAnrHZlfbmA53ZDRZ20m/NXWNQpBEacxNq76A==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Dec 2025 18:48:22 +0100
Message-Id: <DEVKRHI0WLHG.1J4ULCK2DYF2Q@bootlin.com>
Subject: Re: [PATCH 04/26] drm/bridge: make of_drm_find_bridge() a wrapper
 of drm_of_find_bridge()
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Jonathan Corbet" <corbet@lwn.net>, "Alexey Brodkin"
 <abrodkin@synopsys.com>, "Phong LE" <ple@baylibre.com>, "Liu Ying"
 <victor.liu@nxp.com>, "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Adrien
 Grassein" <adrien.grassein@gmail.com>, "Laurent Pinchart"
 <laurent.pinchart+renesas@ideasonboard.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Kieran Bingham"
 <kieran.bingham+renesas@ideasonboard.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Kevin
 Hilman" <khilman@baylibre.com>, "Jerome Brunet" <jbrunet@baylibre.com>,
 "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>, "Chun-Kuang Hu"
 <chunkuang.hu@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Anitha Chrisanthus"
 <anitha.chrisanthus@intel.com>, "Edmund Dea" <edmund.j.dea@intel.com>,
 "Inki Dae" <inki.dae@samsung.com>, "Seung-Woo Kim"
 <sw0312.kim@samsung.com>, "Kyungmin Park" <kyungmin.park@samsung.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
 "Anusha Srivatsa" <asrivats@redhat.com>
To: "Maxime Ripard" <mripard@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com> <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-4-0db98a7fe474@bootlin.com> <wxxjp7fmsnh2k4huvg2thmfi6kcszdphrag3zosrnykn7abeua@cdlywqj32jd7> <DEH2R1Q0XJJG.1NMESYMX9GMFL@bootlin.com> <20251201-fragrant-kingfisher-of-expertise-e43bff@houat>
In-Reply-To: <20251201-fragrant-kingfisher-of-expertise-e43bff@houat>
X-Last-TLS-Session-Version: TLSv1.3

Hi Maxime,

On Mon Dec 1, 2025 at 5:34 PM CET, Maxime Ripard wrote:
...
>> The main user to be converted is drm_of_find_panel_or_bridge(), which is
>> very tricky, and in turn it is used by devm_drm_of_get_bridge(). We
>> discussed this in the past and the conclusion was a rework of the drm_pa=
nel
>> lifetime was needed to be able to properly replace
>> drm_of_find_panel_or_bridge().
>
> Yeah. I wonder, now that we have a proper allocation scheme for panels
> too, if we shouldn't just create a panel_bridge for every panel we
> allocate.

I would definitely second this idea.

>> Maxime, Anusha, are you aware of any steps forward about dynamic panel
>> lifetime, after devm_drm_panel_alloc()?
>
> AFAIK, Anusha stopped working on it. I'm fairly busy at the moment, but
> early next year I'll try to revive that effort.

That would be great! Please Cc me so I can review and test your work.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

