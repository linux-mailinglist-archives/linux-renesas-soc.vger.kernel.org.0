Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 457262DAB02
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Dec 2020 11:40:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbgLOKkv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Dec 2020 05:40:51 -0500
Received: from www.zeus03.de ([194.117.254.33]:46044 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726921AbgLOKkv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Dec 2020 05:40:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=qGCdnlY/Fg9cXfD74zJ/38OpLU8/
        EqcSvr85CtgewVo=; b=Q6xDceIsUFongRCexgPdS2acC+MyZj+JrFbMOCMl53Ac
        WweiRmkf6SCyKnhZk0+bR4+4IX0CtGJEOCzGTeJWec6A5YTh4OTAqBJIzpzoLAm8
        PPosmoWrfyqTmWgex2L/qK0U7ES4smWQUWU13nxv/KRM/H20rjNoU3VsVU53Phs=
Received: (qmail 2724240 invoked from network); 15 Dec 2020 11:40:09 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Dec 2020 11:40:09 +0100
X-UD-Smtp-Session: l3s3148p1@55O3YX621swgAwDPXwxuAGmjn0j2cA66
Date:   Tue, 15 Dec 2020 11:40:04 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] mmc: host: renesas_internal_dmac: add pre_req and
 post_req support
Message-ID: <20201215104004.GA9090@ninjato>
References: <1607087853-6570-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20201214155001.GA950@ninjato>
 <TY2PR01MB369299EDBA25C39E5B4FFBD4D8C60@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <TY2PR01MB3692AEAA842555886E0517B5D8C60@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <TY2PR01MB369240E88E0629EDC140D0A1D8C60@TY2PR01MB3692.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline
In-Reply-To: <TY2PR01MB369240E88E0629EDC140D0A1D8C60@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I'm sorry again and again. But, I realized the current patch breaks
> "force_pio" mode because tmio_mmc_pio_irq() doesn't take care of {pre,post}_req.
> So, I'll try to refactor tmio core to support {pre,post}_req().

How did you test this BTW? Just checksumming a large file doesn't show
improvements here on 5.10 + your patch with H3 ES2.0 and M3-N for me.
Did I miss something?


--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/YkoAACgkQFA3kzBSg
KbZlvBAAktJEBSq7kDaUmxEOwGu4P6SUWDPRKnJfsW8O7S+b6IDT02NM7dtjuoRm
rNwwarSCpSTL72fNzLjHXI5Tvt8k9CQw5WNpr2HwhowER557cBsovojf6OymLNqb
DvU3xzK9kiRc/sT6tnECx6bh3F9AJxnmw5UKjHOHI/mMJFsqYzlVM24ufa/4TB2U
qXAWuP4k8VwadkOzli8jG0noGQS9g1c6/Y7uxz6e5+3Xr0WiUrC59q3X3M8n/FJo
g1V/+ByIkRODK6GiL/Wosth2TCF2jWBhOf7DqUDZr1U1/cg3atTLftR5BpS+yxVq
eHxezTwc1EYaljRTjgMbS5SVoSqvvs+AyR4LLGjdLmjpq/sjmFpV2+MrXeZMML+b
psQLhS0QT02fmJYHSLOARwmR7A6qeLJmeDfbjtNIxoDK8yLBhpmEppNOGIF6x3CO
8IICeD5qBshbcis3U47uNJv1rxsMbvQ4uEJa6dxCQnInrTjuw+ZrcEEnO41gOZDr
R8tVuQueX+ZWYHQ+mrsxtUhBr++RkqyiCZLNlq1fhuHd/DHilmpaFCleUdNYkzO3
JN1fbk634XYiNJ8N+uCy2qw6oplxrI5Yj0nsBg9Ro+PthdVjX673ymxy+tYINqEm
bixd7Sv6DY6fTy5XtAOfT12Sw3grb7iKnjWGu4qAA/WLwriShnU=
=KOq6
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
