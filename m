Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD1B2E370F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Dec 2020 13:19:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727646AbgL1MSl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Dec 2020 07:18:41 -0500
Received: from sauhun.de ([88.99.104.3]:42142 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726847AbgL1MSl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Dec 2020 07:18:41 -0500
Received: from localhost (p54b33d88.dip0.t-ipconnect.de [84.179.61.136])
        by pokefinder.org (Postfix) with ESMTPSA id C29412C0509;
        Mon, 28 Dec 2020 13:17:59 +0100 (CET)
Date:   Mon, 28 Dec 2020 13:17:58 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        hoai.luu.ub@renesas.com
Subject: Re: [PATCH v2 5/5] pinctrl: renesas: r8a779a0: Add SCIF pins, groups
 and functions
Message-ID: <20201228121758.GC10822@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        hoai.luu.ub@renesas.com
References: <20201221165448.27312-1-uli+renesas@fpond.eu>
 <20201221165448.27312-6-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RIYY1s2vRbPFwWeW"
Content-Disposition: inline
In-Reply-To: <20201221165448.27312-6-uli+renesas@fpond.eu>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--RIYY1s2vRbPFwWeW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 21, 2020 at 05:54:48PM +0100, Ulrich Hecht wrote:
> This patch adds SCIF0, 1, 3 and 4 pins, groups and functions for the
> R8A779A0 (V3U) SoC.
>=20
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # for SCIF0 and =
SCIF_CLK


--RIYY1s2vRbPFwWeW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/pzPYACgkQFA3kzBSg
KbaDVA//YsoeTxtJvjLB3VG1w6BPjo6Lq+icIyi//iOk+PWKCn3HGc+9TGQuOZWO
qWWQ7wjBVK6DjPn9O1PQcAf/1LyAkQggaRxThNTLLwNeb0C89Fe9X0z7kkqEZLfU
q7FY8Li2xm8qor7DFWXG//uagq+aBTY8yrYrvne2H18QuYwSVfzimzQfehMfLdxX
wfPs8zY/g/d7Z0hJOfWGFl0llFyyw8s5Tx/dDib6/+2r0HRhUIz8BBO6E5ITCpTc
2KNdFefmiNiJJ9hBY4flp4Q+2GHuXiShS/6OapRG2Ia9L+xCCweyu1EhJlsQuMYP
xP04K0T06Wg3sD2mX3WKucnoOlhzDSEubSRhvgWtMw8oJbRum/Ws6mVzPf7yGeVC
fXh1X/AWAKbMw5tdBdVY98PBrdZAOEvD8ibMQKk/WCE/s2bUMmBe4ZxDGJ8bZteO
O2E/x7Gujll58P7qmaSSDNMktxZ89yvahhdsghta7yiySq+BrduhhI1vSwpb3pKw
Tb4Ff0DAh/VwLCU8lXjDrr66sR8IsupgtqQCqM/ieVdn0MRgJCap4Xf/Zw/wgMLI
yr559PaFv57VwK9NXNV5Jr0KZ0CZacgGa+CtFSGomr2sm8elblBP5unfSukjTnOk
IvHW3ZYNyfLdXa+MhrOw8Mnx9BnYvNXwhACtMDs81Gf/ZYWuhRk=
=LCPq
-----END PGP SIGNATURE-----

--RIYY1s2vRbPFwWeW--
