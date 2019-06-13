Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED56244C91
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2019 21:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728566AbfFMTpt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Jun 2019 15:45:49 -0400
Received: from sauhun.de ([88.99.104.3]:44394 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727429AbfFMTpt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jun 2019 15:45:49 -0400
Received: from localhost (p5486CF99.dip0.t-ipconnect.de [84.134.207.153])
        by pokefinder.org (Postfix) with ESMTPSA id 62B404A127B;
        Thu, 13 Jun 2019 21:45:48 +0200 (CEST)
Date:   Thu, 13 Jun 2019 21:45:47 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     joro@8bytes.org, axboe@kernel.dk, ulf.hansson@linaro.org,
        wsa+renesas@sang-engineering.com, hch@lst.de,
        iommu@lists.linux-foundation.org, linux-block@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC PATCH v6 4/5] mmc: tmio: Use dma_max_mapping_size() instead
 of a workaround
Message-ID: <20190613194547.GD6863@kunai>
References: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1560421215-10750-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RhUH2Ysw6aD5utA4"
Content-Disposition: inline
In-Reply-To: <1560421215-10750-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--RhUH2Ysw6aD5utA4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2019 at 07:20:14PM +0900, Yoshihiro Shimoda wrote:
> Since the commit 133d624b1cee ("dma: Introduce dma_max_mapping_size()")
> provides a helper function to get the max mapping size, we can use
> the function instead of the workaround code for swiotlb.
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

I love it! I'd really like to see this code go away. Do I get this right
that this patch is kinda independent of the reset of the series? Anyway:

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--RhUH2Ysw6aD5utA4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0Cp+sACgkQFA3kzBSg
KbZH5w//YZbTziLismKCWT2Aa4Xx6jz9hYCViEHV3YlulecWNZMk1MMj5mAEVLDS
XQep1eGpqDNfxaXKoHdzinLJ1BQGEtwwqyKiWr2XC0PEZh4H7Ead43pYEg1xKgb6
9eC82CtEQemmnV9bW3DRi/H/zRE2oNmshA5oM8Nk70QDNSD/dW2XEWNTpCGwq/oQ
PiaDy2UMqneh6fpNADb/2motINaNseE4ChCTc27Hx/PGtnl4qvR34iZXSI0WhLaN
Ppt1uI9kC50YaMAgeO4mSK9B84N1FucI7rboutgkRWOfUlDaDf+yIMhnE92LLVs7
0yn0uXKtkDnnWRpI2jcMScLSpzk5ISbPfsmvImoRUwruKy/vfpsYylJYWtxTx6Rn
OyZccS9fKodljAJkn7aly1fezO2+m6+NlLY/mPxEcOMuHgXo948/za6b7Aa4bzEF
Rr/AiP4cXYdvUjy3OnYpnGMX+3zsStJSSEHl+Lh9cxhflCyj0o3BLoVFn7IUOC2K
3STPFIRsol+WtRH6NJSOCQ5u8PZd1nd8n4nm0/tv/tUp55Ao62uoStmkz7D0IzKQ
migGfFhLx+NEHejtIhFFUUXNAWk+Hqw3yfBsUtbnJXX+rZcxo+mXBUveBhs9GZ98
IWp9OB52Rb74TGprWNz4JxlKi/T82E9wl3IPD1jizTD915sW/uM=
=bAj7
-----END PGP SIGNATURE-----

--RhUH2Ysw6aD5utA4--
