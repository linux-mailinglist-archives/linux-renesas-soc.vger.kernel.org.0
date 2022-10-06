Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44F775F6AA2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Oct 2022 17:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231756AbiJFPc0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Oct 2022 11:32:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231704AbiJFPcZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Oct 2022 11:32:25 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 727DAAA3D3
        for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Oct 2022 08:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=cFD/xLry0Pxd4fynjE1yyONd4E3D
        KwizQqwFqe/erGY=; b=IB6D1uxHJQjwOVPCqjsEEXuLWiyzNCabOi6yY6tIPvUq
        LP0QtoQOTFc2Koirw0HuEZSjCXY5Uo6MXfRCh9/AbT0jkwdsfxtBhA4lvF8bJoKf
        eoEEQdScfsG79hA+fPx1R0flG35m9fwLtK47DF/mTZTR6rIDrRUiqnrWXKsXqik=
Received: (qmail 1409361 invoked from network); 6 Oct 2022 17:32:20 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Oct 2022 17:32:20 +0200
X-UD-Smtp-Session: l3s3148p1@c1n6ZV/qhMAgAwDPXwlMAISApcxVU0Og
Date:   Thu, 6 Oct 2022 17:32:17 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5] mmc: renesas_sdhi: Fix rounding errors
Message-ID: <Yz71AT6MbgrTPP6X@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20220928110755.849275-1-biju.das.jz@bp.renesas.com>
 <Yzsb7SCkNDyCghLg@shikoro>
 <CAPDyKFpkfr9Rtrz6DF1zYxEypTYqyJyRsTyxHToBJu+1AFB+Hg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fAL7s1c1Xymqqk3+"
Content-Disposition: inline
In-Reply-To: <CAPDyKFpkfr9Rtrz6DF1zYxEypTYqyJyRsTyxHToBJu+1AFB+Hg@mail.gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--fAL7s1c1Xymqqk3+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Or is this just a general bugfix that we should tag for stable?

I'd think this because I assume there is no commit causing the rounding
errors. But maybe Biju has something to add?


--fAL7s1c1Xymqqk3+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM+9PwACgkQFA3kzBSg
KbYnBw//ejuglcHhitnZtG+LmWZBhCet+K6pRcZEfwyDRzU1k5E7E7WJJjE6V93b
YcnEZCBiBMaP22gMReIvkY6GCoyuUOOLzD7olDvTWvlhXArsp34V/6Q5Bp0YV/lv
+RRcq6QEcu+x3psvSUm+jIVTQCNlSN54zOQLmk6ZQ7d215LKpL7A5E52xdAgmTvU
0oBl/33lbGqWNE/STra1NwdGoNx9bthY2i8OZ8LOWtr4KNw7+nZe5+PLgkHWQgtF
HY52IaJ/oKumEYAhjsH6T3LXfncs3tIIjut08XNBUcv3USOPihio+YvIlVpSOyNA
KXREd8cDnluoYJM41kpfVOW9JtDlC6i14vgsMoBOqTQBe2+VmreA55asjoofCLX8
PZ6/8eWBuMZc8TK0X9mxuzNvq9GXZ5XHzyR30VLFJDV/tfPOYUBtyAZ6tPAKvW52
9kn8atQ3VLxs6nl7sAGdkVVkp0db2MnA5Ln8x0rEU4H6rkQzmqPO9SVuL+vHKmsi
NZDz7byiKXVdIlApZkIvIy9NslCl6ydlm1XicWdr8u9cqayj0Xz8iWvl2A809vij
Gm1sSjFCnkGgLRcC/VU+EqEpHfn4Hsbo7e9/0vWpLy2dnh7B0UVEYYYoHOSJfrH0
DAZSsIti9kAHWHmexD1GWcpTW2jNeDnGJkzQLeYzyfzdQU68QyM=
=tnpi
-----END PGP SIGNATURE-----

--fAL7s1c1Xymqqk3+--
