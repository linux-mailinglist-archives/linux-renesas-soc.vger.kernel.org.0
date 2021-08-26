Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C5DD3F8A1C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Aug 2021 16:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242737AbhHZOcE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Aug 2021 10:32:04 -0400
Received: from www.zeus03.de ([194.117.254.33]:45692 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232876AbhHZOcE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Aug 2021 10:32:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=vJ6mmy9vl/JGliu2Of4KbV2RaZmv
        RaSbtwml9YLcEgA=; b=Kc4Mjq18m6zQfmkrp3EGt7aP3voUh9oKKQ+Ds6XcC8lN
        sLdRRqpRF3MphQoBr9vHOXgMnQyZutZHPMYeEtOIrCFQdptsXztXAFh4j7tDy+Aq
        tU7J0dgndI83tDUorSNZNbJJV34IiVDoJ3lNyBXiUEGGTNv7FQhAATEicik6PVY=
Received: (qmail 1035284 invoked from network); 26 Aug 2021 16:31:14 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Aug 2021 16:31:14 +0200
X-UD-Smtp-Session: l3s3148p1@UcAVOHfKXrggARa4RSUSAccDwLt/uLTb
Date:   Thu, 26 Aug 2021 16:31:14 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: fix regression with hard reset on old
 SDHIs
Message-ID: <YSelsjPyswWCr7Nu@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20210826082107.47299-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdUXc0oSCXJ-5QmPJz0VkX1Aib+ZAv8K2LN_fT1+5mocqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zb4ir3T8GEvSKJdn"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUXc0oSCXJ-5QmPJz0VkX1Aib+ZAv8K2LN_fT1+5mocqw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--zb4ir3T8GEvSKJdn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks a ton for testing, Geert!

Ulf, any chance to get this into 5.14?


--zb4ir3T8GEvSKJdn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEnpa4ACgkQFA3kzBSg
KbbENQ//TD7pg5eFYvRe1cFp5hM+uaItZ43Vx8N00BGD0ubk29lGNu2RxN3ZN3X7
N0UQoivlR67wGpm7BWMcxzAi5J47MHNCNXCDl5JNg6N9H/1g+pvqxAddq11dxURY
7MtAO/YPTp67Ym6/NojM04WGeaQd7+S2J6554kIxG4rksSMMpQzT00+VGjIWzNc5
K9CmeJRIXPATcVNFZETWH4kmSNOxX2w2j599qJsZZNoO82PZaYo9LTNEnVvuRdXq
lhzBaBc9Mu95MTSi/Yst84brSNGB90llYWpFf5HRCE9DBJ9WTrsVY0ghHkd14/TC
UdtEXZ2oqpaN7V1HqIJVHUzIpnnI7JVqlMyhtAntKIxay5y4aRfkli3dnUNSjzEe
YwZg6HCTZyHYfVMSn8mW2NQF72WjcTyl/JL4l4EZDwnXpxDF1kXp62cwQm9Yssh8
lsu4ldn7jxZ8AG2K3pwy+Kzd3N0ttV/oZTpxW0SpG08OghtTh0C3fXWHwNkqT9sz
CB0kGchRW7Cn0IYHOz2PcW539utHpHcSgTJzlabEMjWgKoiN/ShJhIrwYBzLjoQX
AKFU75qceeemIGylZfzqnGUKsxVbYFlge6j1hpeEvKvQi7rxPp0BmBsaWxxj1ni2
FOcAdM1Nhb4A4cl0o7Y4GuE1hijlxJgVNxGAk3HQg8gmExiEq1Y=
=qUwz
-----END PGP SIGNATURE-----

--zb4ir3T8GEvSKJdn--
