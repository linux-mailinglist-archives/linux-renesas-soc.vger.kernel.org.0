Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E066F4F7690
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Apr 2022 08:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240113AbiDGGuZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Apr 2022 02:50:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235677AbiDGGuX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Apr 2022 02:50:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77661220B23;
        Wed,  6 Apr 2022 23:48:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1045961D6A;
        Thu,  7 Apr 2022 06:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3CD4C385A0;
        Thu,  7 Apr 2022 06:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649314103;
        bh=0YdO0Xc5cXY6/sh+jAMBaRYipm8kduScuqiqau9Aa4s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ouM4hIdtzdKYjX3Fvq573x96XjCXKOuX7TXSV0R5bd9l8RoVDJVOMCDThzLHHMvwR
         Uj35uTuT3Io8fQwGMiOcqfHfZzR7gT9CKtuvRLk9LtRyTzqq7AaDLtd4fP8XE6UuID
         Xg2LXqhNP0BxTodabvZNg5bu23eYEzk6blpj9lLei3sc29R7Di75TT7GXmDBy9yk/x
         SKF7TNlHzj6h13o9/yQ+TxKF8HFN+1852D/ShNyWmV+6kjsL7Udc32f9ybtbWwm/PR
         FHb0WBPz2PMbtpNEcMqStVT1MrGoVu4cp8ktht9rAvjnRiEQ7X0/7lCGXSImH7e5nm
         SnsF/mr87RTTg==
Date:   Thu, 7 Apr 2022 08:48:19 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: renesas: r8a77995: Add RPC clocks
Message-ID: <Yk6JM6pKjxu90Mtm@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <cover.1648546700.git.geert+renesas@glider.be>
 <3fd1e886b7737cd0e199603bae81d01be9dcf3aa.1648546700.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ADuulvOI4vKfnTya"
Content-Disposition: inline
In-Reply-To: <3fd1e886b7737cd0e199603bae81d01be9dcf3aa.1648546700.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--ADuulvOI4vKfnTya
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2022 at 11:44:26AM +0200, Geert Uytterhoeven wrote:
> Describe the various clocks used by the SPI Multi I/O Bus Controller
> (RPC-IF) on the R-Car D3 SoC: RPCSRC internal clock, RPC{,D2} clocks
> derived from it, and RPC-IF module clock.
>=20
> The RPCSRC clock divider on R-Car D3 is very similar to the one on R-Car
> E3, but uses a different pre-divider for the PLL0 parent.  Add a new
> macro to describe it, reusing the existing clock type for R-Car E3.

Maybe add a comment in the header file stating the last paragraph, so it
is obvious the "E3" there is intended? Other than that:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--ADuulvOI4vKfnTya
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJOiTMACgkQFA3kzBSg
Kbajhg//Yku0TM2/h+2EYbuJ7BOJvBG8fTf6wDG2vIFDWahFEUb0cA5CXUyNkhIW
Z8sa1dBYwiiLzJrcyEca28k3RKToTtgddjl3/VvGPUNgXWnRVJgIAw1zhQX9B36x
33e7T5L/dzXufKSRoHLoFvaS5OsN/l7uzs8GoM9pvJWJ7ULdRAF95uundFX3pKrN
ybUmfR5ntipaXBqCY8euIm5jq5Bz2Kr0Mug0yt84QhMDc5SgyEyhvm6ULUjacwM6
boDuJVSLI6w9HfZ4uqbYL30TuhKTi6zdeqGt2YdHRHgYD9hrglFcke24AWSKyJfJ
TpjPm2fWvJoPWzkE5noetjIY5ikKcvEIGfvvDa90XWzyRDkV/2VSx1Pwc6c7yMnC
YoDoj0tJlpQQMAV4bgxsEpGIC0sOE9vDkz/VVYIPA0qve+MZVI+LcIdBK1H8eBkE
6/J9VZbyJPORmUEH1kBt/TVrGJoBvcuN1aONlq4AIQlLNOPYnhkmJQcL5pAg9xTK
QosjEFvlLBUuR9td3duSoHaLeBDsXMD+UgLeNz19+gaNueYLKO2DuDeWk/RyBHfq
QRL8iBhlIewxuiN2egmmBRWtuvIA+6juKa51rFzxnDJ4aBhGIxWU3NMXNfURdiOp
V20f4Ms+wfO7pwghnENtgmddKHPi/ZCj7SjzssDHANclZknQsPg=
=HWHe
-----END PGP SIGNATURE-----

--ADuulvOI4vKfnTya--
