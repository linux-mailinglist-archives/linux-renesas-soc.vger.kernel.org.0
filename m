Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C82625FCB5E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Oct 2022 21:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbiJLTQl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Oct 2022 15:16:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbiJLTQl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Oct 2022 15:16:41 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E0BBD8EC3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Oct 2022 12:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=KT0tcmcQzZyWogOD3cbS21db8dEZ
        zVFVycpKkeTp1fE=; b=dLcoWxbHRaE3DMLmuZp6VTaNWs9r7iq9A+Fq3DpEB7Tg
        GdaGLwdD9H1hO2ens7UaS1gnz1eMX61lzuw/I9iVgY0sfaz1Y7yb8vYwMMt9PzMK
        6gmoS/zGV5HbjjIm/tr+9Rvnu4qfw53ZklSVQqfy5UoomN+Aj8A4ZDaJLYy0Ae8=
Received: (qmail 819953 invoked from network); 12 Oct 2022 21:16:38 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Oct 2022 21:16:38 +0200
X-UD-Smtp-Session: l3s3148p1@LKRUO9vqOocgAwDtxxN7ABspc7EPVowl
Date:   Wed, 12 Oct 2022 21:16:37 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] arm64: dts: renesas: r8a779g0/white-hawk: Add RPC
 and QSPI FLASH support
Message-ID: <Y0cSlcx79NPbwM3x@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <cover.1665583435.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iDZjrwiS0JZhVsM7"
Content-Disposition: inline
In-Reply-To: <cover.1665583435.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--iDZjrwiS0JZhVsM7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

> This patch series adds SPI Multi I/O Bus Controller (RPC-IF) support for
> the R-Car V4H SoC, and QSPI FLASH support for the White Hawk board.

Did you need to alter the firmware to access it, or did it work out of
the box?

Happy hacking,

   Wolfram


--iDZjrwiS0JZhVsM7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNHEpUACgkQFA3kzBSg
Kbbe8A//USwScBhv58teJ8mQ++4AzbX9rS8OrRHhLdN0d0+qRIEDztu/013uDiiy
sXg6yk+6ufG8QzKX+6LWHXIGLKRuAVTE92+p+WStnYQ7IDtaG24enA3uNUNYEdPr
L+vxrg/XVP+ScEPs9aXCBkNoRDhWrtMDEvRNARfZQzk8w703mYw0qJn9BlmOUSmw
ZxhQmj3mW0PfRmIcfF7ankyBYkzOsWF0vRKpFbJcjk/JbeyvePeK/f1XIxcsJXWp
sBYhZzlGl99Gh9P8EqiVx24aNQeTRVbL+Ochs4eKmPJiZdymtBDGvPGnDYDu6KVQ
LkUdcGmG7ee05xsP4Xcbole0KAMQDkdUHZrBpijKmyvgaizAmwzAckkn3LpFejWW
9FR6qW9hgtRlBfJfhFTVMc5nOMI+rFX1prboLCj0tx0RiXzLa67VluKoHjYaJcGR
boHjUxE6nFtN/qf+p/FLKfnd3VGsYjvuVf/d3AG09o6iYi9UJkfKxPJo04z1S0C9
tZbOiMYUirSfQQvzsW37uYauIVs3NaFvXy3FsgvR8TDH11oM3siS+9iGWo1u06oU
TmEYhkIo6bJgn6LXUXb5eV5DpoDOpoAw+9DwbZESt/sPiO42LnVYepTl4kKNLt02
UveuKgSKdEpOJP+rPKVR22q1m0MdDdJ+6PWmRlDcLsq0EQRyxck=
=HCiS
-----END PGP SIGNATURE-----

--iDZjrwiS0JZhVsM7--
