Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D055F7188B9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 May 2023 19:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbjEaRpx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 May 2023 13:45:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbjEaRpw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 May 2023 13:45:52 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D15E125
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 May 2023 10:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=xF1jrHpWgyLAM1RX5JSvaFDq0uwM
        8e1tGnw3GIAbOiI=; b=sLpYVlpczUnYulcUUEIPuoHjKVJF6Pg3hm7waq4JDbwp
        rCWYeo+G/Ae67PvaRwN9TKfWFTKVl9dqePm7qgV8WQkPiKVDQxB6tOlxdb/GYA45
        M7wDFRrfCIzIjRHMZAuV5lStp4RkxX3e0PKdboNKd/BI32+hCPOdz7Q5Lp43JSk=
Received: (qmail 1368689 invoked from network); 31 May 2023 19:45:47 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 May 2023 19:45:47 +0200
X-UD-Smtp-Session: l3s3148p1@qWGc4wD9/qkgAQnoAERNAL3mZPR+E0tc
Date:   Wed, 31 May 2023 19:45:43 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [RFC/RFT PATCH] mmc: renesas_sdhi: add delay between tuning cmds
Message-ID: <ZHeHx/rUE7ORf3V2@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Adam Ford <aford173@gmail.com>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20230531070049.11806-1-wsa+renesas@sang-engineering.com>
 <CAHCN7xJxROk6RU66PjbGH4M-R7PbUG-4y_2BHyCeGx_hTeUprw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="knJbNpSJI6xAqFWd"
Content-Disposition: inline
In-Reply-To: <CAHCN7xJxROk6RU66PjbGH4M-R7PbUG-4y_2BHyCeGx_hTeUprw@mail.gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--knJbNpSJI6xAqFWd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I am testing this on a 5.10 kernel based on the Renesas RZ linux
> kernel branch.  The good news is that the card doesn't hang like it
> used to on the older 4.19 kernel, but it still does not enumerate to
> SDR104 speeds.

U-Boot has a 1ms delay. Could you increase the delay to 1ms, please?


--knJbNpSJI6xAqFWd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmR3h8MACgkQFA3kzBSg
KbYNiw//a5P0UPzI3zvtaPnylNH9BRkP1I07YMSZ6uecyJ5xOcYXzACnbiDdThMM
UcErWBUQ+MWQFvLbj8IHKOtWLfU6sAFjv++/+m+RZQpsJeDYH7l7kYC9grGL7HGq
drlhT948fIq6ANw28oRGEiJCCZRilkfsfTiiYPTpzXtjsur30MyHPkVRSlGNbwiv
l40buWzhdulQwXueAFfNPdMFmnBusB0ONIlm2z0XGUgu8nuAEUlETBXN+/Ju0hb0
8m5D8jYt0Trhg9cOvpSeg98bs8lyL6aUrBaoVHquwhsjSCjVk3fnlMf3bQb7j6Pp
bCc2OLOVQxqa9lhZ+ArnK8EYAxCgjT+bUTwvRcAl1bI1Foava1yk5+nto9o+ljAO
Dkvca+drtCDZFlAoZfW2DhamVRZZMOnl3OEyXrrOtjIY35tZXGLFQ2xrumVuYjs1
vLyKWMMtJDhFANj5z5tW92QnE8gg4FW5VHwspfra68d6qZgjISlkKzgHVsmdz2b0
spc8/KMwU2yC189L3HkkxKUWMnMT9jUB2+0SSs+RjEJ9jhurUDF2M3OORQm5FrkU
972VFjLFMGTeeS5dv89at9MEHyEVCIeYdXKAJMLljPlLeUtzj+BPvW8A4mBDEFxd
96MYKUU+7NHawJK2O31U0qAU7XuV+IfickAwHxr8FvxyLJPXBmA=
=TLvS
-----END PGP SIGNATURE-----

--knJbNpSJI6xAqFWd--
