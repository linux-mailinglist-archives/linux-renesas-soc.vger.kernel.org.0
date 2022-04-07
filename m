Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAED14F76BF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Apr 2022 09:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240008AbiDGHFa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Apr 2022 03:05:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240096AbiDGHF3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Apr 2022 03:05:29 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0AA323577E
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Apr 2022 00:03:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3661EB826C3
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Apr 2022 07:03:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 707EFC385A4;
        Thu,  7 Apr 2022 07:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649315007;
        bh=P8Ff+ofJ/MgC/6nqDMejrRKrAvk1Uxodar46Yuxi3Go=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gXIt9thanG4uthGmgctivDcojBekH15DuvkldgRbm76D363ocnsbipT/FGTmJJlIS
         SG050osTlqp4ukWfWGc/Ug9bDKMm2rCuhmEMvLjb2TeEF+qXR8YgmsUKEvvKejTYPp
         ka0v7NAuBmy98lwgcRTeCwoz/prlaHcqXTv2hcLLN7FFVxrqrQ6vw1sTvM1lcsQLXf
         RV3310RXCoVlx3dwB9Yc6HHp8//FaBR6qLCkUsT9iVWi63Dhg+9uAQYJJIK1/46D9O
         P9uxoyHfNlGkbfvK3MK2kyI+c6GNzbqYHk0WQUodHLwPxwSDfMhblQ5A8BranELKk8
         mtg04N3qPQfhA==
Date:   Thu, 7 Apr 2022 09:03:24 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/5] arm64: dts: renesas: rcar-gen3: Add RPC device nodes
Message-ID: <Yk6MvBFWM1ZRVRj0@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <cover.1648548339.git.geert+renesas@glider.be>
 <3231749c7b63df1a2134daabe66446a3e0e5515b.1648548339.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5/yxUEJXd2q1U99G"
Content-Disposition: inline
In-Reply-To: <3231749c7b63df1a2134daabe66446a3e0e5515b.1648548339.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--5/yxUEJXd2q1U99G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2022 at 02:20:01PM +0200, Geert Uytterhoeven wrote:
> Add device nodes for the SPI Multi I/O Bus Controllers (RPC-IF) on the
> various R-Car Gen3 SoCs that do not have support for them yet in their
> device trees (R-Car H3, M3-W, M3-W+, M3-N, E3, and D3).
>=20
> Based on patches in the BSP by Valentine Barshak.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Looks good and builds fine:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--5/yxUEJXd2q1U99G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJOjLwACgkQFA3kzBSg
KbbReA/6AwicjVN3tr/kfPj5Jzq/vTrKCR2W+u6LfhdO9Hcc7lhqcBU1iTpDOy67
MhWjBy853XKV9eVRKC6qwdhvVP7kfqGRk2hXD0hpp6FGL5V4jJ8i+6YcPNLXHU2d
tS2MqdVoMn80DJ3Pp9AKXMjZns8jVh8icCpRGpnPGo3IxxnC6ztWNx2GdH2HqEYJ
tPV52GQsb6+vThsjWuwN/OHMK0j8tHtErKy8iaYnN9M2PLnd5+AakQbFa/snTgsu
Syi5D9ROeLGsP8cTxZYVydLCI5wGQ4zqWOmnqwT309Myy7jI5jFmdu9ULy2gD94T
UUwJEfegDmHCE559AZeAmuRt3tmr5dx7Ha4NNX2acqss7Wm9aKRiNXpN8OruEbDc
OEIlaxcLFm/SuWxNyuaXP0fKi917aYjih0iK+A43+7ifVNV+0uu1469Zl/Dpbm/I
ux/yteI5R0YFER90DaHaI0AiAFaeIidCncu9MG3CNB4C+91Arr8PFDPkPZF9V4fS
c5et0KAVmfS617WVWzOvoipH5RsXLuIO4ikj40LIxf+2Gi498L2P+znUFfIlm3Rc
Yxb3RbsRquqaZz5dB0yU6veHzRpMp0CXGYG3CSeh7A615A5Q9BgWfUVH/liHUy0G
tyinXEMONcY9IqPvJb/6BLIUiWHWXUMeXtwCnULjYwqEHV7Xzbw=
=XZKg
-----END PGP SIGNATURE-----

--5/yxUEJXd2q1U99G--
