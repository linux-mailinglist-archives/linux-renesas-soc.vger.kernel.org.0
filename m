Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94D174F1900
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Apr 2022 17:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378124AbiDDP7I (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Apr 2022 11:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376800AbiDDP7I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 11:59:08 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AC343EF34
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Apr 2022 08:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=/n+OCk9tVa+rS7qm24GFpFKOquRs
        OsJXklZ+9H6ua8Y=; b=yF5jOj1aH2EpaXvq7JMfxbz2SCo01sjSn1a5caPZdHAg
        tygSlxO6lLzAyIlScG15OnArZAq+MVgAEMVVekXww2ion+eLyw5Yx9ig2gzkb1Rd
        1cuEync7QKJ8/EOaI2wyj5zMBYeKSalDCkdBEOfzBHJeRliPgPe50Ps7Smc5viI=
Received: (qmail 1932866 invoked from network); 4 Apr 2022 17:57:10 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Apr 2022 17:57:10 +0200
X-UD-Smtp-Session: l3s3148p1@065OLtbbbKogAQnoAHNmALK3JllQBOZM
Date:   Mon, 4 Apr 2022 17:57:09 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: renesas: spider-cpu: Add I2C4 and EEPROMs
Message-ID: <YksVVTLIA1ox7gmo@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <cover.1643898884.git.geert+renesas@glider.be>
 <6d8917e49f83b6a932970ca169100eb086d11f16.1643898884.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fdZtHBuYmqzeHIHG"
Content-Disposition: inline
In-Reply-To: <6d8917e49f83b6a932970ca169100eb086d11f16.1643898884.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--fdZtHBuYmqzeHIHG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 03, 2022 at 04:26:48PM +0100, Geert Uytterhoeven wrote:
> Enable the I2C4 bus on the Falcon CPU board, and describe the I2C EEPROMs
> present on the Spider CPU and BreakOut boards.
>=20
> Extracted from a larger patch in the BSP by LUU HOAI.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--fdZtHBuYmqzeHIHG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJLFVUACgkQFA3kzBSg
KbahHA//Sxbae6JlSni07jX4w3BpfTJGGnQTf6lbYew4rsxqUV08Zsfe3pV7Maih
JwoiIcLSG1G9ThHNEKePMhDsBVGoz8z05ZJKFENvAhYjTRu2acRcRXb4f6aQlU8E
eLgXwIFfj+NLZynkXpKVjFcMZWDgme9ze/oSSrIIEPv22g+Bba6HoowELbMW5/pV
EsGSk6e6TTAtAGHVC/32HytwlhCeS/AR51W+K4/u4hMXhrQ7NIUPbxRroV3bcavd
E9cHzs3zclUevLPvL3t6n+xNYXgn7LXxFS91tjF0VQm/0hMkyEBGx9c8H+3qEX44
rbQx7aXaoPmmtFvbzCZ5Eq+XLeFFXUdooZG6PSFetvklyX2jv2uFTYi6uUHYZvxt
5tMm77w9WdPapNkR3i9UE0HT/M3U0j1KUveyEiwdQAa7y+5Xc6zX6UOnOxi2oGX2
BMhaIjWKrJ36m6n2lLgsHgyij6+OeeN7c7Xb4v1xMGSU/RBnWSxVKnVkmm5kEAYG
EUIzkw/yvgfp9WpqSHbVKcfHGxmoWwKhHV6CBj5J/+k6hZJ6nJB24ti8hEx2Qx81
IYYu0UhegxN/zUGWE4FRBASbgsF0Jzn0KBUaW7pEAG2zUoC7Ohj8sj+Q7dn5T1rP
8DTUzp56i8WTWVOYknpzwrQxwrVupIdRev+L9eF4SsDKNlk2N3I=
=X8FF
-----END PGP SIGNATURE-----

--fdZtHBuYmqzeHIHG--
