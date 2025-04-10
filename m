Return-Path: <linux-renesas-soc+bounces-15795-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D12A84DCF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 22:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AFC6175513
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 20:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 154F0290081;
	Thu, 10 Apr 2025 20:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="i6LNsZQ/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC92119DF99
	for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Apr 2025 20:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744315541; cv=none; b=BBCEjQOy3o7UgGqWW77Dqpuyt4FXG6fAQb0M2hbQIGjB6AzGVPzTVfI9ixWtWRFkxkY6MoWz0QsSd3GnEE7U/OslVnMQKx+dlzs0+pc5t95/3nmvIr99mYc/KkLe/xM1yI7qR6Zk6MIC0xwel8Mrl4bkoj89GHfRENMDURUdh30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744315541; c=relaxed/simple;
	bh=+Zmol42jS8R3Khcnyl9L1BbLCQN8pRU8TO9IhC81GR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Neg73zideimUnmccroTj3NhAgzWsMf6uXkRH4TEo1q7nagMQDXofNdUizYq9pzz8QZajkBYNCN379ysn5xmFdlg953F7q6eG2QzCkA6N9TpNuV7Mum8A+jamFcxfa8Qi2y2M6H0RZOJDybNuDeVzJYBh/iLtdhq9nm5JTylGIzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=i6LNsZQ/; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=+Zmo
	l42jS8R3Khcnyl9L1BbLCQN8pRU8TO9IhC81GR4=; b=i6LNsZQ/NMGzGWf3q+4R
	mn7e+uOxw9QRcOroxtls31dtP2MBvF9gfpEvewSnoG1quuG5B7fnFEWtrYLBiAv5
	7k3hxJwufookVkqHdpYXRUhl29p6Eyz4/OXGVzC+Xhj56Z+5CWAd6S5w3D1H7jVQ
	vgdE33uLGd1RLScLDRoH4fZyBAwP7pZ9crGou2IUXJCnvOTOfeqKhq5rGcf4Mp0B
	7zzb5BriqgaDzD47y5ezO18ZKJGWAXiLWFkAE9R8zHrkZzYI2Im+Imr0GLKD8DCy
	+PRCMVg8g++PDSEBJ6dAx0PA86WLcYiZh0JY3nmL2/x6TgYhJVQqSnqGg/Cj0BPz
	Ug==
Received: (qmail 1028174 invoked from network); 10 Apr 2025 22:05:33 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Apr 2025 22:05:33 +0200
X-UD-Smtp-Session: l3s3148p1@fzC9G3IyDIoujnsS
Date: Thu, 10 Apr 2025 22:05:32 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-renesas-soc@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Subject: Re: [RFC PATCH net-next] net: phy: marvell: support DT
 configurations with only two LEDs
Message-ID: <Z_gkjKharPsRhT6J@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andrew Lunn <andrew@lunn.ch>, linux-renesas-soc@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
References: <20250408063136.5463-2-wsa+renesas@sang-engineering.com>
 <7f706127-aa48-4385-a7b8-f016e0ba52b7@lunn.ch>
 <Z_YZ3NiXb15wgDuY@shikoro>
 <0fe35fe3-b63c-478b-9674-a2522f582167@lunn.ch>
 <Z_d2CgxLKaEV3w8X@shikoro>
 <1cb6ec18-9abb-48d9-b9a2-ca79584d4d0d@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Cy7fRQovuYQk0d7r"
Content-Disposition: inline
In-Reply-To: <1cb6ec18-9abb-48d9-b9a2-ca79584d4d0d@lunn.ch>


--Cy7fRQovuYQk0d7r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > The 'link_*' files appeared, 'device_name' and 'offloaded' have the
> > expected values. But now the LED is blinking like crazy despite all the
> > rx/tx/whatnot triggers still set to 0.
>=20
> So that is odd. If offloaded indicates the hardware is doing the
> blinking, that means we have a problem with the PHY configuration.
> What model of Marvell PHY is it? There are some differences between
> the models.

Thank you for the detailed explanations. I think they could be a basis
for a documentation file.

My PHY is a M88E1510. This is why changing its init to
MII_88E1510_PHY_LED0_LINK_LED1_ACTIVE helps.


--Cy7fRQovuYQk0d7r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf4JIkACgkQFA3kzBSg
KbZtdg/9HZW8J7RAElNaMj+1BrKb/KB4Cu0o1eFNa71km5gB2jUZ8NcmF7hgGgCT
kBaJogfXBRBeMYjJzKNOBvoAiVXgKkcjU1NUpw74P1qS2PVgfXjVw0phwvJA6j5k
ukL49LBCe4NehKw+kn+e7Iw+2VWGcmHcuRXvOJXTB1j9OExjCSasysxjZnM9wKrb
N8BwGetguhUvJj6Bw5viOTKFZ2xDXBA29pSTrNRVHIM8fyiyhD4ZVsme5I1Gx1Fb
eSJsKzgjiRSQUrL5P5xKuukwacuWsW7fTXkq9xkBHhPq6zHJAW0RHQ/ZHZ4wuoze
WUHLkstUdT4uIfsliDgrxfK2cGIazSA1OisFCIKGwPJoN4zKt0EPctSzl/zFCchg
3MrpkKolzNQEEbD+7prr7yTesbaBcgOEMqLGxukEgsCTNenHATMEuZojGGX3AQwt
CDEwdrNtZ+EyrhUOu/6wXgeWeYuIQbMrUNoWR8MwcVW7NwsWPh4oTnGvkSo7jgYZ
AUNEZA8BqwafrDQcTpSbeEKY2g2BqrSZcxsQZzQivBBSv8DxViUVK6MctNYPqZcv
eggVaic2rx+MOrkhKf8tx3hLy6XfZ5Gt3lFuRv3NkpJaTptuTsA5lQg5U0OfmD8l
Jazbb/+EHkVHwslqb5k85629cprpoVOZHZ99qy9rEd4QMBTlGU4=
=HLvt
-----END PGP SIGNATURE-----

--Cy7fRQovuYQk0d7r--

