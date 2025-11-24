Return-Path: <linux-renesas-soc+bounces-25084-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D1DC817A2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 17:03:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CB4013476A6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 16:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05858315765;
	Mon, 24 Nov 2025 16:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cc20tveb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04461314D18;
	Mon, 24 Nov 2025 16:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764000198; cv=none; b=kpW8vjJsk9YB+wDRsVDBD/tU6OvQrrjbuVchjOVnU5rDIzN07OJ8UZ2OJLFsxTlg8rw++rn6ski6hV96e2MEQ25GLb737dSb6dJrXLeCwK94Daw8I/cV/FBksdTfYcP0up+1ncE96uCyQ9Olrc8BKtyK6Mh19DSbGPgYWeeD0rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764000198; c=relaxed/simple;
	bh=iNYZTK8FqL7zYuodxjQVjn042PT5p2VJydpdS9njRwY=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=qe6FluZvRY5w9WMIAQJVCE9a60zpcK5KuJd7GP+dc8u8IUbHMmGU38U1uz1cATgRWMgIVVfGEJge2TPZfMrLOJkduLtapQJgqIH1/30ZwwzCUqpJQ9bU6FTUCWBmT1c+82+GiTGgE9scJFY6oB3Cu9xcwnCmihcvV6COCVH0x+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cc20tveb; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 632914E418A2;
	Mon, 24 Nov 2025 16:03:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2CA36606FC;
	Mon, 24 Nov 2025 16:03:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B4CDF10371A40;
	Mon, 24 Nov 2025 17:03:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764000193; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p+QBWKtawqpPzZu9LPDyPm5gsgmOzV7hJRZ5Ebshggc=;
	b=cc20tvebhyskRFsehgbMDtN58mFWJzw3+meTYMQYXrWdpw5VV3uKvGIpPD9HS8R83EmRZH
	qALe8e5UUI6C7MJXNERyWBLmNk5WfzKKvn8Wss/BPa1OVvmct7arm5zW27QDKgInGVcz6k
	oi6j2QLmL3GbqobdqI1pyE5V0TLsDjFvq2MBjZC1AlbLsk1PMdr+v727PXLGHuuUayjymh
	vV+Lgfi2eIyHigvvg8KiU75iRe8JFjVl6qwYhTFrQuO5g/Z240s/dFBsN/mdGefIWxxz3z
	LHntkwUmsv/8hiteqTu/SKAu006LhE9TFbOO34cMGYjkq2/kVuVeteyUjoVDQw==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Nov 2025 17:03:00 +0100
Message-Id: <DEH1VJUEJ8HQ.MIS45UOLCPXL@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 01/26] drm/bridge: add drm_of_find_bridge()
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
 <linux-mediatek@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>
To: "Maxime Ripard" <mripard@kernel.org>
X-Mailer: aerc 0.20.1
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com> <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-1-0db98a7fe474@bootlin.com> <pv56bl4p7lfflloocozxaeufd6udkk3jhehrtne65cidrvlfwn@wvrkw6mjmhwp>
In-Reply-To: <pv56bl4p7lfflloocozxaeufd6udkk3jhehrtne65cidrvlfwn@wvrkw6mjmhwp>
X-Last-TLS-Session-Version: TLSv1.3

Hello Maxime,

On Mon Nov 24, 2025 at 11:15 AM CET, Maxime Ripard wrote:
> Hi,
>
> On Wed, Nov 19, 2025 at 02:05:32PM +0100, Luca Ceresoli wrote:
>>  #ifdef CONFIG_OF
>> +/**
>> + * drm_of_find_bridge - find the bridge corresponding to the device nod=
e in
>> + *			the global bridge list
>> + * @np: device node
>> + *
>> + * The refcount of the returned bridge is incremented. Use drm_bridge_p=
ut()
>> + * when done with it.
>> + *
>> + * RETURNS:
>> + * drm_bridge control struct on success, NULL on failure
>> + */
>> +struct drm_bridge *drm_of_find_bridge(struct device_node *np)
>
> So the convention we've mostly had was that the first argument would
> define the prefix, ie. if we pass a drm_* pointer, the prefix is drm, if
> we pass a device_node pointer, then the prefix is of.
>
> Considering that convention, of_drm_find_bridge would be the ideal
> candidate, but we can't use that obviously. What about
> of_drm_find_and_get_bridge, or of_drm_get_bridge?

Ah, it sounded the other way around during the old discussion [0]. :-) But
no problem in using a different name of course. of_drm_get_bridge() looks
like the best to me, so I'll rename that way in v2.

[0] https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose-0a18ad=
@houat/

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

