Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A34E5FCB38
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Oct 2022 21:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbiJLTAb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Oct 2022 15:00:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbiJLTA2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Oct 2022 15:00:28 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 608AB37414
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Oct 2022 12:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=6sA2cMwrpuhboo54UDc3vz1g/heK
        z195KAk+hllhyD4=; b=Gn7VdQCDj0czpCOJwvh7SHT/qFpjwwrGtl87GF4oITOl
        serCax8JryipONK558vf47gN41z3638mRfPq26HH3CBS3/QWiOeu/aVzfvhNoMiW
        6j9gmeeRFxjkT283iDSjoevs7Q5b09kmJLRVmU9Eu7EP4Hcl0Nn1GA336HsoGUE=
Received: (qmail 815584 invoked from network); 12 Oct 2022 21:00:24 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Oct 2022 21:00:24 +0200
X-UD-Smtp-Session: l3s3148p1@GCtHAdvqKOogAwDtxxN7ABspc7EPVowl
Date:   Wed, 12 Oct 2022 21:00:23 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a779g0: Add SDHI node
Message-ID: <Y0cOx8YfvdUrllyf@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <cover.1665558371.git.geert+renesas@glider.be>
 <d2d5cf982a380699483edf7a632441628ee73183.1665558371.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2p5JItaD4PSRBEio"
Content-Disposition: inline
In-Reply-To: <d2d5cf982a380699483edf7a632441628ee73183.1665558371.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--2p5JItaD4PSRBEio
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2022 at 09:12:33AM +0200, Geert Uytterhoeven wrote:
> Add a device node for the SD Card/MMC Interface on the Renesas R-Car V4H
> (R8A779G0) SoC.
>=20
> Based on a patch in the BSP by Takeshi Kihara.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--2p5JItaD4PSRBEio
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNHDscACgkQFA3kzBSg
Kbbz+BAAhHkqP1HDkLwd2uGoV5aTuSrbfzIIVX5EuxtpasoztBZbvw7InFzMrbrX
BsJvtfdQtxahnczvcBuaIZpvV5PQzsoR0aDarBpaiTKUcLObxFirsHCRtbYvgT4o
3GTpaKNBIDbs4MJHuXcOObaYi1hNZEINtPS2/M089Xhvp7y39nC7M9asL4jKMslM
IOc9R+b/+/J9f//x73jmbYqP8fem8qxCIYuSr6n/pfsRDwC5933XLUTkl91xBkLh
ySl7xPcUhGkhWJpNyKR46X7Jpht2LRfz7SfRXGtnhZhK6th3Psw//KKYIV0wDURo
YMpMJ9RtqFLgK5tTwEZkZrfLMNllQNEi23ax3Jb1Lvi9Awo+d2iM99cCQ6qN1lP2
/OBDpco+jos7QyZ1SOlOUC9xrdCI/8urx0G6wwm3/t2TYVEkJ37DDura+jPS/ZlG
S6zBhDXTqBlnt6pDrVUc8/d5G61ctBI3YRvSSumhDwG323l2OP49nE+Y/sVBvyVM
MC0c+WCCEjPaPLjIlTpfOQmXYTk/9aZ86wu6/GI66SO7ezF+8B6ovH3keJmkkbge
6niyR+iAp1pMApGfNmw7mZ7HHDfdyzLEXSijqSUAai4kfkuDoXMXD5l1XmXC1hH8
lwFa33n/sc/A39hjy4HUwIL9bHHieJGOGCwyMQHFWpiGyRkCA5o=
=FdzB
-----END PGP SIGNATURE-----

--2p5JItaD4PSRBEio--
