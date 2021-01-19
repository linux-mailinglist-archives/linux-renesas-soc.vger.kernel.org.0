Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2A142FB9F1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Jan 2021 15:55:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725771AbhASOjd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Jan 2021 09:39:33 -0500
Received: from www.zeus03.de ([194.117.254.33]:47492 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389994AbhASMq6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jan 2021 07:46:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=B/tgnQe++TiNEzjAeZeldBhlj6A3
        T8pYiGEsSUAtogQ=; b=uwbZfWInaxQBHij4qU8TlH4HF9hXI++CYIPEGHusGwls
        V/xh7/4GL/Ben2yejWMuewPQWYN/FNF0ZKI5OLHJjhEuBKAZnSzOB56nJjdPk3vR
        Ra4gFMfdnHcq02cZ6C56ryNmviQeZMWrcpEJfzUFlho/pM09Gvs3kJwoKRMttD4=
Received: (qmail 1070386 invoked from network); 19 Jan 2021 13:46:11 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Jan 2021 13:46:11 +0100
X-UD-Smtp-Session: l3s3148p1@rYodOUC5uNsgAwDPXyX1ACWcscxtZ2TX
Date:   Tue, 19 Jan 2021 13:46:10 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/6] arm64: dts: renesas: falcon: Enable MMC
Message-ID: <20210119124610.GB1259@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20201227174202.40834-1-wsa+renesas@sang-engineering.com>
 <20201227174202.40834-7-wsa+renesas@sang-engineering.com>
 <CAMuHMdWs5SWUpDkcX4m9MqVKa4KJvAfXSsRt=Fq3c9=2JtdwHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eAbsdosE1cNLO4uF"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWs5SWUpDkcX4m9MqVKa4KJvAfXSsRt=Fq3c9=2JtdwHQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--eAbsdosE1cNLO4uF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +       reg_1p8v: regulator0 {
>=20
> Please use a better node name, to avoid accidental duplicates, cfr. commit
> 45f5d5a9e34d3fe4 ("arm64: dts: renesas: r8a77995: draak: Fix backlight
> regulator name")

Done.

> > +       no-sd;
> > +       no-sdio;
>=20
> I'm no expert on the no-sd{,io} properties.
> Just wondering if we need them on other R-Car gen3 boards with eMMC, too/

Won't hurt. I'll prepare something...

Thanks!


--eAbsdosE1cNLO4uF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAG1I8ACgkQFA3kzBSg
KbYiyw//bwI1CJ3F9ockT6j55WLc1MDFnVukvB0oA6xUzfVbQ4s//6IGFKz7yNIg
ZESpSiagu7xD9dF6l4rxeaTHF0jRRENIJcyZLniTG5CCX0EirFLSCwtZZVuWuQ6k
6a+gbiLPcuCs5XAZLQzARpOMVkW1GevPDHqEm0jj/D7+W8yMxAkpRbrSyHOVr3kx
VnXaJ4ycTSakJHSc3uzzAOqxDP+9z9cGpQT0nmRgoVyqtTUwy8vFzzFwDqVuHujv
fonmCgr8mZQR1aV2b3XYdQjgPhI040BzNKfjR/PD09qw9znV7Qi7W9ThLSwLrmdT
TqVk9Rvzm+bO4AQtiLm9lcBhOOf+z3DBLnPr+wkMxrEWQs9iqQCWZU6daeOxtNFQ
P6KqhG+zW0Y8JdDPi7/6s8fhwUSOW/NUezI5a9fKSZGEmoL+gVpG4F4DZTZUmokz
iTGqQhSCzYXHnCWepUEwx4V1Ht8hnqwkcLcxIhxIRoNFDzcByZgnZv4ME7dCjQKU
J0wJxRJqerWxjjbJhJHFxjSTCnN22p4/IFlZUn9c2hfrikwK3WFbhLdcMSYEpTr1
6tb+qADtqIbFvElVfON2Nvy0uUWo2h58yryzBbvFkYgoF04V0F3HV3WmafIIINL9
BRej6bYYX4UDuc94u+ophtpUCJVGpaumicacb9l3F0+bKwIEpI4=
=kVoD
-----END PGP SIGNATURE-----

--eAbsdosE1cNLO4uF--
