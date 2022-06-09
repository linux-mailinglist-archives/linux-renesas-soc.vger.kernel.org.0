Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F150F5443E4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jun 2022 08:36:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233852AbiFIGgz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Jun 2022 02:36:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbiFIGgy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Jun 2022 02:36:54 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1802622BE45;
        Wed,  8 Jun 2022 23:36:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 4821ECE2D47;
        Thu,  9 Jun 2022 06:36:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB2FC34114;
        Thu,  9 Jun 2022 06:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654756610;
        bh=eghX5GucV/60K7txN5/pa0Nt+7HRURSUJRWuzvUb9M0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QPc+In8/Nt4C71MMCUk8XDn6BwfIW0ytAIbyQ9cjwN/Fs4QmbbAkonUdYO6d2d7tn
         YSsKaG+PxMjPb+xhYyxrXtZ7z0PG6Kk7DcDLCiW81cmzPk0anFwGde9ASC0qKtgGTv
         Wrmj4Y3jRMz1w9MvOV+SAO9LzdWlYMA9fkGCiNBeCUULlF6srSMcbxgHNdfxY2hp8V
         ZhV/Iv5sQCrDZoIRkqlxULecT+wTL/o4VLg5e9KKp1LVBDasHtaMqcSRO1UpP7uIwp
         vYbrWkkbSf/NTJbDg1u0+sHS9Dq8jFyGDRxiqB0NK9MwnUI2ZNativSflKoeqMLSep
         gh2J2WiB3y/FA==
Date:   Thu, 9 Jun 2022 08:36:46 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/6] clk: renesas: r8a73a4: Remove r8a73a4_cpg.reg
Message-ID: <YqGU/h/lva+TG66J@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1654694831.git.geert+renesas@glider.be>
 <f835f3dfcf3bf754065e5002663952cc6341caac.1654694831.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vmvETeEwTCAqDwvd"
Content-Disposition: inline
In-Reply-To: <f835f3dfcf3bf754065e5002663952cc6341caac.1654694831.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--vmvETeEwTCAqDwvd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 08, 2022 at 03:41:10PM +0200, Geert Uytterhoeven wrote:
> The register block base pointer as stored in the reg member of the
> r8a73a4_cpg structure is only used during initialization.  Hence move
> it to a local variable, and pass it as a parameter to
> r8a73a4_cpg_register_clock().
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--vmvETeEwTCAqDwvd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKhlPoACgkQFA3kzBSg
KbYBew/5AceNZu3pJyCA8cJeWJNPamLefUSYEW6BORfQnp3SWtMqquukNMgnlab/
Q3cLNqEPF2cjRnoj8B4rau/JutXVg4ov8nlzmvgqrjTa606GnQXc4g4V8DtAA4FA
njlctT8OtXDLJGbxvrlHAtq+rAIZcoIyPydrEwhAGZn/YDVhR3cjyLnkkE9EspBk
FHifpGh7fZQ2Jo7n8TIwRdnmU4qco8gsvySlSJ7kO17H6sq4Q4OBpq44RC0wjjO1
vhy6f1X5X/f3QmPenqtTVIKZjGTmWEZ0jdsUOU870RzVyDe+JMhPFDVIqord0rdh
Fd5+NvYhlMwkJ0/LnJttQeYTFYaRqD5mY9hzPpS3QOegSLsH9F57uIb31asi20fO
1z/V1CSoed/A3nEc9Rz4yrpaXmW/0Rs525xdsq+aoUCATYhZyyUDuMtWXpxse/4H
cYXzsuqv/m4FseolUY5lWibPq1DkjyFeNDR4772qhdNUfCpSKPoy2wHN1SmMh8jx
CVQoXHz1spuvHSD1sfBcMv2yro38og5xxcSRUryNsnHurkJ44iQltBJG9CIDEFQj
YjXsrB9iVQ4pjKrk+nemFCoNTnDpthlSkJPIxwDj7t47229AdGPdncZ1hznmT5hX
vhwfRi0Psrey5a4ikt1WgGgxmeNoOC5zVUGoSlEC0TfYGYpM2Ts=
=Ziry
-----END PGP SIGNATURE-----

--vmvETeEwTCAqDwvd--
