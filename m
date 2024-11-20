Return-Path: <linux-renesas-soc+bounces-10625-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C279D3695
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 10:14:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBC38283E84
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 09:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83CEB54728;
	Wed, 20 Nov 2024 09:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="kBKTIRHb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88594155C96
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Nov 2024 09:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732094032; cv=none; b=kHrIjFuuLpthtPibmLX0UXNFMDFDb6H36FRyjBx3wFKYmOSyxy8/pjNkFDtm/kcs6BruX3oMgwbtw0cuYzOxNRPyHTygOknRh10LeXO7RiyKlTKlVzDvKpgLuaX3WPnwupA2WHCTdssCCigr6IuTHEbZkZUBanm7uLeIvKLgDYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732094032; c=relaxed/simple;
	bh=Se+MLORRIDI+Oj0NctVRR4lD5IS7Kyy+QRTmsDwMsgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l3YOjQWAczug+8yiPXSypzfEhz4EcxX9ZqO8HzU6bU/aMPUIq7IH7jMVSKZ+LHF3gRr+Ctg1r7I9jGGe5LdaUse+CGtvfE4KIo/5S3vvooucLvgbYfBMTMoWzvEtl3oGfutJROGHLB4oHkcW6Q/qAboVbc92FxEv27EVTjXjVA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=kBKTIRHb; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Se+M
	LORRIDI+Oj0NctVRR4lD5IS7Kyy+QRTmsDwMsgo=; b=kBKTIRHbd6BaCWzL9eAV
	wIEoAT3MOnxQKNXqSzxwT6B1DAvbNsHzXp2xWeO9D/ZKqUg8a63WuLxD2ffFJbvD
	L5pKJjZUAEjztY2nJIBxI8cqwXNVC8/qAo8ZljjsQRqhrT6R+jjGerJgR5xfRuCN
	ZaCWZbuCfUNi3QfVW02Pq6ShAAklMJ6K6YYUzf7PgqSDQsdElYn5J5kGcED9H2QT
	nkRCty6WPuVI8aS1QpdDzyXZdIOCEYjKDLwgNCiPzrf9z4N6ZJFlkfoPzTO4rnb/
	NoYZYr47eD3MJDhrGVN0/RD7cirSEzSi7ia8EZvg2H4LD5j0LzITECWY6w01HFP7
	kA==
Received: (qmail 844596 invoked from network); 20 Nov 2024 10:13:48 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Nov 2024 10:13:48 +0100
X-UD-Smtp-Session: l3s3148p1@8sJJkVQnCOMgAwDPXxznANR4Jedc6XSv
Date: Wed, 20 Nov 2024 10:13:43 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: rzg3s-smarc: Enable I2C1 and
 connected power monitor
Message-ID: <Zz2oR521sac6zUVO@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20241120085345.24638-2-wsa+renesas@sang-engineering.com>
 <TY3PR01MB11346DB1A6D857AFD968DA9FB86212@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S4Jw3UmT4gskMAeZ"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346DB1A6D857AFD968DA9FB86212@TY3PR01MB11346.jpnprd01.prod.outlook.com>


--S4Jw3UmT4gskMAeZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> How do we test this interface in linux? So far we use windows app to monitor the current.

BTW, the driver is in Linus' tree only as of today.


--S4Jw3UmT4gskMAeZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmc9qEcACgkQFA3kzBSg
KbYBfw//SRvKppV12QXKXazM97YcBmppn9EkyK3qhJmsk1v6zeDayxz5swqPOwuJ
NmSgQW6bPIXVhlOVqNKC2tdAmixI/ED48l2R2a7PwFIamVvFRDb6xSR4PT0aNdyA
BOzSkU05X+ZV6UIjFu/HmSkbLIc1GZJBU8043CR0HSzbcEMfzDTuSC1deO/pcOeB
KVQmICjlHqU4CEYWV1MtbmA2HQ8boc/WEGDy6DgS1jbXmlnoPItKwZ3PoSTJ9biD
L51clDdoXvexShbAK6SETp7hjTLwXEeLTdaeaDSVkjQEDmPEkh2ubZeg7xvYOJqE
Mljqwxxd7KGnd5XGUvocgexrcCNcKWCwRii4MCanrj4yvugq4SU0Bmx0ywBkKXlK
g6Dirm8P8mltNtQeT1Sw5DvLbZjnC7hsLu6QtYsotMkZ1VT9QV8339OFXU8w3MKB
eBXcCi0mkOwgMboHse+AtFGcGlVNA5/4zp2GH/tD7uUYq6zbv+faqyssPk/WbQ1R
ee+QomZ9jm1wynyn6ySIgslPDRxepo+2ZQEa4HixZeMI/H2R9TScZofTlQlaihHO
JQP1Xf0u0A1TS/MepFaH4RObVLp3G9+UOHLgi9Y2AGvkmNWZPoJX8wNoKSGbLGPV
WEYRUUULAgxH/wCe+k6B7YZXSE+208FwdFcE2KExHXP5FQYtEas=
=pwgv
-----END PGP SIGNATURE-----

--S4Jw3UmT4gskMAeZ--

