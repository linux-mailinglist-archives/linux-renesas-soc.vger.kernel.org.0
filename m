Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC3D55F9A67
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Oct 2022 09:49:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231527AbiJJHtP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Oct 2022 03:49:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232743AbiJJHs5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Oct 2022 03:48:57 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2B822B4;
        Mon, 10 Oct 2022 00:46:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 95169B80DE0;
        Mon, 10 Oct 2022 07:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A64B1C433D6;
        Mon, 10 Oct 2022 07:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665387973;
        bh=HUWDx9968WJHkiBKpvgdEDBwKpGc3JYinZy8nio1DUE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c/YWP24E7EhTgCHhm/tIMfrujbrpbbNWwzXXconkDHAYMMsbnirG9J3yqUFWcqMSn
         3AUNFNmlhQU1hUm7MDj/yvAurS8+jgpS0zUoRh7/rUuZ8JB4/vrjfzXdOOkAV1Rzhi
         naFR7dh+fYkx5yAkQGVVkK3Yl7wjZcFv/KspXWH9aq00MDpj7lx2egRL2vGueruPP6
         Ae+/nF2ptrkpQmAn7Z8cLpEu8u8zGZooHzIIAVV+CaFCLSLnSAsvm877ve4ahMiLjL
         9T1z+wdq7iG7SJYHUvU2O9fSW5skcFldAtDm3bQ0BbnbGfq88PqIFQ+S6sePm10QJn
         v4IDHtusNvVTg==
Date:   Mon, 10 Oct 2022 09:46:09 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/5] clk: renesas: r8a779g0: Add PWM clock
Message-ID: <Y0PNwToHAqQCRvsB@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1665147497.git.geert+renesas@glider.be>
 <a33d0e51c2fe8a0e6c89f3fd92db7c4bf5c33074.1665147497.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uw/2SOH6B02h0n/n"
Content-Disposition: inline
In-Reply-To: <a33d0e51c2fe8a0e6c89f3fd92db7c4bf5c33074.1665147497.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--uw/2SOH6B02h0n/n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 07, 2022 at 03:10:03PM +0200, Geert Uytterhoeven wrote:
> Add the module clock used by the PWM timers on the Renesas R-Car V4H
> (R8A779G0) SoC.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--uw/2SOH6B02h0n/n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNDzcEACgkQFA3kzBSg
Kbb3xA/+JRDzFDPsMs8SzM5sqzgK2v2ClApCYc1PVcXiCY6Jku93Y1QIuGuNW7+1
FGlRQO0XNF+CHe5jx859cSht77Tl9wluVPJq9NE7Y/FmSyP7dN8XcQTcPO3CCNqP
fycZKRmBOC/rzbFLeXGGKgLlVowUP+8AbCmsQmC3qBYvaflXQIVp2hh0VxMXEVfh
flm0rbixgpMPTra9OAFhzTUMEgw7vurZ/JybibObyYQNjdw5ibWNL3JCOqp5UX5E
FS7rBvNYcCZA7aqkQm3DeS+H5VT7//KjtlsbkjijUxW4r/fiNNaxFpmNWFTmy7me
jJJrTJI2jo6vJinAFWRK8zakVJ/gXMl5T7nRxVSeyRgiEh1SjAPiRqCAexPDdyxK
r4fuGT7dDrTbwSs4but6ssPZbr/mrXRDuwY74Q5Z6R3REa5nyvekGDyK9ODkV8jO
hYJb2V4WND/ZBFfKBYvf/bqqv80k0qHQ9l7FdRaGh2P+dZZ8aSFCANBxHeXMbPcM
aPIjJSaNyw5mSBHAsAxXR5J9k7IO0v96ppCFSkObYupSoSl8dUmbhYVxMhcdPClw
Y52UYgnXEFLJiuoh+uNpqfsGhu8zEYFk+nuR1hzl+0wngJIOQBWlCB8JY7hMrY5q
CN0N/X3IP+DLckSWI9aiaKQjLkobUOD5GVX7ds11A6457tCK5gM=
=ukAl
-----END PGP SIGNATURE-----

--uw/2SOH6B02h0n/n--
