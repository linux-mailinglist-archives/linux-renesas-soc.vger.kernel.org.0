Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E76E7215A02
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2020 16:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729285AbgGFOvA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Jul 2020 10:51:00 -0400
Received: from www.zeus03.de ([194.117.254.33]:55238 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729263AbgGFOvA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Jul 2020 10:51:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=P0s1hNnrN5iV3gwBK873JosXAcBA
        jLIMcllp7ooXce4=; b=3UtMVu5TrLyInUViVJ9f/em+jzZHk/ZTnaElFiS7evsP
        JVrMgpaRxpiYav8zXqS6FlrQxWl0Gqgqbf5VFvb3glTGtUYPaKU9zcVhTzdclTD/
        zKLsHf+3MGQUXt9UXe0Fo4pZwyDVLXpDmWKDarsGw6S/MRhB5oRlL1EuAqhiupI=
Received: (qmail 2131645 invoked from network); 6 Jul 2020 16:50:58 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2020 16:50:58 +0200
X-UD-Smtp-Session: l3s3148p1@D7SpAMepyIggAwDPXwSPAD3C42NrtmEM
Date:   Mon, 6 Jul 2020 16:50:57 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mmc: sh_mmcif: Use "kHz" for kilohertz
Message-ID: <20200706145057.GF1046@ninjato>
References: <20200618080321.16678-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gdTfX7fkYsEEjebm"
Content-Disposition: inline
In-Reply-To: <20200618080321.16678-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--gdTfX7fkYsEEjebm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2020 at 10:03:21AM +0200, Geert Uytterhoeven wrote:
> "K" stands for "kelvin".
>=20
> While at it, make the spacing before units consistent.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--gdTfX7fkYsEEjebm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8DOk0ACgkQFA3kzBSg
KbYwVQ//bJ07luUSyQMooRAeQPmMg6D259yGk/tU6HgsKQSlsb0zJo+pTPrJOnT+
LD4XZe+PJ+cHWWqJfR0oiTBLZDVWaTqmEVmAo4gNzk2MPKxnQWnuSK9JKX5qmVvt
hA1ABe783GgFjK56aDP4R3472+2bm5V/QaJ62U8SOgAZv8LwqqPx4QP9lc5LqaX4
RU2nLx+1mCclNhkHlbJPv75JPDU1nSVCa9jVoQ7EYZHVEufAM14LdnskDgrARwN8
7MYJNE3UaS3z2P2JCNHU2gXVXJhQ/IOSfJuy48KEEyrMEEt5Dpycw0VIp6UHnaYz
W4GKt74vMpB5rLVy/2Qgue+Ed1jYqVt+prmVtCwl/aDwFUDNpfNWm5vg7c8wUlz+
gE4Fxmi+L/5AOYohNV62l+tid1obkU+wDrHFA2uynIegndWJYZDAY8Ec9kPAVsgl
LqmFMEuTNx6q968kLiOXGgTlo/IJ4vM3LJTcMFnVy1D8v8wd2w8NWXZzVmy+4AkQ
uCU4E5R5pETswrWpMeiOzKEa0xNTqyhmvM5+/xIbLL1rjjSuLVr3T+zRgdUyNPS7
zzFr2UBwrvgBuT17v8RiVUW0eLXIHXlu55DY7mXK4MwYvJ0V5fGEhilx1pP4hffz
hvnxFfMLqX19NiXEfk9NMCOdgfeYGh+PUT6F05Xfzm+WQ7DFseI=
=F0yf
-----END PGP SIGNATURE-----

--gdTfX7fkYsEEjebm--
