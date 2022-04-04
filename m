Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3884C4F1902
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Apr 2022 17:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378802AbiDDP7O (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Apr 2022 11:59:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378799AbiDDP7N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 11:59:13 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E02D15A3E
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Apr 2022 08:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=oH7gNxu5OIXE74NrvkNg1O+3B3we
        xwwiu8JtJZvGZSE=; b=HELW+2jSQe2ZYegrPfjDw2EpF2xJS5Nbuk85l3xh4VDw
        5IOXVMkj1AVovmRRIg5v/IO9dxNzt8XNcwaT8MIMPgGcuRNwwKFPPHzgPddwd+rV
        IKoDFcsEX9OSzqi7CaUnanjM7aeX0xGVS+PrKkjNK82z+Dzt8DxkS94NgeOTBiU=
Received: (qmail 1932916 invoked from network); 4 Apr 2022 17:57:15 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Apr 2022 17:57:15 +0200
X-UD-Smtp-Session: l3s3148p1@PcmcLtbbbqogAQnoAHNmALK3JllQBOZM
Date:   Mon, 4 Apr 2022 17:57:15 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: renesas: spider: Add Ethernet sub-board
Message-ID: <YksVW2UoCaqSMMVK@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <cover.1643898884.git.geert+renesas@glider.be>
 <5aa58816182b34d9e5795bc1e22784f4e4879d13.1643898884.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6FL+GdOSegFw6t9J"
Content-Disposition: inline
In-Reply-To: <5aa58816182b34d9e5795bc1e22784f4e4879d13.1643898884.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--6FL+GdOSegFw6t9J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 03, 2022 at 04:26:49PM +0100, Geert Uytterhoeven wrote:
> Add a DTS file for the Spider Ether TSN sub-board (RTP8A779F0ASKB0ST0S),
> and include it from the main r8a779f0-spider.dts.
>=20
> For now its contents are limited to the Board ID EEPROM.
>=20
> Extracted from a larger patch in the BSP by LUU HOAI.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--6FL+GdOSegFw6t9J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJLFVoACgkQFA3kzBSg
KbYsJxAAs92DKirSFHKpyJ0DQyG1avhJ66f248CqVCvs7bL6X8P7u8ZwVE2uNLdr
imoeEm7ImBgjk5Z1IQ5kggWr4T8fk3r6q5FFAbNthsqUKFLjl7pDUYyo808TStkN
R725rKhCxDIoxyYghfX/a02NN3bF9sqjZ1+4n7PBHwlWOc6keyeF5ON1CepUFNRo
a6o0PbhBKUxHhG8HVRd0AQ2E/ptKW1SgNnsSdZ7wnUYYjka1fVnCplwM2cgeddxI
x1ojZq+uyzvH7yVZFHuwhSunbqXWAg7fcYsj/NFcUy4RAFpXQ9LZ6eEGFj4vq+6d
KHwK5UskMe+k+1/w5hk0WoakGxt/bt4aefEa7koUBVWDWKK7PIJRrAEZ5tDacHaj
pxLPTt0+k8RubMzPLzEjadTZ8IfkvuqzEu8qWP5sh4eNjQuvv/GbRLhhLKAwKG4W
JxL0wiURaRaxYTDzGf6NhSnrT58i3rvvFPKkfPSYDB2eZlEy8fDtVztctP6JtgDw
r8F73cDEb4mv2+7mKmlRyWpV982Nf6NGuAg9Hq4wRZJJhr/n/xwu2ZBLdp78gOce
Kk64jKpH6lqi8fanrWR0GhcH0hh5BLExwKdVyuG5G96l63qIXYv3FjAgwBJR1NZt
bhfxTGVJVdGY/v5z5lxiOg+e+1SSv4Kd+cB96ZX/y69CzgNz7uE=
=9Zgs
-----END PGP SIGNATURE-----

--6FL+GdOSegFw6t9J--
