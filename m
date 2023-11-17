Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46AB07EFA8A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Nov 2023 22:25:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235787AbjKQVZI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Nov 2023 16:25:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235819AbjKQVYv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Nov 2023 16:24:51 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 127FC1BD9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Nov 2023 13:22:00 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F4DAC433C9;
        Fri, 17 Nov 2023 21:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1700256102;
        bh=R1SydD41aTF9AzGFrOUtAlS1/Bcr1NLr5O1fgAKhXvc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=F3eItnnHNgeJZodZWS8WZkxcs20jv8535KJ6Dq+xBVsj7HfggMKSIAPX8rqc0RmDQ
         0dj5/e8xqZEN936yWKj8WR+3yBiveRAhjqaefNfFLyaMGy8ixHp2DGYtrLZE3pYoqG
         DQTTcZvRXQD0htyNWE/8461UxdEYED1aVyg9L9HXYn9clEQDb2ojJALKhY17d9vaVs
         u58WlmrMiqdoOGG60uPyAeyEZ1Co3PnLzN9qMBib1QCGWNG++Np0Uf5LqgiMJZpwhH
         ciEvUrmCwRl5cd3S1ZepE/WAhe2z4MfEKRiPxH4fMWGKL1YaJC9R2FfQC200DxxJjk
         RnMn2Vor3m5rw==
Date:   Fri, 17 Nov 2023 16:21:37 -0500
From:   Wolfram Sang <wsa@kernel.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Richard Cochran <richardcochran@gmail.com>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 4/5] net: ethernet: renesas: rcar_gen4_ptp: Add V4H
 clock setting
Message-ID: <ZVfZYUd3Ov24nlXJ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20231117164332.354443-1-niklas.soderlund+renesas@ragnatech.se>
 <20231117164332.354443-5-niklas.soderlund+renesas@ragnatech.se>
 <ZVeqSsfBEMsQ+8mP@shikoro>
 <ZVe2PJVQVZgKSFuE@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ssBge7LyC9GSR782"
Content-Disposition: inline
In-Reply-To: <ZVe2PJVQVZgKSFuE@oden.dyn.berto.se>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--ssBge7LyC9GSR782
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I could not make up my mind, I think ether is fine. I opted to put it in=
=20
> this series to group all gPTP changes in one series. If you think it's=20
> better moved to the upcoming TSN series I can move it there.

No, I also think either is fine.


--ssBge7LyC9GSR782
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmVX2V4ACgkQFA3kzBSg
Kba1sQ/+OmGENg404mz7lxBdaB+dy/yqn5WXyBEJu41FKiWx8PhRnr0ebHW0LaXW
AlQ/7tRd2ZQIEnNolkv7wO+xc7XUFtio9oAuKnq3ECHJvgk7UlqFB+h2q/4eZvNG
ON2WkibWDnzUAUqlbIvHukwLbDqxQiZl1F9krHgWK9Q5KMKdHGCDs3SYTidQZzXD
BKiy3l5sUkY4LbGW5wKREHSbto1XemHcPgFat7FT4K7ugSBT6BusZ9pS14WuLSfF
Civ8HuUHI9sCELG0mcysdy4JnILUQLHEfYuJNf6eoKCPpNuwX7f25LYfP79o/SX7
R7DdBAw3337ZnZrLEalCMPS1tmJJBbYppuwTVB3pFVH6Q9r5C2BoONd83RMV+hLz
+TNm1fZu7/DvAutHtYuqDsH1mGbgUO5tE/w+7M4CDt8O3ELJr9sKj9jWoYGjhQCC
XCoPWRj3wa9b+tIkECqORNR3j1z9g6EvGIVzLFVLgNXwBtF1QajsV7og3VMLIdNX
fWjkgTC9mGgoID/4BunTc8ONv8WK+P2o49A5DLA1qUeMyCw6GMBfShdzSUjLD/x5
7YuQXLUNbfRPc7es67JXRN72SbYbEAaPxu1WNpps6xDrywwpbY5stNpus6ClMIfQ
Gt/nULtO5wmcXer2lnIxfH6lMhtUFVJfCESwtYUYI+1+UV92ceY=
=twPK
-----END PGP SIGNATURE-----

--ssBge7LyC9GSR782--
