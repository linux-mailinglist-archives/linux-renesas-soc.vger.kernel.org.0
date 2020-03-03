Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08BFA1777A2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2020 14:46:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727191AbgCCNpn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Mar 2020 08:45:43 -0500
Received: from sauhun.de ([88.99.104.3]:50116 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727121AbgCCNpn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Mar 2020 08:45:43 -0500
Received: from localhost (p54B3308A.dip0.t-ipconnect.de [84.179.48.138])
        by pokefinder.org (Postfix) with ESMTPSA id 576732C0872;
        Tue,  3 Mar 2020 14:45:41 +0100 (CET)
Date:   Tue, 3 Mar 2020 14:45:41 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mmc: renesas_sdhi: Use BITS_PER_LONG helper
Message-ID: <20200303134540.GB1622@kunai>
References: <20200302093534.9055-1-geert+renesas@glider.be>
 <20200303124842.GB571445@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Content-Disposition: inline
In-Reply-To: <20200303124842.GB571445@oden.dyn.berto.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2020 at 01:48:42PM +0100, Niklas S=C3=B6derlund wrote:
> Hi Geert,
>=20
> Thanks for your work.
>=20
> On 2020-03-02 10:35:34 +0100, Geert Uytterhoeven wrote:
> > Use the existing BITS_PER_LONG helper definition instead of calculating
> > this value.
> >=20
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5eX4AACgkQFA3kzBSg
KbY2HhAAjukYtokAJej0dYRd0RM+0NiAbGl7C/GLOHQkFx1S4uBWa54cSC3NQ+83
Mo/k0heHnzYzAmBFa+bc1BbTgr7sq2xfZ+XaXM27wxS+nFTdsrCGZZAY8SRGO0y7
KRBpVkevotPyc5U8gT7tc/XBxklPOkWlXw3JhOXoikzyEVQgJljKMYSC4G560CNz
zlGdR7+NKm991YlNH+hriVaRpPwwk1GTWhodEFuVVQl7k+Bu5hXG2ej2GCJkF+KS
hXije9gbAf/tfIc0apkQr6Ey+57fzVYeQkTuKUXKG1arQTXod5Qqzs/USeZOnfvA
ITuy5Xzv65rWjoKtKahwCoI8lJWa3/1FqK0v6ZQhFcs778szI42fnjUakCvvb7Ng
/kk035xuC8QFjyW3xfOiJfVor1+TOo0tX3WjDhrTkKY0qM44DugjI+MzvfCnZq7Y
LLsJC1xAeu9KydW/wEv6+mY6Sw1HktfpM737aXffXzlBOEbfxn26eU+c0Pw1nuGJ
OlI5LppipQnDoOL91Wvk2HHzWpPqHTg5O5mgej834uuffN8MTN8q7LBpuMq/Iht+
okAv5l+be9A0MZh6bo0ZvWmd6dm4rAUA6KZleLuzT6Mk2Jkn2toWpG+z/kQ01ELq
HR9bWeWmZEyeOQUIfS4QEEsv6c2NPrW4x6u8rTqD35Op9T17SFk=
=sLo8
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--
