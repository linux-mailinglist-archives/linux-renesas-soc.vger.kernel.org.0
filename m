Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2EC53000A9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Jan 2021 11:50:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbhAVKth (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Jan 2021 05:49:37 -0500
Received: from www.zeus03.de ([194.117.254.33]:48012 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727466AbhAVKsl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Jan 2021 05:48:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=PMgvNgcY48fjAtOFJ8UZ1HFr+qTN
        OAzeOkTMZxnxr9Y=; b=ZuSy68qsXn2ajzCHwuBK0LaW/dJodlMmlz5xsNqqdmMd
        qiqGAfPmdDLo+bOtsCzfSlRLW8B0fVrROZdySllRFBPL0d/0He2DiUQTx7hr/Nfj
        VfedbohNtb7Jl3GCVDRKLsowUPviiSlozaqiaGndKp6MhM+FwpiJbioFAQcYqzE=
Received: (qmail 2306657 invoked from network); 22 Jan 2021 11:47:59 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jan 2021 11:47:59 +0100
X-UD-Smtp-Session: l3s3148p1@Ei7t63q5kOogAwDPXwqqAP3nWBA3ETDu
Date:   Fri, 22 Jan 2021 11:47:58 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 5/5] WIP! arm64: dts: renesas: falcon: Add
 Ethernet-AVB1-5 support
Message-ID: <20210122104758.GB29150@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210121100619.5653-1-wsa+renesas@sang-engineering.com>
 <20210121100619.5653-6-wsa+renesas@sang-engineering.com>
 <CAMuHMdX1PoB-YNXvtr5dFMKu9OE8TdOB43fRfED_wVV6LhRU8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jq0ap7NbKX2Kqbes"
Content-Disposition: inline
In-Reply-To: <CAMuHMdX1PoB-YNXvtr5dFMKu9OE8TdOB43fRfED_wVV6LhRU8g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--jq0ap7NbKX2Kqbes
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >  .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 160 ++++++++++++++++++
>=20
> New file r8a779a0-falcon-ether.dtsi?

Makes sense.

>=20
> > +               ins_mii {
>=20
> pins_mii

Now, how did that happen? Thanks!


--jq0ap7NbKX2Kqbes
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAKrV0ACgkQFA3kzBSg
KbbsKg//btL3WC4ZmwXkMAgYycglfnTbQ4Kziaf1JVp1RlYpAROo0tzpO5zQ6hcM
D4HqeEDI4pa7VFmIhjmOS+klKcWYnDoXd4uSmD8rs2k08XRu2kXAzzVUOyR9VaRT
YYh8CEX0AKzTlRqo+RRajoje0HGTB6l3/9cM/6op3eDySAhZLZRqXRSAYBC/xfFM
aQXwupVwhXxDgClKnwSBYpbu9ODEHXY95GCxXhhgQx9eIWZLx2wfwTiAhJknExrr
R6r3lIoLdaGYf3X3o12j0QGTVq+/z0QknOJuBxAJ5f0t0X1cLva6RfqmtLCDKgpQ
Iu98g+qg+FYU5Ks56taXGzrz/bZMF33fQsuFLMucwzQp2vB6uoMpjzoweo+jzxlx
V0aw9hb3bTlr1QQcQMO0Ak4sUlkrgHuAjq2IvfDx6oWKnrnZPkW7x4ecXeHpF0bU
e/YpBO2oWqoZbyHEVM9pR2drp/wO3GhviMrIbus8zu4EKaFzrAFuALUF483+nOul
qf01034gGcrZGeNzxH7IpuW24LVzOiSw4sDXOa7L/8Qkodl/cabMrR2eJItP3SnI
ILV43dQg5aZ5A1Svnw28siYGL2Ai+XRmJ0iCJK4OIej4gYRxHAEO0qeDoBpAerXl
WPln6qDQDwGgzCgWEnAYAiC2hbRCAsrgMKFtgRVWs0Nrxg4aIog=
=gEcX
-----END PGP SIGNATURE-----

--jq0ap7NbKX2Kqbes--
