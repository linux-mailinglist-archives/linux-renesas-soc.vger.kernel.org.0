Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 517353074EE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Jan 2021 12:38:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231213AbhA1LiU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Jan 2021 06:38:20 -0500
Received: from www.zeus03.de ([194.117.254.33]:38340 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229551AbhA1LiT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Jan 2021 06:38:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=cpH+JufiC/0ytiBxM3OeRTYZvJ6e
        N7lOGHdSA6thHd0=; b=bMuxaQ71juf5XZVyV4OjnAdli/Zct5PMU356qJr+uP++
        7tsjU7HixhBnG64qCHWhuiW0VmlQYowlrHeE4sk5SMOkWzxfUZ0hC+lzLVHqYHkb
        q56oWCTNBcWQkAyju0rOfOXrR4oMYUtMkEYXSpGwZulyPlXRvpVV4HKsZY6s6JA=
Received: (qmail 214403 invoked from network); 28 Jan 2021 12:37:37 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jan 2021 12:37:37 +0100
X-UD-Smtp-Session: l3s3148p1@qIGDUPS5YpcgAwDPXyX1AEdA8SGgn5QT
Date:   Thu, 28 Jan 2021 12:37:37 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC] arm64: dts: renesas: falcon: Add I2C EEPROM nodes
Message-ID: <20210128113737.GO963@ninjato>
References: <20210128110527.2294423-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Sr6hGnsCY8KeifOY"
Content-Disposition: inline
In-Reply-To: <20210128110527.2294423-1-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--Sr6hGnsCY8KeifOY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 28, 2021 at 12:05:27PM +0100, Geert Uytterhoeven wrote:
> Add device nodes for all I2C EEPROMs on the Falcon board stack.

Yes, good idea!
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Probably we want to move the sub board nodes to separate .dtsi files.

I think so. I think we should add them when we have the subboard files.
Or you create them now with only the EEPROMs, if you feel like it :)

The nodes themselves look good.


--Sr6hGnsCY8KeifOY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmASogEACgkQFA3kzBSg
Kbbanw//Ugk3INgoIODW3ZVRnq+5GyeBEzr64u0jx9K9MbikH5c2HFcEu/ZiMU0e
nb1KEUBYSwQltbZHUi6uYr+v6rAQRihf4eJFb4HIesVNuGQ8MLuHqUT1Ot0q/jNO
cKHys/VlepYO+K5SPHg6yDi02YB7T4fVXAIY1b9L4pi2/VmkBxFEGvUZJ7NHLM2k
Q4BLO/A1cGS3SntIeBuvBaQOpHyktcrxmtY3ZQBdazBXl2F/OnM5mddjPSj/JyLf
MVXxaHVGjXbY8AIbk9W3oqt3mBkxnJ7GRu7fH6BMmwI8KvAGPw3gZzXu1BwGWP6e
/CeuwbJk3DjD439iT+g6NtbYoc5sl5SHSz5ZEJjiGGmQ824tN51xwU90Gsft4SM6
JHWLF1zbhYLeOR+vfiE9xLd8c0juDeEGnn+QAC01YiscKMEjJGiBoTTaK//rK+vf
THzz3Jty/zyJPqmoA0vtj3qYzEFGzwiy0PM3scXCFcASW9jMNuUwvQk04GJoRzeV
rZglYIQIYERfYxumpmMUA9DkL+5VayJNKcQ6vrsmsd1GoUlK/zrjg1dA7ViCnaWR
yEQF4Ywkc7QEHZfJbtT9LdgLM+4GpSpOSaJVqulZodkXOci6omtVxwui35rHVC+W
La9kXmDzR5lOiQYBjXMGKvonM3rB3JMUTx39kJ2fJ+5KNFUjpCk=
=nueY
-----END PGP SIGNATURE-----

--Sr6hGnsCY8KeifOY--
