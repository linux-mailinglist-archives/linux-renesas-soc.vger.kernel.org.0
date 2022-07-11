Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71ED1570723
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Jul 2022 17:33:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbiGKPdB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Jul 2022 11:33:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbiGKPdB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Jul 2022 11:33:01 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 763F42E9D9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Jul 2022 08:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=3jbcBZCrfXdwPJiypaAN9dsWHnE5
        mBnJBk+C1SjUH30=; b=Dze0PnGaem330+27AKoi8W7eDJaN2gE67yEWdrpGotXc
        df4oGEDhU1ofVD/fP5kPauxL55vVFbNW9TExUjrtgztxCpMqhk9kdnz3qeUPEOPc
        1UMfUoVrEeJi5dwO5vvR8DXvnDb/S6gCkM21nLmPJm2rBaon2q0/6LbsKeFpQuw=
Received: (qmail 3590205 invoked from network); 11 Jul 2022 17:32:54 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Jul 2022 17:32:54 +0200
X-UD-Smtp-Session: l3s3148p1@X2H5Q4njhJ8gAwDtxwdRAEXXn+yo/Rze
Date:   Mon, 11 Jul 2022 17:32:53 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: spider-cpu: Fix scif0/scif3 sort
 order
Message-ID: <YsxCpS7AElZbvsUP@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
References: <2fe0e782351c202ed009dcd658f4bceec8f3a56d.1656951240.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DmknQB6EYubOPOPX"
Content-Disposition: inline
In-Reply-To: <2fe0e782351c202ed009dcd658f4bceec8f3a56d.1656951240.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--DmknQB6EYubOPOPX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 04, 2022 at 06:16:26PM +0200, Geert Uytterhoeven wrote:
> The scif0 nodes were accidentally inserted after the scif3 nodes,
> breaking alphabetical sort order.
>=20
> Fixes: 1614c8624a48b9c9 ("arm64: dts: renesas: spider-cpu: Enable SCIF0 o=
n second connector")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

I can't test because my board fails to boot with renesas-drivers for
other reasons. The patch looks good, however, so:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--DmknQB6EYubOPOPX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLMQqUACgkQFA3kzBSg
KbaWVA//dD37yWEJJDpY2IrWyM1TJiEHa/FflWr6n0IJPZ8fdxjNUTuOCIAYCctp
S+y1R9sFR3nxkbucaADuhEnfxNw2B29EvFn2bUcp8erid+NNm9GO7KYb1JDoEEVB
p6gqKAtJZMV0stNRnctIEWEV+19wtv0vuks4xMSHnbD6FKVoXUlANtmAV4JgKG13
4Iw7XG4PlRXR8V9UDP7UejqEhZuM83lVcfmM2HEoCXjc0yk7/ziyL/9ZY9LpyhbH
Rk6gKX7dt1E/cTptFgNAptFtxEOPlPUcnAJ0qDvL1Gcu4NXrNk7Yk074zJgnkfCT
aM3Em9wmgwtocV26aldEgK/cLQm56uZ6qTaxqgnJ69MkNiQzQCKWWC+OgPJ0M3rv
aBvQjzyDaKt08M6Cp5IvGxGNeCWx10lQdhBy0h6mZvyByXJpVTOAze3kpg/WqAsa
JxuHbSJj4yE6/JxmMWckklpAVqZVdBcIDVdJHufT60Q3TOgjM/T3JxJyeNsGagqN
9uO3WYnc1KywSJ2NjQAH1sPumk1ejFWBBDSKhSEqoV/D3EFDm+e2nxgml2BBgRkN
GCVJHeGpeJr6QXpatmppCb3fNGWCQc6LaHzfd9BydN/ArKpwmtt5tVwUj9XogARY
l38p66X7zsUB5YqXxkPTi9F8wC8NbGMTZ0WrFpqSfLW7w7SaDjk=
=mqsV
-----END PGP SIGNATURE-----

--DmknQB6EYubOPOPX--
