Return-Path: <linux-renesas-soc+bounces-10130-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9A79AFEAC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 11:45:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAAA21C21702
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 09:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1CEC1DB356;
	Fri, 25 Oct 2024 09:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="H18zrlnn";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="F3F5yYkE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D411D4350;
	Fri, 25 Oct 2024 09:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729849476; cv=none; b=InK9H2FRNX8Ozs/GKwLFk/cEDCmTdZCeX4DlPjX30WTK+5BcHfM1rJ6uh8s2ZfNsiAcQyo2SgneAQ83agSx+dHTpgEdNStdXqDvrLnAlaAWcmZS7mCoaXUwo/Sk6YORLqriLJzGrDn/ynjWDD+Hi7vkNRH95zEe9v7m7MUYR13o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729849476; c=relaxed/simple;
	bh=nUgI+KAw1OCK1FlS4+823m7SpvqpbidXV4y4blyHU/0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZoHIc5sN8XdL4FdG6NVbqmL+SxA7L2I3448goW8GYSlz9Z2SsouOlSgZgfpmUZFWbdiJuH79I07OD1NKKQ9kjk//tzfrxhu2YZpGjDnY//xinlH7MoD7VhEkSo/r9AcbO9bI7iryslkAqkve1VJ9BAP1F/p2a3YCGM8mSaqhSKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=H18zrlnn; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=F3F5yYkE; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1729849471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nUgI+KAw1OCK1FlS4+823m7SpvqpbidXV4y4blyHU/0=;
	b=H18zrlnnzpvYcwzsURWB6lTCIfb2z6h1opcqYO+/p4MP/iBtPwaKKpnKXK6C64c8JIofNZ
	MCXgGdX6ip6jfPmGIyG9NpDkWWgzwmlYmaqTqrtuKEtGCsYYo8CoMIGwb3g7k+IrMhxRcQ
	Ex+HUUdoEQEQ6V9Aw5r9pzz0wHOcDSREVF+2XFEKL7cR9ukv7Foql91dgEssLeRuTGJzok
	jI8dzF/qRXkUMAqwwD6nZBzqMLBqhQn3i170k7ec8gsqe04Ls1RPSFCHFFE/+PHKGzrGJ1
	t8tB70kW8O0eeSPDyLhwf1B7d8ixwYzpX92EI+ad9SGA1/SDue2fUMBRUdHw3g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1729849471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nUgI+KAw1OCK1FlS4+823m7SpvqpbidXV4y4blyHU/0=;
	b=F3F5yYkEAS0ullAJeSkBsJ0AQfFUszH4ZeIZcnoqfXYOjexMm7AaOvnNk65zavjrEiiCK7
	4f2k1XrqXl7ePcAw==
To: Rosen Penev <rosenp@gmail.com>, netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Andrew Lunn
 <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Woojung Huh
 <woojung.huh@microchip.com>, "maintainer:MICROCHIP KSZ SERIES ETHERNET
 SWITCH DRIVER" <UNGLinuxDriver@microchip.com>, =?utf-8?Q?Cl=C3=A9ment_L?=
 =?utf-8?Q?=C3=A9ger?=
 <clement.leger@bootlin.com>, George McCollister
 <george.mccollister@gmail.com>, Simon Horman <horms@kernel.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:RENESAS RZ/N1 A5PSW SWITCH
 DRIVER" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCHv3 net-next] net: dsa: use ethtool string helpers
In-Reply-To: <20241024195238.176131-1-rosenp@gmail.com>
References: <20241024195238.176131-1-rosenp@gmail.com>
Date: Fri, 25 Oct 2024 11:44:29 +0200
Message-ID: <87wmhwpldu.fsf@kurt.kurt.home>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

On Thu Oct 24 2024, Rosen Penev wrote:
> These are the preferred way to copy ethtool strings.
>
> Avoids incrementing pointers all over the place.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> Reviewed-by: Kurt Kanzenbach <kurt@linutronix.de>

I've only reviewed the hellcreek driver, not the other ones. Please, add
this to the reviewed by tag.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmcbaH0THGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzgvwdD/0bEdNauUSPWGAi7KZzkRxLK6A8tTek
U36iKiZK7iVuq1064RqP45uejZki1d2WPIuFZt+Sp33SDwW3jsoybsw912pW0y4r
ENl8z8rWSg6zYvW+7w3liv3ZEVAm6DzjOyqPrqPIDQG2OS03erATXsoj9z4RUdg5
lA7pz4WBYyzIiBSwLlM4DSJWj/T0S6L4jOEWaHwBsk7awBf/XXQnpfnm5GttR/vC
fHnQvZwJw0KCNt020jaYueER5v9mmvvYnOBahh25iDr+Bk6qMcQ/g2s0cLO+HUz9
zNST5Gb9iN+922BXmrhk2deF2dvOr6EtBc7u6qUOJotcM5eLN4qmdC4viDVc1dB2
lM3KnXhryIfHb9Xds8QeOx4lrhGNdRFP2er6ar8+NqVd0yFGBt5+3jv/SRXnuBl9
1XAQ73nLxJ55jDfGRsCJBZtTmbtUyDIKe7dbZv4Zu/QfUuQfGhHDihcfP5nlJo5P
kVbi5e1SjLONv1OddiyyBk//+TXvbVHqqlYf/Xzj60VjOix70WLeawZ7whLuBybS
dCowA/6Rfo/J9s3QqNLCcLoNQD4gEV6/MrlQjopW9CHH+CT23ewnwOo8IzIm5K8w
jKDk8lVkYXTzOjtoUw00qQNueUuGLHmYvr7yxJUcHp15fY0Q1sc9lyTRRlAZ4T0r
SFRrj367zJvf5g==
=dcMD
-----END PGP SIGNATURE-----
--=-=-=--

