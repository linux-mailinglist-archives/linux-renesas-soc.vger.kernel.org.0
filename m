Return-Path: <linux-renesas-soc+bounces-16173-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3EBA93DF9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 20:51:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B49C51B67416
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 18:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F6A522D4FD;
	Fri, 18 Apr 2025 18:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="laDqaqR1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D08139579
	for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Apr 2025 18:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745002227; cv=none; b=Y+JW0TqHwUc5PdPqS3JcLBgBauQ/deUQq9Ou6G30KXPf8vkR6tGk7FynTT/q8yR+bCX51RWhDLPINVWUgqf7s0Ta3mtQkDSqVdf316yK1MB4KLJwDfJ+QTY8GVds8HSHSlS6zm+MaU3wYIdJGIp9fnSZNFQqP6eP05Qcy8lVUoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745002227; c=relaxed/simple;
	bh=vZL3hJyh6vFF/o6xtjG6d/xD0EdW0x3J5+2caPucxzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TRXIRz0PCew6QF6J90jJ3hwL0xlvA8sdL3NABkDVYEpJDMGED6vXVt1mrDI++aBZfLZtIZYV+pEUGiFZPaIkXkQ6VKrxiX92HmYtspmiP7yARAs00UjC5bJTaf06k2//aogxUBzMHSvAOgWznXPtzROQGbfc77Anjkdjnxw2hu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=laDqaqR1; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=vZL3
	hJyh6vFF/o6xtjG6d/xD0EdW0x3J5+2caPucxzA=; b=laDqaqR1cw4dPfzqNTdB
	cqyyF4mFm3xVLxlvZeOBUVxYIRdOQlTYp/T1iqL+tnyxXR8UmarFx5WOi1bILSjD
	cHvyC2clf37L1rFB4fCq7QoK76iHqA18GExPABFY1MS74y1hQ3ovurP4905ATCTn
	YBuoVgij7VskR4tKDfItYDPT72tHTBZhqq5A223yqvLgUtlTUHBka5wAUUsTzyxb
	621QjCb5ST88AM6phgqIpExSC6wdQ50+dZMUIEk5TwYfjM2gXw4Rr/DCUl8VV0Ss
	+j3GmCRrp6NRFbgExHWry7Qz2excDU3g2dqyiOhkesQJk7pyUn3jtiDA9LbbqgyL
	PQ==
Received: (qmail 1504095 invoked from network); 18 Apr 2025 20:50:19 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Apr 2025 20:50:19 +0200
X-UD-Smtp-Session: l3s3148p1@7opr/REzIscujnsE
Date: Fri, 18 Apr 2025 20:50:19 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next][V2] net: dsa: rzn1_a5psw: Make the read-only array
 offsets static const
Message-ID: <aAKe60hldaTKWu3X@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250417161353.490219-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JMX6Ix78kIrznwRS"
Content-Disposition: inline
In-Reply-To: <20250417161353.490219-1-colin.i.king@gmail.com>


--JMX6Ix78kIrznwRS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 05:13:52PM +0100, Colin Ian King wrote:
> Don't populate the read-only array offsets on the stack at run time,
> instead make it static const.
>=20
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Works on my RZ/N1D-DB + EB.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--JMX6Ix78kIrznwRS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgCnucACgkQFA3kzBSg
KbYmYg//Rxa4VNXB3C1prQNThWW3XX72xsHW1tT9FXDJQOfnS6/L/SKfxf3k4kTy
UvNuwQHTfX5dW7wO9enukphTnxEGQWyBVnsMu23PWHi5s4r3fIxBQ+sGCTUKxVAS
+MzLcmJ6ckgHAjaoAx0kebID6p+ueqgl3vCwaev3cf+vpG78xdt6PNPTaSHL1U9Z
jJmNYv4KfD1w7/Am5TXBbDFAe5NXKAMgO+HJTkhh34IpeBZs5En6xZJkQfRyDwfz
AavYRj6+vJQ+yFunuMahLq6d7QW/sEqMXOBp65iQtfYHwfk+kKbGoY4OBXGKSObc
NwTHmyvEIj5oIIzgDdbq98HhJv68m9VoSFSFoerCdQMIxFSUnOcwkNj4nvjUp4k4
qPdFcBcaR+89cY6oSkKO8AXOQgiLevwKzCa8pB+88I4Tfbs9aPWDqQW7XVttzEqz
zs2n8pn9AaXuqdH6tqLJDqZHgmR7w60l55xBKRu+vIBLmDhMKlttXwI7nxijRJnA
AaGRr+wvEuZNGolVuKtJsapwLj+ms9AjETLoSwVK8WliQT6C7DU5pL6aMJiUPY0H
L3vJ1wvvFLs2d+mGB4oJoynZhPG/hBN2yQlo6vb6Bat/Ghs6lJJPwjN2RhP4Hne2
lxpob3gJajN5ASZKvmEIr7QAbGbiYUDTS0YgNlU9nLP2NqpDufY=
=qRNC
-----END PGP SIGNATURE-----

--JMX6Ix78kIrznwRS--

