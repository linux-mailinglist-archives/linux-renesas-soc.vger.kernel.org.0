Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF5745F8EEF
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Oct 2022 23:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230316AbiJIVVB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 9 Oct 2022 17:21:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231834AbiJIVUo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 9 Oct 2022 17:20:44 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A0B01057E;
        Sun,  9 Oct 2022 14:20:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3B14DB80DC3;
        Sun,  9 Oct 2022 21:20:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426AFC433C1;
        Sun,  9 Oct 2022 21:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665350440;
        bh=5SBLnG/2JbsEn6gA0IetOD5ieNSX8nb8zt7W8D8p3tA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kSMfViCr/ZxMMoF/vVbns7y/c5BIXwC96c1QdHUX+TaJtsvWzvPgMRlV/21Ctjnib
         9OyE95iqlKy45b6s1QCnpW1lVI0FrrHdddaMQnguVuo1Q8gkRrYNSO139o/ERPKezl
         JE0vAje5afI/vwHdCON/mx80MVg1uMbxNmD5rD0YNtety1MOSDxzZRpYS9lWRkXKPj
         Z/0Dt2BbfRD29uOa4x2GUSjMD/KIb8gZN0J/w3+ofjyQaG+TY2y0WZTMCwkBy2cLxJ
         9ZGxflzqJI9eiCHYBi9NFzwPQc6Yuz/wWc/TIYKp/sfBmSqCYQW0NCvSArGAllOveX
         YAYX73LJeVn0w==
Date:   Sun, 9 Oct 2022 23:20:37 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/5] clk: renesas: r8a779g0: Add SASYNCPER clocks
Message-ID: <Y0M7JVPVmrudEvZI@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1665147497.git.geert+renesas@glider.be>
 <d0f35c35e1f96c5a649ab477e7ba5d8025957cd0.1665147497.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="y5AJyrcNjBbPAWBA"
Content-Disposition: inline
In-Reply-To: <d0f35c35e1f96c5a649ab477e7ba5d8025957cd0.1665147497.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--y5AJyrcNjBbPAWBA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

> +	DEF_FIXED("sasyncperd1",R8A779G0_CLK_SASYNCPERD1, CLK_SASYNCPER,1, 1),
> +	DEF_FIXED("sasyncperd2",R8A779G0_CLK_SASYNCPERD2, CLK_SASYNCPER,2, 1),
> +	DEF_FIXED("sasyncperd4",R8A779G0_CLK_SASYNCPERD4, CLK_SASYNCPER,4, 1),

Some spaces missing after the commas.

But my main issue is that we have it a little different for S4-8:

112         DEF_FIXED("sasyncperd1", R8A779F0_CLK_SASYNCPERD1, CLK_PLL5_DIV4, 3, 1),
113         DEF_FIXED("sasyncperd2", R8A779F0_CLK_SASYNCPERD2, R8A779F0_CLK_SASYNCPERD1, 2, 1),
114         DEF_FIXED("sasyncperd4", R8A779F0_CLK_SASYNCPERD4, R8A779F0_CLK_SASYNCPERD1, 4, 1),

So, no CLK_SASYNCPER at all because R8A779G0_CLK_SASYNCPERD1 divides
PLL5 directly. I don't mind which version we use but I think it should
be consistent because the diagram looks the same in the specs. What do
you think?

I'll have a look at your other patches tomorrow.

Thanks and happy hacking,

   Wolfram


--y5AJyrcNjBbPAWBA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNDOyUACgkQFA3kzBSg
KbZLlw/+Ix2Lk4UhEVnvR6VgDGKscyMeEfUDYwmdSz+Y21xDSniqyLye89yMvOc0
DHNu2P6D8zv5y5EBt2+ZjrbUxusUNNhxj2hmN5l9GSYaUIUfI8zIOWX92BV1GNUO
9g4VHymlHGDF0xm87i92bCYC2zfn4X3mQEKnjPqEnSI8r0UmYv+zKDwqmes16KeP
zV+fVsnOI5te/KHbCXy5K5OAQrSCF2NUBydYsn2+OOSP9EZtzYtLMBV8n701/7FP
/jgpZRxlN9xHDUve/rnKyLlRHnHqbVXlXvttHLSdcIVcxl24CcrBhck+pfH3cHYr
C/a1KiJ+V9qg9qN6/KPMkliXsxVSMHf+TxPPbml0hHjfQLyLko2BcI+yhMs3IqmZ
gm+at0L5sICBKDWjj4o9APmMrEYk5tevWjN+FDP+owj7BprxzlBrtX0hryYEafHK
tiOZMncbGaPyoCNVtm3r/HJ+EctILxQ1dFymIoUjmxvyr75jdCZdb9Og9JEPf3AX
fDQMi/7qZm7k1jAyCqiKx55YftFwX+TmNJukXoYC2mNoIv3pJhdiJO6CleBt9ve/
HHDNIdB8uneNBgYURJjbFHwX6TifxRnmo/Tk2YokLL/14mldSStTC6mbnrzEe6++
6YgNbE5Jrb0PLhsyQO+F54si4UkAHzPzGAjpwCLzCS669XYacGw=
=kxY2
-----END PGP SIGNATURE-----

--y5AJyrcNjBbPAWBA--
