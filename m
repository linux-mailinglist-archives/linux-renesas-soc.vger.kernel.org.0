Return-Path: <linux-renesas-soc+bounces-5435-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBB88CBEF3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 May 2024 12:05:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1EF91F22A01
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 May 2024 10:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC837E572;
	Wed, 22 May 2024 10:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ka9PVjSs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460DD7A715
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 May 2024 10:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716372350; cv=none; b=E9cO2V5K4M9JMzIdEc3ytb0n0vkJ1LvVm5efW/L0ePKs4OtH2g2sn4G0B5SKqS6mpZfQmGA8j5kc0bziJEzxxjbZoXGQVyXIIP5n/W16j7hBvRGaP9ayTjEYm/Wv6T8/48BI5+AWq201ElkP6YmM0IxvkVZTHUpgqNcaRPcwv+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716372350; c=relaxed/simple;
	bh=TkqqdUwJqaZ3BE0lgenm4KO29MLuU6p2UOll+UmheQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SncRNkapeFLwxxb5s7fXeH3bowlsZWvizGWFAL8Juriw87aPPClzeFEiwCh4D+8U3/6NvGRdASolP2P1zvZNiILjmjavZFE6Wrj7zn6cSRh9w9QL/NmYWKdW2zc//h3ejT6XSDcZ2zxZswt8IBzkiFjlHClMXw2d+3+Nye8SMWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ka9PVjSs; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Tkqq
	dUwJqaZ3BE0lgenm4KO29MLuU6p2UOll+UmheQY=; b=ka9PVjSsNHyewh/yG8lH
	4r6JZ3p5cHQorFwt4C99b8s8yQA8C+5U/tH1Ozy401DhqjYQ/lAqCTCS/YG0HFjT
	udu0j2h6GnDKYzprnAOjJf2d2EMyxd6zo0nnuDr4IGAyXTVISYK5m3un/iYzEMK+
	Ibr2aX5LwdmJhx+8oF3r3AdUMcFnN/jvhEZO0eYNjhrMQMB2Is9Pj8i5OOcmZRqH
	V7vsbWW1Uc6Mm8/hZunygoE9BrMr80fvl0My7/dPNROTM2g8jY3vVECf4O53JtQK
	acWTRszuUt7SSj6uNjzuGEUP6tnJM7m7044HeC0eQTUVqFVXFQuMOe8L/ER+BXEm
	7g==
Received: (qmail 660923 invoked from network); 22 May 2024 12:05:38 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 May 2024 12:05:38 +0200
X-UD-Smtp-Session: l3s3148p1@d1GJEwgZ/K8ujntm
Date: Wed, 22 May 2024 12:05:38 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm64: defconfig: Enable Renesas R-Car Gen4 PCIe
 controller
Message-ID: <20240522100538.qam3uafwxqnhxvdi@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20240521065136.7364-2-wsa+renesas@sang-engineering.com>
 <lcbvbogpsvia5c2rpsedu4mjvzjht4cfqds7zwmzyghqmdlnbg@xzyogkjl53dv>
 <TYCPR01MB11040E4C3EC3280AA907796FFD8EA2@TYCPR01MB11040.jpnprd01.prod.outlook.com>
 <CAMuHMdVH-_fV6=9pOD-jP-NNb1z-2qNeT_B3mnh7CM+=PJ91Uw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hgjsr3xcahy7fxp4"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVH-_fV6=9pOD-jP-NNb1z-2qNeT_B3mnh7CM+=PJ91Uw@mail.gmail.com>


--hgjsr3xcahy7fxp4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Do you plan to send a v2 including that?

Yes, I'll send this later today.

> I guess we also want that in renesas_defconfig...

I agree.


--hgjsr3xcahy7fxp4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZNw24ACgkQFA3kzBSg
KbYFhw/9EM9wGbkgpsGmsHM06ytXCHud93oPGVVWehzjPTQXwqrSzhZKrTnnnYZ4
pvsQS9bGGR4rJzMxnRyUnUTl0wCpwpW11PLtnjt1KLn2qkzDDg4z55/xPOKyFPou
I8N6dsBuB9eLd/zAJjSR2UFmFukQvmKNER5c3aqVMNzZ6JW+e/RyzV61gMzLoQ7t
dT2tDo6A5qDkzyji7dkoT98EanTYjkYnlBgd3JjtDMsKsSgB2urLyjtwvQL3lLi+
0VQOTt+ID01LPUhVQ83IsKdFkBtsdSeU7Q+M4btOJWP9RFPNnB+Gswq7FmxDtXr4
0at+6rCnz9Y+1WtvCvFE5kM4kT0fvEyp3spntPBM6semvOmuydRderrZbMg9f1Yv
qrC4MtJWYaPbFTlLKL5VuChkpPgFxZBsaC43PVprDnPorhzSrxm74I1LIB2Muyl2
Wj/bm28F2esnCV6OOm4JF79Eq338Tu8pAc2SPItiUf+Hzk3Z+roEmO+2P4dwEX3Y
8Rdm14yIalFwHh0lGE8eM64Wb7QgggVdmRwUQShPeUbAj1QAVXogiC7mwVXzCSnX
e7yKRRllGCI+KbHuCfC5FVKW+7HpRKHTaKYrujfGPbLFm613qTU9DMv+Xk04UwuC
KGVEu0ZrKVVItXMRA55dLazjPvPWeF4e7weI7Rd9ift4hU5oNTg=
=1qzw
-----END PGP SIGNATURE-----

--hgjsr3xcahy7fxp4--

