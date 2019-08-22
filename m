Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F6CE98FCA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2019 11:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731321AbfHVJf7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Aug 2019 05:35:59 -0400
Received: from sauhun.de ([88.99.104.3]:57998 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725987AbfHVJf7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Aug 2019 05:35:59 -0400
Received: from localhost (p54B3343F.dip0.t-ipconnect.de [84.179.52.63])
        by pokefinder.org (Postfix) with ESMTPSA id D54622C2686;
        Thu, 22 Aug 2019 11:35:56 +0200 (CEST)
Date:   Thu, 22 Aug 2019 11:35:56 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        ulf.hansson@linaro.org, hch@lst.de, m.szyprowski@samsung.com,
        robin.murphy@arm.com, joro@8bytes.org,
        wsa+renesas@sang-engineering.com, linux-mmc@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-block@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v9 3/5] block: sort headers on blk-setting.c
Message-ID: <20190822093556.ludte2vtp77fiaax@katana>
References: <1564129876-28261-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1564129876-28261-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190816195026.GC6886@kunai>
 <6ed6c62d-d773-71ec-382b-acd850e3dff1@kernel.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kgj75bivo7t7ncfe"
Content-Disposition: inline
In-Reply-To: <6ed6c62d-d773-71ec-382b-acd850e3dff1@kernel.dk>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--kgj75bivo7t7ncfe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jens,

thanks for the feedback.

> Please just drop this patch.

OK, we will do. And patch 4/5? Is it OK or do you need some more time to
think about it?

Regards,

   Wolfram


--kgj75bivo7t7ncfe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1eYfcACgkQFA3kzBSg
KbaLww/+Ke0gLqx1XCJqev3VRm9mm9T+lYoT5L7RlOSw7vRIZSGbZ5TtRLZvKmsY
Kec20o8ozIAuXKsYsOZ3TC2sMh+ntcnP+Gaadoj0pSB3APqT/KdCae9q31zL5DV5
JoJUfQs9OKhNT1kiQgSa3lkZdOsFheB0k1e8l0lnZJOga68dRFcOA57Vx0vFm5UC
dobMpbGoF/aLRfF7rPOdGGy1kZ+8L1+TVLrK97YTlHFrrSlAT2l4HBHAn0gCUOxD
7naLN2w4PQ1fLHVfEAZQHp5wg1XTYjyBIHj3hafLdvxXFtJZmlZDKQ+cTMFD9Ht1
EKW18HKFyUhzrdBgmOlizxqybL5lOpJhFXXE9KZsFVgpbKW6+WtPpzmRk02UagF0
N5zPf7TqQLWzUzxDT9zR4baTy074i+Oazzv5ur9GTCk48JFLdtTNhW4BXCj55ksZ
lkYmbKBNxfI6V8rZn9zhJNJAXAi9Vq6mHJnTLfIHIvcTT2uWJ67Mg8kbB5I9NJ4K
APmuIvXoss/cgXllOwkUZO7A6Z4HCbAS4H5M5seSqJ3DBf4wN0DR6ihOlktho0vz
LTsI5Kqi65RZbtJFfLWmHp2HhHEJbt8zZqvrTivv9uv23lS3tfKLzHReTSW5yJIa
d40nFCayfsQPfE2+FqK49Nvw4KBcH7q0TtUhwsb4is/iHnV/Nvc=
=QW4f
-----END PGP SIGNATURE-----

--kgj75bivo7t7ncfe--
