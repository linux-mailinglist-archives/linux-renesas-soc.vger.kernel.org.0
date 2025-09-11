Return-Path: <linux-renesas-soc+bounces-21754-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED844B529C5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 09:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A630D580160
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 07:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9CFF26A0B3;
	Thu, 11 Sep 2025 07:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="AuTW9KW+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C433E266B6B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Sep 2025 07:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757575374; cv=none; b=cDMwEKSOToGi28zAWTSDecpAZR18TJJ9pjGi/GcrXKMB50p0oLKU8kqT2z04Mk2WOzoU5cwtZgGEix3RLS1Wg5/B/RzsMEa5i50dIHRnbEqXcv0FkCBPw5Qy2BCsjPaXLMuIlKbHKd8+G7qGkX3zDKxBhFomD2LfQZVCgUEpoKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757575374; c=relaxed/simple;
	bh=NHyOmU0yD9kwK6z7img4IS1VLrA1y4xR/AWChr8PwWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ke9hFJHm68IXNV8M/Tyh33wTvOGb1ZTrJMPyOWJryvnh49su8l5qaW5OVYJgmqe0P5OoqgrU/qZ/kcKw4ZARfkhTZeCqDi6k+atEhY3NsZVYf7DPDKEvKzuQcfHQqDc/3JEXuQIixvAhJ5j+t4dS1HPWxoE8hal2e/zwyIw8gAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AuTW9KW+; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=NHyO
	mU0yD9kwK6z7img4IS1VLrA1y4xR/AWChr8PwWk=; b=AuTW9KW+rjtBJlcNB9Sp
	9tcCfLQxpnjpB8169qRjQE5UNpCdCZBeHMzkoBLi9N0cnjQoGR5ZLYptliBrY8fc
	Mq9arakGRZTaCy2Z8d4vWlkZfzedPS4nqLs8b2hPcXuwXNq6tkvBREv8JEakBmMV
	RwiQf+Gu43lk3/u0Snq3f6BD4lxlktqpfO2cMy17rcjjKUNzcFdZDVOGAfbPetNs
	7JL0SfXsZJ13TMCgAgw3NQagFgyW7od3mk4ZYCZHltSXYpA4m9fDIAlQSPLQTCjl
	bXHykK9CcGM9i5DlBCVgdhDdsiTngEAsygQFaY5lYfntfLEhfQ28zTgCPNyyqTo5
	wg==
Received: (qmail 883424 invoked from network); 11 Sep 2025 09:22:49 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Sep 2025 09:22:49 +0200
X-UD-Smtp-Session: l3s3148p1@yGCTZ4E+nosgAwDPXyerAKQ7QDbxBzog
Date: Thu, 11 Sep 2025 09:22:49 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: renesas: rzg3s-smarc-som: Enable I3C
Message-ID: <aMJ4ySzK0Qr5l3BF@shikoro>
References: <20250807151434.5241-6-wsa+renesas@sang-engineering.com>
 <20250807151434.5241-9-wsa+renesas@sang-engineering.com>
 <7737de72-701a-43ce-88a4-90d2d17c48f8@tuxon.dev>
 <aJcSOlS1kfem0Bd2@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XIS55XHH93jbeXWf"
Content-Disposition: inline
In-Reply-To: <aJcSOlS1kfem0Bd2@shikoro>


--XIS55XHH93jbeXWf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I assumed the firmware is setting that bit. Never checked, though, and
> can't do before end of August.

Point taken. It seems I need to handle the registers you mentioned.
Thanks for the heads up!


--XIS55XHH93jbeXWf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjCeMUACgkQFA3kzBSg
KbZukQ//TmG+S6e+XzFirwQ68dTm672apKkHAJX14lfu/Qo28qUnX/y5v5dALuGG
U0NNQ4WwKtr4yGPHg8dgwCVdzJYCUA3XxxNaSck9ve+cTR3YSIXnqK7DpI+JNeDa
MQBPLLw3S8YwSGayAswIH1XeVlkywonLqii0VP2lg97XyQwwfckQ2cSTw577ixhw
+3+vMkZ9eGNqydMQPbDs350mfTi8JQ6Zh0m/SHEddXPAuTTKqaKnf7Q16CEi1hXx
I811+L8jp2vp5xHrQbxzp5AceflPPZ+mArIy0AhDoOaJEUAGZd1tuT8P6AxKJz5A
H18juCAmNyoh56/FWgb3x7TdcmES9rs7rQ7GZegmeHfLulAFFvoUPehAsPoXoX+Q
sToBi8qZRgiu97h2BtJnSa0rM1PonACeZXWhdPqTSJc6tPGy7n/+gnLLU95NZ2vA
TA9f4BF3JQZ2ygYrtupuUtExLbHsBJhOVUPWFyOMs/c51Ll2m/f1EcUK8L8wEGVH
1coItyBToe+wjRjgvDvgWLw1MsTNg6uywCZ2uxmDj9DZMj0OeIl1A9RW3yRufGX2
i24TJx+aHhTyP/ZXpOQ2cCPA/uRUQpDK9UhJq4XL8WbzznZZyk4KSy+9l6BYFJmJ
4tpqKcT8LJ1bSyKMcbYMU9sones5Gx/XLA223PNPsmD9E+l+Btw=
=/EfS
-----END PGP SIGNATURE-----

--XIS55XHH93jbeXWf--

