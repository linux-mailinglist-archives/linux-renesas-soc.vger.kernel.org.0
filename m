Return-Path: <linux-renesas-soc+bounces-23737-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2159EC146E0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 12:44:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AFC394E6B0E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 11:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D943081AC;
	Tue, 28 Oct 2025 11:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TMxhBtvf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814EC2EDD62
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 11:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761651717; cv=none; b=SxaSUCbijy+i+lJMK6x7bdD1EDfaw6Dgn+Pbw2LVOe1FcB3caoYw0eCrFOmGBHpZV8v82mtZ9AHV5TxMgKm23wjwBAuo5VbFqGASddvYfHL24AfllGmwajvrwMfz4qnmUsIJyXcreKJEux5lsZ3Kckx9zXPpT8Iviz52/D7z/2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761651717; c=relaxed/simple;
	bh=qvWlWq/W8X/VCCd0e2VY9VKNF1lxtivBrV2LrAuGZQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NJJ0oV9b9dMr/uTaT60gx4wMkxZcPSbr1ODrTXy/haAUiyYAAh50jEdG8PX6GmhrLXcqactMerRv5w5tuSsWOcCS07NqiJMsw1EnH1dw0j/Tv8VL6wNQ2TAn1D8R8TZKjxITRBINtQv4kvt97QaLR86HL/maxBKD9YW5+aSFf9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TMxhBtvf; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=jz7u
	EGV1nYX9HuE5xRfx7TexHsqcjfgUn5DYJztNetY=; b=TMxhBtvf3qGvLNQSuv26
	BOkLvLua/mCBSAO6HvYqFF34Ld7Ct2BD5IZdwUWj6EMPK2XT/11JHiNHCmOj0sZ6
	s/mTxn54nZI+TS2g+T5xfRJtjZ0Blsf41knRuSwaN5NwzgDwDWFyCVKiVwwj3M9n
	p4cZeqagLjOLf5hjQExu5UV3h2vI4ye0kvgVf+Do38mDqwFwdazktj+w3xJLhVWD
	YnAH9Hj35a3Ah2Nx7OHJ9WlbbFzafGwgUx4D/bt3aoI4rJCSITmcvBXGfYPdEbM+
	FjQQedgJH2FnVOxjdkfdhgaXNdua24Adli3dXCvTQWRdA0j1JBtNc7OhvwfmH6JZ
	cA==
Received: (qmail 3998476 invoked from network); 28 Oct 2025 12:41:52 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Oct 2025 12:41:52 +0100
X-UD-Smtp-Session: l3s3148p1@BUyIgDZCxsQgAwDPXyjKAONDL9E53Fzy
Date: Tue, 28 Oct 2025 12:41:52 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dt-bindings: mailbox: Add Renesas MFIS Mailbox
Message-ID: <aQCsAEl25_t9aEeb@shikoro>
References: <87o6prsl2z.wl-kuninori.morimoto.gx@renesas.com>
 <87jz0fsl0u.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdXz9egr_tye9CbVRMJws_Y-jh9jwCvTTOq0JRar7Zd_Xw@mail.gmail.com>
 <aQCjJcXaKAjjUhTg@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="99KvmHoy1/B6C4bY"
Content-Disposition: inline
In-Reply-To: <aQCjJcXaKAjjUhTg@shikoro>


--99KvmHoy1/B6C4bY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Well, actually, we would have two MFIS entries, there is one dedicated
> to the SCP as well.

I just saw that the two MFIS mailbox variants have a slight difference:

plain MFIS reg + 0:	AP -> RT
plain MFIS reg + 4:	RT -> AP

SCP   MFIS reg + 0:	SCP -> AP
SCP   MFIS reg + 4:	AP -> SCP

As this driver deals with the "AP" part, we need to access different
offsets when sending/receiving depending on which variant it is.

Shall we handle this with a different compatible?


--99KvmHoy1/B6C4bY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmkAq/cACgkQFA3kzBSg
KbafhQ//ROPPWFTfsafAfUqD/pIBKtRlJEgqzgmaP1whfstVEXzlZ7Hms9dkRkVS
G1db9+asUXPMz0t7Qg+itgFnewtyI0C2OlAVVDB6432Gj+NgIDv+WhoPOekx+DXS
tDNVNfDSmx75J2v/9fL9irvfgwpoVFyQbmoPAdcEyycAzKLCoa19MT42sLo/j0aW
gbiqpWstun1U4bQODnpmaNM+GZyE8sbxIT4AdjV7sAEbHPz55uAwGvK27RGAAivj
7OgKpKKy0mG3nxAGcaigsYy69cKtXkWUMtQZrXSlqdAUug6Sp+Cg3v6MasbQgZhi
/h5pHocxLN1DPRvSq+FhvkclA+/kNPtwU0KaVDJzEttMUbUiJNr5V3qIrOpPZI1N
1lTaRNuRoTCr7hvI1QeNan1DpLDXdnny11BQkVOfd1qvgx5ITX1SeagUpd+tJreG
7Hli8FWl7e7YqzDeL+97GbbGbjfx4gbCN6UInmm37dTXQsTYhF1qhZjDqYjrtkTL
R8XjVwmiGjpmr5MREeGWYbERzKkwSKchVM595yro6O4pCCZl3ECVrQPt45M5ubRc
YYrDoA8OWTAHlBJMzV0sMM9UFeUo+mtAlOeH7AK8RHu/0hMeu1nlO9nOdfokaK8a
kyNCpRcjYiozwRuzexQ8a7nV8sQzUo6kcxGis/2eoCOJVYxIa8g=
=DMz1
-----END PGP SIGNATURE-----

--99KvmHoy1/B6C4bY--

