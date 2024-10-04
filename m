Return-Path: <linux-renesas-soc+bounces-9444-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6E49908F4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 18:21:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81F70280EA5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 16:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2CD31C726C;
	Fri,  4 Oct 2024 16:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KAAPYooL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170261C7266
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Oct 2024 16:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728058915; cv=none; b=FOSJDCnSvd4cmbr/hG8VApf+V9C+FLqIhMcYW2amafLXM2EjKSWK0kdZLAr/BK1t0bbgwK2CttmJQtYz/3lD3/5oo3uA5K3j0ZXPrPCRGszFPOtP8/cnPPDVlBGkBiNtNhPF5qVo+i3PYHzjjkkDx5mtM6V8ZpBDnvtqeHyUK8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728058915; c=relaxed/simple;
	bh=QI+x0JMvgTPqLe891iEmcSvT4hecIS6GPs8XDikZkL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MvKgZ/T0iDbEvghYQoD6P7Ntv9edKyfw/y/TFS5CWQBS+2USsrsc+xvkpk1/q5Fxf3VES0GwsIhLD4Nplxia3VRvHt1FFF3919kGZChtlHlcAMmsZikQvhtta+UK23dyJbS/TozXMoQYbadQXppBOUX2e6bKKEESFi9nz9ZufrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KAAPYooL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=QI+x
	0JMvgTPqLe891iEmcSvT4hecIS6GPs8XDikZkL4=; b=KAAPYooLybHp2KyrpJaN
	4My/voukrhdPO0QXR5IOH2O2oChKq5wgHp3EC9isb/YHIxxNr2C6dZqLfLRgynUW
	q2PAT91obvAZTZmoBoYqfTyd63pcQhBkfizMDQlzw3Jyb4LkjAH4DAyMcu8bJ81l
	R+XA6IbXjMvOtUz/AgkxezPkjW1CxSO1L45I3VGdpid7zpIXAz5XwVOUeqTcKWDA
	PgV7DBci/sAtN1GBR6CYEjVzB8+jc2nSuWQ7ykuKpuwNm66448VnRcOvL9cWLUd0
	GBWSfNgZQavZYNeerv1aISOqdI2eAmi5MArQS02qG214vAYMZfv0rmH2DexKqlaO
	7Q==
Received: (qmail 3503161 invoked from network); 4 Oct 2024 18:21:26 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Oct 2024 18:21:26 +0200
X-UD-Smtp-Session: l3s3148p1@uCAMEKkj1t1QvCeD
Date: Fri, 4 Oct 2024 18:21:25 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] ARM: dts: renesas: genmai: enable SDHI0
Message-ID: <ZwAWBYunkIetd40r@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20240928092953.2982-5-wsa+renesas@sang-engineering.com>
 <20240928092953.2982-6-wsa+renesas@sang-engineering.com>
 <CAMuHMdUwJ+EY2qFZxXJc478W98OEWQ7c7tfmmEj8zVEii=OyvA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Wl9Y2OOvzGW+kEzZ"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUwJ+EY2qFZxXJc478W98OEWQ7c7tfmmEj8zVEii=OyvA@mail.gmail.com>


--Wl9Y2OOvzGW+kEzZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Any specific reason you left out the regulator for SDHI (CVCC1),
> but did add the regulator for MMC (CVCC2) in PATCH 2/3?

Yes, the MMCIF driver didn't work otherwise because it needs to
negotiate with the card. It does not seem needed for SD cards without
SDR modes. I assume that, didn't investigate further.


--Wl9Y2OOvzGW+kEzZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmcAFgEACgkQFA3kzBSg
Kbbviw/9Eg2wOGWBpAKrvDDa97W61UiH6Km9JeAzU7Akp81YB6R+B2sNF0S9QC4m
zBzLkw8lJbKDLZ0x04rbibReU9gWWpDDts2PxAaQKyoigI/MaCies86cMYyVgPZr
Bs6yOpdpNFTNReZn6MVI5aD9GZZqwAnd4G8uzs9iIpIahFWV2ZyFVE/BU6MwFFJG
q8UuMxnLMvBUfcjqMukuXX6E3vPBEmXv2INnFpRouIydIMf/ue9FLFuzo0Pw7qzl
TOc5R8/CqREpcbSOGNlU9qyGjMa3YeNlW8HzsNWKwWfpUUQXNKKkavhwYmelnZGv
vwn7iu/Z8986/c4lP++sWOZo/AlLYBpp1WgEPODu8ezHdD4WyH3YnTVBi9mz7v4h
1/ZjtSzzx2MP1RESCIyVHqflSCskloG7EgPnM4Wo/pZ1b/ACOJyQlnBUvHnehe6l
+3W0BtAoS3HxyJHwVfg61bamnwZ2FzcQYGOg4WmiVh7psguK2007wVOCeOKJ7+5/
E7QMrYoUlWiT2Jvv0vmZazuFTSoAdTgh2wgwvVz320VUnlYe6v9rT6mTF2d6O/eJ
VFeHqUD3ni1L8FgFdizPcvByF7xzkl3C5yemCikF1QdQHgWwPn7uwNcbfPPIdZtH
4/OwyhWYwIjvtVF5WPObUl6qnuQTfY86SyZy4tcsfFSV6GnHEsA=
=MD4Z
-----END PGP SIGNATURE-----

--Wl9Y2OOvzGW+kEzZ--

