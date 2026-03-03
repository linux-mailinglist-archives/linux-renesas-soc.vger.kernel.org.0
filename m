Return-Path: <linux-renesas-soc+bounces-28686-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CG3NEmUpmnmRQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28686-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 08:56:57 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDF31EA6F6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 08:56:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9DE1E300D0E0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 07:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7F283815C1;
	Tue,  3 Mar 2026 07:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r9ufdgva"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8470830DD11;
	Tue,  3 Mar 2026 07:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772524600; cv=none; b=P19EACWGegA4tvrHcHpgpEOs69IA0GOs6cj+RuizXf7EFC6nvIktxiYA2DkL2htqOmWOOwme1TL0QzYhhYq11xNFk4hsco11MlMPS/vrn9ENISJ7qtt9VYtt+3zjNhx4pLANnCfMewrG/gKprkUBwD4/VHUrE8BZz8nBIpO9Koc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772524600; c=relaxed/simple;
	bh=FPSWXBq5h5afHHQAEz+9DZlmBzF6MzQWH5e4VqK9Y2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WVN2t9W+szylaCYP3Cns5NKT2oVv0auS3w874ZSiI+HiwA2cr2ajpkiFJjxJba0t/QvLdcr0w/aY6kIKH8p1piUpaq5C5/0EarVDrXSQdA3JJYFNs+k/kQcF6NBYIvMY8AT2C63MZkar7nr1Dj/oLFxzTS57QwfV/oBoEvP7A4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r9ufdgva; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1176C116C6;
	Tue,  3 Mar 2026 07:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772524600;
	bh=FPSWXBq5h5afHHQAEz+9DZlmBzF6MzQWH5e4VqK9Y2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r9ufdgvawrpPlnAtM0ouFDuO3f2CKQ1CsgRa+jiWLDMs2bFdicnx6eHyvUQ6KK+D/
	 9f6XAuTB+2XI9tKop3mvMVv9kt5EXZ2U4nVYa4tlkfAUQNWNDxS45NH4tT/0xXKTBj
	 JZQrO/Ju55zTuQ1rEp0uhzZrByObywMowr21VJCcs3+F56nQqxbdzZsYc0hfWX/oY5
	 ImwJWEza5HcQJZm0i33RWIHwc5YB2KffTZ3Ww3/HvQCLC8srNynT7CRc9Ct6Voi3mJ
	 MNpxDZYVGoXJesTgJ7xmbSqUwl2Q4kk3M9xmI3HwI4SteBuYAbbsMaNuGDzhSkh9b4
	 GEWz2HEm/NAkg==
Date: Tue, 3 Mar 2026 08:56:31 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Joseph Guo <qijian.guo@nxp.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: waveshare-dsi: Add support for 1..4
 DSI data lanes
Message-ID: <20260303-free-kudu-from-vega-20fb3e@houat>
References: <20260115024004.660986-1-marek.vasut+renesas@mailbox.org>
 <20260115024004.660986-2-marek.vasut+renesas@mailbox.org>
 <3af09657-78ce-4bc6-b8d5-b346a3b86c5b@mailbox.org>
 <fe436c72-deae-41af-87ea-726fe4801e7b@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="m34revu4ahbvqc7p"
Content-Disposition: inline
In-Reply-To: <fe436c72-deae-41af-87ea-726fe4801e7b@mailbox.org>
X-Rspamd-Queue-Id: DCDF31EA6F6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28686-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,nxp.com,intel.com,kernel.org,gmail.com,kwiboo.se,ideasonboard.com,linux.intel.com,linaro.org,ffwll.ch,suse.de,vger.kernel.org,bootlin.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action


--m34revu4ahbvqc7p
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] drm/bridge: waveshare-dsi: Add support for 1..4
 DSI data lanes
MIME-Version: 1.0

On Mon, Mar 02, 2026 at 10:35:31PM +0100, Marek Vasut wrote:
> On 2/6/26 12:48 PM, Marek Vasut wrote:
> > On 1/15/26 3:39 AM, Marek Vasut wrote:
> > > Parse the data lane count out of DT. Limit the supported data lanes
> > > to 1..4 which is the maximum available DSI pairs on the connector of
> > > any known panels which may use this bridge. Internally, this bridge
> > > is an ChipOne ICN6211 which loads its register configuration from a
> > > dedicated storage and its I2C does not seem to be accessible. The
> > > ICN6211 also supports up to 4 DSI lanes, so this is a hard limit.
> > >=20
> > > To avoid any breakage on old DTs where the parsing of data lanes from
> > > DT may fail, fall back to the original hard-coded value of 2 lanes and
> > > warn user.
> > >=20
> > > The lane configuration is preconfigured in the bridge for each of the
> > > WaveShare panels. The 13.3" DSI panel works with 4-lane configuration,
> > > others seem to use 2-lane configuration. This is a hardware property,
> > > so the actual count should come from DT.
> > >=20
> > > Reviewed-by: Joseph Guo <qijian.guo@nxp.com>
> > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >=20
> > Is it OK to apply these two patches now ?
>=20
> Can this be applied now ?

It looks like you have a reviewed-by already, what's stoping you from
applying it yourself?

Maxime

--m34revu4ahbvqc7p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaaaUKwAKCRAnX84Zoj2+
dskVAYCJ7J/l8B9fqheSoxJIx+Y4Gx3nWzFKUqBV2qBIdXmqMJzsizWpwlJw8gqh
rBzx6/sBfRXuFUNae9IbISIR3FomKKf98SSgyl11gageLtdnZz/5cy+j5xq+k6Fu
wslp5YJncA==
=MSWU
-----END PGP SIGNATURE-----

--m34revu4ahbvqc7p--

