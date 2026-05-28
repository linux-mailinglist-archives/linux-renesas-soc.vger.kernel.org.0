Return-Path: <linux-renesas-soc+bounces-33308-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHlXC1O5GGptmggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33308-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 23:53:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC285FA92A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 23:53:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A798D3065EB2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 21:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 440F936680F;
	Thu, 28 May 2026 21:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="F1rHcz29"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA19D366557
	for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 21:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780005136; cv=none; b=Yd6oq4s+tAyOfNk114SS97TLFQ9X6UVAOYSFYoHXmupp6sIc4GZuJkETDDt7+KFWCcRZOGrcE0SOLWcWExUQ6a199anHXBRyVyJ09KMEGGKHPzUXQYO1oQ4zd7ajJthmCoI7vzOgbrR1EqXGWaPgPEpARhf5OfUwl1K8riArHvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780005136; c=relaxed/simple;
	bh=2F+j0yjjKa5C9dAP9Ns0/QJnSc6q89Sh7XgQRq3vbww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1yyoVGjdgX81hXUyybjmvJCjBCdg6lv8RW4F38e0Qk+9aOcnzafA08Uo31s1tlQ8Oe4+Qt7UfYN+BGxBOvG1uzM7Y43tUUgNEwX48By73rNcU2aJ1jXCMMTV9PDQG0rpRII16KfYz8sZ9ZpxWkeqKe6la8uPfhIUoFMn8mISdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=F1rHcz29; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=2F+j
	0yjjKa5C9dAP9Ns0/QJnSc6q89Sh7XgQRq3vbww=; b=F1rHcz29bQNGYtLUU4lT
	CH3IFtUzM7T/h5JZmpj4vBYIF+5wVc7NQ+Dg3STPX2RJVhLMb2vmRcEwrhAlcS8T
	8xzGdAo102gJvkZqrdoINUyI9SuAHk7CSG80WNhneOE4ooB9aHHFh9igkhuZWmJK
	hzzX/dikz6risLe/Lej8yufsD1XnyvigrMR9nMjkYmhdFI0bop5VlrtkJ0mLdb0f
	D8TqRY+19k+okPoJnJm3D+KOixDgB+VaIP/G+PCKgbmi6lHokm6a85nJ+HdTouJX
	xjZmLoQlvokF6T/W7FX5ZEQATOEbkrPZg9c8hEdZ+PC8c9AlywOBHDU4zmsnojX+
	ew==
Received: (qmail 1173576 invoked from network); 28 May 2026 23:52:09 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 May 2026 23:52:09 +0200
X-UD-Smtp-Session: l3s3148p1@3upmvedS35eSAB9x
Date: Thu, 28 May 2026 23:52:08 +0200
From: Wolfram Sang <wsa@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org,
	claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] i2c: riic: Abort the transfer on completion timeout
Message-ID: <ahi5CC7t_Im4pWfT@shikoro>
References: <20260520131206.932050-1-claudiu.beznea@kernel.org>
 <20260520131206.932050-2-claudiu.beznea@kernel.org>
 <ahhJtz7QG3IxQA0G@shikoro>
 <88d1db83-1127-462f-9b1a-7c18a7087960@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nRsRy12VV0keRsmN"
Content-Disposition: inline
In-Reply-To: <88d1db83-1127-462f-9b1a-7c18a7087960@kernel.org>
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33308-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 9EC285FA92A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--nRsRy12VV0keRsmN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I haven't managed to reproduce it on i2c. I reproduced a similar behavior
> while working on renesas-i3c driver and decided to implement this on this
> i2c driver as well.

I think the issue is real, but I am not convinced the solution is
complete without a verified testcase.

Maybe it is not too hard to test: you could hack the timeout to be lower
and then write a block of data to an EEPROM. Its erase cycle can trigger
the timeout then...


--nRsRy12VV0keRsmN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoYuQQACgkQFA3kzBSg
Kbbkyw/+IcsUjXR8Y/aSpYuTetobIhIAoTvQ6GoX82xQ3c2ywJ1U5moJxEjDTI29
3N/VUrlzRfr09MeQ1PZLTtiu54mwxQNWRgenRZaNoK4Vtq0M8WjH+TXjSO3omiBc
SOkPSek2kNOwHOmQI3s0nT4obabCq6ZezOmgXzkcoyACHr9fO7San5h5x9var8Y4
9NyJS9F39fgRLhTTdSr85fAAh1iz0czTooirvNnSqOHb9DpJyDYim2d0cZMWBqMC
pERCqIjfznvU5MQNjtLGPePo5XkHwTtU2sZ2F6doWNWbHORKPQuKDX+iZi++Rr2f
cevfh+fQaWgNtdI5i1eru4L8tWPdU6kUq1bUYuO4ym2AY1byk5W4BXTcYoCC2/Nt
qiBPPd5ez4jYFH0KEYstHHOjtyCJ1AV89X02Ux9Z43Jplgytv7Ky5CZ72D/LnCCo
77cgZjT1ffjnC3elKuOBBfhr4v7fup+dJ1W9LEris96xssV6LCDqzUVWY/fDSdDU
aFHUHR4sq24B2G6JDWLhxmTK43S8Rqskj57Y9OvwC7yWVLb8pKv6r+YqphCcEEts
rHkzATd2ovPaNvXPLFJATa1jkJAQDCW//rEM7/zREBZ09dA4s9AplWEB+JTljgsj
ECxpZ6eNUiRrdLQUirkFnicGwqVbqlKAkeyjlP9+1gUw8ALDgWU=
=qRLb
-----END PGP SIGNATURE-----

--nRsRy12VV0keRsmN--

