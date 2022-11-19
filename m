Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4060A631145
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 19 Nov 2022 23:44:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234388AbiKSWod (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 19 Nov 2022 17:44:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234334AbiKSWob (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 Nov 2022 17:44:31 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E520163CD
        for <linux-renesas-soc@vger.kernel.org>; Sat, 19 Nov 2022 14:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=9KV/ATGJOkdbzEXi4+T3DvrEbHa8
        PoK+LCgqMeoP1og=; b=oLCplOO6ehH5B5CO0wkl6PqYCq5N2Jya0UBezm4E77Cz
        UcPXGeABzqcG2QaUa9jbtcXmLQih8xKWqeP35h8h4nBcQ1vJRK4fjdgSuwDCHaR8
        ugVdVK/EgZ5H6EcjgEbcBJT/LIUSCZpw/1kOAnnr4xhSgqkGz9UbmK0FLnjWyTk=
Received: (qmail 2336455 invoked from network); 19 Nov 2022 23:44:28 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Nov 2022 23:44:28 +0100
X-UD-Smtp-Session: l3s3148p1@il6UkNrtUI9ehh99
Date:   Sat, 19 Nov 2022 23:44:27 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 0/2] mmc: renesas_sdhi: upport better HS400 reset from BSP
Message-ID: <Y3lcS2hSJp/Qr7aX@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20221118214556.81763-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FO7RVPPs+92L+Ea7"
Content-Disposition: inline
In-Reply-To: <20221118214556.81763-1-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--FO7RVPPs+92L+Ea7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 18, 2022 at 10:45:54PM +0100, Wolfram Sang wrote:
> This small series upports a BSP improvement in a refactored way. The

Please discard this series. I want to upport another BSP fix, but I need
all patches in a specific order to ease backporting. I'll send a new
series on Monday latest.


--FO7RVPPs+92L+Ea7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmN5XEcACgkQFA3kzBSg
KbYVMBAAqQP2KR/N4kKTKIqC2pf8rZ43K83HUfj7r4V9K+52Jf1GVFTls/Ra4i/G
GBAPYG16lRNDTaaEfi45V9fNqJcSwjTbd1iwLbiVNQC7YhNNVK6529kXhqt5pAVJ
It2V7tqq3GABHUdW3ZzfQHgaQ1+ctyGacZdghnNSrzhf8oE2MusFsl6C6Q0VWn/R
K+LM2+p2EZuNAgtQOMoMi7aGGzUycFPn3LtOGNO6mxsjw2be/CJdVhI3+seUnnek
WAaX2VQ9Gz7aFCNLKs/hD4wrsW7NkEm9vieOEQSSbsSO0cuKuJVfP6c7hmK8vBEi
tIzWZiMM0vtHFRSH4EgpI5XtrYkS7XeKe2yPRdbmaSTgxsvRSeTLrh9V2VIuK4cR
80Ds5bGnKsQM1BCgSFhWp1J1jyWvTg8rTVay+490eWRtNgJiVBi6E49Fcvz9oKVp
MoSQj/XqCHDmLQNFkbKd5EgiurqFsW8tA32XCbHNUTL4r/aMpxKvuU+WsV2dLqwU
Twefiibs5FJ2UjcYp9J+4ns3NZoIoV7Khm3c2/pdOWv2LaG3BOgC0UrAOWd17cub
9r0Q1wi+ecvDSt0twP549bu9pRKWcWv3EnZaVtxwdHwTOK8S3KLL5SvN/+F1RcLx
LRbd25FQghWAiqNuRRAHMerV8bTh2PdzS3whWpGHVaKQhkCA9mI=
=aYy8
-----END PGP SIGNATURE-----

--FO7RVPPs+92L+Ea7--
