Return-Path: <linux-renesas-soc+bounces-23340-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D09ABF3479
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 21:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 347483BC2F4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 19:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C3E3314DF;
	Mon, 20 Oct 2025 19:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PYi99bOU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A1C32F74F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Oct 2025 19:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760989725; cv=none; b=rzyYFEj/fhE5aNDf7AoM4j0ze2DkffKobDuowxNn4IuHa1qEvUKp9EBjXjg6RNGvDrsyAdxKjNTSTeLoHXa6y5Uy7GbrevGBEw1jd8bAAqNE8v8LY5Cg7hI84h4tXO/M17wvwJSGe/GY7Nl+0cCIOYa3TSFDCMkV3gOdhk+Mp64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760989725; c=relaxed/simple;
	bh=3AaSt5irSxoTjaXTJF8y8dIG7W3zKUdqcwa+1jCu2aM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RcPqkypYRXo1l4jHHL7uWc8E+ZaqXUMOyPZhGGfb9M8N97XjPlczGRJ+uwKQ4m7/Mh9Csd7pigiUlUKRB8mDv2/vAg29RwzKPfoeP5Gh7mAi2jGZDsuL9XBG4VzubyuHU+UrKc6GuefjBX2hw+BQkG28kdap0QAhfdh3Je8MScs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PYi99bOU; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=3AaS
	t5irSxoTjaXTJF8y8dIG7W3zKUdqcwa+1jCu2aM=; b=PYi99bOUmqphs++UMD0y
	seZ0mIsQR/7m8c32r11HnUsx9jroAYjEV14X3dNQlQDQ1Ebbvqwjc4LnBLih9xCg
	PDUovY3pEStG1jGOiCUsOE3SUhp4J+Z/lkjG1yKZShPdDpis0No6YTB9aj0ajFZF
	ccOADvWfdP42nYDNGGUMS2nQoZHDd3Qx9r5ouHPI+raBeZXmq1MVWhoqzoZqETOO
	whuEmvg0LBW9sSY2ItOV0l52/7ZDrzUV6m1mf6f4/v4aetBG+urgDQlPn+tpWEns
	T3/kg+XOMF32JslEy/vq4iXaaEW7h8W+nyIwusG5QydfavbW8ajB80WCzLIWY33M
	6w==
Received: (qmail 1173740 invoked from network); 20 Oct 2025 21:48:40 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Oct 2025 21:48:40 +0200
X-UD-Smtp-Session: l3s3148p1@sFqvXpxB12NtKPGK
Date: Mon, 20 Oct 2025 21:48:39 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Marek Vasut <marek.vasut@mailbox.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: don't reserve SWDT
Message-ID: <aPaSF2lokJ748cTx@shikoro>
References: <20251017115123.3438-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdUCSRKAbD=DfJxfFGpfKTRkt=a2BO+HnwTqALBeeECOkA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vu8MTP2ik1rVZ2XY"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUCSRKAbD=DfJxfFGpfKTRkt=a2BO+HnwTqALBeeECOkA@mail.gmail.com>


--vu8MTP2ik1rVZ2XY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Or better: drop all these swdt = reserved commits?

Maybe. Since Marek is maybe interested in fixing FW...

> TBH, I always had my doubts about making them reserved in the upstream
> DTS, and there does not seem to be much gain in doing so...

No strong opinion here. With "reserved" I think I followed your
suggestion but I personally don't mind.


--vu8MTP2ik1rVZ2XY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmj2khcACgkQFA3kzBSg
KbaeGRAAqcOU9QvDbaUDy2F41gJVFn5kBDZDCy29x+H78+gFS8VMZ4VpVxFHNF/H
rS/pIN5pywMfGviRahkOHg7FvJacLR0yWHyojhZdyXpnAQ+2y26CuRqYCeawySQd
mB+myRVE4qSR4oEiohTeE0ok9E/NgPc3A28dNU6IsUXyiwhtWay++kFMOIlc6wZJ
g1M92gPcVHO8qZ9eOcfd0dqConCaH4Yb1ifO46eFEKkrSkz7cvCTICAA7P8nJyqA
TP5BzCpGVfuysdwQxGS2Aj2lT33aS4PYDk2I5TjGO2I5o+sjzrVkFpfwgXvQU78T
hoO50R4S65e1KvP0fIkzsHu6YExtIEJkY9hdJZ26S/y2Mu9Qt0kNFlvhS2WEyxUM
+fk+i8EwSEoolILjG1H12pHEOYFkhWom3Cw+jX7NbKKBjYNVUQNExtnpPUv9onU/
sMdAqpufucEOL9CcdHzNj8Xx9FRZt1UDDTms1M/clFRx5CzPdG5MWBy73QSSdmzZ
ZMtAiZNBLX46LTfjhFmYP/dkRUk10hwnEjA8DMqGmkkI9qjIwMYcG1c185sjMp+i
tdZdVMpexstTQutlsC++c+VGrcRvMReoJHQyTw5wNfw9N3eHnVX3qIbXdVMzF0sV
y2Hpa8PMDFHo3TeK1VxUjJy7AOXYVB1ZYwWfIEy02QKs9sMN7pQ=
=qLkD
-----END PGP SIGNATURE-----

--vu8MTP2ik1rVZ2XY--

