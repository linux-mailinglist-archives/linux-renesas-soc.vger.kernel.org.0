Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4334B62CC55
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Nov 2022 22:10:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233057AbiKPVKg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Nov 2022 16:10:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbiKPVKf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Nov 2022 16:10:35 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BB0D24D
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Nov 2022 13:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=fUa0xlQjfOCGgnHkRMBKn+U9Td+9
        PUXIj5jpNURg59k=; b=Jooo5/9zyqauzuMjE9cv1HpLp8GQTjBIoofkkNsoN0KB
        siDg2HUJ844v/wmjVyUjUkGRVLpZldIUf7bTFost+5bFCR6ZrU/QOFjShQN7T05V
        TLMCOc9xGOltMVbzyUkPMX4nNuQQDpjHcJ5J0aqs8XG3dVJMmVDMZRYqhKECYe4=
Received: (qmail 943064 invoked from network); 16 Nov 2022 22:10:32 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Nov 2022 22:10:32 +0100
X-UD-Smtp-Session: l3s3148p1@zw8i55zt+LkgAQnoAFdaAHMtqXgc/sFu
Date:   Wed, 16 Nov 2022 22:10:31 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [RFC PATCH] clocksource/drivers/sh_cmt: access registers
 according to spec
Message-ID: <Y3VRx2fkhHzT8r6Q@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20221116202110.1770-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tIGpbQDIzYdV+IXO"
Content-Disposition: inline
In-Reply-To: <20221116202110.1770-1-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--tIGpbQDIzYdV+IXO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	if (ch->cmt->info->model > SH_CMT_16BIT)
> +		read_poll_timeout_atomic(sh_cmt_read_cmcsr, reg, !(reg & SH_CMT32_CMCSR_WRFLG),
> +					 1, cmcnt_delay, false, ch);

I should bail out here on timeouts.


--tIGpbQDIzYdV+IXO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmN1UccACgkQFA3kzBSg
KbbpMRAArHQYUPvxl0UDEIvQHs7fbvjZ1rXOnIjTVCOStieQlqgqW3CTH+eVMTXK
8P6dPRibpxBdOVzVD8y5oMMWhFzycG3xrYvCdBUKu8qRbK0bmbQgTQg0MMCr+CqC
YG1ipwTJu36OYXACwlSZ2gSoAVU3+RlGYoJ5M2sJqvvu+y9uIG9h14NLA83Meyag
aXae80gKY8Vr6rL+wadQVHi7ue0qYDf7H8zOfG48aFAoD1uajoR8A37bLwvMb3nX
a8OIep1FpgbzoZLHHJjhygvpXK3gGyjAew7SlXC1EvMFn7T25qEtgPQvShhwElT/
0tLfO/cbxBcX4iNniQB5JCKpKjMa9ThRsdapAYCxzMZ5u0s6bdWHG2H0qRGi9VJJ
QG/uYB1N02FWRInXmR0Cvq28RZjXUXUz9aUL27CRCNyHVmbm0JctTXSUFRZc4Bgy
/seZljgvx7tIZRRPrcUf63HBKZ+sbUoCRao1DQcSbqPldjRQGATGlrDrs2KaeESN
A/qEYjIshHKJSnzo574NLqp/h2+C5wl6irFla5YqpE8jw2vNRBUcYBYna+dPL2rS
G+FfZ6zz9xsKXWmQ/71mGQ5B5RsZLxIDHyMlSZsIzB3LA8PT9WRQFky9lxQB7Aur
ynq3rqmVKgWiZB6mAfyRaAXxbb1AmL1pf5DdlQ/RkZhhrIgj+Lg=
=leU8
-----END PGP SIGNATURE-----

--tIGpbQDIzYdV+IXO--
