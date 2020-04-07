Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05F671A0FE2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2020 17:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729365AbgDGPHQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Apr 2020 11:07:16 -0400
Received: from sauhun.de ([88.99.104.3]:54114 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728917AbgDGPHQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Apr 2020 11:07:16 -0400
Received: from localhost (p54B3320F.dip0.t-ipconnect.de [84.179.50.15])
        by pokefinder.org (Postfix) with ESMTPSA id 4289A2C07CD;
        Tue,  7 Apr 2020 17:07:14 +0200 (CEST)
Date:   Tue, 7 Apr 2020 17:07:13 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Subject: Re: [PATCH RFT 0/3] mmc: renesas_sdhi: improve TAP selection if all
 TAPs are good
Message-ID: <20200407150713.GC4308@ninjato>
References: <20200306093159.6155-1-wsa+renesas@sang-engineering.com>
 <TYAPR01MB4544095698FB020DD81FD2B9D8CF0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uh9ZiVrAOUUm9fzH"
Content-Disposition: inline
In-Reply-To: <TYAPR01MB4544095698FB020DD81FD2B9D8CF0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--uh9ZiVrAOUUm9fzH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Fortunately, I found such an 'all TAPs are good' case board (R-Car H3).
> So, I tested this patch series with update tap_cnt on patch 1/3.

Great find, Shimoda-san! I can confirm that my R-Car H3 ES2.0 board also
has all good TAPs. So, I will run some more tests before resending.

All the best!


--uh9ZiVrAOUUm9fzH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6MlyEACgkQFA3kzBSg
KbaUXQ//dTKmgiECdr/F8uZDzLaXfjCtOZih1ejidNPfrs8qmePSawrOsNQ5BEaN
Ab6bmoyI8cn2fTEbuxxM2mANrqWyVhEFGASpU/AjTjU13zKmjpAXKO0PP3CQXZXl
wES2K2eOtCnKc78XZvyh8wyz8MBIRl+QrqKa121n+ssZrDxtDHIxpgzKDuWNTAWp
+srxSFgr7XBvYRVIH1oifLhp7qbr6t3oasQxqqKvQ6PkGNb5DXNyBUxDueOveE/+
NRsQgBgOUPGF6I/BczuYmEHieFxhPZiogdr7BMLb9C7oO9xsmF3Hzo+b63GvegUl
NwFesM6kFsntSt54c4xewimZVu4v5ab00iqJZyFKrWbxkutYtknUuDaMBxhXvlkh
gBktvAyKPVA38752hlWwcrU52qj4mrPX6vDjX/3y+q9bvDLV7topPVzRtks5LPr0
P/o3svmygCuUEFMJnS4V3DU0bPfVaF+65n5qqoD+UtmWKwmPuA10FVKoPYeFGNZS
eE3tvcLDRY/z2UtfK0CNRg26xd0j9ekK77ECaxJhLPhnrrNcRxs/N5/SNMRZ1cnY
cLIYkChRtboBNiefrOXHa02AvQYlZViSi6DnreKrBLvjidf6HGPpT4mQTr5TGSww
ztjB7Wx1dNPo3ZVnZeuja6ECL1EawAAbwq/qum6E9NQqL4fDabk=
=jeM1
-----END PGP SIGNATURE-----

--uh9ZiVrAOUUm9fzH--
