Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 416BE3B7E37
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jun 2021 09:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232893AbhF3HhL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Jun 2021 03:37:11 -0400
Received: from www.zeus03.de ([194.117.254.33]:47988 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232788AbhF3HhK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Jun 2021 03:37:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=e3WhkGIYMcElSQnusEm1KIiH96k4
        ofQ6sXqx1VxCePM=; b=rtvJxbe0Y3Zh/NV80YYNYB/J79yk+h4rrXrHBJ2AeCTn
        nzOSQI6q6Z+2q2jRVr/gg2nEMPMVnm+vXZJlwujFN+4nbsSEWOHdRsqDeNf3N8T8
        wJKulVD5IynKY0l1mBS6IixMfFqeMYUFxLVu2GvmWFmAotnv3hhTvE53N0QoS4E=
Received: (qmail 771211 invoked from network); 30 Jun 2021 09:34:40 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Jun 2021 09:34:40 +0200
X-UD-Smtp-Session: l3s3148p1@qNhdwfbFKOIgAwDPXwaiAGDoJRk6bv4I
Date:   Wed, 30 Jun 2021 09:34:40 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH/RFC v2] mmc: host: renesas_sdhi: Refactor
 of_device_id.data
Message-ID: <YNwekCB+GxPPjR8p@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
References: <20210629102033.847369-1-yoshihiro.shimoda.uh@renesas.com>
 <YNv1/9WsdYu3ZwVv@ninjato>
 <TY2PR01MB369251254895EADB8CD6CC17D8019@TY2PR01MB3692.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="seCvDq5IsQrcGP7M"
Content-Disposition: inline
In-Reply-To: <TY2PR01MB369251254895EADB8CD6CC17D8019@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--seCvDq5IsQrcGP7M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Shimoda-san,

> > I think this Rep-by can go. Test bot mentioned one build error of v1,
> > but it didn't report that we should refactor this code.
>=20
> You're correct. Perhaps, adding "# build fix on RFC" is better?
> I checked the commit history, and I found such tags.

Oh, I didn't know that way. It sounds good!

> > You leave the quirk handling of different ES versions still in
> > renesas_sdhi_core. I'd think this should also be moved to
> > renesas_sdhi_internal_dmac? Then we have all the handling in one place.
>=20
> I think so. So, I'll try this.

Glad you like it :)

Happy hacking,

   Wolfram


--seCvDq5IsQrcGP7M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDcHpAACgkQFA3kzBSg
KbYeOA//V2Zt0aeMQtkvlYlg3UhfTeHRPeC6upM8DTxH81XuQ+5PUyVOYpQY9upA
3Js/2GTHJLJjJHA/4vUrl6vMQbw0TXW/gbEvPtL9sNzPSsUZ7rA+hlLOLS/u7b+P
2P3zS/6OsAtJto5s/oujW7JFazUJm/njpAXgM8WaeYb6nSQZ3bhdLtwp/9BZ718i
J2kf3zNHZNtkvvPYNfDJDjh7zJ5OJ4GUbJl1aJ/IFVJrMd44Yyj3DJP2zWib/92/
BfSLHVj5Luokqb70AljTQm+Xto9zsXXwj7e+MwgvcQJ2AKoKCsnHjGWoP4YBgFqt
iX5mZ92CfQN3W7X3tyd+3ZezVZbHe0wKro9NMsTVxjUJAA1yOS194z3EJm1Gtkyb
vS7H50pc0e3op6A09f2TtfxIQdlb4HuEEP8tZ+XC4OYPQej+Xu3RQ/2fa1sskKHq
EeSNBnmZ+SbctHIfWnfkP59MerPwtgQdymo47CToO0lCDTwBeshzKEB1D/tg4VNX
d5IMy8exybM8A7KnkKp0s1t13XVzPuwpAXs1zBy2jwmM0LqHy6bqO3F1gI9uPjYR
IBX8GuSsH4ug0RQ5Vyr7rOsiewiIqXfZ/mYCSfVEK2/SoDMZ3NGN4qCctcfTgG3w
nGbQvMF2mbTo/wSiuANd0nr6JcVOapGxc7SCoB0frKd59OCzWnY=
=yD9p
-----END PGP SIGNATURE-----

--seCvDq5IsQrcGP7M--
