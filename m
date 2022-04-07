Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE744F76B9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Apr 2022 09:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234702AbiDGHEI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Apr 2022 03:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235246AbiDGHEF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Apr 2022 03:04:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CE75221B93
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Apr 2022 00:02:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C207C61D6A
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Apr 2022 07:01:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C8FC385A0;
        Thu,  7 Apr 2022 07:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649314895;
        bh=XaYZgxnN+ueVrEuNHgaUoCKsIldewEDdE3zlB2N9WH8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YpaVhB1lH7ZTJ1YF1bF/wlh5tey/VJsbW/jh5IPv/0m8L67zuT0Nm94aLJd1d3tHa
         ca6Xl8lnOTk2QTwFPBb18kMWCbLvjTRl2EJweCJmu1Kz02aiCw5BoQMpFCbSRF6tq0
         tatS5fcIGRs1wv7bjksm0L4mJB3Wtq4rFu7REiH3Qhcmg04IhGFbklTMsq/RHC1sBX
         y5Lvsdg7FrryZ5cEMzrlI+oRxIx/LX9Tni8K11CkKt+dKe7oA+qiME7sTXBFlWRDzt
         LKuH0Ojx2yZ6xBalMs7VdIsdaBAEqzidnQOA/jPvbCJ55q9CFrJYQ4tmqzQ+zdSoVn
         R+W7HAqDoN98w==
Date:   Thu, 7 Apr 2022 09:01:31 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/5] arm64: dts: renesas: draak: Add RPC HyperFlash
 device node
Message-ID: <Yk6MS99tNvlq+MMA@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <cover.1648548339.git.geert+renesas@glider.be>
 <0f3d3018ecfcdce1bce67708708a6d3a98368b10.1648548339.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="F2Nt5GuXYdEer/JQ"
Content-Disposition: inline
In-Reply-To: <0f3d3018ecfcdce1bce67708708a6d3a98368b10.1648548339.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--F2Nt5GuXYdEer/JQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2022 at 02:20:02PM +0200, Geert Uytterhoeven wrote:
> Add the RPC HyperFlash device node along with its partitions to the
> common Draak board DTS file.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Looks sane and builds fine,  but I didn't verify the partitions.


--F2Nt5GuXYdEer/JQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJOjEsACgkQFA3kzBSg
KbZO7w//e6BEyoxFvw1lee51JQZM3yA9gZcx6yTqmnOu9IKXBDacz56Yo+0fOOMh
h369anjatV99XSaJNjl+tcgPhrrCHMhB75LuK0YuSJlTKEAd+1KJstzVU5D/yvSY
HKprbU5B3iDQ8mwZH5UJ6MhVvaSMsnHdqjIxykmeI4Hp3iI45yLTGaxF2r5Yhm3T
O4I9KHFHyseElKyTMiu2qAxLD9DnP6cvueUie3i0diFgwtwbqfJPUJ6TthESvEHE
248ycoeOJ/8VlvaCqm8F45wcLHjliBbfjVDRty+Et31Tk3wyOSENA/4kfAfDA87j
Tctlg98C6aCEGVD3ZbChSM+tLINmvlz0+th8MH5D2aJpyhfmC3ne3P0g5t4VPgfL
LyRXZ+5u7ag8AYqk3A86ntKW4HUxWLAv+LlDRp0M1xww9oj5TgEU9wyM3NAX8mKq
tIyOshn1HMLjgqiLOs2QexdGlqqx2F3Uaj+EjgHbguB+NdSTf8QMs3qLB8pGJYAQ
0esjn9DG9D4JDiqB8LkwQkhzw9qZWODQyY3MPOYGB4YQDHIj7t8tFsD0CkYxwDmG
G/U3IlhLOuPQno/2yM1k2ILxkEv2V7uiRVVX/xlzvNs8YtrlZO+B2kNI7upjLB6L
SIdnmYM9TTokYIRz4kgr0L9saEw8FxBiWJT4qDiUlsMjpSsFrzg=
=vohx
-----END PGP SIGNATURE-----

--F2Nt5GuXYdEer/JQ--
