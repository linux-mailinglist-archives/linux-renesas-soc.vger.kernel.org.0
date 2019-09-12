Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2830AB1433
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Sep 2019 19:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbfILR5i (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Sep 2019 13:57:38 -0400
Received: from sauhun.de ([88.99.104.3]:52656 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726425AbfILR5i (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Sep 2019 13:57:38 -0400
Received: from localhost (234.77.63.94.rev.vodafone.pt [94.63.77.234])
        by pokefinder.org (Postfix) with ESMTPSA id 7E0632C4EFE;
        Thu, 12 Sep 2019 19:57:36 +0200 (CEST)
Date:   Thu, 12 Sep 2019 18:57:36 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     hch@lst.de, ulf.hansson@linaro.org,
        wsa+renesas@sang-engineering.com, treding@nvidia.com,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mmc: renesas_sdhi_internal_dmac: Add
 MMC_CAP2_MERGE_CAPABLE
Message-ID: <20190912175735.GC919@kunai>
References: <1568261636-25625-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1568261636-25625-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="adJ1OR3c6QgCpb/j"
Content-Disposition: inline
In-Reply-To: <1568261636-25625-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--adJ1OR3c6QgCpb/j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2019 at 01:13:56PM +0900, Yoshihiro Shimoda wrote:
> Since this host controller can merge bigger segments if DMA API
> layer cam merge the segments, this patch adds the flag.
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

For the record:

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--adJ1OR3c6QgCpb/j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl16hw8ACgkQFA3kzBSg
KbZt1g/+KlEGCwlinMs38IZAeE1aMXe77vf9++FPut5tawVdNDIlF+1b64HcX4IE
pgmgtjkUdMkjC7pgFL8Bz0BoeHJj5wwq9ih3VKeBdY6Ik00GEqAUObHltvmM1DUm
9947wmcbIwuVvkpY/eFyJMVH58jHmPptwk/Iuo+hdfu5otOUldtHpD6lAkHsBMxY
Tz77XJ7ipbtEyRAbWDjYZY3bwxJagb/WpxvUmB/pbFKE6RGcPwN//SqP1qlTEVU1
5XKIbCWGOLuRcP6MRUBQShIllaQ+UWQosSb78R4/bhvJsNrosILa8fqqoSgRHeie
GdWAjdRKUoe4UK1SGoPs4ZdLw5WIjGRReRr+Wk0V8FlnWhT1f22UN6u1JGm7HpVY
KWJ5Rb1tIgi0TBKa4jZnhDS2Sydvy40/OHVC/zrxON7hV4NxuTMP24iCRPddC4ag
gK1bNm64DwI6DED07/hgHTVcDGX767pX4C60EOlYd/IedMkRcZs+At/nMnqCUD1Y
22Y7VM/6MT/8dTh1L7BhSkkW/DOPmbaGqid4TSb9FplEGmppf1mColZ7wFOqccxZ
uWmdoT7p66SloDDVM8FLg7/+U+p57IfXo+pXdqI31rAZYu8XOcwAuSZGKGTYY5XB
0ZHr/0+2iPEfiikDoB9YzF26GNfswfe5tkSmOusPxhM7vLKun2Y=
=kHT1
-----END PGP SIGNATURE-----

--adJ1OR3c6QgCpb/j--
