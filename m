Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78E4C35870F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Apr 2021 16:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231881AbhDHOVu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Apr 2021 10:21:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:33704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231929AbhDHOVo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Apr 2021 10:21:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C60456101B;
        Thu,  8 Apr 2021 14:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617891693;
        bh=fO/H2TWR8q1dXhDd78bSkARRpIe7+jARxJXpnGj7gmY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UYoPwgzr8p5ril74OUyrPDKrtSa/ukXP+Aq6KTtHTJ8kdj66VYkTCg+YFsJK6jdzy
         OxCk/pD6x/3iwYyJUeVtlfRzH9OIaYibBGugybBemxT6VGRQRCsbMPLB/pMN/FFxfC
         YcnWsDCC+34JouVuhJufG9edV0V0dn2ORq9y18xf2ORRfp8RrITdK9XBYPgN50lR7p
         DP1EnXQgA2O3ybmW+Jch3+5oKyqCmZ0rwosVDo91JLZj8ZWd99eyWtJiU8rbmwLY91
         ATNwmt+KV0shHdZOpr1ngLO6Ik5fgXjmC3SXyGdFjqn45hOFjT3YV4ku7sE5PvD2rq
         WsL4nBlUe2YIw==
Date:   Thu, 8 Apr 2021 16:21:30 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        linux-renesas-soc@vger.kernel.org, yusuke.goda.sx@renesas.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: net: can: rcar_can: Document
 r8a77961 support
Message-ID: <20210408142130.GB1034@ninjato>
References: <20210312095030.534957-1-yoshihiro.shimoda.uh@renesas.com>
 <20210312095030.534957-2-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tsOsTdHNUZQcU9Ye"
Content-Disposition: inline
In-Reply-To: <20210312095030.534957-2-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--tsOsTdHNUZQcU9Ye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2021 at 06:50:29PM +0900, Yoshihiro Shimoda wrote:
> Document SoC specific bindings for R-Car M3-W+ (r8a77961) SoC.
>=20
> Also as R8A7796 is now called R8A77960 so that update those
> references.
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Rob Herring <robh@kernel.org>

Shimoda-san, I think you should resend this and add netdev and
linux-can@vger.kernel.org to Cc. I'd think the CAN maintainers will pick
this up.


--tsOsTdHNUZQcU9Ye
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBvEWYACgkQFA3kzBSg
Kbba4Q//Tke0uE8a5ETpCuleBtm2tbCYuRGp0/e1ZIMDmRdsCayb4E2M5IGVrRHa
ljpLw2+AzKXXCv3aHP9ltw6q+W8vjX+JIEsP0guxyVcTZyeh3pvfGCW7ie2p35nH
KcANw4pu/Eki24AUV2qojs0qjwivpRlZ04a+3G34JpUG9gwsvKwsY4dDyhdN4uw+
bheOdlGGFL8mw6iwkF0lvINTog0puyZ+p7KL0Fx1tOA5yioZgrocwxMbrgfx0x4O
jWjDbdYVCCabEBsguckIPTHLhSZEMnYOp7ZCNZQ1LN/65Gv/SgWyBPQx+r+CSBBk
UvwnJGmqA8GP3t1iPlql1IsfwK+S7zTJEplrALI/LgT8cjJ9Yz79hZn+uMO5c8N5
HyJjZCmpTUDlepfL+G/KPADhNbd7dT+sB5HML8Ay23d9tK542X3Y9SS1k4bUNYUT
JIyowNIMZKxoJA1gEDvO+pa11Z5Tixs6F4XF+Kp3UN0woeVda49gd40BAIxCAG5V
Ek7pmQhcio+QRFXfGb6f5OzW6Ei6/VUmwmi7mIuIRNIKA2guOS4JoYYliWtEk9Kt
YgLkRN6/sS5CPfbHLowL+ZuYsVH4bxCvDnmtsH4g+I42+RybVLqrRbgi8ru9HLGX
pN9cuC9W/i/fTLtF3Wirkps8eSIcXs1e5DGNbhYyVKu1hDurChQ=
=2/yI
-----END PGP SIGNATURE-----

--tsOsTdHNUZQcU9Ye--
