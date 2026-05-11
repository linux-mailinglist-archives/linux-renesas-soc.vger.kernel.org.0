Return-Path: <linux-renesas-soc+bounces-32395-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCI/J2UHAmp2nQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32395-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 18:44:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 175345128A9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 18:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 108CD30068DF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 16:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E7DE427A15;
	Mon, 11 May 2026 16:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u420ESoE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A514402BA0;
	Mon, 11 May 2026 16:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778516912; cv=none; b=lKQkM3rpGbkeSzXMZU1D03w9vHbtFi8GNNR7W7mzxZrlTWpt1t1it1j8KDlo2+TJkOOl2uMoDvQkop1vKmrtsdmi7/kMGQknNHe0rAdvAZcUkxKUH5mMYwxYcFgHIaN+XSf6Gx/XL8oUnLUM0s4Nca1GD+bzS1Ef3lduQQZqvsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778516912; c=relaxed/simple;
	bh=XyGGAqtZlzRJBtg/5PYfDkuJsejYjsveP0gpxlus6BM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=grUXFjZrLP1szPSJj6BrPm8RQTnMXFPnxaxYRAlIBg7NVojEO5CAqWouGFf4BcHoF/aMDbl3qV8P1hgd6H/zl9zEPNa6Ft4SnGDo64MAlZKQT+kI7SoDjUih77X1Wly577h12mVOHZhGtC3zDt+8GoZeJ3BBuBt6Aeeg7148Yz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u420ESoE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C648BC2BCF5;
	Mon, 11 May 2026 16:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778516912;
	bh=XyGGAqtZlzRJBtg/5PYfDkuJsejYjsveP0gpxlus6BM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u420ESoEVgcwE6erx0RH5zKF6L2dUcMJPl9ctyyKI0DA3zCiGls4Am+PLbpYGJOb3
	 naP8HKYnKfK391suFpehhDJfRhC+DfeSdLiHWDgsDxJ53rDKGtzMTpzn44KFd8pTqD
	 ziGLJxynkDfMqZFcOtN4857/q6jENcU1KEBZoIc75Xp+nUzXeNka62UK5STyDxF6yL
	 iFtD71vlsXBGNzazC5TLsHV6grzLNH9gv+DmIwse96H5bdOiepstyI2Zwz40r/lVdY
	 i2Yw6HeBe9NedhccX9eII1rjvimrM+F19mm+Jn1QKG4tjUNH6gcoBCv+otZVTsWRXt
	 DNNGu05Xp5rzg==
Date: Mon, 11 May 2026 17:28:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jon Nettleton <jon@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: soc: renesas: Add various SolidRun
 RZ/G2 based boards
Message-ID: <20260511-headless-guzzler-4793b285a55a@spud>
References: <20260511-rzg2-sr-boards-v2-0-82aebbd27891@solid-run.com>
 <20260511-rzg2-sr-boards-v2-1-82aebbd27891@solid-run.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9V1dWzA5s948okPQ"
Content-Disposition: inline
In-Reply-To: <20260511-rzg2-sr-boards-v2-1-82aebbd27891@solid-run.com>
X-Rspamd-Queue-Id: 175345128A9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32395-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[glider.be,gmail.com,kernel.org,solid-run.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,solid-run.com:email,solid-run.com:url]
X-Rspamd-Action: no action


--9V1dWzA5s948okPQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 12:37:47PM +0200, Josua Mayer wrote:
> Add bindings for various SolidRun boards and System on Module built
> around Renesas RZ/G2 family of SoCs:
>=20
> - RZ/G2L SoM [1]
> - RZ/V2L SoM [2]
>   (shares PCB with G2L and has very similar programming model)
> - RZ/G2LC SoM [3]
> - RZ/G2UL SoM [4]
>   (shares PCB with G2LC but programming model differs largely)
> - HummingBoard IIoT [5] (RZ/G2L, RZ/V2L, RZ/G2LC)
> - HummingBoard Pro [6] (RZ/G2L, RZ/V2L)
> - HummingBoard Base (Ripple) [7] (RZ/G2L, RZ/V2L, RZ/G2LC, RZ/G2UL)
>=20
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/r=
z-g2l-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/r=
z-v2l-som/
> [3] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/r=
z-g2lc-som/
> [4] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/r=
z-g2ul-som/
> [5] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/h=
ummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
> [6] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/h=
ummingboard-rz-series-sbcs/hummingboard-rz-g2l-sbc/
> [7] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/h=
ummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/
>=20
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--9V1dWzA5s948okPQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagIDqwAKCRB4tDGHoIJi
0rJ/AP9BX/NSDxfXT/fKr/K7sOnRq6yJETkIf7cm+JtD0KVfHAD9Ho6t/dbPiybP
3TnssqUmwF/j7lSAiBg8jl6nE+NchwQ=
=9gC1
-----END PGP SIGNATURE-----

--9V1dWzA5s948okPQ--

