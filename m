Return-Path: <linux-renesas-soc+bounces-25086-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D2FC818AB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 17:24:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D57B84E5650
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 16:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3DE4315D42;
	Mon, 24 Nov 2025 16:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BmmKrDVR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CA2314D28;
	Mon, 24 Nov 2025 16:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764001435; cv=none; b=Qr1ci3Bhw/3Gx5k2XrsPG5S1/8vs0wHlb2XyvF3ogRQDzLzqnmH+TzcdZmI08dUyBXgGrsKOYzAshlAxRfnekTWPjyFLRCutxSAidIdT6VAObJHBo3NcQBvqq8woJRhq/6x3b4nRyH1vIYczNAnLOnSVjgPwsy0aN1nYRF2FEo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764001435; c=relaxed/simple;
	bh=5iAbDOgOR8ZMbTQTdCUF7iLVrRq1qzVBnjvSfBkCQjY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=plrvtXspv7r5E4dBOV42qoeJ5fLo0NfDisTrxhtuNTFNdXIJZ7IZXG46RHKnTMYFbC/RnGeqcuQj/Q3+FNC7Lkv+GmwlJ6nBRmc0l5QWcrmJr3KVjs3TMqmEAsJrJuzoWoQmGhyyFsYyvqqUIwThLpJd3tKTpC93ilRKVPnTBXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BmmKrDVR; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 35C5A1A1BE3;
	Mon, 24 Nov 2025 16:23:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 02ACB606FC;
	Mon, 24 Nov 2025 16:23:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2AF0A10371D9A;
	Mon, 24 Nov 2025 17:23:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764001428; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4dwXgW7awt8oQD3TrOxHo6im6bS23ABW/5Js6C/RUYk=;
	b=BmmKrDVRXr5Ui32ulufganjLHxAsQu1h7GaA9GD/T26zZxsOmgBvpSlEsWb4eI9jBIrq8K
	HJRZgRJik54F0xx2TU/v0tHCfxRpZNOWhhVFU0fh/tctuiBkGe6xW5AKIFV56AzOFeR0D+
	KkRUZ/Hf/eBL0NxbHwdjqgI5BzLofOXiNiZX41H7n5Pc/c2ktwFubkq0zA6WKyHxr/g7w0
	Fj3SFW1KfFRHkOtqPrRz8zKkw4Y3NTKrSm8YCJtPSGvkDc4QPbzddQG3GvEd0nqVdi7Tba
	eeHfeMNGKEukwL0NNBiTyeDeUH5H5ptJ2JmJJI7XgEcDg4bqaXb0zUbE3FpsZg==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Nov 2025 17:23:34 +0100
Message-Id: <DEH2BAF6NRPG.3S6GKB2PR1465@bootlin.com>
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
To: "Maxime Ripard" <mripard@kernel.org>, "Louis Chauvet"
 <louis.chauvet@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 02/26] drm/bridge: deprecate of_drm_find_bridge()
X-Mailer: aerc 0.20.1
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com> <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-2-0db98a7fe474@bootlin.com> <66cdbe39-d065-4aa4-86e4-84a38b49c09c@bootlin.com> <x6uch6cyjgbwnmac7fyjxdbi56gnhmilezfjdhqpakbz5hogt3@q72fex3ssh6u>
In-Reply-To: <x6uch6cyjgbwnmac7fyjxdbi56gnhmilezfjdhqpakbz5hogt3@q72fex3ssh6u>
X-Last-TLS-Session-Version: TLSv1.3

Hi Maxime,

On Mon Nov 24, 2025 at 11:18 AM CET, Maxime Ripard wrote:
> On Wed, Nov 19, 2025 at 02:28:41PM +0000, Louis Chauvet wrote:
>> On 11/19/25 13:05, Luca Ceresoli wrote:
>> > of_drm_find_bridge() does not increment the returned bridge
>> > refcount. drm_of_find_bridge() is to be used as a replacement.
>> >
>> > Suggested-by: Maxime Ripard <mripard@kernel.org>
>> > Link: https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose=
-0a18ad@houat/
>> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> > ---
>> >   drivers/gpu/drm/drm_bridge.c | 7 +++++--
>> >   1 file changed, 5 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge=
.c
>> > index d98a7b4a83c0..6debbf20aaa8 100644
>> > --- a/drivers/gpu/drm/drm_bridge.c
>> > +++ b/drivers/gpu/drm/drm_bridge.c
>> > @@ -299,7 +299,7 @@ EXPORT_SYMBOL(__devm_drm_bridge_alloc);
>> >    * @bridge: bridge control structure
>> >    *
>> >    * Add the given bridge to the global list of bridges, where they ca=
n be
>> > - * found by users via of_drm_find_bridge().
>> > + * found by users via drm_of_find_bridge().
>> >    *
>> >    * The bridge to be added must have been allocated by
>> >    * devm_drm_bridge_alloc().
>> > @@ -360,7 +360,7 @@ EXPORT_SYMBOL(devm_drm_bridge_add);
>> >    * @bridge: bridge control structure
>> >    *
>> >    * Remove the given bridge from the global list of registered bridge=
s, so
>> > - * it won't be found by users via of_drm_find_bridge(), and add it to=
 the
>> > + * it won't be found by users via drm_of_find_bridge(), and add it to=
 the
>> >    * lingering bridge list, to keep track of it until its allocated me=
mory is
>> >    * eventually freed.
>> >    */
>> > @@ -1452,6 +1452,9 @@ EXPORT_SYMBOL(drm_of_find_bridge);
>> >    *
>> >    * @np: device node
>> >    *
>> > + * This function is deprecated. Use drm_of_find_bridge() instead for =
proper
>> > + * refcounting.
>> > + *
>>
>> I think it should be more explicit that the refcounting is not done by t=
his
>> function, like:
>>
>> 	This function is deprecated. The returned bridge is not refcounted, you
>> should not use drm_bridge_put(). Use drm_of_find_bridge() instead for pr=
oper
>> refcounting.
>
> I'd rather say that the callers must take care of the refcounting by
> themselves but that it's racy, or at least that it *must* not use
> drm_bridge_put().

I was rather leaning towards "Deprecated. Convert to drm_of_get_bridge().".

But if we want to still support existing (lazy) users, with yours and
Louis' comments taken into account, what about:

 * This function is deprecated. Convert to of_drm_get_bridge() instead for
 * proper refcounting.
 *
 * The bridge returned by this function is not refcounted. This is
 * dangerous because the bridge might be deallocated even before the caller
 * has a chance to use it. To use this function you have to do one of:
 * - get a reference with drm_bridge_get() as soon as possible to
 *   minimize the race window, and then drm_bridge_put() when no longer
 *   using the pointer
 * - not call drm_bridge_get() or drm_bridge_put() at all, which used to
 *   be the correct practice before dynamic bridge lifetime was introduced
 * - again, convert to of_drm_get_bridge(), which is the only safe thing
 *   to do

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

