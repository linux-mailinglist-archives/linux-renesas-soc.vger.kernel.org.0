Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A162A30020F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Jan 2021 12:55:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727287AbhAVLy1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Jan 2021 06:54:27 -0500
Received: from www.zeus03.de ([194.117.254.33]:52150 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728098AbhAVLAo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Jan 2021 06:00:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=hxf6Om6fAWPOkTJuqbH+H/WjNWLf
        Rk9wpF/ad2YIrkQ=; b=S17OcAXRzJBmURLW9nA6pm+OdSJoONpzO3ZFflUxhKab
        HOltLgt1w4AS1TWOsGS3utgS0JagD1uDCBfdoQzowBNlMfOZ2GMEQ813Y/T7xR7V
        9xJvd8PR/UW5e6+oFLWv+LO5n+yBKOHOFLJzd4SOJwrVfTNEzqj2iZyKGGEVFdY=
Received: (qmail 2311044 invoked from network); 22 Jan 2021 12:00:02 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jan 2021 12:00:02 +0100
X-UD-Smtp-Session: l3s3148p1@h+EJF3u5kuogAwDPXwqqAP3nWBA3ETDu
Date:   Fri, 22 Jan 2021 12:00:01 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH V2 2/4] arm64: dts: renesas: Add I2C to R8A779A0
Message-ID: <20210122110001.GC29150@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20210121095420.5023-1-wsa+renesas@sang-engineering.com>
 <20210121095420.5023-3-wsa+renesas@sang-engineering.com>
 <CAMuHMdU-QK2xLrOy-OsS=H7tN5da2wrc3TuVKiwZFy0N6ueDtg@mail.gmail.com>
 <20210122104618.GA29150@kunai>
 <CAMuHMdV2JSvoArw4dU8sLQTneKNL5Ku+xgHkkRMpbCpKGuarrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7qSK/uQB79J36Y4o"
Content-Disposition: inline
In-Reply-To: <CAMuHMdV2JSvoArw4dU8sLQTneKNL5Ku+xgHkkRMpbCpKGuarrA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--7qSK/uQB79J36Y4o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > "arm64: dts: renesas: r8a779a0: Add I2c nodes".
> >
> > "I2C" please. Sorry for not prefxing it correctly!
>=20
> Oh well...  The less mistakes you make before submitting, the less
> mistakes I can make while fixing them ;-)

:D


--7qSK/uQB79J36Y4o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAKsDEACgkQFA3kzBSg
Kba2Uw/+NTxZaCchQ0MHDvnkb/imH2yrJFeAso4CYheb3GyBiNNKVoHqBnzByszR
b94qU6/ZO1vQPTbQIB0T+XjE2x5zIZnubLRRxt62oOikik2ckSClA/V55051Gfui
Cuh7ee7V23eSvfnkgcpaaimF5KoCmMKGUEYnRHub+AcJ+QOYeT7GcDMXg80YOdYt
rZy1mWFlC8I5g1h4mHCNUZikat+7Iib7UdilUiwDg57wjBtnJKd2II+Z2cob+6bN
TiGxk1jqaT4g7F/3qqx3qowYGGE2mYeeS/y9t3q4VuWe2XhUaDavy6MRwxAIZ8vR
c4udqk+KIrOJ8aIKBHWhXTtMdFnPhZRUgTH6XALIQqkS/GMIRslu5o9s5zn8P19Z
6/Q+sHxJSibkJGIcU1gaqC7h6CEPVisKf5QOLrKBh56q1aR1Wpa2ni9NqPrKClje
DgMYc8Xq1yFrustCav/EiZ1JvH9cAK1SrFjt7MRnmBdR+Okm8sW7LHF/+T5wFivM
aglc+MiUDYd2sGnIVhDcR8h8mRB3/mFeSB/oSCJvnFVx/hJXK4NBmif6X4JjwSkt
fRUi48Ovr3nfmpV3ulAH+74hDvfhlllRoVvx9ciD7WIk7vt6J2oMOIfJ19kmXHHR
wopmEKOvAt7ZL2x4k3rOE853AJFwGzakSkcLDvprfUEk1emI9t4=
=mKF7
-----END PGP SIGNATURE-----

--7qSK/uQB79J36Y4o--
