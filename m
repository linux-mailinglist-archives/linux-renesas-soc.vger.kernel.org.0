Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 638997A9DD3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Sep 2023 21:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230424AbjIUTtY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Sep 2023 15:49:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjIUTtJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Sep 2023 15:49:09 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDB8DD2577
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Sep 2023 12:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=087g
        b4mTJbMNzKHUdQuZSfdapJBPBScM7jHtuK+Uu54=; b=NJgp5ttHtqgaL4O+/YOy
        Jgp+PWSniP3c5btKFMU42uVEV4aeVi0mo6uootbKCvVx50vC8bVreOk5TO1BYS94
        RiWIqhIFYDCQ2cTKhcVjIUbTvdsm4uX4FODSvNjbqVmJ8tvg4w2Qky9gaIkjPVb4
        Qd/A7Frb4VifUAREGT6oKWszPQiYiDd3QKwF+2iDLED/MVEorYIZPGMMX+29xSF5
        6ZkGClspCAUDUZ1T71tIENlWj5tl1xAMgqiy9ABh79HuT4w3HiMs4R2NyyjWagKk
        ptSnhxexgmwBTYV83VKT73aLidiTd5wTg3CKwTfE0BPKZDMEfZJ+PFoTGyNYIYjD
        NA==
Received: (qmail 868390 invoked from network); 21 Sep 2023 09:59:40 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Sep 2023 09:59:40 +0200
X-UD-Smtp-Session: l3s3148p1@Tf7D39kFWJIujntX
Date:   Thu, 21 Sep 2023 09:59:40 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] clk: renesas: rcar-gen3: Extend SDn divider table
Message-ID: <ZQv37FcMHNTi6SIE@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20230919123722.2338932-1-dirk.behme@de.bosch.com>
 <ZQtY+NHFzFBWhrZj@shikoro>
 <7b93fb3b-378a-2c82-e5b8-428dd0b984e4@de.bosch.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="e7uS8NMr9QrDM4hF"
Content-Disposition: inline
In-Reply-To: <7b93fb3b-378a-2c82-e5b8-428dd0b984e4@de.bosch.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--e7uS8NMr9QrDM4hF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I was just wondering why this table includes STPnHCK? I mean, this is 'just'
> a translation table between the value read from the register to the divider
> (1, 2, 4, 8, 16)?

I thought this table was used both ways? Need to check, but can only do
later today.


--e7uS8NMr9QrDM4hF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUL9+gACgkQFA3kzBSg
KbZu2hAAjyzjdmjwuiv/sJcbPUUsMIWj0U+1yk8etZhsasE3wVoOW8fvx+avKtZr
8Yxx2gRN4KnmjeNDs2jVtP267qxWmvUJT3+Xit4TnWun+dXeDyXxRFLjdCS+QaNe
LqYHHgy3HQ5cC3PebuBe4j/rVQHHTo9E9GAIIHwUf1ob56/2JjG1bnrigd2Nw79P
XB8NFRFwGgwE+6di+7uer/wDTGd5kIVFfhnuSrjhtkcaFseCFdu7LFSKGfGPMHlq
cVvBPo5pHpuDtKfTYC053aLXmvqBftyznHPjIbxXKQG2N8JWdq+UoHPiAtKt+aH8
uLSFKDL+OaUUPS3W0100Qs9cNMcRn1t1LJCyUKnvtbUs7A23dYaEjLiAnGeYcGId
bbUFZicgPxICLvUXH9c8RADLnZKFzFZnEAKOM0itL5VGc1OJCaKQZerFDPXiR0vH
DFMQazAcsabKEZ1uc3WKnAA5lJ8jJWJAUHVsXsj523aqp2xw1pgR4DkwbIkgoFGV
JkA0V5yj0T8G/Ij/SXYUkX0IQ9oej74rmcq+GvMMOyaXcljHZTlL4AoQDpQ0YWP7
WzdZrmoiwiwHHkgzffA6KUXpvadwLNUR9CGl5f4/nz2cl6XutheLR2HgivlU870y
tHfcamSVyXN3x3+TWROFFOcPVhDyPdNxW7r821F/J+4cTuWpLBs=
=C130
-----END PGP SIGNATURE-----

--e7uS8NMr9QrDM4hF--
