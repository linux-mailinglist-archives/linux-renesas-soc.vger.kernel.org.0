Return-Path: <linux-renesas-soc+bounces-5395-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1C98C8935
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 May 2024 17:19:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0A6E1F249F9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 May 2024 15:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22BC612C7E1;
	Fri, 17 May 2024 15:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FJESDPlY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549F512D201
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 May 2024 15:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715959125; cv=none; b=lr7yJodKwXaI+fiW4Gf5k46Vv7BXUZZKE9IT2aYv0W/xDFdfdrx9cxH9hPwt6VP2z8Se2P4xeZkdot/QgagpWgZn1CDYpPCkaRMdDY6n4nb86LH6DeKZtptAZ9RNn4b7ecYmyuyGbJi88CNKJaGWJhvninwEsu6FFhnOcCF9hIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715959125; c=relaxed/simple;
	bh=i7phWkthwIF/ZdNaZR82d5fiTaYr0kEwGwEeAJbEAho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PlD9o3sG19ivZTs0F4kdpfPzhXF7VCEIoNYE0x5mUjodEqmBqHXiDnamfX7yAKv8VGAmSfPiYQBpnEsSOXgV2ry02A/nonxNUb+FKAvwEb4+E6EzrVPLfF1SXPxecEI6VvA2aImT82Dp2/Gpw3h/kQNevy73mYIOLop3XHVieV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FJESDPlY; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=G5EH
	md2Tx1KsWrg0RZajljlVAsNIwv4fGXJdBf9hV48=; b=FJESDPlYmOd3U9fn4ihh
	PRa9/ly75+F9+6Xlvgk29GrXFJS8E6W7Cy4FAc0fiCK3C36FBcDzwKGZJXx0WuG1
	7vF/gbZa59EwZQ3ZCvMzLtmQSvQgG92Ogf8UEzkYsPHdQ8ZuGsHIXxzAkhTiW8po
	AsFcRob/SeZ9wp/81eo3RBSjjIQ8eypJrdElwk4mgo0KaQAtbLZTaL6/XXTF3B+2
	ST4Eg10RzGatPNTUaAbglnmT1Dgq2vWeyIU40Xsvs/Lr87vvxy0IMmKTqj0a/DyQ
	zCt8sEcyYFMFXhukhJXxfbrf3hxC970v7GfrnDHiZB3pzMdBlgfGWTf4FeIuKDuS
	Lw==
Received: (qmail 3535469 invoked from network); 17 May 2024 17:18:41 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 May 2024 17:18:41 +0200
X-UD-Smtp-Session: l3s3148p1@gonb3acY4o9ehhtP
Date: Fri, 17 May 2024 17:18:40 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC 0/4] *arm64: Add CAN-FD support for R-Car V4M and
 Gray Hawk Single
Message-ID: <r74ymblr7f7ruwjzo3dfnr5y7xu3z3nf3e4esadicixdiexxf3@ycwbwxdskzzc>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org
References: <cover.1715956819.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ma3igmnyldzwptvv"
Content-Disposition: inline
In-Reply-To: <cover.1715956819.git.geert+renesas@glider.be>


--ma3igmnyldzwptvv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

> The CAN-FD module on R-Car V4M is very similar to the one on R-Car V4H,
> but differ in some hardware parameters, as reflected by the Parameter
> Status Information part of the Global IP Version Register.  However,
> none of this parameterization should have any impact on the driver, as
> the driver does not access any register that is impacted by the
> parameterization (except for the number of channels).

Does the BSP work?

Happy hacking,

   Wolfram


--ma3igmnyldzwptvv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZHdUwACgkQFA3kzBSg
Kbb4Tg//QMO/uKc9+aKSuEpcQSaZzBUPspX3oTkYKvjwL1AZWuiKTMzfyBI7TJTv
gPzPV3TYpnTS7tPkvQMDnjYMfwRZLdFeADPuEvTh4VbaNzNHpJCT0aId4BXXMRl7
ajxu81ig0p+lVl/80PN0vVjwNhEX6KmmvXKhY3J2khChnS+ftSRfXUb3PRFYbZwJ
3LybYkjEmoEJy6boflyU1QAwBspFG3LqEgTL0Qgdkl/3ZvO6FFjTcqvmKl0yxreQ
KqNjrwbRq+e45d44esflqd7p/qoNPM7K5qkdviP9Nol+Yj2x6xg44cbp6wLCdLkR
2PVl/uEXwci0JM/rZgIUAu2XakAT4gsZuTkYfERsyyUnM+aYXiL9q2JDF12XLv0D
dsAw0x1oabkY3I+CTnk5tdq1M5bDjK9PBgFRQw/Gvf+gB2PnuzerNc1hW5QZHkP+
ygDmVyHZFN/47Tjd143GGb9krElq5FoZ+KaEiu1WnkuI1gw3WBRJlmjuVT5vZ772
6xq9qNbxkxpnVefPHL6mohohizPALcv23Evnpjs9ORL/ZZ81F0lgThqKw2bUTnAu
aq+nBtG8s7UgwoP7Re56/Ppsp8OHDirYJI3AUXP42yltE0D8PTfYF8UJhAoK5W0g
wm6r4kppkuA26If6/TPcoUvFh/svUCewM49JzivPKTB20c7yyZg=
=wDW0
-----END PGP SIGNATURE-----

--ma3igmnyldzwptvv--

