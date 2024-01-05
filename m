Return-Path: <linux-renesas-soc+bounces-1327-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FA38251AA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 11:16:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 595E81F2154B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 10:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05CAC25101;
	Fri,  5 Jan 2024 10:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UVqyFBGd";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AIt7iYti"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BC624B47;
	Fri,  5 Jan 2024 10:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1704449721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jO+VO3wXFRu66UkMcvjqElGeC5Sv8WT5wY6xOwIw/S4=;
	b=UVqyFBGdRkvhbOLA+ppFaGAfNm0Vonvxuottzyh/4XWb7L+OG07Kg6jdcXmeVHoWlI7JLR
	NKGJ7s5rZ8EwJgk99uiQrQAmz2zcbxx5qbAWIT3ywz/Qx0QS+l9keHU+RwHC9a1b81C+Uo
	eYXwBmz7dQibvSINhYdtV/vMNzjokYrD4SrJBOxsz16TOwrT29tdeRsOTDcjq84QSJVhJe
	g1/qxvYVgxjrHXiRLLDsHhoUeqP+FjfYw2ZlCysFpo/d+8xx51bgAPTt916UxE69UHp4PM
	S4yy5te1FBYR8Dp/opZ5sszDj7MNcvTLPVrpox0TvMvIfCk1KoI2Dvs608hSig==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1704449721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jO+VO3wXFRu66UkMcvjqElGeC5Sv8WT5wY6xOwIw/S4=;
	b=AIt7iYtiUvQDrEKJug3LyhX4SHG++vgGesong5Ppvswqs8G7nnWz5dyDPY0iX407QgSYib
	fhToLweazCrkaWBQ==
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com, Jakub
 Kicinski <kuba@kernel.org>, andrew@lunn.ch, f.fainelli@gmail.com,
 olteanv@gmail.com, hauke@hauke-m.de, woojung.huh@microchip.com,
 UNGLinuxDriver@microchip.com, arinc.unal@arinc9.com,
 daniel@makrotopia.org, Landen.Chao@mediatek.com, dqfext@gmail.com,
 sean.wang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, claudiu.manoil@nxp.com,
 alexandre.belloni@bootlin.com, clement.leger@bootlin.com,
 george.mccollister@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next] net: fill in MODULE_DESCRIPTION()s for DSA tags
In-Reply-To: <20240104143759.1318137-1-kuba@kernel.org>
References: <20240104143759.1318137-1-kuba@kernel.org>
Date: Fri, 05 Jan 2024 11:15:17 +0100
Message-ID: <87plygqe6i.fsf@kurt>
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

On Thu Jan 04 2024, Jakub Kicinski wrote:
> W=1 builds now warn if module is built without a MODULE_DESCRIPTION().
> Add descriptions to all the DSA tag modules.
>
> The descriptions are copy/pasted Kconfig names, with s/^Tag/DSA tag/.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Acked-by: Kurt Kanzenbach <kurt@linutronix.de>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmWX1rUTHGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzgk55D/9zqbT5fC7AXgLULEkx0VKj1404ulqK
ZxXhPu2NW1/G+/+5iFZvce7q0JEJDNcRPG0IVYc0WxkbVN2pLZoFKFO4omzAi1OF
lHzUaB9SjVp4kS3B1mJbj7q6+JPfU6Lt06d23cWp2GI8O1wp7C7Hu+fSW325k1dx
ccw8/jfnFyuxKe1VhAPuQfSZ6erM79r6zi8sf1iwwU8l8hUr/WjFD4iREXKyL93j
G0W6Gw10DwRp4lgwy8WPdydwjvE0sbeMKh7ijtnqCYwnD5j2DCSKZuevoglZXzSR
fyrSIjUclxys7VbWfQtn3QYa3y6O+mJKMD6Q4DLoAm9X/dyran49xRCboJC3KrUI
7exTGoXUPVA452Jy5wKZccG+RS+HpQi6AC3L7v1tPWg6mltmusQc/SHK5MVm1riz
qNTMJP9uCojCUiP+UWbh20HpOt16yHP0+xGRiX3pUBl16RGmyWRtixJPb/4MQz8T
xiN9HaGi+9jRF0v7I+/iUwWkmMEThaBY+mtl2e8rWInOPyLVC0Bddr/KwzxFJ6fK
3dmsIztl8lvC47jH86xriXJDp8QXKkjo0bwq/TonB8w4g5OeR04bvZmo/A73M10k
jn+4pSKyO9c1NHyS7nCs2dpO3Xlrdj9p1HZ2Uv8N1BbogRcU+v5KPeGoe7QYvcOz
vd9YY2W+WapiiA==
=U6fC
-----END PGP SIGNATURE-----
--=-=-=--

