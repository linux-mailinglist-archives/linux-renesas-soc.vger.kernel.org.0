Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD1FB4CA9C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2019 11:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726082AbfFTJVT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 Jun 2019 05:21:19 -0400
Received: from sauhun.de ([88.99.104.3]:39804 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725875AbfFTJVS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Jun 2019 05:21:18 -0400
Received: from localhost (p5486CFDE.dip0.t-ipconnect.de [84.134.207.222])
        by pokefinder.org (Postfix) with ESMTPSA id 92CB92C376D;
        Thu, 20 Jun 2019 11:21:16 +0200 (CEST)
Date:   Thu, 20 Jun 2019 11:21:16 +0200
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
Message-ID: <20190620092116.y7aqun6jjjn4mgow@katana>
References: <AM6PR10MB218184C8F2206024C6CB77EAFEE40@AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kqzhjyotn5nd6yyg"
Content-Disposition: inline
In-Reply-To: <AM6PR10MB218184C8F2206024C6CB77EAFEE40@AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--kqzhjyotn5nd6yyg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Is this a safety clause? What I mean is, shouldn't the hardware design make
> sure there are not two devices located on the same I2C bus with the same slave
> address?

It is more about preventing userspace to accidently access this address,
and thus the registers behind it.


--kqzhjyotn5nd6yyg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0LUAcACgkQFA3kzBSg
KbaCzA//bSm54R7HOZhp0THghBZ7DsE1wkpsGGfyCaIROm2ZmqG1STPmpRhj9+cH
gZyDJkOJKIE8LQvfsVWnAknbpE942cnbczOIzGFKRS0lQlP3uUe/maQez+PowuUM
0GQoofwDyF24w+jQX2a0QB0SwPmU+Yr1IIJb7fMvisiKo0YQ774sYSD3b+WBH5Vm
+3bU+9a1i5onSsCqu5zZ8fzJRQYr1WUFkOxRf+uzeBrltDwWvfxUrVJ7u6GF2uHs
1f/ilqDdw+ngQeGLV1kF9ppHwVIFxV8vMwoGR+B3vbufPXcQgfB4Cknshb1baU/K
k/2zUP6Q2gnbrWCapEQrGvh4adtqP6JGoPHV9UAj9ZH72qePER/DOJsQW9ZjN3m7
RRZb7gUoMZOhwr4CyBT4uZH4tf/CUvt08AIY9SjEX+SNRf742OZgUD1dJR5ajc29
q+yqG+9yruLb1Xsahe+k5Zz/0D4UEWZJ1wmIQVK+7Knue2sr2HZ1XTDS8EQOAUPh
rrIkkNXU+r23ZubT2FeSruG93BeN2MR+COQM0XanxemGiNmx2g1eQMa6wtnPbRXn
7qg4Den2vMQOkxk6mC0YTg8kRu6AgW+Koie/F8/IZbfmgOpIBLuV8AJAPWnNHIAM
RuAsOHKk8ip13B2p36wa8O2igBlTaK9d6lKwLl1AnF60y1IjOlM=
=cDU8
-----END PGP SIGNATURE-----

--kqzhjyotn5nd6yyg--
