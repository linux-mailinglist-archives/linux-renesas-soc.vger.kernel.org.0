Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81DE155F699
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jun 2022 08:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231477AbiF2Gb5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jun 2022 02:31:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbiF2Gb4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 02:31:56 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB0F2AC78
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jun 2022 23:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=hvu4JV+IzrFFn6nlVRyMO/j1qSaQ
        zB2n/0C935jNYcw=; b=SoURPRK1UcfLh4UVFwliAh+idUXCsRev/3djMVnIkIaL
        EKmUsV2YqFHbGhEFwyYHH4NdnKVhBC9QzdlaffZn1z1PL7DcN/woLZUAba5WyUFy
        O2wmKSX7uNOzh2Uj1z4qsQGvItFiCo6NEe3xcMO4E836RtXH5hD/MEhEJPabf1Q=
Received: (qmail 3149332 invoked from network); 29 Jun 2022 08:31:51 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jun 2022 08:31:51 +0200
X-UD-Smtp-Session: l3s3148p1@RYuqTpDifzhZD+57
Date:   Wed, 29 Jun 2022 08:31:46 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC PATCH] arm64: dts: renesas: ebisu: add port node to ak4613
Message-ID: <Yrvx0qRDf5V4C7jj@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20220628122330.28323-1-wsa+renesas@sang-engineering.com>
 <87v8skjp8f.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JTsY6+Egc3r1lQX4"
Content-Disposition: inline
In-Reply-To: <87v8skjp8f.wl-kuninori.morimoto.gx@renesas.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--JTsY6+Egc3r1lQX4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Morimoto-san,

> Thank you for contacting me,
> and sorry for my bug.

No worries, bugs happen all the time to all of us.

> Could you try this patch ?

Thank you! It works \o/

> It should goto linus tree, but it seems not yet ??

It is also not in renesas-drivers, this is why I am still seeing this
issue. Now I know.

> Thank you for your help !!

Thank YOU! :D

All the best,

   Wolfram

--JTsY6+Egc3r1lQX4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmK78c0ACgkQFA3kzBSg
KbYe4Q/9FjYqV+xMoqWi2oUSNu+ZdT2hNKq60ISt6LHv7e20vPjA1acW4B3N7hLN
SmXOGw2sN94+0VyXnFEQ69dn5ww6xomyNc6Rynb2G1xyl+Ryg3gsiTLekVFr2Frn
dO37Mri3H4yL0zpEiY0iKS2vB8qzXPg/p6Of4yNmIRZcEVTFoqmbMRuQj0u2zjTR
/jMbuDcSTuO0WwY8+IoK1YuWetUVlVKNak9ISPlHitlJdWFsfPWYrYYnYujtRWmv
K8Uy8OZr3iHSpa0JQ7wmn2WmFsyu+VVKm1TqMKqTHq7yC7gCXu66oDx2RTm8+uGS
FUlnHmpz9GvxqLRZZ1sFREN5NPKcpYtsFa/sfozzIfx6C7NtLaN900iJeAK1UwWi
94gAowxMOnZP6vZ8IiZmGXVSMmrojcFGF+1Hk43diVjcFdx96pkEeL0Utx9iUG+X
RBk43EbSQBd/cKKLDQ8rSis7Nj9IXDabA3FIRCYvpz46aYqD8xOBU+7NCfgpGtYB
1ksZkIcZ2xbwMXR3n4qvjMqlofikmS41qStsM1ZuuN2xfm69JFogd4GYum761Nyd
wUTo6US1LR4iFr2HvAkzMJ0aKf2zMrmXgBq/Hvi8JIWOkJEtyZFtTxisNiUvliHk
wHJnYJZYbgME1b6buvHkfMmMRnZLrn6l9g9cUk6l46bRb3jX18I=
=S3J/
-----END PGP SIGNATURE-----

--JTsY6+Egc3r1lQX4--
