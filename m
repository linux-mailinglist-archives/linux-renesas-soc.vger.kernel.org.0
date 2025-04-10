Return-Path: <linux-renesas-soc+bounces-15704-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A777CA83B72
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 09:41:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E1B818874C5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 07:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164FB202C48;
	Thu, 10 Apr 2025 07:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="HvQYV3IU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E971E32C3
	for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Apr 2025 07:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744270864; cv=none; b=iatuJOqvLrMWuDJWbaFJqKXGM9h4YkHi3qkdILzPTRmiBpuCfCb3WR8zXE8RxVCwv/XCXh17yOBz06nHIKaAS/A7d6EexB24BcQiiEQ/OlAQBXicUoVxoBDZGNWIXJhEAKrMvB/FgrHmqne0wu11hjkMTqyAjqVWP1cJ+reHQkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744270864; c=relaxed/simple;
	bh=WTa+sVMHV/8g9q8obKXhs+n3QwcWj4kC++qyJml8+ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aNkBs25ZIaRTEaTN1wSrNsYJBgb7AI4PC5ioHcOSun5tlaUBJNIm462WGsV2Qq/WnpRLOcM4Svu9wx1jE8WDZ2NS1GBUiGM50scpSo27dahGYZ//V4YefxYH4Y9c5OeaIv0TaOOepQLxR2tbdF/n4YyrB7jve5LUFioUx+u+u38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HvQYV3IU; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=RoWg
	L5XCNr1oUTWvKz9PmHLj815z3d1/RM8rkNlbZ6g=; b=HvQYV3IUfZHkHrvezFMs
	VjyZ/57uDYbuw/MShdvsxukvQo3CZwvn8Cm7t2sWCDwjUvfhai8fTS3npnhQ6T9+
	MAObjVH+XCmFuNtY7YNh9X5c5Bt272aqg4MLijs3qeZlDFm/hE8u7davbmAYcHl8
	Pdc5oELW2S0x2EsOLb/OxdVir90jc/tW7YHcopSFe7hWHNUfskCMoHDn1K0cdZp+
	1WQSAVQQfN+QlXRAlJCWfDoWFMIstvuox2qxcXit6b0g+kT+NDDDwgYjaBT3drKE
	nAz8BcJ8VngoRPUFuA/svlZ3o3/WMjJYQniDAZm6+mp/CDsIrJW5Lto9ve5jB5ZP
	jw==
Received: (qmail 792290 invoked from network); 10 Apr 2025 09:40:59 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Apr 2025 09:40:59 +0200
X-UD-Smtp-Session: l3s3148p1@o5rxtGcyMoYgAwDPXyfYALbiJ46yNPq3
Date: Thu, 10 Apr 2025 09:40:58 +0200
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
Message-ID: <Z_d2CgxLKaEV3w8X@shikoro>
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
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="inATdUMQonikLbhm"
Content-Disposition: inline
In-Reply-To: <0fe35fe3-b63c-478b-9674-a2522f582167@lunn.ch>


--inATdUMQonikLbhm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> You should then find that you gain an LED directory per LED in sysfs,
> trigger has [netdev] and there are additional files you can use to
> configure when the LED lights/blinks for different link speeds, RX and
> TX etc.

Again thanks for the pointer, yet I get weird results. After booting,
with the interface up:

=3D=3D=3D
# cd /sys/class/leds/stmmac-0:08:green:lan/
# ls -l
total 0
-rw-r--r--    1 root     root          4096 May  5 10:13 brightness
lrwxrwxrwx    1 root     root             0 May  5 10:13 device -> ../../..=
/stmmac-0:08
-rw-r--r--    1 root     root          4096 May  5 10:13 device_name
-rw-r--r--    1 root     root          4096 May  5 10:13 full_duplex
-rw-r--r--    1 root     root          4096 May  5 10:13 half_duplex
-rw-r--r--    1 root     root          4096 May  5 10:13 interval
-rw-r--r--    1 root     root          4096 May  5 10:13 link
-r--r--r--    1 root     root          4096 May  5 10:13 max_brightness
-r--r--r--    1 root     root          4096 May  5 10:13 offloaded
drwxr-xr-x    2 root     root             0 May  5 10:13 power
-rw-r--r--    1 root     root          4096 May  5 10:13 rx
-rw-r--r--    1 root     root          4096 May  5 10:13 rx_err
lrwxrwxrwx    1 root     root             0 May  5 10:13 subsystem -> ../..=
/../../../../../../../class/leds
-rw-r--r--    1 root     root             0 May  5 10:13 trigger
-rw-r--r--    1 root     root          4096 May  5 10:13 tx
-rw-r--r--    1 root     root          4096 May  5 10:13 tx_err
-rw-r--r--    1 root     root          4096 May  5 10:13 uevent
# cat trigger device_name offloaded=20
none kbd-scrolllock kbd-numlock kbd-capslock kbd-kanalock kbd-shiftlock kbd=
-altgrlock kbd-ctrllock kbd-altlock kbd-shiftllock kbd-shiftrlock kbd-ctrll=
lock kbd-ctrlrlock [netdev] mmc0

0
=3D=3D=3D

This shows that 'netdev' trigger is selected, alas the device name is
empty and offloading is disabled despite the driver using those
callbacks. The only thing that works is setting 'brightness' manually.

If I now select the 'netdev' trigger _again_, things change:

=3D=3D=3D
# echo netdev > trigger
# ls -l
total 0
-rw-r--r--    1 root     root          4096 May  5 10:13 brightness
lrwxrwxrwx    1 root     root             0 May  5 10:13 device -> ../../..=
/stmmac-0:08
-rw-r--r--    1 root     root          4096 May  5 10:17 device_name
-rw-r--r--    1 root     root          4096 May  5 10:17 full_duplex
-rw-r--r--    1 root     root          4096 May  5 10:17 half_duplex
-rw-r--r--    1 root     root          4096 May  5 10:17 interval
-rw-r--r--    1 root     root          4096 May  5 10:17 link
-rw-r--r--    1 root     root          4096 May  5 10:17 link_10
-rw-r--r--    1 root     root          4096 May  5 10:17 link_100
-rw-r--r--    1 root     root          4096 May  5 10:17 link_1000
-r--r--r--    1 root     root          4096 May  5 10:13 max_brightness
-r--r--r--    1 root     root          4096 May  5 10:17 offloaded
drwxr-xr-x    2 root     root             0 May  5 10:13 power
-rw-r--r--    1 root     root          4096 May  5 10:17 rx
-rw-r--r--    1 root     root          4096 May  5 10:17 rx_err
lrwxrwxrwx    1 root     root             0 May  5 10:13 subsystem -> ../..=
/../../../../../../../class/leds
-rw-r--r--    1 root     root             0 May  5 10:17 trigger
-rw-r--r--    1 root     root          4096 May  5 10:17 tx
-rw-r--r--    1 root     root          4096 May  5 10:17 tx_err
-rw-r--r--    1 root     root          4096 May  5 10:13 uevent
# cat trigger device_name offloaded=20
none kbd-scrolllock kbd-numlock kbd-capslock kbd-kanalock kbd-shiftlock kbd=
-altgrlock kbd-ctrllock kbd-altlock kbd-shiftllock kbd-shiftrlock kbd-ctrll=
lock kbd-ctrlrlock [netdev] mmc0
eth1
1
=3D=3D=3D

The 'link_*' files appeared, 'device_name' and 'offloaded' have the
expected values. But now the LED is blinking like crazy despite all the
rx/tx/whatnot triggers still set to 0.

At this point, I have to stop it because I currently have not the
bandwidth to go further. I will live with the default 'link only' setup.
I hope I will have some time in the future to add the activity led
properly.

Thank you for your assistance!


--inATdUMQonikLbhm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf3dgcACgkQFA3kzBSg
KbZ2Hw//YP2AyhRWaSxcQVWGfKmqrXQd+zatixzacp7teKpFEBrQDN7p8xG3TNCx
s+Wgi8rYbYfNiLxGiY4gt3Kl5J67/cSHq1yhYyeIad5dlkOUXkjxSO2zgthLMM/Y
u1t0qS8m+vju1q4u+DQBpdpeaCgL0egZp5XGyreQGrHKwKPcnUA4vfYYizx8T4Uj
rHJuk5Ih/RXQDDaePS4djj90sLOtvWJ86Cxuj8+LEddiy3ZqgFWZj+WiXtJNmRYu
ti4GJ2w2dk+BsFbdSkWukAZleuEE7e4WzATjZSPRTZk0NFbloai/D9R+zCrkqI/1
ah7AWmkC7g6zHh0N/nzzAl5z8HS6PNoYIKK5PLqtoVOIw8Ro9UJJ2gVA9/oik4A0
WzYxKbHmLbWSFgPrxY2282EXMHZ+xP5NBRsNN8TGOaJJJlexu9yl77DvRVxJ1eZB
dh/K6hogJBWRPuEQMHrNkdE/Za/BlYOXy5709rtV/ZkmPaimBw8YLADrdJZpJbeh
cXFj1X0LjphqjMSYSmGdPNIvvKc3jPnYKBtIONAR1ln0+rjZ3v4gnqdDZnCazdBP
0k8AhDjg5TSE+C2n3Zux+Zq6RYtcq7u2kHYLyM6mnB5/UbzqUQOlSsx75D+vNEpm
pVeyPIsgwcnZ+qfNfaIwOlhsPaXWwmoDbVQxiiSqHgSbhQyrIoM=
=DIwm
-----END PGP SIGNATURE-----

--inATdUMQonikLbhm--

