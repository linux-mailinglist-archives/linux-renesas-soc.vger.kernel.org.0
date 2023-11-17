Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05C357EF74A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Nov 2023 19:00:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbjKQSAr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Nov 2023 13:00:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbjKQSAr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Nov 2023 13:00:47 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E281E5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Nov 2023 10:00:44 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97FA2C433C7;
        Fri, 17 Nov 2023 18:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1700244043;
        bh=eynEyaIBuBjrQ9oV+nUoN0qckQ3uiEKGSHNnU5itV5I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IOTlh1Q0XCTve//I0Sj4kg53qMqlmOCyaiJuQK23mdayrxtXuAOKKqgKULaZfxboF
         FH4vbWmv8SLmye9nnZH7z4iPgo0KydVklkelojt7cl9Pd0aAEXLohX7t97iIV6yZh3
         6h4Q8FzHo6DS7oG9H9PFLwy1xk0vRZiz73Mg5ttzQ49YIzVzkF1F+mhmsF6Css7/e6
         mJQX+qE277mNJRZsmQRVt67mqKMDWB0ksmGtwVKHC/yvztt/1G7zQzNSqpDhKeEnuV
         fhxFv/4iVQUJeK62eQMaw/+2iaM8uecbiblXPi9ell3o4UAWMPHMinluUnymf9ObIV
         ZWBk2Qw4sq5Tw==
Date:   Fri, 17 Nov 2023 13:00:42 -0500
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
Message-ID: <ZVeqSsfBEMsQ+8mP@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20231117164332.354443-1-niklas.soderlund+renesas@ragnatech.se>
 <20231117164332.354443-5-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Zq3oPg4x7Dpv6xMo"
Content-Disposition: inline
In-Reply-To: <20231117164332.354443-5-niklas.soderlund+renesas@ragnatech.se>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--Zq3oPg4x7Dpv6xMo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +#define RCAR_GEN4_PTP_CLOCK_V4H		PTPTIVC_INIT_200MHZ

Is this easier right now or could it be added together with the TSN
driver?


--Zq3oPg4x7Dpv6xMo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmVXqkoACgkQFA3kzBSg
KbaxGRAAojviuZlYStFvXIXsit/RonbMs93nxW8SWEv/dZJkd5nmzNUkvV6sjQmO
gHtNfVEc2bsO+fBnJJh5C8V2HniTBSRCzauDiaZsguJAX3XCu7RDcdH1o8Zimvy2
zNXhvCNgxQGWCGRbk6Bce6aGNDXwYDZQe2v1n40ioCNIC/6twS4C3wwgul6qZ0ey
GoQ6dA6nwMLdn7lA3EoNNpv7eWYwMTH5Zc5x848mKGboENMYasiwwE3C+DhRN5yI
8E+F2o1EQfFNugZrtEuBTtva7cf4vzqMGJD+Aa9hGKcYfN7/washOk9fs4SBz5sX
DRTMV1pDQ7MUhNEERgfKn23q4VIqQ0Z0ECq4dw6n5ekDjXuz1/H2ShmWMZxf8ddR
yRGtWZNfob21zu6OEjvQFc3/SwhsPwpKO0ADeLmgvAgv+c+TxS/dyzOho+3m2l5U
1CosIucpPk+pJ5oUo3FyYGmIYwvDJQMIPmLstlpK5pypkqROKwLeGlG03oM8Yaes
YeZL1oguaOe9Rz/6/TPhHRqGMPOLUVNrgm5Bv64fX0PGfe2/rgXJN5Q30YahEviO
Va1RjPJHuXOpaa5jVt+83LS8zQTaemFdVwFyeh1i5l24FIZMOF2novSMjtmoVY6v
Z1VJIxCBDlgv1gchBBo86fqrDzx1A2ir1tHRv6gvw5vzch1Qi8c=
=KSSV
-----END PGP SIGNATURE-----

--Zq3oPg4x7Dpv6xMo--
