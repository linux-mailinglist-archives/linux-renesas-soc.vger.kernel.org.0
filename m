Return-Path: <linux-renesas-soc+bounces-33309-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIKWL1S5GGptmggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33309-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 23:53:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7265FA931
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 23:53:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9FAF6300B9E4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 21:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F4A3644A4;
	Thu, 28 May 2026 21:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CXhk+AOq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F31D3546FC
	for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 21:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780005151; cv=none; b=nhmn3sbZT8lsGnUIse8VFVwnyQn1DOUYJcVVtsOFOOYg83aZBUGncbpCB5lH/cyVrYfjqWK+xNtoDFfBEGW03Bue6JykrtC/NRabX4OYWlCGTS96G68XCNEYOaJp5D3UbI87AO0Pp5EfiYdIwGSfRx/jOxUuPynQp8T137+EjFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780005151; c=relaxed/simple;
	bh=0kocouIsTqR/X9Nhyn11zJ/CNbC+OlW/x8VltSjYfzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g/yY17HVK3VHZnVJ5QFwhoVkHKIhuCnfd7aXelnFhQACrVuVeeOTzezO60184CsNZhzUgtH1gaqhWEYDZcfBLbOYe67/FKNr84JN+uHXqNFXt4jUHOb8RWaWkel6rhEjynaXmL5SEdHWcY21Xt2dQiM7F58eDuxC5PNHrUlUmiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CXhk+AOq; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=0koc
	ouIsTqR/X9Nhyn11zJ/CNbC+OlW/x8VltSjYfzE=; b=CXhk+AOqvFVpZdio+qgL
	mokNRxBmBLn889y70Nib7sH++vIBa763rs5ESCRoNcvdOaFRJKmEye3lPOsVKzPv
	mrbpBDfFJiq7nCbTMCBRg/V92U1GxVMJ448aOU7qVxKPR2/YCguWI4VgjhfUjbj/
	XP6qq1RXBfGVNQuvbVEkSwAkKJtDrAfUqM1ZyPHpqTr/5rxe/iITD1B7Sn0sX+HP
	F4Fwlz+B+Onj7vGaWAYVhN9ipbANmWrZqojprq/8Xq7k0DXzgNy3lbazjhpvvyde
	W+nqwmopCyfeYdN7ch2fWIj0eZW1sJtM0OWUNdSNG+4DijOCw16wIJf6NbudFws7
	Dw==
Received: (qmail 1173724 invoked from network); 28 May 2026 23:52:28 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 May 2026 23:52:28 +0200
X-UD-Smtp-Session: l3s3148p1@VtqKvudS4ZeSAB9x
Date: Thu, 28 May 2026 23:52:27 +0200
From: Wolfram Sang <wsa@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org,
	claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] i2c: riic: Drop the space in front of the "out" goto
 label
Message-ID: <ahi5G6hs9qWVk76R@shikoro>
References: <20260520131206.932050-1-claudiu.beznea@kernel.org>
 <20260520131206.932050-4-claudiu.beznea@kernel.org>
 <ahhMX0hdr43K9eLa@shikoro>
 <5d322a10-12ee-4157-872f-c549762b0f7d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ux8waDd5+FFR1vWm"
Content-Disposition: inline
In-Reply-To: <5d322a10-12ee-4157-872f-c549762b0f7d@kernel.org>
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33309-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8A7265FA931
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--Ux8waDd5+FFR1vWm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> OK, I wasn't aware of this. Should we align the other goto label to this,
> for consistency?

Can do.


--Ux8waDd5+FFR1vWm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoYuRsACgkQFA3kzBSg
KbbkXRAAlccH9R3MaJ7T8V/MWMts6ZQGD5iP60oL22nRT56hjC9nupbTuK2yeLjJ
EdzSX+TjpKSmtczOffRLoetZZhWuUwUWjJvqmpI7zRxYXlqOHRLwMQFuA8UfXSY5
gOQet3WynB8K9qt7DzLbtWZ38cWqZEO+4obWOVzwPq4WzEyak7PRw3V0/UDjObXV
BqWFLjyblIALbbCvIely4yVVju8d1pkMmbm/6nBoReqM5jwYHPA3IPh8ESYCZgJm
xDbz3kOD0AnlC2oRwARW9/Urt4RcAylDf56xefSuLLooCkWRd3btHsTbo0tQSr4G
8n6D1mibuT72d095xYm81BUyF4eqKszwSd7aRRnQlaZp/odJVOStw6m0yJC9xYlT
Rw8g1UY7/6I2z4Z3rwzBUIh0q0z1Hz3AokxTBQhQy92Lbxe3ZqnvoIyzQqy1ZHpR
jZ8szpJ5rJG8JgYt7j3datjimtkIFQZ1ouRpluzhcUbX7vZZeE7thdcZknwu+Fgg
AuFottRimoLpGezX2XaiLmwo+IxwhE/HKjRs5fVezL6jWDa1nuV6P8Nys00l8gMv
Hbj4m8dOEo+OdddjL8x3xvt1VwVm2y4SqWzBBGAkuFT7tuz1TBiDDoKhTplivKam
f+iVq8xpW06uOBVF89gCAptaBoCnkG/zqPkt0z//v4MTLo+TFXo=
=Ipur
-----END PGP SIGNATURE-----

--Ux8waDd5+FFR1vWm--

