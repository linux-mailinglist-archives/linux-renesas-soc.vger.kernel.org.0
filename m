Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B353A1B772
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2019 15:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729142AbfEMNyX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 May 2019 09:54:23 -0400
Received: from sauhun.de ([88.99.104.3]:40754 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729040AbfEMNyW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 May 2019 09:54:22 -0400
Received: from localhost (p54B3324F.dip0.t-ipconnect.de [84.179.50.79])
        by pokefinder.org (Postfix) with ESMTPSA id A950E3E42F7;
        Mon, 13 May 2019 15:54:20 +0200 (CEST)
Date:   Mon, 13 May 2019 15:54:20 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] mmc: renesas_sdhi: use multiple segments if
 possible
Message-ID: <20190513135420.GB20443@kunai>
References: <1557721744-30545-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1557721744-30545-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190513090054.GA15744@kunai>
 <OSBPR01MB3174B96296BFFA408F1C901FD80F0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
 <OSBPR01MB3174B39C9BE0A725D4945D78D80F0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TakKZr9L6Hm6aLOc"
Content-Disposition: inline
In-Reply-To: <OSBPR01MB3174B39C9BE0A725D4945D78D80F0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--TakKZr9L6Hm6aLOc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Shimoda-san,

> > > That also means, for the sys-dmac and Gen2, we then use 512 for the
> > > IOMMU case and 32 (default TMIO value) for the non IOMMU case. My
> > > understanding is that SYS DMAC can handle 512 in both cases. Maybe it
> > > makes sense then to make an incremental patch setting the max_segs va=
lue
> > > explicitly to 512 in the sys-dmac driver for Gen2?
> >=20
> > I also think SYS DMAC can handle 512 segments. However, I'm not sure
> > it can improve the performance or not though. Anyway, an incremental pa=
tch
> > makes sense if needed, I think.
>=20
> I measured the performance on R-Car H2 Lager. It seems 512 segments impro=
ve
> the sequential input to 5%. May I make an incremental patch on the patch =
series?
> What do you think?

Cool! I didn't expect that much of a performance improvement. My main
concern was understandable code because there was no "real reason" that
we once use 32 and once 512.

But if it causes even a performance improvement, even better :)

Yes, an incremental patch is a good idea.

Thanks for the work,

   Wolfram


--TakKZr9L6Hm6aLOc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzZdwwACgkQFA3kzBSg
KbYZlQ//d8HN99ysATnSIUFh/qOo7UMZw4lDeHTwqPUYMEEvzWBMJ1ZOrCpDMqXc
lx53Z/Tj8nYR7Fwe5UOTL33EIvDz5wjFg0IsF05dBTf+WN1i8Z9hSAtqkvBuMWYR
nMbK4TGGAwNDKrWaqlxMq8iZsmz6v8EVU3flcNBXue9cvUc0CZo+2aYgT+lSlHQ4
bp/Jm73jXIJTCI1fkZZtvkK4xpb5KvwHd6mhvBidpkJoMBDwkLj50LQYBSFy0Uiu
/n6x+seX3xcdcWhr3JnILvcdna8PpLuNBy3CNWn3McyJ6h5Ovx/vrhtNCfDateR6
9YMrF1POwCNujbiK7JAw5D3T2b2MVcCMaUK6mD6Z1bRC3V/Q5v9BfvExwucwH8cc
tGUwIrTXMS6kjpgnynV1LMkMbeLozmOwA+FChv3xGTaB/QL6hZ2UQ5jR8f5TQof8
DXPSQ3HNdnASyOZWdOyPTTEcpSdk5EL3OwlImk4i4jq9YfLP3E3H+xSwxbp2IOb+
wMkqHZ5rJhzTHBfLEtuL5BqMMptwx1U56UUfTsBTdTkZNi85anYtYwZmWUHh8Z/W
BPpKvAYlUJ9aO/eYkfvmzO/FkA2qppRbaPy7OrX12PhHkeeV7acAH7YJa7XYaxBe
K97oqnHuyRbRj0jYPiDM//XIWYTpXduBD5wMWRGwpcTsmykbyGE=
=/6WD
-----END PGP SIGNATURE-----

--TakKZr9L6Hm6aLOc--
