Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B84B51AE17
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 May 2022 21:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377577AbiEDToX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 May 2022 15:44:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355901AbiEDToV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 May 2022 15:44:21 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BF3B4D629
        for <linux-renesas-soc@vger.kernel.org>; Wed,  4 May 2022 12:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=SOm4u6eW/yIX0J2Bb0AQeBrw68BQ
        rMKqKO2sO0h348g=; b=gqBOvUxvIfb6bdWQ8nSx+88p0lY3LgT7oiwdFwE4/uhO
        XAEusf7Ns1MfmibWwAUPHf93yGqkW7gDptFx8GG6ZY02WEDAego3kHoQFKDd+JG1
        lRay+i8TwBbqE4olDudOLh6damdanJPySXwTbFDxiEy/rCdmBUxQ9EO20dQSrtw=
Received: (qmail 1530941 invoked from network); 4 May 2022 21:40:42 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 May 2022 21:40:42 +0200
X-UD-Smtp-Session: l3s3148p1@8fvezDTeFpwgAwDtxwyXAP9dq+3qRUcy
Date:   Wed, 4 May 2022 21:40:40 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a779a0: Update to R-Car Gen4
 compatible values
Message-ID: <YnLWuFIy/gAA2iR4@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <73cea9d5e1a6639422c67e4df4285042e31c9fd5.1651497071.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="051duSPgxVRwDn5i"
Content-Disposition: inline
In-Reply-To: <73cea9d5e1a6639422c67e4df4285042e31c9fd5.1651497071.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--051duSPgxVRwDn5i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 02, 2022 at 03:35:17PM +0200, Geert Uytterhoeven wrote:
> Despite the name, R-Car V3U is the first member of the R-Car Gen4
> family.  Hence update the compatible properties in various device nodes
> to include family-specific compatible values for R-Car Gen4 instead of
> R-Car Gen3:
>   - DMAC,
>   - (H)SCIF,
>   - I2C,
>   - IPMMU,
>   - WDT.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

LGTM!

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--051duSPgxVRwDn5i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJy1rgACgkQFA3kzBSg
KbayEQ//SQ/L2/fG+pcHNEdzNMcwKVvINOifXAZ/zeArx178UCIcXLVfu2wkVF3Z
fSITmU3sS0h9en5pfy5k1rKGegmXXOx6B7RrGX8gInEgveC8Q04P2LCatU3PHxn/
K0rn+rY7sA23pdy4hHQ3JnGv5Twcy7oLQNhzCCf8ol0Dk3aspfwumybygnci4/+/
j5Sg9GGWEGxEtKVyDBAucXt1yWmi0lKdQPR5Cgn1GSPEM5asWTTDpxz9tSnvVyvz
6Vgx5HitLyXM2mJXLIHuncwkNyDq73bwafPABGtrkYK1doHw5JYl4GCu4p5/jQXE
YlxjaRvFTJTRPPZm1vYM0dLTgjXuHEJdQPUMxKAY/HwWYBUEmR+J2Y/451T1Uobf
i53HJIyXsYQKwHgQt8UUb3crmXSVQW6wBqsHOlUXfCPY65f4ObDp0zUTa0jxIG8J
8e/J8OhkOKwCcuk9KZ3Z+bF4f0iS/LHDXcOAwjs5PWA4FxRbhGKdWvkgdc8fycLy
WZSidDQ2152UO9dde/v0aJ73THfaGY4SCzbbXmTmzRdT+Yrm+zPGWW4nXVvNthNv
0Sum5BxHcGyEukFNZSJwBm9Z19fuHyJNv8UbuuD5t5du8Wr995vBylFaz+sqe4qI
rw1fdgu353dBqQQK+FVki+b30zRqeK5QIhq4svbkldOO8lcMBH8=
=hB1H
-----END PGP SIGNATURE-----

--051duSPgxVRwDn5i--
