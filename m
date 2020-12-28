Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBED22E42C4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Dec 2020 16:28:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392622AbgL1P1j (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Dec 2020 10:27:39 -0500
Received: from www.zeus03.de ([194.117.254.33]:57590 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407797AbgL1N52 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Dec 2020 08:57:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=JpSS6SJxSrGFlfoJzPOk0zvGh8aI
        +TuYM/8FlHNqQBk=; b=Jta7t7RYoAkAjAYoqr2FZ70Di+k6zforFCXuyd/XEZZ8
        kbu+u4hlBku5k1IHThsmmDU1hsL8WlN2jtYoPHC5mBWdk8i3H+cNi/LdR+F/FLbB
        vunIcZ9J6MVeUtrXe4AY8uvFWnREscTklmir2QaQZGdY/kI6CxkYPoUM1kxVWWg=
Received: (qmail 1773424 invoked from network); 28 Dec 2020 14:56:46 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Dec 2020 14:56:46 +0100
X-UD-Smtp-Session: l3s3148p1@RfcMpYa3ApYgAwDPXwIpAOUwDQytQs2L
Date:   Mon, 28 Dec 2020 14:56:46 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: r8a779a0: WIP disable reset-gpios for AVB
Message-ID: <20201228135646.GE10822@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201227130407.10991-1-wsa+renesas@sang-engineering.com>
 <20201227130407.10991-6-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fWddYNRDgTk9wQGZ"
Content-Disposition: inline
In-Reply-To: <20201227130407.10991-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--fWddYNRDgTk9wQGZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 27, 2020 at 02:04:06PM +0100, Wolfram Sang wrote:
> Retrieving a GPIO currently fails, so probing the whole driver fails
> then. Remove them for now to get a working AVB device for testing.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I just pushed out another version of this branch. There, in the
depending gpio branch, a fix for the GPIO DTS addition has been applied,
so 'reset-gpios' work now as expected. So, this patch has been dropped.


--fWddYNRDgTk9wQGZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/p5BoACgkQFA3kzBSg
KbaQwRAAi0sSIeBJxddxz+u6GkgNf+0wUSrPzu+WBp7kW5HpBDYy7JYrwVlv8pje
Lqj8whWEPLSeCa60uLaigKqTrpK5MyjZthDG22KrIOR9kLHOUP+7cAnzC1pcXrX9
tvsvkjnL9aUk3d+XivmgwY88Eg65e1RwWjjI4WXJi8REMWw9VmcY4s6pI9/wNfSE
GLh3iMxomVSvEjVgqpWloT1AX5UxHe9GyOqxzfGuNP90ELZPiF49TigaTxdwkn1i
Bx4U77zWUZcXstdvOFzJGA7LDM0ZAYn220DH6qFrNS2K9Z7+Wr33Ky3Z6owNg1fb
fM+5GiqBvjCAFab2f9hNAqfGqRDBp5tP7A444Ms3bp414ZU5EeOXcJDHEYgu1jyM
l/pL30nj8yPHPT//m/p2i6ZoapMd+hP4+ocJxyCDxQkzq8Fmmt73JnuW1GcDCWs5
ufcMPizdfENjxJ2eY7BbFputaFXf2r64/jGrNPjCuaxwc1+aYZdKy4X5T5I8bYY7
VdE/Fs7+WFqwhvWIrhLOo1DFp8TIB8balaxTESR54ZI1a2wST10EXFYX+iITkoNu
awiMI8ta1Ty6rKzUjdlL3v0zfOC3uNToN0V9kQWy4F+pefttZBvbikzT/fkueoiY
Zkz7NREePjZ54TGLX0lP9+xZquti0rzUmb4PY4dyfDMi7GlH6sE=
=1AWs
-----END PGP SIGNATURE-----

--fWddYNRDgTk9wQGZ--
