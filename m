Return-Path: <linux-renesas-soc+bounces-24840-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 037BFC6FA0F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 16:23:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 21DD834C9BB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 15:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513752EBBB7;
	Wed, 19 Nov 2025 15:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="m7vF4ll1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A372BDC0C;
	Wed, 19 Nov 2025 15:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763565241; cv=none; b=TKFfagY3vbCX1m4TdAEYgdB1jZLdojbcidh/nB6Ysx1b5SjENVi6L/YqusQmLzz4tvdBnNC5ArinqH/W2VsfTTulFIyTDpQrV0kOltCXWGCyew47gOiTBqypMDqfxaF/zwVwcMJMnhoY+dsXTNkzVLPA7JLVFAZvbBR3d4PyBi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763565241; c=relaxed/simple;
	bh=jTVZWb1z3cijgYgnTd2OTnTD3iYb79u3u3LIuyPG89o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=tDE5T26lGQR5BT1uhkVYVK4i+jDMKGztuLNt98d/uyGyB1e3uSAPFqXZmXz0lCymSVII1BA4TCHTj2HEV9SOQh7lbQccR4jwp/vrW7MkIdjDBs9ASJSKAV0s09cwZQoUTNxAkSNj6Lh1H+YCgCsLQNdzbZYb/pHjFPIEfTukHgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=m7vF4ll1; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8CC83C1118A;
	Wed, 19 Nov 2025 15:13:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B484260699;
	Wed, 19 Nov 2025 15:13:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8CF7910371A8A;
	Wed, 19 Nov 2025 16:13:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763565233; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7NujdOdzUvG8wdCZQfUnNhZngIGWDfpoPw7syCRBlyU=;
	b=m7vF4ll1ceXLHQ7SOaiZpgd4CxFPgYohzfJ0NlZ0aTzSJaXD9VTyQ0b6Nca2vIQ/wrWegN
	X7lT/+WK9S++6avBgiOXY9NP7+MI1jjWHWI7RBsLQX6wfWReUJ54QYX3K53QOZ6/y8dBoc
	rwTJVJ7c+G9WaXQ8N7tTqpG6uDWPHNfn1xUUQJ6LI4Em7jpXR+JjigURq762sngel+VEcW
	YeNbzw3ktmsl5OOmcChfp5qJ6/9qH6bPrQk2TgiRq9mOSsRfXE2q6j3dzq+QEA4YtrRHS0
	cD5J70cFAFYr33yZY126C/B2axcVbx4hl6oArAJtX+b6b2pfPjSYBIGdWMXGmQ==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 16:13:41 +0100
Message-Id: <DECRP2E0HI3I.APSIIQR4TVWK@bootlin.com>
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Jonathan Corbet"
 <corbet@lwn.net>, "Alexey Brodkin" <abrodkin@synopsys.com>, "Phong LE"
 <ple@baylibre.com>, "Liu Ying" <victor.liu@nxp.com>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Adrien Grassein" <adrien.grassein@gmail.com>,
 "Laurent Pinchart" <laurent.pinchart+renesas@ideasonboard.com>, "Tomi
 Valkeinen" <tomi.valkeinen+renesas@ideasonboard.com>, "Kieran Bingham"
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
 <alim.akhtar@samsung.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 02/26] drm/bridge: deprecate of_drm_find_bridge()
X-Mailer: aerc 0.20.1
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com> <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-2-0db98a7fe474@bootlin.com> <66cdbe39-d065-4aa4-86e4-84a38b49c09c@bootlin.com>
In-Reply-To: <66cdbe39-d065-4aa4-86e4-84a38b49c09c@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Nov 19, 2025 at 3:28 PM CET, Louis Chauvet wrote:
>
>
> On 11/19/25 13:05, Luca Ceresoli wrote:
>> of_drm_find_bridge() does not increment the returned bridge
>> refcount. drm_of_find_bridge() is to be used as a replacement.
>>
>> Suggested-by: Maxime Ripard <mripard@kernel.org>
>> Link: https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose-0=
a18ad@houat/
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

...

>> @@ -1452,6 +1452,9 @@ EXPORT_SYMBOL(drm_of_find_bridge);
>>    *
>>    * @np: device node
>>    *
>> + * This function is deprecated. Use drm_of_find_bridge() instead for pr=
oper
>> + * refcounting.
>> + *
>
> I think it should be more explicit that the refcounting is not done by
> this function, like:
>
> 	This function is deprecated. The returned bridge is not refcounted, you
> should not use drm_bridge_put(). Use drm_of_find_bridge() instead for
> proper refcounting.

OK.

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

