Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0B24685F3
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Dec 2021 16:30:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345109AbhLDPeC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 4 Dec 2021 10:34:02 -0500
Received: from www.zeus03.de ([194.117.254.33]:51950 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345013AbhLDPeC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 4 Dec 2021 10:34:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=xih8teoHgWKlk/CMUlaWV8+2E447
        JzSknbliTf2xbDs=; b=YEMnv0O/IXIq2HU/SYxY0GZDbOeFivH/SA6QEyodM6yH
        NqmtvkC2O0AZu5LMvSyHJvOsg4wcgOn0Cfn27KTeSZhlWT1C+KgkkAclJXKNYSJH
        +iJimzTnmbjRdfVRAfZ1yxBVOGweCMBssEXrInWFJdBf/2nBQCXjvxFrSDzXJCc=
Received: (qmail 1185082 invoked from network); 4 Dec 2021 16:30:34 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Dec 2021 16:30:34 +0100
X-UD-Smtp-Session: l3s3148p1@MPQ7tFPSINMgAwDPXyPlAPd12m5RGHNn
Date:   Sat, 4 Dec 2021 16:30:30 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Magnus Damm <damm@opensource.se>
Cc:     linux-serial@vger.kernel.org, geert+renesas@glider.be,
        gregkh@linuxfoundation.org, linux-renesas-soc@vger.kernel.org,
        jirislaby@kernel.org
Subject: Re: [PATCH] serial: sh-sci: Use dev_dbg() for frame and parity errors
Message-ID: <YauJlvC7CbCxAhU2@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <damm@opensource.se>, linux-serial@vger.kernel.org,
        geert+renesas@glider.be, gregkh@linuxfoundation.org,
        linux-renesas-soc@vger.kernel.org, jirislaby@kernel.org
References: <163862557847.23421.1243156045279776895.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8124xSYIPz66W2Jc"
Content-Disposition: inline
In-Reply-To: <163862557847.23421.1243156045279776895.sendpatchset@octo>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--8124xSYIPz66W2Jc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Magnus,

On Sat, Dec 04, 2021 at 10:46:18PM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>=20
> Adjust the console printout handling for frame and parity errors to the s=
ame
> style as for break errors by using dev_dbg() instead of dev_notice().
> This reduces the amount of console printouts generated by the defconfig k=
ernel
> on ARM R-Car Gen3 for certain use cases.
>=20
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Could we maybe just remove them because there are dedicated counters for
this?

Have a nice weekend,

   Wolfram


--8124xSYIPz66W2Jc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGriZEACgkQFA3kzBSg
Kbbhsg/9G09MYyo9YcsbqL5YeI/UA9XjA4tJpRyH9tNFlMDW4jKWY6oKV1oPwtpx
HFwhVOZJUMm7xgvb4hvzeR6X5/iEbcti7MEPlbsims2suYNw9maif5vX2yI2o7hT
EmTI/nt+LkCzhdr7vl/Rm4LRzRgKIWrv94l8F8yqibl7pn/us4Wsa70iNXl1JEGr
hTf81MQZZIqYEa769Fu2WquhUdiE72XRbvLE72CF+bU+qthspWnUAZdy7ul5n1wD
vJldjCWHqTtnA8B/e8Ge3HTvzk0BkbWzDGa1dJQoCDsoFhcd5nHHcTtujqDRzHfP
iVt+wL8677Kp72SOht5oS6bVLCAMt3sVP+Ui0GoAPmIHlUPQyt66Tz6VdmgMRkP+
auIu9lKQgKlHcZN9BErYjl687MvNV/BLNwdbvQPVcRE0/bjvSaBtPy4weT0gzNs5
EiUDsjZJj1RA3ZGYrCsqG30zEs3zgWw0+Y1WHi5jAuU8AYTlXBQEWpVibd7iq4/L
Sp2ivv+2gdw/qQI70vLhZsA4eogDyhvjrMCmUCcAQ09sCYyvwOW0nI0HRxsYB7j0
V5IMpPANYATa6ti71v45BaIgnRnHYbY6dO/NXYwC8e4M1tza3CEfgdVwIIZtrF/F
/KB68A8vX9yufDiX9hou18ecYhcuzc0B6Y5XVLosYlfESGqZNeA=
=rvTi
-----END PGP SIGNATURE-----

--8124xSYIPz66W2Jc--
