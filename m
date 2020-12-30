Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 101512E7ADD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Dec 2020 17:05:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbgL3QFU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Dec 2020 11:05:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:50352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726230AbgL3QFU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Dec 2020 11:05:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DBC3820795;
        Wed, 30 Dec 2020 16:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609344279;
        bh=7HiJr1hTNJXmtmcKCItl+wH40I7XBAJc6Cd4l7cmMOQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=F69ulZUvI28RtuxGDb/EB1/FWLITXr5axG6/XmsqAKgsG3WMJQzDbEAmJRKo21mva
         GEmwJnp1yNknTACMWbA3H4RKLVY6sXk3hUxL3PGMdMHWdgNJzH8N5jowhlvVrbZ8wz
         JiSWAaVsF63LPfI54uavo9Ej+Q3mSA1vAshlAcnLPNJCVAC1a2GrLPSYY7cebbx4xQ
         u9phUy1FxjGS9woIbcRVQ3tb5pa5ePsnFPlhNfLNvA98r4Jl/cf06+l3eUQC+0mfgX
         Y5QwOKUm4k8oE+n13Zm0dEH/MRynWdBzlAn3H50CtEb5VcuWfw3KLKeqmnKBZo5pcy
         8/LdojBKm6c8A==
Date:   Wed, 30 Dec 2020 17:04:36 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>, linux-clk@vger.kernel.org
Subject: Re: [PATCH/RFC 1/6] clk: renesas: r8a779a0: Remove non-existent S2
 clock
Message-ID: <20201230160436.GA23641@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>, linux-clk@vger.kernel.org
References: <20201019120614.22149-1-geert+renesas@glider.be>
 <20201019120614.22149-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Content-Disposition: inline
In-Reply-To: <20201019120614.22149-2-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2020 at 02:06:09PM +0200, Geert Uytterhoeven wrote:
> The S2 internal core clock does not exist on R-Car V3U. Remove it.
>=20
> Fixes: 17bcc8035d2d19fc ("clk: renesas: cpg-mssr: Add support for R-Car V=
3U")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/spREACgkQFA3kzBSg
KbbcZg//X4nFN3aqSUqrpC/cB75NyDhgaxEruKz8z3IAJkp/41o6puBdW4NT03ip
S7z6mjz+YAKJ9a+CkJfVFr1LFtMgoW1cSEtFZ5wPP1GH7/ONW0F18V7/a8hTjjAe
IoXjjULVr9A3bQAK9TO0PtXbEQ98Wi45fUXxYzY5N/1dQrOUnvfDAJITjltWN/V/
laUIC9JXSBW5UX+VFRzXRR1wSvDZh9+vE03Ezhs/7B7ZEnGA04lSXw2EgeOusD6X
9972wBsqf2llXgzSIIhTxi68WiMCVeJwYWtH8JwO/No0DCtHg28yc1+XSnWTD861
CMyZgHZLYvqzEYOKHpF9A+xx6sDeLI34XZRJ3e3/QpkAZQ/cHL7FwlVhdll/qnD+
HYox7vyEQFNrmupkPlTpIBpLld3nQXYhxwEYOqVfnt64QWVqy70Vx5mN2wGOAma7
fRADYmtG8aWkOXPL+ECV+9qQ8q8vu7DEt+jffMyhwzX66u1OTCiXHP0LZhmctrSc
FtOSxsekGNNs2RLqP8YNXWd1B5BGi/qUu2QuD5jSLA1yoYgtU488vsOVXbtphIJM
jkbzemFFAb337rbIKuHvnPt+WV4MgMtlUL0k+n3tu8/Wx2iJny27dC+eC1bVmAFa
XfTxt/cemZleZfD7ygBII6zroKdRhj7nJoEhD7tgentqM36mVnM=
=/76Z
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--
