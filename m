Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D26B262F5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 May 2019 13:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728335AbfEVLbK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 May 2019 07:31:10 -0400
Received: from sauhun.de ([88.99.104.3]:43422 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728111AbfEVLbK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 May 2019 07:31:10 -0400
Received: from localhost (p54B33377.dip0.t-ipconnect.de [84.179.51.119])
        by pokefinder.org (Postfix) with ESMTPSA id 637F32C3720;
        Wed, 22 May 2019 13:31:08 +0200 (CEST)
Date:   Wed, 22 May 2019 13:31:08 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/3] mmc: tmio: No memory size limitation if runs on
 IOMMU
Message-ID: <20190522113107.GA895@kunai>
References: <1558520319-16452-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1558520319-16452-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline
In-Reply-To: <1558520319-16452-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2019 at 07:18:37PM +0900, Yoshihiro Shimoda wrote:
> This patch adds a condition to avoid a memory size limitation of
> swiotlb if the driver runs on IOMMU.
>=20
> Tested-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzlMvcACgkQFA3kzBSg
KbZVEw/7BSIvUv6S7G44FI1YO6pzmz15RYxutBvFilUDEp3oRUVbkKRdbAceeOsY
QUxG9xDd864NOkIh00Vf4ZCGTsM0bx6NpknfcxMUnOMhHEIwq11dJaZYEDgqO0ho
CnTNO98gcGKqEUo+yGhqrQMfd4xawxyZToFHShasPZ28+kEC1AC/NDtPSfd2I55c
5DtnK1FLRxLqBVo10U8RM3l3AmBJ5ArR+atfoom3vub0Wt3jjI7cejc6nca4hK6v
0TDpHsYKex5I7GldTOcH53C86Nc7jHUhBW1S+Ix46EXqSO+FMRgUgh+BdWdgBxzE
lUkT51wKkQaamg8XjLXUc/xuF/sJGIcf/ZZj2ryOyUPOlWBoJmsWw0IOM+Aw71NL
eheFpcWnQFT85YdGTQf1gwPsiuxkadXSH1yha/A23ZzdxMnXPlaog89kn4MenpNv
mdcCC2JfZ6VJRRTz2h/D8KeIHIbq0B9Yf5L4uBTmlMnIc5WZNsLohNwg6y8SUG66
eEX9umVlDRepg0et9VpA5/8CPlxZBV6QZz08MP45P1W3Oq3HrkK4kmr26YpaVCSi
c9nLh6uVQmTYYUbsZ/ajkOZzsEqiW24gC4UMId2q8hwWr/j+89X5kMh4iD6KCcoJ
keoUSENRd9enWah/tdy0MWRi1FSHZDcD9pegJL6uOhTRk7xROWc=
=vHdP
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
