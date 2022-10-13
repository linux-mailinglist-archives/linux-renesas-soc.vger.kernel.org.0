Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7B9C5FD91D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Oct 2022 14:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbiJMMTe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Oct 2022 08:19:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbiJMMTc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Oct 2022 08:19:32 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3890105350
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Oct 2022 05:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=Eju3YDtoify6gT2Dh/sQ0ydh/zxe
        7bb/yU8c/5kG6uc=; b=nIllcVcPylbmyB48kl0WXXCgdIAOXqPMtVJdlY26fDiM
        GdLMJ/rdTUG2LXnry67n7+nRYxLf9OIrtj88lqxMGa2UQPrkyTNOcwDt3BQIJRDR
        N4DZMmtMQYQRtlSnmdvCiAb33sioP0n6G6QM1/PG/SKTtKRKM62LSvQIMhaeOIg=
Received: (qmail 1101032 invoked from network); 13 Oct 2022 14:19:28 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Oct 2022 14:19:28 +0200
X-UD-Smtp-Session: l3s3148p1@2g5KhenqMrQucrUX
Date:   Thu, 13 Oct 2022 14:19:27 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Hai Pham <hai.pham.ud@renesas.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: white-hawk-cpu: Add QSPI FLASH
 support
Message-ID: <Y0gCT0wFaT/OubiV@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Hai Pham <hai.pham.ud@renesas.com>
References: <cover.1665583435.git.geert+renesas@glider.be>
 <c3a01a8de924d6a3fcdb1ee0284544ad2ea5c8ec.1665583435.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nExAjBgbmy6YaRrV"
Content-Disposition: inline
In-Reply-To: <c3a01a8de924d6a3fcdb1ee0284544ad2ea5c8ec.1665583435.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--nExAjBgbmy6YaRrV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2022 at 04:06:51PM +0200, Geert Uytterhoeven wrote:
> From: Hai Pham <hai.pham.ud@renesas.com>
>=20
> Describe the QSPI FLASH on the White Hawk CPU board.
>=20
> Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Looks good, but I can't really review the partition sizes. However,
Geert is very good and careful with hex values :)


--nExAjBgbmy6YaRrV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNIAk8ACgkQFA3kzBSg
Kbb1UA//W03kCOVCJ5TagDWdX5+0ErvElSOnQhxFdbskTUBQi3HqllXd/81KXFLJ
LWU3C2hBpQPpB7RaWrEzQC0WLfeh5vmzLgmt3U/UupqbKp4j4ZTHsrh4WLYhbOOt
biFz9Z9WhPGeZvtXSKguozaXsmVvCMFzRIhQsI1nnWy3EVNBzZEpQBrSJHazZ2hy
bUC78YJPmvz/G0beWBXBvU4BStlOE5tjOsrUwAaQdeno/Of6dM2LG9LRk+C2rMDo
lMLDz65B7T0aI2xi32uAHbU5UMIANaCRbYfU8xH+/K4clK5+sKtFRFxrFn+HaNep
Qjwrot+Www9WE9XPszWdOuVs1OjYQEkjvM1n9exAcPjL9E/pVRffQBWGWPER6efY
KSg3OeRCktqOZpZtxpQ39eWeY1LD9IrcjeVti4dtqVQuGJrgFU0dth7/mdI7LMcZ
yqcHgP/wCixm5wmMMvlJPZvrMwl3Cs5xYN4Ph9b4+HLnIFJt5JEkqgg1j0u/e3UE
wYh9envZXwZp553WsCkXZzCulthugSa7p53JVl11Oga3OeFPMmZpQPQeQXqKBjW7
ThoADT+9B2lIpmROXpiMlfMALhckuEpA0X2Gyprtct2axMldMWUndkMcOb9bYgHw
C+jVgG3y6Fypjhk5vTtvnwLZ5BUr3HVJpJQ9PO5DUGyY8LJQYJo=
=MP9h
-----END PGP SIGNATURE-----

--nExAjBgbmy6YaRrV--
