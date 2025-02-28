Return-Path: <linux-renesas-soc+bounces-13830-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E28A4A512
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 22:30:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23FC77A71D3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 21:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2105C23F377;
	Fri, 28 Feb 2025 21:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="W7pb83O/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70A223F36C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Feb 2025 21:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740778233; cv=none; b=eTZT4RQ/uy6Z+l03CHhgIHRHFqdO433tx2yrgI1TF1LpEVTbFEzw5/7oMk54R7PcwZ/PyC21IhxyHkgrV6/16LITJbB6bu9Ora9x/nOYMQT6tzNn9I02iFFJ/B0vMbENP0IMlPsTQY2YkKJsk1PsVxSUVvGFMJRfmvh6+MyDwuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740778233; c=relaxed/simple;
	bh=3llXzds/pJcBvSbtF+e9nqNRCz2s3QViR5vuyA02Q5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mf7y7992/+V02Ki5RX7QUWwJ+zSZxMzR+yEUfuaSuJ0OrUmKLmSVVuhvB0+tCcmBH8fibsEzqvnLa/OHwY2A50U4yuUmFuTS/lwhA7V3LLwbNJY/tfAsMwWrlbxEOdusut+dMx0mhbx75Npj2FAWDK1H2mbpRymLPLH7KGnkmxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=W7pb83O/; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=3llX
	zds/pJcBvSbtF+e9nqNRCz2s3QViR5vuyA02Q5A=; b=W7pb83O/LISeXggW00u1
	BR6vL8fnS9PfPSSbJahjKzPF4Wi/+I9ufDJDd0QdlAJgAER1fUihHtBUiVF6qBrx
	P1cJuKeIA5PIExj9xgj6dkJca5PRlXYViab9ncC9/+Hih/y0i3L47AMVZZkbP24Q
	5icycWG7iQZu2rFrokR+sJahvWS1ghXQkKy990HE+biH8kvkdTtbuihYtzAo/wGa
	0cJm2o4pHNZXf9JHn6mRCwiWXNXTLrbyQ1AQuuDAcAa+TgxNjJNlEsMGFUIQ35T7
	967PARxmpD5RKaKx+z2yUu1clRsQMNS7ojxJ9jjV59+igukIr8DPKSA+Aef+7GX1
	Kg==
Received: (qmail 1429949 invoked from network); 28 Feb 2025 22:30:28 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Feb 2025 22:30:28 +0100
X-UD-Smtp-Session: l3s3148p1@9NTxgzov9OMgAQnoAE04AOw9xELqAtuS
Date: Fri, 28 Feb 2025 22:30:28 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v3 4/8] arm64: dts: renesas: r9a09g047: Add SDHI0-SDHI2
 nodes
Message-ID: <Z8Iq9MhtQroCbwsC@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
References: <20250206134047.67866-1-biju.das.jz@bp.renesas.com>
 <20250206134047.67866-5-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KCA5+pJH0gLMiA5j"
Content-Disposition: inline
In-Reply-To: <20250206134047.67866-5-biju.das.jz@bp.renesas.com>


--KCA5+pJH0gLMiA5j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 06, 2025 at 01:40:28PM +0000, Biju Das wrote:
> Add SDHI0-SDHI2 nodes to RZ/G3E ("R9A09G047") SoC DTSI.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

I don't have a datasheet, so I can't check the numbers. The general
structure looks good to me, though:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--KCA5+pJH0gLMiA5j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfCKvQACgkQFA3kzBSg
KbYTVQ/5AWAyWaFGSgHsfe/bFFrYtw5weS604L2PqXiD6ZWZV854VndgmWTffo54
cXfKWiSuysV6vGaUThSgYgkpS+cTjeZynS5/taJKcq/xO+fttS88VCD3W5QeFcAq
XV+BK787Hgymx/KbOqL5mnFonsK7vUvAy6le7OanxmI84N7I/FBzxNypVsOFxXr1
2cdng2MpHQSylFoh4xYIS636rPmKH38qZYMVu7w5mrpeb5jDuzHXVLY7AdR6gZUM
xIAvMgPNY8k3JOokD0v4h73Q/RRllp3Y411Kziv5Q8aZjYRKY8zYoIhLekoj4GSK
nFtDE8XjT+E5hyjjHAxvZFzsOXdVC+7ttrOTw15vb3jSSjcbJvB5jg9WAhUQTlol
IxOXkeVE6Dqr8PfWimVHV1bJkVcMczq1tgcddG4Tt1UQYak9yDpIVJvFmMThVlQq
Q2U2SM+9np7rJ6VQjVdDIUvz+7P8bisCi1LH/4FBEb5qKl48ZxiTmOiPNtV64408
tw2ighaaAb3nwY4T3cjstxojZpYh919gosCkuC1K40m/gJqJ1aUCh6xcpFI/hr21
+GCSaJjCTvp5kMa0PE1McRRS42pwKp0u6cVJAAPDB1BovqIEmAsk6EADSFF9AwqI
Et1fi0eeUkPix//Alg6vXaU09ajVEkBS05xd6bM1xOLabVD7FS0=
=EKyW
-----END PGP SIGNATURE-----

--KCA5+pJH0gLMiA5j--

