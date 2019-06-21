Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8B7C4E591
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 12:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbfFUKKC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 06:10:02 -0400
Received: from sauhun.de ([88.99.104.3]:51526 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726299AbfFUKKB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 06:10:01 -0400
Received: from localhost (p5486CF54.dip0.t-ipconnect.de [84.134.207.84])
        by pokefinder.org (Postfix) with ESMTPSA id 746702C077A;
        Fri, 21 Jun 2019 12:09:59 +0200 (CEST)
Date:   Fri, 21 Jun 2019 12:09:59 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Steve Twiss <stwiss.opensource@diasemi.com>
Cc:     "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "kieran.bingham+renesas@ideasonboard.com" 
        <kieran.bingham+renesas@ideasonboard.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "peda@axentia.se" <peda@axentia.se>,
        Support Opensource <Support.Opensource@diasemi.com>
Subject: Re: [PATCH] mfd: da9063: occupy second I2C address, too
Message-ID: <20190621100959.GA2568@kunai>
References: <AM6PR10MB218184C8F2206024C6CB77EAFEE40@AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM>
 <20190620092116.y7aqun6jjjn4mgow@katana>
 <AM6PR10MB218134CDB4ECB0A9534B6B96FEE70@AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline
In-Reply-To: <AM6PR10MB218134CDB4ECB0A9534B6B96FEE70@AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> For what it's worth, maybe consider adding a dev_warn attached to the return
> of devm_i2c_new_dummy_device?

I am in the middle of some API changes. Once those are over, I want to
think about such warnings as a second step. I'd rather have them in the
core than in each and every driver. But this needs more thinking...


--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0MrPIACgkQFA3kzBSg
KbYm4Q/9H7oGk9dvSws93hBTXQq8GGkBg3/iP/rzVeOpHfHb4ar4v/SDUvWJUT4E
dF3wlzG6GmtyBzqu1HFEtgTk2fLb3SM6WTqllb8mGlHkSvt3IGbgmSZ1MOZD5F1w
GrdFTT0scnTlehuxQLAHoHXBwSn8mkPBxCQuyoylyOYcgSpUVoZ/GiuSay3f2LRu
fe8V/FH8VlOYLVjcHD+TjpeIgmww8FhkUZa6Lq5SM8mLT51B4oMswJMSnnWkXCcC
a8oHMpObhBoY7wuPqWDcpW8VdMHshpKUZm2aU6Rd8QNuLf1FzPd5aMVVlr0rl/k7
keeRT+zsI8ARe5pDampkPVbCeRLRWhDLMgZDu+AxV5dJ5YuJysO6xlk0R0k8jKRZ
bGCqlqEqhPPnw0oJlVvOiBZNaGIMmSvjf/vg4VkOFUvkB+xext7KJwUF0kMT2u9O
7uP8AtnUNYp2pgzAiFJAKGWv+9o0PGBJNRKvNUwCuOjyT6l22dgsrI+nEGhybfcO
zOiEaydo4Buq9IphDWGW5kMoEpvUC8V4Giq3mhnnMt+PxdcGAgh2Y4QiVqGush/U
dltqDxZ1oO+/d6FYArYcmjvAQD0ICQElAMSNJnQxuOPh43OPYn+J8AKSANLtOr2b
cde3kVi8+eJU+J0tYPn5qDQzAT/KkfknHdDrxJNe78xyDvGkHus=
=BnpT
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
