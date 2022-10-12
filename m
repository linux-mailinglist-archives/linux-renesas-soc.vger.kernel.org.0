Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1A525FCAEE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Oct 2022 20:48:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbiJLSsN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Oct 2022 14:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbiJLSsL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Oct 2022 14:48:11 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35BCEC45B8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Oct 2022 11:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=2Vhi0MUodraNVEegB85Zo01OYHT1
        o8iR3LteolowBxM=; b=P+4aipyTFLzBSZuMEqcc1CHz0xFEvQjgxTP29aKmwknr
        LDwW3yUboZbjGwCNW5x6MbhI9iPvZUgH10vBl8msv5PkO8teoeoq6voNVwyPnvgu
        EDsngmQlhMUAYWqSOvvcdUbUHjMQp7NdbtRA5pPXM9AO/C3cgaosdMXNWxNNN0E=
Received: (qmail 812036 invoked from network); 12 Oct 2022 20:48:06 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Oct 2022 20:48:06 +0200
X-UD-Smtp-Session: l3s3148p1@30Eh1drq/sogAwDtxxN7ABspc7EPVowl
Date:   Wed, 12 Oct 2022 20:48:02 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: renesas: r8a779f0: Fix SD0H clock name
Message-ID: <Y0cL4kDOogA9wBV1@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1665558014.git.geert+renesas@glider.be>
 <1f682d338f133608f138ae87323707436ad8c748.1665558014.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="y2naherowGktJY3h"
Content-Disposition: inline
In-Reply-To: <1f682d338f133608f138ae87323707436ad8c748.1665558014.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--y2naherowGktJY3h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2022 at 09:02:33AM +0200, Geert Uytterhoeven wrote:
> Correct the misspelled textual name of the SD0H clock.
>=20
> Fixes: 9b5dd1ff705c6854 ("clk: renesas: r8a779f0: Add SDH0 clock")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Oops, thank you for catching it.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--y2naherowGktJY3h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNHC90ACgkQFA3kzBSg
KbaCgA//Wnttk/O/VrUeo0tNBTnFG1G/5sF906IIO6puPNmLkTUKhLFJbdsllSGD
AjU07niY3DGpALFcGIGgJZ7HHBnxGysgi2sNcGa+d42ePJtH+UUW1WOV0znVJQ2x
ULO+rWD7fxRgt1MIfNXjkO3UnnZ2ws4+ljpxXooYFBshwuEDkGa5Bxpw76CHo5nM
b3rHfrBM4Xcd510YOwvIK0HK9JUoELHwi6nkEBeJWSq1c4q2adCeEb9aHkhLbTur
0NfxGebt/6WwADW5a01gzznNlSUtaWTt/dekEDfKVKABNqJnZvGeG4ML9coCBKCJ
/MP1p499qfJ7gOVwa0KtXLEy/MEEd+/CXuchWyYmpt5QR0iZaMyakm/pbHrp46UX
fSKP+B7tDUU4Aa3N2C1Ic3x2ZACHbS0geuXDylbmJE9n7lnB4x0ENyhn9zUaFGxH
gYMVEz437DFksbpvjryoVsV4rMnRjwjdgJ2Y4HuaomUFSsco/7NvJit+QpX8p+Xo
GNKaR8xH2OI9sUsqaF7/2k+I+Ncjgr0gQMalxK0ApNm2dk6cC3s/3KDkteXGFRpW
o3IQxqDqq1N3ZTWzqZhUObvQgeAceCa/WV+DxBBUbqB6q/qVcsOaoKug5PKLjXO7
Os5QwZdJUPZFef4fOq673MDvg6dTEUh+PuU4pX/81YxY7D+cC/g=
=Li6a
-----END PGP SIGNATURE-----

--y2naherowGktJY3h--
