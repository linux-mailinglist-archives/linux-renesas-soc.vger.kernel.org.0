Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F70A543020
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jun 2022 14:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238817AbiFHMVR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jun 2022 08:21:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238809AbiFHMVQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jun 2022 08:21:16 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E34A1213
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jun 2022 05:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=lHpl2DwqxRSjsZvJeCUvaA9TeqQ0
        akzzXR16/GXfnAE=; b=QrqicCetXkJYt31XHRvFt107j1iEetnQe+jOgW/qhhcA
        f04iGSY9+HZiURjFLNiKe4fchl8FVPZYE83A2AQezTNhIy7Os+HS5fjqYaB5DNUz
        I42/u2GnqeA9GX32f29C8ff4C4RSqbIWqmjvtH/BuQ577YNI+aqhf6BTFjFl6hQ=
Received: (qmail 2894601 invoked from network); 8 Jun 2022 14:21:09 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Jun 2022 14:21:09 +0200
X-UD-Smtp-Session: l3s3148p1@VFl5ve7gGDtZD+7M
Date:   Wed, 8 Jun 2022 14:21:08 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: mmc: renesas,sdhi: Document R-Car S4-8 and
 generic Gen4 support
Message-ID: <YqCUNLiEcXPcOyXX@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20220603233810.21972-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdU3U6PjGpB4m4jXC4UMjruqg1T66WtBSnuF68sKD48WTA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2w80s1BLTnQxOUaS"
Content-Disposition: inline
In-Reply-To: <CAMuHMdU3U6PjGpB4m4jXC4UMjruqg1T66WtBSnuF68sKD48WTA@mail.gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--2w80s1BLTnQxOUaS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> You forgot to add "renesas,rcar-gen4-sdhi" to the "if" block below, controlling
> clocks and clock-names.

Thank you, Geert! I'll send a fix in a minute.


--2w80s1BLTnQxOUaS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKglDEACgkQFA3kzBSg
KbbXUA//TIGwuInpwlGHmOmU7g7yoTv9m+tgUsLnMuI3qcEfq2WL3EDsAn+Op+0h
5dh7Zklxw++JDAsHUXAerl3Mj3UcaKWCt/tS1GlfSUjuRNGfdNZyGZ7eqHp2YsVE
68SzEmPTDCfIZzfk4zQ89TBSeW2fFnHLwne6YPfy8z9IIg1MOQAHq16f97vtiTow
GivtaLNrhrEjOhG4s0LyjK3GvC4FYprWZlDy4XjhkOSkOT0uqmF6jK7eRkYsyM84
/UvppUFUV+I2GaHNwcmYdidB1HoJoaqN2Wbll7GOKQoxdRrLte8J+vsK+5DEHVrZ
vTwODWFMSMLjEnK2rzZhDWt4oB9Nj6hCdaHX87jNcwIQwA+wtA9hABBy/J1FnMek
uOjmnW1kO3g0ftjwHchzXTdx+CWuxGZsjFf97M02VbRh8Bzbg0hIWtdFQqjrB7Ka
maDnwOnLsaQSlxvzkpM5+Esl3w8ZH4mDYm6QQC76hpQlzP9DQBA53nQfc/Pm8fRG
5BPt27sJiMJs8oDk5myf/Jy8q41AIxSRr8H9V7YgF4BmoCkSW89IP+l1X9f3d1HA
h8dMxP6bAfPVLx5pMhdmOovQbkQIhmW9wJ7BvVh5MoEMKc9sbAMDAoBwqTJq09+V
zCTMpL5UYjeB+PM0m+aPvBK1jV1sEWD7hJhLSXuwCCURxJ9SVRE=
=dsxF
-----END PGP SIGNATURE-----

--2w80s1BLTnQxOUaS--
