Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9927666164
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jan 2023 18:07:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235625AbjAKRHm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Jan 2023 12:07:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238633AbjAKRHK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jan 2023 12:07:10 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A9903753E
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Jan 2023 09:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=gkM0VdFZdvNbJyLi3s3CnwOlS6EU
        u0A5L1bKDADdpUw=; b=HVNNAVdP10U0MoJbxzFPs1d2m3sFyZqAp7heRzP/4Yas
        pga853Ursqrcsaz/MVrNw4pz5wZoa1L1F2/PYkQ/4mlq108d2tI26/3V/cps1V1x
        Vf2C3VhbpFs2QSF8tu/y2WKSBj7/Db4zPPbB9OK0xW/9Jdx4PoTn1bDqNZE4c/Q=
Received: (qmail 348191 invoked from network); 11 Jan 2023 18:05:39 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Jan 2023 18:05:39 +0100
X-UD-Smtp-Session: l3s3148p1@3ix+AgDyYJZehh9g
Date:   Wed, 11 Jan 2023 18:05:39 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: spider-cpu: add i2c0 bus
Message-ID: <Y77sYxv8qBTRGmIw@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org
References: <20221220121959.45779-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdU9YTgXLdgqPvUWwf6cZAGBPTxSspwnO5KTyVL3v_gwbg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="o8TZGlddOlyRmhtS"
Content-Disposition: inline
In-Reply-To: <CAMuHMdU9YTgXLdgqPvUWwf6cZAGBPTxSspwnO5KTyVL3v_gwbg@mail.gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--o8TZGlddOlyRmhtS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Add the bus and the GPIO expander connected to it. Based on BSP patches
> > by LUU HOAI and Phong Hoang.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> But perhaps Shimoda-san's patch is more useful?

If UFS is ready soon, then for sure.


--o8TZGlddOlyRmhtS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmO+7F4ACgkQFA3kzBSg
KbZ92A//bGgzJOGZojusXVQfjyLopzlIqrOHAC2FewJEcPzQ5MWq6e1M4JrtAjlj
TLg0Sol0lDCrISPufobbJOaxMuSi4BLHid1naWRlk0i3BhvnPRU8jc2byIJPvoVN
vXwxakOWGmKanUiS+mvxTEvGyfTg6FxxJjZv5p47cmv/YUEm0OsSvwIlOnZEYIGG
Bv4zPpO8mMsztnF7LGfmz4psFFyb+xBpfD15L/yMiCp/cYCmwFCIS/Oobo50pBz4
YujG4uFKLitRIgNjQdY5G7yXT4zhDfTmS2ASFm6Dflg6pmbYMWQI6CobJEIv816O
cA7o90AjJxfuu2MBvBVDmSI7p/sbVhnmAWwblLNIyOkFqxHzsnHNCkHzwu1Da1lq
xu1RTpt4ha34xTiv43qOOoDofhvpRrDPJFTgLtcqmoT9sMRxT7aT90mCs8vwvOHm
hBMgYZbxEzKugBXjo9imsEU48NCT5PgIdIfIvbW7oJpGO/Jc+fiDSxzV3xFLgk4r
wlqL0KjhXn4bJvd3BKovCkpI4ASBzj9aRZX90b97klWVxFWCa62Cj392f4Jduzc/
BRwEFq6RlcII5U/lN9tVIalO7YfECJkTiV6slirPSF0/t9hAi+X0tjA0HB7Dln+G
p7Avr8BlHrtqwYRSh9+eOZ2HbNmwRlSDyVk2pHmFL4Z/blte9G4=
=yfiA
-----END PGP SIGNATURE-----

--o8TZGlddOlyRmhtS--
