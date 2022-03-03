Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2004CBE49
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Mar 2022 13:59:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233245AbiCCNAF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Mar 2022 08:00:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232815AbiCCNAE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Mar 2022 08:00:04 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 121D4186405
        for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Mar 2022 04:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=+zuLWDvY47l2QhKFya80zi6klr5b
        9SDt5QSVmt2GKEg=; b=GORGXtHgMRBcwQvtRe2TtSnt0AXuh5V5s1xikpmAXug/
        F1sm5g5JXtnKBs18Y4vXtsDpxxsNiu42Yd6n8SL1gKp/O3ELqTwFToeug3ZTKeAe
        0m7JplsLg2X8six+j0Tz2VWVljH2ts1ojKA6qR0X/rQF6jj9V4xoRz+neQXnimc=
Received: (qmail 519150 invoked from network); 3 Mar 2022 13:59:15 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Mar 2022 13:59:15 +0100
X-UD-Smtp-Session: l3s3148p1@yD8a90/ZKrggAQnoAG9rAEypTKKqokJH
Date:   Thu, 3 Mar 2022 13:59:14 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] mmc: Drop commas after SoC match table sentinels
Message-ID: <YiC7ohnjtmMUHUZI@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <9050fa278eaaa9e6ec719a3b158a2fad285560d0.1646311673.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rRw9Qb0a4golC+UA"
Content-Disposition: inline
In-Reply-To: <9050fa278eaaa9e6ec719a3b158a2fad285560d0.1646311673.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--rRw9Qb0a4golC+UA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 03, 2022 at 01:49:18PM +0100, Geert Uytterhoeven wrote:
> It does not make sense to have a comma after a sentinel, as any new
> elements must be added before the sentinel.
>=20
> Add comments to clarify the purpose of the empty elements.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Obviously correct:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--rRw9Qb0a4golC+UA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIgu58ACgkQFA3kzBSg
KbaDFQ//UAx8sannbjkRsy8CdmIsVIiE+YMkiJQJiy/qqYRPkncxaYGDeTh3CG2d
1NOcHGOWqvTheNjNZX20WZ0B+91xhr6ueFypcYEs1AZlw9O3oZ/17tybM/b4flMS
BGA28CcmbUbkPaz7MuT/nR2qd5RBcc06C2i3jleAeYQTv9kRehA/7bVQK/A4oVuR
02R6hlzu6AGSMAQVUvDyBTc8OsTYcRlxgr4ScCX76p5+iuxLz2bNqF5iMkoWTLkI
F4DugiGFtLMmpgpXsrgIzwSMvEa/RGfVFwm8e6yBLKrdc+5+/NUJQT7V8A3PTf66
YvDFn7JJMb8pVi3pVxoq6eCsdo8iTsruegyCaFhnNlDo7TRyErDUVsCljiqDgro5
RNFEzPFwFb7/dbc/IErUtiKIQ+OUbeXGrFnEWtUnjeGliaFbr9X0d7SlOwO3t1LE
oINvPE5SquOW+N025rLrtA6OqnEP7jYrDhUwkITjPEpt5lVbXRYc/4iOeVFGoYR2
lSrrAX4eFqSGErnE1gIr2P36Jl548ur+8FkaOw/pA6JqugPor8HViooacNk/G5vX
SCHbAU1pZoAD6Ri8byOZRRoolNCzUh3axAWwtGHV9050OnKgIDMrCh5sU84J+LoW
U+OF0O4kUD7c+1cOwBBl8sgv+CUDu/TnaGeVvRi+RuNlsUImQ6E=
=Uxad
-----END PGP SIGNATURE-----

--rRw9Qb0a4golC+UA--
