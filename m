Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82DFF5B909A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Sep 2022 00:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbiINWsq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Sep 2022 18:48:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbiINWsp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Sep 2022 18:48:45 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A8EA7823D
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Sep 2022 15:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=oomkBqicKgYn9/lFLoIRqt/+mTvN
        OeJhxHbEB6Wx3Oo=; b=Siob67kQ8fUeVmuVR3uBlDgj3TOGb/EzLJk+o9yQOiqf
        xatAfciq+bXQm7ZByqWfFmO8CpJYnwSpQm+dED0FM/iSZnSuw1pwKRuMLlQJaXXD
        RN2ZSwFZv1pzikjwiAFY0Ov1cWoUSK9CrKea8BoyBVsDCQyfXeECfbMjOKHWeZQ=
Received: (qmail 2746108 invoked from network); 15 Sep 2022 00:48:39 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Sep 2022 00:48:39 +0200
X-UD-Smtp-Session: l3s3148p1@HLDV7aroqPVScWNM
Date:   Wed, 14 Sep 2022 23:48:35 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a779a0: Update to R-Car Gen4
 compatible values
Message-ID: <YyJaQ0i+gs4yTgzU@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <f14fde21270bf8269a61a75fc6e50af2765f2a42.1663164707.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+/dHzsUQrc/2IHx+"
Content-Disposition: inline
In-Reply-To: <f14fde21270bf8269a61a75fc6e50af2765f2a42.1663164707.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--+/dHzsUQrc/2IHx+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 14, 2022 at 04:15:14PM +0200, Geert Uytterhoeven wrote:
> Despite the name, R-Car V3U is the first member of the R-Car Gen4
> family.  Hence update the compatible properties in various device nodes
> to include family-specific compatible values for R-Car Gen4 instead of
> R-Car Gen3:
>   - CMT,
>   - SDHI.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--+/dHzsUQrc/2IHx+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMiWj8ACgkQFA3kzBSg
Kbakqg//T+BEqJgbaSC/M65tRcbGVOJh3rClOQf941nveL41od5YEivYhMBhy5DZ
gLLp8rLLWf+WPFTAJO/ImETo4C/mz2OPlkVnd1Ib/prm6pWhTgmMIpS3GageHksR
WHLtU3as6qTcJ4qEdr2/oX2AGw2o8uWf3fSLopyzhKjJjhHnWIzLDTTarImgRmYv
M6XHCeIGXwePR/JsulaeJhDk3tlawCBoB9isQzW8+6PzHPAYKdlMsiBV28flIx4v
KDDvBSR1S2+9yCU/LsU5Hy8WTMEEAq8IFwOGM9u42gseYPF1faVwiCQRPnOG8UTG
DSxF9Skmfn5ktHlDUKSCrS6kqPVRfbhtzXnDY9uwanE4wipBdDF5kK+VgTEH7KLU
zczW8i3+TZHt+hwuoaigGsA5dFvxRdpgO6Uv/w4CdFaLR8+gnUGGCKLORb7yE9r4
bvePtEegA1lawRGd1ueyVGdkDFHBpBvcMdne1NlfU2RzuGnp9VXdtmA6C3eu3rBH
SZJMCG9CPUi/Y0xm4BxDzHltn4oxIovf1/1iGh3AMGrcW+FK5mr0vxVNymxiPILG
2Qj3AF2g7x+mgUoe6UrYooG7tRhrTTJJLqjJnxNrG5kPl6l9unhUvDoWffj5FPnE
yqMdb3/LXiH8703K5ErCn1925V0UJ7Y2fnZ4nIscI+2vIwGCfiw=
=24rz
-----END PGP SIGNATURE-----

--+/dHzsUQrc/2IHx+--
