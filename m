Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46DF41EBC15
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2020 14:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbgFBMvj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Jun 2020 08:51:39 -0400
Received: from www.zeus03.de ([194.117.254.33]:46328 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725940AbgFBMvj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Jun 2020 08:51:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=dSzMw+UaS/C9XBwiXA9Iifmw5RLL
        NDrtXcnh4fJlcZY=; b=lwAphbARv6z64CpPcAMAZ3Pea/Kt/oWUUTrRNSNqfs3C
        fFCNFiPFyA02PbMdoycco1ALCNq2ISpf5jj3uS4RyLoUIrz4DAkU+g+bgBCxH8GF
        k76y5pl0EkdR0No/9Z3WU5covS5HPsxgIe1maymqmjXL+UdFvfarzhZ0HU4sEuI=
Received: (qmail 952765 invoked from network); 2 Jun 2020 14:51:37 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Jun 2020 14:51:37 +0200
X-UD-Smtp-Session: l3s3148p1@dFE2XxmnEOkgAwDPXw/+APwanz+b4yd7
Date:   Tue, 2 Jun 2020 14:51:31 +0200
From:   "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 0/3] mmc: tmio and renesas_sdhi_internal_dmac: fix dma
 unmapping
Message-ID: <20200602125131.GA1318@ninjato>
References: <1590044466-28372-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <TY2PR01MB36921D805C79B829563698D6D8B70@TY2PR01MB3692.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Content-Disposition: inline
In-Reply-To: <TY2PR01MB36921D805C79B829563698D6D8B70@TY2PR01MB3692.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shimoda-san,

thanks for the patches and for providing a test case. I was not able to
reproduce the issue, though. I'll explain...

> Note that this patch series is tested by using additional debug code [1],
> because there is difficult to reproduce this issue. Before apply patch,
> When I enabled CONFIG_DMA_API_DEBUG and CONFIG_DMA_API_DEBUG_SG,
> I observed lacking dma unmapping on /sys/kernel/debug/dma-api/dump.
> And then I confirmed the patch can fix the issue.

So, I have this debug patch applied on top of mmc/next. I have the above
CONFIG_ symbols enabled. I have _not_ applied your three patches which
fix the issue. I mounted the eMMC and read a large file. I see the
injected timeouts happening:

[   94.079560] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for SD bus idle
[   94.088668] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for SD bus idle
[   94.097727] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for SD bus idle
[   94.106768] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for SD bus idle
[   94.115848] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for SD bus idle
[   99.300589] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for hardware interrupt (CMD13)

But I do not see any output from the DMA debug system about a missing
unmapping. I expected that, though, because your fixes are not applied.
The testfile could even be correctly checksummed after reading, just
awfully slow, of course.

Am I missing something?

All the best,

   Wolfram


--wac7ysb48OaltWcw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7WS08ACgkQFA3kzBSg
KbZa6Q//e7N/DQAOB/qjQcezOiFcIx0c2MI00ts+DL5aTELoNi/557uxeOm+jGE0
z7J/Br6PHWa5hBxpaQuDYacvXsF/c5tlhpjG6bSB3RRkRrqrascjJGVlQ8soPt41
Dx4Ih7u68SgNE6izCy+5Kw+yu+lMAsv74Bmr4wIKUhFHE9vOLlmiAOkM7FLkKRRu
CKPbuWib4ESMzVImO6dAPyHMUOFqksJ/ufF15i7LiVMeCpn2H4pgZqi3FeuaZckO
CbVxKHUwJuomXQHrLQwAooMYdwde79kobFrJbk0REqvaUiBY5IBXbqql4R60B15k
2R7M7fDLVqc6zcntzTGMAwnSh2Z6+H/BZxDvoL49HHC83R/eH4RrECApBqjfPVam
9mo62ZaBeG2OeNODVpJCLIiTPdqB9cq/zUL4+bqed2X9OiY7t/QoDURLXugput2G
jt53lw3OBkvOUrkiYHmqqTv5dEceQ/Q01gyceEDFMiwCTyEIPb5gTh4rjkKH4An8
6tj8TlOtwegeYqhtdAb/UQk3tRY+CjVM4hOJy8aU5c8F2XknI4OiFp3HqU5e2U1z
zhbRDPwBDO6NP4x0cx0ktwzIu6MZhwm4Pl9DLREc48AH0M3QxWGHfDO4py7rUXrx
eNf4pz3i5br3f3ICbZ/b0rRbC2K7c5GeV6MxmwmHzog4dJ7sAmg=
=fGu8
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--
