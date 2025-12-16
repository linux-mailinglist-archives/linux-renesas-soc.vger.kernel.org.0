Return-Path: <linux-renesas-soc+bounces-25807-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A676BCC3666
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Dec 2025 15:02:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C4D93026FB1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Dec 2025 13:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9247365A0A;
	Tue, 16 Dec 2025 13:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ms/EcseV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9521F364EB9;
	Tue, 16 Dec 2025 13:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765892983; cv=none; b=YlQc8l0B0BuraV+zdTdEg6MaNniLj2pqmhhwW5eAFti6sIYDf9hb70BsXgywfWioE53Kvea9DtCyO1JP0F9fv3jvO3e8X5+MfVBnrc12zhsCgqdjvqIdleSGTu0+HeC4HxFRMgKgfKyrTLpn7T5JKv5MXy6W4BIB3fPncpjRMso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765892983; c=relaxed/simple;
	bh=YfLQ27amlUSOROYLrmwTzJ9E/8AgqpTLSS/yS8wBt6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R0ptojQa2xDAmxVJuUBW6xsrcghTRaBVDb7Kt6yZL3Uwf1ENPoOyFxLfQs1ZmFRqS/F8WRwP0B6V08KM6mbAaS7MvkAGUeqzN4sG90vt6f1UeHTptiZgXbO6a8DlMXOGPo89Pk+9L2O2ruzf/zOPfa1HxSak0zvz1K0av91PLaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ms/EcseV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A093C4CEF1;
	Tue, 16 Dec 2025 13:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765892983;
	bh=YfLQ27amlUSOROYLrmwTzJ9E/8AgqpTLSS/yS8wBt6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ms/EcseV+s20wmc1lLhYwDx89gIvClg2PrymIGMeUbwNDiD4SnOmW78o0LBiCBxlO
	 BdxeF2Dz7vNPLlHk6H9c/Loage+PF2nosiRONlDlgQCWHyIinBjfz+mmT27iulavfd
	 BuE/G7U+oUbo+mnBfw6ESY6cd3Q41neeo7IYkgSIPk07g5OM0wIZnaF/AK+WLm6cgJ
	 GmCyNXU3kAhE/wGxDlMtotwE9co/euW0U0pWBSlyqKeVL94wQyOekYMU9/93Cs6rqR
	 ujWcxuOybxnttG5mv4zj6LB+Bfu8R3ei8lyxE/EthGDt30dEmVf0CTtlhobbfgREOI
	 OXMYvMAHdg9pw==
Date: Tue, 16 Dec 2025 14:49:39 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Alexey Brodkin <abrodkin@synopsys.com>, Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Adrien Grassein <adrien.grassein@gmail.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
	Edmund Dea <edmund.j.dea@intel.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 06/26] drm/bridge: add devm_drm_of_find_bridge
Message-ID: <20251216-cute-bandicoot-of-authority-3c492a@penduick>
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com>
 <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-6-0db98a7fe474@bootlin.com>
 <hs44z4b2dgisemuewgtvl4epjcqqilg6cy36po25pubaog4hmq@33qgl4o3hwoa>
 <DEH2CVQV21Z2.25PJBAQAKFJSG@bootlin.com>
 <20251201-thick-jasmine-oarfish-1eceb0@houat>
 <DEVKQWH8GU0D.2NWQ1U7IOIEHI@bootlin.com>
 <DEW6XHD12EY4.1THDR9UMJOTAN@bootlin.com>
 <20251215-mottled-dexterous-marmot-c69ad3@penduick>
 <DEYUNHVYCKYJ.2HU878WBYCJMV@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="65zjs456orcupskh"
Content-Disposition: inline
In-Reply-To: <DEYUNHVYCKYJ.2HU878WBYCJMV@bootlin.com>


--65zjs456orcupskh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 06/26] drm/bridge: add devm_drm_of_find_bridge
MIME-Version: 1.0

On Mon, Dec 15, 2025 at 03:11:21PM +0100, Luca Ceresoli wrote:
> Hi Maxime,
>=20
> On Mon Dec 15, 2025 at 11:35 AM CET, Maxime Ripard wrote:
> [...]
> >> > Additionally, as a matter of fact there are currently drivers storing
> >> > bridge pointers. The next_bridge is the most common case. Code using
> >> > drm_bridge_connector_init() for example can store up to eight of the=
m, but
> >> > individual drivers are the hardest to hunt for.
> >> >
> >> > I can see these (potential) tools to handle this (not mutually exclu=
sive):
> >> >
> >> >  1. remove drm_bridge pointers pointing to other bridges
> >> >  2. check whether a bridge (say B) still exists before any dereferen=
ce
> >> >     to B->another_bridge: that's drm_bridge_enter/exit()
> >> >  3. let owners of bridge pointers be notified when a bridge is unplu=
gged,
> >> >     so they can actively put their reference and clear their pointer
> >> >
> >> > For item 1, I think the drm_of_bridge_attach() idea quoted above wou=
ld
> >> > work, at least for the simple cases where bridge drivers use the
> >> > next_bridge only for attach. A next_bridge pointer in struct drm_bri=
dge is
> >> > not even needed in that case, the pointer would be computed from OF =
when
> >> > needed and not stored. I can do an experiment and send a first serie=
s, do
> >> > you think it would be useful?
> >>
> >> I had a look and, while the implementation should be simple, only a few
> >> drivers could benefit right now. The majority fall into one of these
> >> categories:
> >>
> >>  * drivers using drm_of_find_panel_or_bridge() or *_of_get_bridge()
> >>    (maybe 60-80% of all drivers, those will have to wait for the panel
> >>    improvements)
> >>  * drivers using the next_bridge pointer for more than just attach
> >>  * drivers doing more complicated stuff
> >>
> >> I think your "put next_bridge in __drm_bridge_free" idea would fit wel=
l the
> >> 2nd category and perhaps also the 1st one. For the 3rd category we'd n=
eed
> >> something different, e.g. a per-driver .destroy callback.
> >
> > Yep, that's fine. We should optimize for the common case, with an escape
> > hatch. That's exactly what we are talking about here.
>=20
> Not sure why, but it's taking a while before I grasp your ideas about this
> series and meld them with mine. I hopefully got a clear POV now, so based
> on it my plan is to rework this series to:
>=20
>  * keep drm_of_find_bridge() but renamed to of_drm_get_bridge(), and keep
>    patches 1-5 (with the changes suggested by you and Louis, nothing big
>    and all already sent in v2)

I don't think we should use that name, but on principle, yes.

>  * not add devm_drm_of_find_bridge()

Yep.

>  * add next_bridge pointer to struct drm_bridge and call
>    drm_bridge_put(bridge->next_bridge) in __drm_bridge_free, document it

We don't have to at this point, you can add next_bridge to the
drm_bridge pointer if you want, but I don't consider it a prerequisite.
If we don't we would have to create drm_bridge_funcs->destroy
implemnentations to give up the driver pointer reference though. Your
call.

>  * convert patches 7-26 to use bridge->next_bridge where applicable,
>    or to do something different when needed

Depending on your decision above, we'd need to either convert them to
use drm_bridge->next_bridge or create a destroy hook for them. Either
way is fine for me.

>  * maybe remove part of patches 7-26 just to reduce spam and rework effort
>    in case of further iterations, to send them separately once the approa=
ch
>    is accepted
>=20
> Does it look OK?

Yep

Maxime

--65zjs456orcupskh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaUFjcwAKCRAnX84Zoj2+
dgzkAYDvA9yfAoN5qn3Uuq31rvBMPARdeaGJP/R7L/afEIqfYpW00Xnt3rcpsKVt
DvfNFYwBf0vpoxbPBiXv/KJmjkwFaLmGNHmvjyicK5vGQGOUo5Kn5EA6cWvB5aoe
s/Mjb6G3Dw==
=yqem
-----END PGP SIGNATURE-----

--65zjs456orcupskh--

