Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D6FA451E16
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Nov 2021 01:32:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345711AbhKPAd6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Nov 2021 19:33:58 -0500
Received: from www.zeus03.de ([194.117.254.33]:35260 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345202AbhKOT1v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Nov 2021 14:27:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=Y2JiVanJ7s0pY1QA31psPPSh9JMJ
        rsrYBMRBfkm56a4=; b=wXjmKqCkgYb0YBtKSHe6TlaZ3lxRy/vQYOPkuFdGYvGh
        0WSrC4bf1ZKbR33VEyh0iQhx1bg5yIx3jHNwCAnm4El69gaHOq67rkAMqcdNGoFY
        YY1R9ANsgRx4N+O2haoN6SPvz48mWJvNnqgH5h60DKowqkmY7DRXSWpABU54LzU=
Received: (qmail 2448756 invoked from network); 15 Nov 2021 20:24:52 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Nov 2021 20:24:52 +0100
X-UD-Smtp-Session: l3s3148p1@bdb+wtjQIuIgAwDPXwfBALyiinaC5TBu
Date:   Mon, 15 Nov 2021 20:24:46 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v3] dt-bindings: mmc: renesas,sdhi: add optional SDnH
 clock
Message-ID: <YZKz/ptgPfzqGfeq@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
References: <20211115160600.4455-1-wsa+renesas@sang-engineering.com>
 <OS0PR01MB59220D97CD59F44918DE4FA586989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YeVVO4yRUGN36Suk"
Content-Disposition: inline
In-Reply-To: <OS0PR01MB59220D97CD59F44918DE4FA586989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--YeVVO4yRUGN36Suk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +      if:
> > +        properties:
> > +          compatible:
> > +            contains:
> > +              enum:
> > +                - renesas,rcar-gen2-sdhi
> > +                - renesas,rcar-gen3-sdhi
>=20
> What about RZ/G2L, as it has 4 clocks?

They are a few lines above this in a seperate block if I am not
confusing the SoC numbering.


--YeVVO4yRUGN36Suk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGSs/oACgkQFA3kzBSg
KbbVYw/+PwUy3kevClvDMdTD+Og9gc1Uw/+QH8PriE+iQCnxQNCVIZlPvbjO5aF/
9OVn5L6kYdJQBdB1iHWw7cIgEB9fMAZlM5k6KEBBAqu0hCqgi5R6Zr4LadWEnVZu
b0mV0vipLd7B4SQG91AJjsVThAtZbEk6J/tXqpsLY2lq8IoPIHn0zMPO98OWgFz3
w52O48GCk1M+yTGyrFb7bGOLWVI2QjROTZ7KyGEjICy8p01hnLiIB8gT7IuTMdgc
ORjecHJlcp+Ia3M3ABo9PG6KQJjiIdNMxGR5+9RyxoNGx+hTHAlcaKp9yuweI142
oOv5XfPawOi/iXVnqSKSgK/P9cAqGz0efVMKfEOlAJMUs3N3RwIQQGROtCQvutjm
1UVS+KEcywi4a3C4MpG0CnOhjBnoBvPhvAhbIyoPxlYCvpw+p7sWdpmmiUUqj5K5
kqmOqoGM0HhNuhqlI88Up4O+KxCd5tfavP8cfxPoSoQPjNire1omlGNtvzn40zUV
LYw5fvpNoYZkE02JMQWLabVXRaBbrDe4b8ptqF2qH9yEdIad+Jlj5wV83mprBqFu
wupD5Xaf9vBOC+1xXBkUHkyxHJod9islkvQ9NSgrAmxHc0w9SPKyhb/tXROQ5JOd
i8hmoFKRPxbZcTSNOrklJ/crDILg/HhjoQ7plwvrvdexZxOxHo4=
=I8Zj
-----END PGP SIGNATURE-----

--YeVVO4yRUGN36Suk--
