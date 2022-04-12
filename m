Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D058A4FDCFF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Apr 2022 13:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356873AbiDLKtO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Apr 2022 06:49:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357269AbiDLKpz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Apr 2022 06:45:55 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32F2720BDB
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Apr 2022 02:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=VRb0dr368M85EnKWc9lDG1p5mZiO
        yP72OUQHMKxaKRY=; b=EP2Td+rrcTyruOWzFQoFDzwodtlWYrkFIaRwMWK4Oi/T
        XTrcSDIGbUr+Be1VQjLQAt/gKRaTW1b3yD1+9fQNzTf5ESxd2jLXJSzdeCRSaCzZ
        qOoesuaGSSe9gQRHSXe2jUAaiRD08Hwf+Sq5fAh1/WyCQeyKjfOPOVt/z5fXPGg=
Received: (qmail 986296 invoked from network); 12 Apr 2022 11:45:45 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Apr 2022 11:45:45 +0200
X-UD-Smtp-Session: l3s3148p1@kqa87HHcDOcgAQnoAGZ4AFi7qjeMIP6q
Date:   Tue, 12 Apr 2022 11:45:44 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: Move RPC core clocks
Message-ID: <YlVKSJhFLtol5S8/@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <a938b938f00939b9206d7fbaba78e2ef09915f5f.1649681891.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CFvetLYq6TrBaINB"
Content-Disposition: inline
In-Reply-To: <a938b938f00939b9206d7fbaba78e2ef09915f5f.1649681891.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--CFvetLYq6TrBaINB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 11, 2022 at 02:59:44PM +0200, Geert Uytterhoeven wrote:
> The RPC and RPCD2 core clocks were added to the sections for internal
> core clocks, while they are core clock outputs, visible from DT.
>=20
> Move them to the correct sections.
> Rename the ".rpc" clock on R-Car S4 to "rpc".
> Fixup nearby whitespace to increase uniformity.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Looks good from a high level view, I just did a build to "check" the
details ;)

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--CFvetLYq6TrBaINB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJVSkgACgkQFA3kzBSg
KbZpAQ/8DYrHiR5nC6h8Ir3JgjbSatsMi5EcheZ9Hyhmxn7kRtpMT8GHjs5JXcIu
ZjiTPJJ1NCXGJcp+otPxLyk5T5XNXrh9u6aPAAdUS1J9fy27V5RZFPpQseSjmU9z
5IRuSLslYhk4JFXpPqYxnFxihiexLmxhwWCZzbR5CofTS7pSqO+ULzVRBA9VDQjw
79QU0BmEsrRR9HN+4i+0PxD84+RnZ9u/xdm8Hor1ugm49vWrJF8VdbgD/XmAFNRL
CgmhkxlcySbrWye2JXzSi2HYZKZn4A3MGwaR1OKHX2sjbzzQpHnjVOBxETbkpnHi
SN1ebbVitNMXi8DTWtqv3j5D4M3b/FHDj0Dsge0CUjZQlR8Xkl5DXoaR/s+N/sJx
Yvpm84nJtjhk1UOrlpVAx3lq0LD1m7KB3GmBPxim0zdf5B66xi7v+w+SQDo/fuMf
aNw2+h3oNYIPhm0SjPXG7fIM6rqGy8jLUTUp849cC5Y8h4sScmLE3sGHz+TKcjt+
NeqGzbWryua219naBEN5fjxy2M7pb0jzp7w8oqKSi04CDSF7/jEknfWMZStICiAf
7aPGUvyGnIMkulOvqFUAWEGO6iPVpaiI2qnVgVcmaKg4KTZZL94xKbfWjaw59ySj
fK2jTvqNGk2t6ORfqyUePbiF6fEFJzswRE6A/AU8Zjv+39bzaP4=
=1o7H
-----END PGP SIGNATURE-----

--CFvetLYq6TrBaINB--
