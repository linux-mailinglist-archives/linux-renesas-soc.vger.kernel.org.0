Return-Path: <linux-renesas-soc+bounces-30621-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iELVMiB8y2lPIQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30621-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 09:47:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB6A36573E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 09:47:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D3B6C30B8482
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 07:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66EEB3C9EE2;
	Tue, 31 Mar 2026 07:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dqIJETCH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7263CEBBF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Mar 2026 07:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774942856; cv=none; b=Tf+U1ZebXBgMxgYprB44/sLwP7uOVhA6PH7D58IjJUu+j6iCmH1FqUyEX8uuxQcS7MTLzOfzAvkRxZorQd340D0sdMJc8J6Un1/KVL6Ok3JsX7UUkaxihz0FrjLoJxp3Rx3mwVisVz5y03SLLBdm8cb6sDniOrdsNMa/oVZPID8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774942856; c=relaxed/simple;
	bh=mxJa4OnZPZQ4isZ3ivPlpL7XmqxbvJctjnvIPc+Fj3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WxPkNDwLs5v1UsT0pNvP4JT/PyZv3Z0z6wizAJ4fOztfOHz9HOYgu8TkQwFtgRvYCMdowOUmhsv7AX/LGpILWItT5c94ruc+aGbgHzIXsldLwrmWcXw2Ym9hwB0ocWwWZYtq71v1S+pcrLBTk3aiF8t5jkG0ZJORe9S/cCRHMAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=dqIJETCH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=dBDL
	mmVEXCJX6ppu/jfbo13ZIge5FZycIk9NKQr8cSY=; b=dqIJETCHGpcK9LGT8iDv
	AzhxEv6BiOW/TE6/U+Eew4mOzrWnXWxqrX1RS4rGDcUjVttO19bkmanmzeV00wIq
	t04IIvLlqFPLWqDLS9ZrZtxkpzzugea3oYNX2YRNzdrLeRmpj2POMe/WAOfvH8fT
	6UcxddCZzKhqqRQY8pXgqN6wFNmaSGbY/vafn+CIyAWpgrnpgMwv9wenM4FS9jbh
	MjnE7SykQwcX5ewpZNzgnMT8buj15dxX5cv14K8Hdth3QzdHGuzepinQu+Nq5kBZ
	n7E3/goLYGIKjLVxKArHuqIZZxkxbJFBgiGerP2JmS78dOFGXu6cxj7dB/2pqF+n
	8g==
Received: (qmail 1589924 invoked from network); 31 Mar 2026 09:40:49 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Mar 2026 09:40:49 +0200
X-UD-Smtp-Session: l3s3148p1@scQEFk1Ols4ujnu8
Date: Tue, 31 Mar 2026 09:40:49 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: soc: renesas: add MFIS binding
 documentation
Message-ID: <act6gTgkYE6Az5hK@shikoro>
References: <20260317130638.2804-1-wsa+renesas@sang-engineering.com>
 <20260317130638.2804-2-wsa+renesas@sang-engineering.com>
 <20260318-camouflaged-umber-oxpecker-b2b29e@quoll>
 <CAMuHMdX=DRnFWG1ky8wT7mK=LHeJ6LduL28nYd19QpASrn6mew@mail.gmail.com>
 <c46357c9-8cf4-45ec-8b48-8cf979de2e98@kernel.org>
 <actzUSIKKzcDmBCT@shikoro>
 <8988012f-b006-4aa8-bb8f-571b8526a15c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YS1M1StTrmdXNQ1e"
Content-Disposition: inline
In-Reply-To: <8988012f-b006-4aa8-bb8f-571b8526a15c@kernel.org>
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30621-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[linux-m68k.org,vger.kernel.org,gmail.com,glider.be,kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7EB6A36573E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--YS1M1StTrmdXNQ1e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > In case you mean this as unanswered questions to v1: This describes the
> > device specific second mbox cell. Like Tegra does it here (even with
>=20
> I asked Linux ABI. Device specific numbers is not Linux ABI, because
> Linux is not device.

I have no idea what you want here. I see it like this: DT is OS
agnostic. So, the flags are to describe the hardware. The Linux driver
then does the proper things according to these flags. Other OS driver
might do other things.

> > shifts instead of plain numbers):
> >=20
> > include/dt-bindings/mailbox/tegra186-hsp.h

And I still have no idea why my header is different than the Tegra one.

> > I really have no idea what is still missing?
>=20
> It's not a binding, drop the header from the bindings.

So, I should add the header to the driver? Can do, but then I have to
remove the reference to the header from the binding doc. Namely, this
paragraph:

+      The first cell is the channel number as specified in the documentati=
on
+      of the SoC. The second cell may specify flags as described in the fi=
le
+      <dt-bindings/soc/renesas,r8a78000-mfis.h>.

Not helpful for the user, or?


--YS1M1StTrmdXNQ1e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmnLen0ACgkQFA3kzBSg
KbZ2pxAAhcWDq2zcakZq3ltjpX1rLg+FBVpPX7VgyIyUWSN/TU7jVHmSMmyoyK3c
l2p7RkWLDei1LFBw1XcLevI8Y9jktic3o2TgU+7XuDBdyFRn41TWc5HVN0eZ4ZMT
+OkBSfu7QdFx3RjSbcRUa6DYd3PJhQVBLtadFaLTfKRkkOI5RWw/VyZnihtxmB+/
0niYY6xbVpm6jFucqs6bMfT0hI4UnUQIeev0CJCYi9ot5y5g51ZvWorDuou40j0C
opOQyc4lCTGTExeGRNP4C0nC/aYiLkchRWNk/NdIrhteyA+yolf8ci0ejZdMiB2T
/exSgjcrceNsQSqnTjsNFM+K4T8RYQGvrdj9f4SGKHthCb/QWZghbw0vv7gjLe8C
FVuX21o4wJZKTeKOmc5eJkrmcaczqTeqW6cbnhhpb+fwZvOTLgVOS9XpJI8x7mrC
4klcGaE1J4aJTwvd8BWpov2SB5N82TvVIJY6G0aczsyX0uqDMt2kZwO73LjbeS5s
emfcaREnFSjU8dE6CiUD3U8Wvt5FXdpbmH9FS1gYCSC/zT9fWV+Cu7TTT5r6GMmm
5/NNx5QSpOc0VnilygBswrWpaN0oU4f4pJmVw5tYT67DvNniEPRwTARJr1miPA4I
59Y3Nktofj1ZT1cfbfFaT7Z9r2QFRvo/TsNQzzGCTzr/YiP5QGU=
=z5US
-----END PGP SIGNATURE-----

--YS1M1StTrmdXNQ1e--

