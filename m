Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F3774F76C1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Apr 2022 09:04:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240328AbiDGHG4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Apr 2022 03:06:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240330AbiDGHGz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Apr 2022 03:06:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 498D724A772
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Apr 2022 00:04:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D29D961DBF
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Apr 2022 07:04:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99022C385A0;
        Thu,  7 Apr 2022 07:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649315066;
        bh=jJ8x0si4hzIFZzU2323Y0zkwp+G/l2mV7RsdCm2hFKQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jEZOTy3wZQWuj/zzVh3uQ9xgNJAljCofm+8EkG+/lA1vanoZlhSciTqojr7c+v+K0
         UlkwXIDgfO8cGCwx+stg6w8AwzL4fV3UWzqOdlq8a1mWybH8i7ZBFH5Q2af4nblEPd
         skK7JVJk6D2+xIetYhDBvlXlwcaylyKrN7OBzckiVrg2kqQqCQzWlcLjuEVmK1JARN
         4sAtZMUSZFpOM3h2bgGnX7lK7Ju1vHAEN2Yo7rYok3R0z/FaLowxmrUsVOIsnUNVBs
         xIk1hYc0wOTT6eiJJ9RFSEcESbe8cNEi8t4yFq7syMUjQLYO26XTFfQkN3+4VdsYYZ
         735TpLNd6SOvA==
Date:   Thu, 7 Apr 2022 09:04:23 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/5] arm64: dts: renesas: draak: Add RPC HyperFlash
 device node
Message-ID: <Yk6M961YU3y3EHsv@ninjato>
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
        protocol="application/pgp-signature"; boundary="rPMfdWdd10qf5y40"
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


--rPMfdWdd10qf5y40
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Eeks, the Rev-tag was for patch 1. Sorry for the noise!


--rPMfdWdd10qf5y40
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJOjPcACgkQFA3kzBSg
KbYffg//ZEJxIrWSVnshoA1qf9uKwQZmIlp8hb7Joo+ocwHjtTiGggHKIEKPD4KK
Vlb+s+2NPOyGqH6MHfIhY01eIISEfMnFgXKFOru6zaDPoxHSVpGXQcGyeG7b8vO0
DwltMUscEm7+TtXAzDr0JbTlaUL8bvsWOjKPWncZ1lHrE539T1mQ1E1EtmTTfWSp
kVtwxHjrhdlF1DuCVjglh5afozUdKQeb9/BpRQvSOqjFLw/nYhY02D+4c5APG+z0
+tdv79nvvBqbl2cgjQ7Qd1spH4I3sEBoG5xwcvpYQfzt0svRbQ/4qWCcNDoLh0GM
vg4Ild/RXroHN12AR8YL4Ae5xVdlF3qofQNFlD7CKXwRhPbbfb/l4SEAY5om8FQX
r1zS31dUhckvtCJRDEYxn7p4ifg9/sixlv/a3birquwXZhSYien13emOg9ivsz4o
zA2EN+5VNToPw54KHq9HLiDXB3nOJtCUaFynS7A1aDarjHKxb7iHjZYK6lz429AW
F0hnAuHPDEeBjCayURw8uM/qua6pRIAv9QthSoJD4iUASEAdYZZSzfPA9+Gbvu9z
aR8ggiQb5cH9LXgCQC18ynw2thV+shp3ab/o+sBNISbRT6x798ATEoWWF0NaxJZK
FhcEPzFDQAu/OXgvPOuy0jBUso1WABGxpGJPjRWmbmYRK2cVHhc=
=WRVV
-----END PGP SIGNATURE-----

--rPMfdWdd10qf5y40--
