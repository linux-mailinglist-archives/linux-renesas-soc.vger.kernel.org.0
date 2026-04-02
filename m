Return-Path: <linux-renesas-soc+bounces-30759-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIeSGNKCzmmUoAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30759-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 16:53:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0514F38AD96
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 16:53:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3C078301C042
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 14:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5036D32E6BD;
	Thu,  2 Apr 2026 14:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZM6RUddz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4873EE1EC
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Apr 2026 14:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775141584; cv=none; b=TbM5N/9BWs9e32Ss+AYzCgH6rr88/CsP4FCC5/i9ZzCI/0mCYFJ42rQcN6pYXjqggaHVcfIgGducB4KfxUMdO17jAf8AO+9hldnGRaeg5B3g4ITgQeH/K4lBxfqxV1fkA1Zt7/6bp8DIYn6iCSyqI7DIy0W564I6KISUEG0XNBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775141584; c=relaxed/simple;
	bh=Rrlj+jv0dYusYMqV/Gk1346M6zmQ4iEIcTFJGDNeEcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n/kS6EMS5t08V+Z2MVSQ1Nttpxl7LmwywbHPqHckH+rS06KP1HRF8DQTaax9mPTkGnvdXX4Y/pZHwoQTRTIXytILo9Jp0rjtwmvgN4NpAyjonQ8cBu5uW3qY1dyioAM3fVwC3L6CNZ7Qfk2aRcD/APKf6CFlwdtT4Dbcmz6XB+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZM6RUddz; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Rrlj
	+jv0dYusYMqV/Gk1346M6zmQ4iEIcTFJGDNeEcM=; b=ZM6RUddzmn6xrerW8+4n
	xSJFNeIo0QTmVoY3qYtd5nvDWgiTpXSyiFtGZhvURYzNnZS6RByGk8bGnwxHYO4H
	cA6Gc4kiuccak9sYUnEAaItfoB/sNCIJDQ7z5LZw0YdRnx73n+pRP/3Vbr8WfFqt
	jT510PL2j/FT1BJuIPPgyqHAQs01s20xnEnjGIzkCoB6pkS8PGn0aEqcubpLf9c5
	prMgBhOaeOL/7BsfW6di9EMrqeFG0xwfiuNxg2f2aQ4Y/JuKJmDrYxQ8pouf1p10
	im5kIPyGJeB9LxkKRYyYTV8gMXinZSFwnZMmMb3VnTWzV5IAQO9Cx55YWa5n/8T6
	PA==
Received: (qmail 2544522 invoked from network); 2 Apr 2026 16:52:56 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Apr 2026 16:52:56 +0200
X-UD-Smtp-Session: l3s3148p1@wSgVW3tOoa5UhsJN
Date: Thu, 2 Apr 2026 16:52:55 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [RFC PATCH] dt-bindings: incomplete-devices: allow additional
 properties
Message-ID: <ac6Cx9t7AKShRIWY@shikoro>
References: <20260402123444.14177-2-wsa+renesas@sang-engineering.com>
 <c2095c20-834d-4f52-aa82-07f0cd6fb228@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oiEgiLf5RpMBkNh/"
Content-Disposition: inline
In-Reply-To: <c2095c20-834d-4f52-aa82-07f0cd6fb228@kernel.org>
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-30759-lists,linux-renesas-soc=lfdr.de,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sang-engineering.com:dkim]
X-Rspamd-Queue-Id: 0514F38AD96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--oiEgiLf5RpMBkNh/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> This solves nothing - the entire point is to have warning for
> 'broken-usage-of-incorrect-compatible'.

Ok, this answers my question. Thanks!


--oiEgiLf5RpMBkNh/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmnOgsMACgkQFA3kzBSg
Kba8Bg/9FhSl8BuQxJj9LsGIdkzOgo1EcSO+VDnT9ZHm8IJGa0UzsfCk2wb+ApWa
FVtyCkmDHUwsYnducuqjQ4gTR0wcLIvfMqLtsDNnYnoZ7AsoWqvRbVeXLcxGedOj
Qzn6gfwHifKKYkQDXql4AbF/0z3N/hnZF0lIVaFCOkSRFU1U2+VykTaHOaHI7iy8
eerbHoFKeCEhmZKlDJCpwVTuLS7TWupXNrdntX/98KsBIiLJmGZUlnNzVGhvWj0D
StllQmMveC7v6IR48cFvFzZJo4WfDBdFb7W2K8oUDLGAmwaPHg058lun6vMjiIku
JsskUngUncqOwd44gKWjQevN9DMRQYpnOt8D/qdHR4TcYmnD3hgZqFaSyLmZSAiO
lxS7H/H8NGgmeYev5Yw7mbiP6Wlvi2RNTl5lWPCzS/RGqfwKvRe73Bui4ubsKlvs
iUcsFG0bOGsWj5vyFp5uZSz1pMX7VdB4pigsRwkmk4a8UO7cLvC7StJksNdGZiuo
fwgEWR75pZNVHi9slLDVf+SCXdY7lD+f6TW6OxrO8FJUMc3rFeinNf6Sp2XCNzRm
fchXrbkRY9r+6KRs8hVr6t0vTt5Q77IyLWuil9higH5tc/6GDrifGVjDVclIvbvu
fk7rpm0Yg9/LrIi31/bMvq9FjtrrWFLIw5bt/urU3gFd6EB5xaY=
=9NZf
-----END PGP SIGNATURE-----

--oiEgiLf5RpMBkNh/--

