Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5C965FCB25
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Oct 2022 20:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbiJLS4G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Oct 2022 14:56:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbiJLSzk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Oct 2022 14:55:40 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A554C34E5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Oct 2022 11:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=6V+6UcZTXGX2VLQKCnVLZ2qcgTY4
        LWkSv1U+UTAcveo=; b=Jwz4z6h8FHe+Y/VXnrSr4MEOJOVva8dpxcnDYz7WZ8jw
        x9HPSPjF0xUSOwayweDzi6fwzU3reCoxQHH5ZXj0lXyHecOdzaOYwPrHeE7/mEj5
        19Ud89uJQA/9RXoEHT8yKjzjsaE9gS60eSzDHbCogqQ2+Let3SAe+YKa5NMaKOo=
Received: (qmail 814267 invoked from network); 12 Oct 2022 20:55:21 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Oct 2022 20:55:21 +0200
X-UD-Smtp-Session: l3s3148p1@ItVA79rqLqQgAwDtxxN7ABspc7EPVowl
Date:   Wed, 12 Oct 2022 20:55:21 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mmc: renesas,sdhi: Document R-Car V4H
 support
Message-ID: <Y0cNmVylLPh0XLPO@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <7ee7fdb6a46fc9f0e50c2b803ede6b4b2fdfa450.1665558324.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="N4BRG1+r5rYw7aNW"
Content-Disposition: inline
In-Reply-To: <7ee7fdb6a46fc9f0e50c2b803ede6b4b2fdfa450.1665558324.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--N4BRG1+r5rYw7aNW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2022 at 09:05:56AM +0200, Geert Uytterhoeven wrote:
> Document support for the SD Card/MMC Interface on the Renesas R-Car V4H
> (R8A779G0) SoC.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--N4BRG1+r5rYw7aNW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNHDZkACgkQFA3kzBSg
KbZdKw/8Dc2rL1pG3gX39oKoFkXn7EswueTAmuOZjAHaRK4QSIR4tyALQSfncySE
Be1sLBzc5kXBsak1ku88SbEsKbzUmA9wO9LUKJ+VfNU/BWcT+M7Illr4jEdk+3uz
uV1youFr4JbYtXnIEXCA/q4xI2OJCkQTkFW0vvm/E8kD8KkrvJk4/aGmmvyO4Ox3
egfGH5BYrOr7XC6jVs3x0IFfgk0Sy3hD828QiHz9YdUrgiLnUUgKV6ftxvM/7iUD
2y5LKJHsuc3WjjkDUgxslRjBqey/Z/PPmr+O5ETELpKjFYj/c5jxa+zARA7uqTxl
FfFd3cdgXUTEmYG+akhJwiczk91h2ojSP6vLLjRzxKQM8QKNtd6ZlzABgOeOvKWA
yQ6ptG5F3pzoDp7z5YgHylTWK9oaxec7pZcaY8YH3+iSX0X7o5UEWDLV3i/85etR
62ZfnjCvVD5WDy2KCS3U5DMeAmpNPjBP1RQfidzMhRco1SCNWKj2MRLaLtwyIlxp
OqPun/g5pBjP5ATclc+oBsrs20QGoEq2gHhzLgfRDZSoqxCxTtaxmOK54+aDBWXc
Q4FagE7rC0T7m3M3jVjFei1QUR4OTdvmE9Nl1yUwRQq34vxJFIGioZEyuWywtUUu
MsYO5V7AerOnBHVGQ3TZuUBMJ38cSSuU+lCf1/bdtgDuJkaa9DA=
=Y973
-----END PGP SIGNATURE-----

--N4BRG1+r5rYw7aNW--
