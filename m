Return-Path: <linux-renesas-soc+bounces-32096-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHeDAUQe+mkJJgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32096-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 18:43:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E354D188C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 18:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0A7543028611
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 16:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6468492501;
	Tue,  5 May 2026 16:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oQV8x5Z6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33A6429838;
	Tue,  5 May 2026 16:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999375; cv=none; b=ozjWPPSQalXo0nnVqyz+xfL+HlWxZ0eQ50165x2UVlyq7Me06nm4A8inOYfshbNQqucK895d08hIoyjqSzoOiXcrdub0vZ11kg5ULjT+CLcLTdmXJlQGt1pfxu9z3U3s1V2KFn36t65LOeNYOwYyEendBlPw7RIpBJrlZg9OvDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999375; c=relaxed/simple;
	bh=/ST3POmUMHpr3+tcwM9JD54cfRb54w9coIuMU0yzs70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8hFO5DFeVVhB9Xz4l1BmnoCbFECxqIhkmAcVz7RY1x7aee6+ZzpUawpzsMkjE3+f5OAqkeZ4uzFKN3OZJIjWpd1EMHS4y3xcPb8omdkdl/W11XkjYOiiatOZO/O3bALELjefhtOvunTBd+b5wzfc6OKixbo/puYQugxqqef3FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oQV8x5Z6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28395C2BCB4;
	Tue,  5 May 2026 16:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777999375;
	bh=/ST3POmUMHpr3+tcwM9JD54cfRb54w9coIuMU0yzs70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oQV8x5Z6wWRo4fgRVwQik/KgBI3JxnJMpMgww/lhGRfvZ/dKirsFDQtw2LSPW9h4P
	 4ucQT1ilLHvEZXgwfibjABRb674+UsPgdl2kvG7D2o/4nRFd7pLw0hG+FFT2ZsaWbA
	 u0QKNpIxcfX33bQr0kHM0hTTemwhMDWB4iya+s43fk6edm/T/KeU3xjAeqmMbUVETp
	 DTlY0yGw2Zl1h+p6CQqtkZAQ7I6EgtEWNJmjQMlLz+ikEgcloxf1lLNU8LeXdpJmUe
	 db13gSn6r0mhXFGUCIY/dlfo0SJwv1/S5rbR2xDl+j/yn4UAkjWSSLMz+DV0/T9YqT
	 q0NGRGpVOhfxg==
Date: Tue, 5 May 2026 17:42:51 +0100
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
Subject: Re: [PATCH 1/4] dt-bindings: soc: renesas: Add various SolidRun
 RZ/G2 based boards
Message-ID: <20260505-reusable-hastily-a014412c267c@spud>
References: <20260503-rzg2-sr-boards-v1-0-8545677f93ca@solid-run.com>
 <20260503-rzg2-sr-boards-v1-1-8545677f93ca@solid-run.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g06tqCVkPwAgzTSP"
Content-Disposition: inline
In-Reply-To: <20260503-rzg2-sr-boards-v1-1-8545677f93ca@solid-run.com>
X-Rspamd-Queue-Id: C0E354D188C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32096-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]


--g06tqCVkPwAgzTSP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 03, 2026 at 01:17:58PM +0200, Josua Mayer wrote:
> Add bindings for various SolidRun boards and System on Module built
> around Renesas RZ/G2 family of SoCs:
>=20
> - RZ/G2L SoM
> - RZ/V2L SoM
>   (shares PCB with G2L and has very similar programming model)
> - RZ/G2LC SoM
> - RZ/G2UL SoM
>   (shares PCB with G2LC but programming model differs largely)
> - HummingBoard IIoT (RZ/G2L, RZ/V2L, RZ/G2LC)
> - HummingBoard Pro (RZ/G2L, RZ/V2L)
> - HummingBoard Ripple (RZ/G2L, RZ/V2L, RZ/G2LC, RZ/G2UL)

Missing signoff. Content looks okay.

pw-bot: changes-requested

Cheers,
Conor.

--g06tqCVkPwAgzTSP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafoeCwAKCRB4tDGHoIJi
0nUdAQDx/iZXnu6bfWlDm644EkJZMUSRDcoz8vD+tuy/NsAtsAD+Kh5NsdW8wbct
wq87fDe4qMkekK8dUGyw1+eSfVjT/gs=
=wLhG
-----END PGP SIGNATURE-----

--g06tqCVkPwAgzTSP--

