Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DAE926305
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 May 2019 13:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728536AbfEVLd1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 May 2019 07:33:27 -0400
Received: from sauhun.de ([88.99.104.3]:43470 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728335AbfEVLd1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 May 2019 07:33:27 -0400
Received: from localhost (p54B33377.dip0.t-ipconnect.de [84.179.51.119])
        by pokefinder.org (Postfix) with ESMTPSA id 82BE12C3720;
        Wed, 22 May 2019 13:33:25 +0200 (CEST)
Date:   Wed, 22 May 2019 13:33:25 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 2/3] mmc: tmio: Add a definition for default max_segs
Message-ID: <20190522113325.GB895@kunai>
References: <1558520319-16452-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1558520319-16452-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TRYliJ5NKNqkz5bu"
Content-Disposition: inline
In-Reply-To: <1558520319-16452-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--TRYliJ5NKNqkz5bu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2019 at 07:18:38PM +0900, Yoshihiro Shimoda wrote:
> This patch adds a definition for default max_segs to be used by other
> driver (renesas_sdhi) in the future.
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--TRYliJ5NKNqkz5bu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzlM4UACgkQFA3kzBSg
Kbbt8A//X/InGW39CwtieEacXeR4+lTwGqRRVCs8VyBSbOAx7wiBXUQr5vmxSwfC
gy2TPe1zJszDOpkaPvuP91WQ87Np3HfES6CPeWk10M23zS4QTHn+mBNmihho5weW
JXXQFO1w/gs8vlaDfy9kIy09sQ3gum3vZACr4vbYFHCfqoJmbtXbiObRFAgeF3QK
aZ4gvrCuDJedHjdzaL5p8ec3anjCFwI6pNx66Muh1a+78KFVCaSbtP38wHJYWfoV
jUkO2CfVWdsmdgj9x//+BFTxr5NKfpwiI+TOaf6/yYtQtHwUGX8xMH93S6Wxjpmo
QrdgvkCnzOxh7WXCGV2Gl9S90BgOfwFwTG6U9aj/8oeiKDWNwOFjXzmupUld+apT
v93/kWL7BmIhx6S9kAOmSJvaYXSJgg6f8D9Hjg+1CfecZVcmAYaO6zURUIVDNmc7
C4vygB0I7cxnw0t2SzAml2R2v4IANNn5bF03KdJa4X/2G6zB0Qt6sm1I+PBkxCFA
7K9cSs/Ooimz79pOIm0QTl8KqybIMV+u/dV7+rIrppC4SFLbfalgGzwBKt3XeXyf
SX4kTf9nJLzHXFbbn3N3W68FlumQLb5sTqPiUd6HMaT/uxsKBI5AuvTwys4SgG19
ezLI2VnHo0nMxrnsMQgmXYE9bcseIoppAD9DDMdTccUatUqJL8g=
=5Mma
-----END PGP SIGNATURE-----

--TRYliJ5NKNqkz5bu--
