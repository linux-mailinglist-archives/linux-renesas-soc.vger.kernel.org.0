Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05BC55FD90A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Oct 2022 14:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbiJMMPm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Oct 2022 08:15:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiJMMPl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Oct 2022 08:15:41 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFCCEFFFB4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Oct 2022 05:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=6pyauorY4PmgghOWitMdZ8hyqxbc
        Ibx5SJENeBfm0h0=; b=1AcAvl/xV+bDDKMmaH0GggCqq1d9f3FQaCv/+loUVI78
        uSYhKJx7qJjELt2kIy/7UQwc3KD9zOy47kkFF2k2yBuxjSXnxnLktt+WM5moiyaE
        IWChtCgecpZHRJoAXDwrwAH0RNGcNrJg3r+89ES5aDus+s7fz/8Nd/5WP1RcPu4=
Received: (qmail 1099737 invoked from network); 13 Oct 2022 14:15:37 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Oct 2022 14:15:37 +0200
X-UD-Smtp-Session: l3s3148p1@+tKKd+nqmX8ucrUX
Date:   Thu, 13 Oct 2022 14:15:37 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Hai Pham <hai.pham.ud@renesas.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a779g0: Add RPC node
Message-ID: <Y0gBaU01wo1ZMyD5@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Hai Pham <hai.pham.ud@renesas.com>
References: <cover.1665583435.git.geert+renesas@glider.be>
 <6da7a035d56a943336f68dc0da77a47dba3dd69e.1665583435.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OvQzeW+pTdXfWEkL"
Content-Disposition: inline
In-Reply-To: <6da7a035d56a943336f68dc0da77a47dba3dd69e.1665583435.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--OvQzeW+pTdXfWEkL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2022 at 04:06:50PM +0200, Geert Uytterhoeven wrote:
> From: Hai Pham <hai.pham.ud@renesas.com>
>=20
> Add a device node for the SPI Multi I/O Bus Controller (RPC-IF) on the
> Renesas R-Car V4H (R8A779G0) SoC.
>=20
> Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--OvQzeW+pTdXfWEkL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNIAWgACgkQFA3kzBSg
Kbb0uRAAhW3tIpWAONBpP9LNPtPrR+dCWVKvVgYd8yEK9z8yv222Ft4mOB58UkKU
rzNbqd/YYhwAEphSXLweEW5/mNn4Rcw2S0ihrS6x5H8k8mVgpe1S3J4xNVvNRYxc
bERmIt9CrAlQH9nlU7lY1YXNpu8ZPXEG6ZWUosXpcXKOwsPFrwJsSKuDC0BbdFOw
rGhR+iZALRdUdD9H79PT+b3PRUFDz+k/yI9dvm8huAy6hkbDnnIsoFRv2Quik1aw
3qakDnn3jWZPVuXDbUonIaBCZmQwroTiMTRnnB7Kz17hE5ttzl0uNIF2uMeGfSy2
3fab9j3SGK+lXPpbVXKwz/2KLdQcYVf2+2i/ANBvjAwBV/kit2f7f/pRGJdvC2tS
+IT3D/jSfHuPhUM1CGel4pebV+hU+T8s6TBbxnSD4rgr5BvVv4oJbPmpaV1dkHvA
rc5nw1SsEgFYryQmQ/As4HlyEZtc+hs0p/zXABcVBGAR5sBP7sPpO9+fiGoJ/6sr
F3gf7Y61uNRoKPngPuAQRgzWVu0u+HMVuz1MYBm814DgfLMABCR6NTnfeDDoAAJT
IYssaEmtP3nObXMk20ZkEGMOngfJH60vGdS2o2EUq3fW+7ahWdLsPfmr1Li76apj
DyB5pawCbfA1FrtGe1d1xPgCEsclAEXHpIiF5TiffRjba9o7IFc=
=ZBAC
-----END PGP SIGNATURE-----

--OvQzeW+pTdXfWEkL--
