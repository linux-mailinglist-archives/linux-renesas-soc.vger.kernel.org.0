Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEDF744C39
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2019 21:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727096AbfFMTgb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Jun 2019 15:36:31 -0400
Received: from sauhun.de ([88.99.104.3]:44244 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725809AbfFMTgb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jun 2019 15:36:31 -0400
Received: from localhost (p5486CF99.dip0.t-ipconnect.de [84.134.207.153])
        by pokefinder.org (Postfix) with ESMTPSA id 61EBA4A127B;
        Thu, 13 Jun 2019 21:36:29 +0200 (CEST)
Date:   Thu, 13 Jun 2019 21:36:28 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     joro@8bytes.org, axboe@kernel.dk, ulf.hansson@linaro.org,
        wsa+renesas@sang-engineering.com, hch@lst.de,
        iommu@lists.linux-foundation.org, linux-block@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC PATCH v6 0/5] treewide: improve R-Car SDHI performance
Message-ID: <20190613193628.GA6863@kunai>
References: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline
In-Reply-To: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2019 at 07:20:10PM +0900, Yoshihiro Shimoda wrote:
> This patch series is based on iommu.git / next branch.
>=20
> Since SDHI host internal DMAC of the R-Car Gen3 cannot handle two or
> more segments, the performance rate (especially, eMMC HS400 reading)
> is not good. However, if IOMMU is enabled on the DMAC, since IOMMU will
> map multiple scatter gather buffers as one contignous iova, the DMAC can
> handle the iova as well and then the performance rate is possible to
> improve. In fact, I have measured the performance by using bonnie++,
> "Sequential Input - block" rate was improved on r8a7795.
>=20
> To achieve this, this patch series modifies IOMMU and Block subsystem
> at first. Since I'd like to get any feedback from each subsystem whether
> this way is acceptable for upstream, I submit it to treewide with RFC.
>=20
> Changes from v5:
>  - Almost all patches are new code.
>  - [4/5 for MMC] This is a refactor patch so that I don't add any
>    {Tested,Reviewed}-by tags.
>  - [5/5 for MMC] Modify MMC subsystem to use bigger segments instead of
>    the renesas_sdhi driver.
>  - [5/5 for MMC] Use BLK_MAX_SEGMENTS (128) instead of local value
>    SDHI_MAX_SEGS_IN_IOMMU (512). Even if we use BLK_MAX_SEGMENTS,
>    the performance is still good.

Thanks for your hard work, Shimoda-san!

I may not be the biggest DMA, IOMMU, and block layer expert, but I
really like how this simplifies the SDHI driver and enhances the MMC
core. So, I'll add my two cents to the patches although I can't really
comment on the main functionality.


--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0CpbgACgkQFA3kzBSg
Kbb6fhAAsdfuCLxXS4xDUphPESkF+gt9xfaK1rX85NT4mPOnCRA7AMdH0rzSAboF
MFBO01ZS1+9P5SOaOuKArFD1rDkk9t41Hp+AEcsyGZMt47QlwvXakNaQeoGVLUuu
9kex9v8bpMgXjDS9B7CFcbWnLvEjEyysBYBVRMpppo1UwfIwKoQFZAzKJkodXGpE
i5HOkl+woaQVUDgNnnKEVbAmSmCJ7H8Nb4CvzRk14i5GK2UYUi9ql9B4Fro4tsgM
dqSlNzb9x/70ajG5EYGv5+E+pA8u3du9hNLzsm7PoFWCUIPa5n74aQC4CpMcjUao
FqPHfzcT3Mg8fk2K7u6riIaQAO7c/sYJ4quv547+cPTyPoAs290HqRZqH413C9wr
hQtNlC2g7j+6hgrkzyoesGKl0zpiPdW3TKQ17tDGoCipGKDwQGptKunqWFbDY90h
UJdgHWAo/kjy+pAGlutoy5bPdEbYYpxgHCgCrOaN0fzV7qKg7N1gfvRCNJSS0U9d
gNzLc4vE+d3a2jPq90LRNxpBoUgB/iuJBIEhZcTycIMjUBrWQ8ikClrFBMHkLEds
slSs6vzgUDcqOBSVQUVAif92fBeOUONnGbwOBx/r6x8LFIpG5h3gw0rRr9mF6Ppo
48Oi8LWLrkZ3ZSjfNyQMaUi4rPwEqULxuhqN7MZIAVUZk3f9L5s=
=tqtY
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--
