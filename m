Return-Path: <linux-renesas-soc+bounces-34788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Izt4LoazTGqToQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 10:06:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E23718E18
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 10:06:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=a4uAEI0d;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F8EF309006A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2026 07:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA20B2DC782;
	Tue,  7 Jul 2026 07:46:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940EE272E56;
	Tue,  7 Jul 2026 07:46:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783410415; cv=none; b=cYE6YJL/0ji5tJfND/DCwFpgIEodOjxEKmil/ns5e+h2jzEIT2Hr+24+a9xT14vgmtBU4lfNuRc2u9OWErmvx3ltRFTp+JH+7ul53HLNNVM/PP3Xt+5nyI0Ta5Mq2O22V47bcsQeODaG8ftWGtL7Q9AzZsKhyqJw27wrAg/l1xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783410415; c=relaxed/simple;
	bh=OnpghKNBXuM5a1+lYcxPvTs2yNmaNmSBYDdKDW5xo7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGGjAfVPdO7j1Cur1kMFzt5g5651Bc0gntuCOCpuaMpBZNMHxRMthxej8sqy+OwueHjrLHa6Fhz8bPPJcBWP98Dbe1XGV8NThBaDbtGiLoHtEKJuQaDfrVJkZ5FyyeJD3DZXyP1Xu4M6jMHTwUI8pUoMaM5qvEgNDYsamlZ03K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a4uAEI0d; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B587A1F000E9;
	Tue,  7 Jul 2026 07:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783410414;
	bh=OnpghKNBXuM5a1+lYcxPvTs2yNmaNmSBYDdKDW5xo7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a4uAEI0dABLPn0hUPJJWyQNJ70Oa4414tjdc5SMVZIe2nR9Wlr9Vl00mhtpqix3ae
	 l+vcafSCV6eu5bnZRGfa4Fa6gIaeiXZAdGbH7dXJdWAuWyRvfxhTfpc9rRwfm+a2cj
	 tmDnEOSIwZHYxZUl6mtVa9txxPvQN06d4rCyHhikkwnWunlHLz2aEvO0YkB5M+JIOJ
	 /zoi2xjyatyfxO/JhOg6H3pCh3sBfwzKcZSWyLeVBtcboLCpmvrB5J8wq0PREjvq+n
	 BCW4gUg5ANzpve+xZAV5vRebff71OpPOQoIm8j9RROaeUFY3EcF/0ijDOguR2/YwiW
	 9nzRYogRcDnNg==
Date: Tue, 7 Jul 2026 09:46:52 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: display: vga-connector: Allow
 hardcoding EDID
Message-ID: <20260707-meaty-chocolate-lemming-fa9ead@houat>
References: <20260705213542.28987-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260705213542.28987-2-laurent.pinchart+renesas@ideasonboard.com>
 <20260706-capable-beaver-of-excellence-a3cf10@houat>
 <20260706094522.GA42740@killaraus.ideasonboard.com>
 <20260706-fancy-perch-of-satiation-0c220e@houat>
 <20260706160243.GB106045@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="uxuzu5uiypml7j3g"
Content-Disposition: inline
In-Reply-To: <20260706160243.GB106045@killaraus.ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:thuan.nguyen-hong@banvien.com.vn,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:linux-renesas-soc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34788-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER(0.00)[mripard@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,banvien.com.vn,linux.intel.com,suse.de,kernel.org,glider.be,gmail.com,intel.com,linaro.org,kwiboo.se,bootlin.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,bootlin.com:url,houat:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 08E23718E18


--uxuzu5uiypml7j3g
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/4] dt-bindings: display: vga-connector: Allow
 hardcoding EDID
MIME-Version: 1.0

On Mon, Jul 06, 2026 at 07:02:43PM +0300, Laurent Pinchart wrote:
> On Mon, Jul 06, 2026 at 05:40:30PM +0200, Maxime Ripard wrote:
> > On Mon, Jul 06, 2026 at 12:45:22PM +0300, Laurent Pinchart wrote:
> > > On Mon, Jul 06, 2026 at 10:52:32AM +0200, Maxime Ripard wrote:
> > > > On Mon, Jul 06, 2026 at 12:35:39AM +0300, Laurent Pinchart wrote:
> > > > > Since DDC version 2, introduced in 1996, VGA monitors have expose=
d EDID
> > > > > data over an I2C bus. The bus is also used to detect the presence=
 of a
> > > > > connected monitor by trying to read the EDID data.
> > > > >=20
> > > > > Some devices where the VGA display is integrated in the device and
> > > > > always connected do not connect the DDC pins. Some development bo=
ards,
> > > > > such as the Renesas M3N Salvator-XS, also do not connect the DDC =
pins.
> > > > >=20
> > > > > To support those, add the ability to provide hardcoded EDID data =
in the
> > > > > device tree. This is mutually exclusive with specifying a DDC bus=
, and
> > > > > can only be done when the VGA display is guaranteed to be always
> > > > > connected.
> > > > >=20
> > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideason=
board.com>
> > > >=20
> > > > This feels redundant with the EDID firmware loading mechanism we ha=
ve in
> > > > KMS already. It should at least be mentioned why we would need to s=
et it
> > > > in the device tree at all.
> > >=20
> > > Very good question.
> > >=20
> > > I assume you're talking about CONFIG_DRM_LOAD_EDID_FIRMWARE, as the
> > > debugfs override_edid feature isn't meant for production. If there are
> > > other relevant mechanisms I'm not aware of, please let me know.
> >=20
> > No, that's indeed what I meant.
> >=20
> > > In the use case at hand, the VGA display is an integral part of the
> > > device, the same way an LVDS or DSI panel would be. Using
> > > CONFIG_DRM_LOAD_EDID_FIRMWARE, the manufacturer would need to set the
> > > drm.edid_firmware command line parameter, and provide EDID as a file =
in
> > > /lib/firmware/ (possibly in an initramfs). Beside the complexity, and
> > > the fact it won't be very friendly to people who run a different
> > > userspace on the device, I think EDID counts in this case as system
> > > description, the same way we support specifying panel timings in devi=
ce
> > > tree.
> >=20
> > It's *some* hardware description, but you have no idea whether it's
> > actually the hardware you're running from. What would be in that EDID
> > anyway?
>=20
> It would be the EDID corresponding to the connected display :-) I see it
> as identical to how a user of the simple panel driver is responsible for
> listing the timings corresponding to the hardware in the device tree.

What's the expected user-experience for someone with that board
unplugging a display and plugging another then? Update the device tree,
rebuild it, rebuild the firmware and / or resign it and reboot?

That doesn't sound very practical, and even impossible in some cases.

> > There's another alternative we've used several times already, in
> > simple-bridge for example: just register any VESA mode up to a given
> > resolution:
> > https://elixir.bootlin.com/linux/v7.1.2/source/drivers/gpu/drm/bridge/s=
imple-bridge.c#L66
>=20
> I don't see how that would help. The goal is to provide the kernel with
> the data corresponding to the display integrated in the device.

How is that not helping? Your problem is that you have a display you
can't get the supported resolutions from. What I'm suggesting allows you
to create all the possible resolutions for that display, allowing the
user to use the display, which is what we did for multiple drivers with
the same problem.

You seem to be set on providing the EDID to the kernel, but it's a
terrible idea to begin with, so I'd rather discuss alternatives.

Maxime

--uxuzu5uiypml7j3g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCakyu2gAKCRAnX84Zoj2+
dttmAYDwAyDzsHH4BdK18Zg1snhvtmCOWF5mfpdzQr5B60t05sOH4JHRHhYDO62c
O0R+3mwBgLQ2v3BV/JvI3f56cwkgVA2l6vP/yfbZFMo+03DPC8zxTjP8fRZZmkqV
6IPIr/VIMQ==
=pNHu
-----END PGP SIGNATURE-----

--uxuzu5uiypml7j3g--

