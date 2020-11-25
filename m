Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66ED62C3AC4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Nov 2020 09:17:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727180AbgKYIRM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Nov 2020 03:17:12 -0500
Received: from www.zeus03.de ([194.117.254.33]:41860 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727102AbgKYIRL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Nov 2020 03:17:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=vsBon6SKC8FZzrPulDjtdMyYi0hC
        Vmls3FDPb+rElwo=; b=F1FmyBlRyuL/KP1bR9SrItKopfML5kC5LneMyB2pO4rT
        jBRxw6M/sNntWaQVtJmlGhJhoPZL/0ETGqmE7hfWLTUwV8sTCE6ctdiC8pQGESzM
        aqhNqOkMrgY1FPJo+kgYhXOdLw1jkJJ+jJSfal/RnxcxmzOb93YE8Xms3G1vTX8=
Received: (qmail 3213386 invoked from network); 25 Nov 2020 09:17:09 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Nov 2020 09:17:09 +0100
X-UD-Smtp-Session: l3s3148p1@Gs20Deq0psEgAwDPXwZjAFYQ5uAAs3hj
Date:   Wed, 25 Nov 2020 09:17:08 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH RFT v2 1/3] mmc: tmio: set max_busy_timeout
Message-ID: <20201125081708.GC1577@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
References: <20201120150647.123237-1-wsa+renesas@sang-engineering.com>
 <20201120150647.123237-2-wsa+renesas@sang-engineering.com>
 <TY2PR01MB36925B9010516CE67A9DBBA2D8FB0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dkEUBIird37B8yKS"
Content-Disposition: inline
In-Reply-To: <TY2PR01MB36925B9010516CE67A9DBBA2D8FB0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--dkEUBIird37B8yKS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +	val =3D (val & CARD_OPT_TOP_MASK) >> CARD_OPT_TOP_SHIFT;
> > +	cycles =3D 1 << (13  + val);
>=20
> nit: we can remove double-spaces like (13 + val).

Thanks, I will fix it.


--dkEUBIird37B8yKS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl++EwQACgkQFA3kzBSg
KbYMhxAAoSJlP5EtYrV+yqNpqdT+ZmZYEERjs6jd4QbPMlIq8C5YtNs3ilevgiQq
yE0eFDWpQjPTmlbR0Z2JNwulfTeatK3zz0CMZA1iQOtRxfWLcqj9/Kbb09wHZJ1O
DT6S+TzFeh6zd3LWbj8Q4NeWOjzU0SnVqgvDmqd3eLovvm9ayK9frqlcQ2oQB620
95QvsmPy29DMWI+udziyVYwSWzb7DcG541oMpwOIDr+RZbot3PhyFHVWBgcMOBok
ZWlkqEfKgCL/ibNSlnGfiwAR2hKP8O3IO6MjiFp64kO/JkvB8ZJgCIlhdkOSSyZc
eLROD8ENGy8EJt6WHwtwSQFbHqAifE7rqt3jUKsNdkwRG8T5FRhvrYo2d68vplpv
ru+fDawUWbsBiQi3DVXiaetqUDINAPYtTaB07BrFAbC3i7iWvXRhBIGezu0rQTjG
IxCU6kygm6jUPwhWfVPPlJZnwL90zcbYDFoxJJ/7SEO2OYt5Tr/zSSsNkJ7Nq7eq
Nu5R12c77ay0el/JEPaMzuBtBlkyw/LYEk8brIT90ejZgqebrizDw7QFJM/nCtn1
JYiETrH7QkHjfCRnwRg4NqovXs7jpKBlhY8hTSDJ8tCePjZP0hBahtQVbu5SX2E/
U/FbOzzX3a/DPaiyez3VOCV7fbLIF8BQe5RUOXSNfNbhVC6n+1M=
=honH
-----END PGP SIGNATURE-----

--dkEUBIird37B8yKS--
