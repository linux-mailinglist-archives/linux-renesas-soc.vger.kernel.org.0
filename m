Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 252C25FA36A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Oct 2022 20:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbiJJSen (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Oct 2022 14:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiJJSej (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Oct 2022 14:34:39 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F33F377EB9;
        Mon, 10 Oct 2022 11:34:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AFE64B810B2;
        Mon, 10 Oct 2022 18:34:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C17D9C433D6;
        Mon, 10 Oct 2022 18:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665426871;
        bh=q1D/o8hjFri5M7pdAX0qRaQ3GjvwpewPGyi6/8o58nc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N8rx9+wgy+mxK7aHi92womRfUs/zAZXsByhEjtDB1n8oArNy68Gptx5jvyXd8vKlv
         BiF+lbzk/gWCxJyDFBLr7iFFFxnif1hU63kw5ajlJQN4JYDjic5o7YrqK1Z/pwng2E
         IJHVI3ADGZHDh8Ro45WriJiCKZZFoGtDbMwiqetZmKSbIYZzjM5ILMFsxgFGwz1bhM
         N2hobmUKOOMy/aYsJM6ZKrV+lTXBksPgpFoL9pYsNZwxcT5qqUTb6urFKThKPW2w8m
         Snj53vpgJo17TlyrYQQEyn9tebhlraavSrKRzt1n2Cfw0pu9Xp8b+QqU2xAuWfHkKC
         PsbN06LlJ/vOA==
Date:   Mon, 10 Oct 2022 20:34:27 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/5] clk: renesas: r8a779g0: Add SASYNCPER clocks
Message-ID: <Y0Rls4SgBIaUtzcT@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1665147497.git.geert+renesas@glider.be>
 <d0f35c35e1f96c5a649ab477e7ba5d8025957cd0.1665147497.git.geert+renesas@glider.be>
 <Y0M7JVPVmrudEvZI@shikoro>
 <CAMuHMdXK1Bh=6p_8LL54gJL0nKZ27wQb_wxM0ve0svBDG5X-6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tmzC9/e4IYft99h0"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXK1Bh=6p_8LL54gJL0nKZ27wQb_wxM0ve0svBDG5X-6w@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--tmzC9/e4IYft99h0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Some spaces missing after the commas.
>=20
> I did it this way to keep the columns a little bit more aligned.
> The alternative is to widen the columns, and adds TABs in all rows...

I see.

> > So, no CLK_SASYNCPER at all because R8A779G0_CLK_SASYNCPERD1 divides
> > PLL5 directly. I don't mind which version we use but I think it should
> > be consistent because the diagram looks the same in the specs. What do
> > you think?
>=20
> I can add an internal SASYNCPER clock on R-Car S4-8, too.

That would be great!


--tmzC9/e4IYft99h0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNEZbAACgkQFA3kzBSg
KbY/QBAAnstfFEOwWc7t2q/lQmII25gOSnGhoaL4e/Lh/O2ihz5au3CH6eQxZM1O
btBcUMS+i13FHEREVKjz4L8fBEVG5ry2pIbj1qjQHJGyTMOnal1xyR+TD0Op5R+L
C4Sbe8iaL8yMyKgFN6PMZ5i/ydnInQ85L+8P1TM5PIjjxMpemfwJHeh2Q2T3boRY
jebkfkzt7WizouVNfeTITFjhVRHvCm3SLj3SjKGAk6yaY0kYn+vSvi0HgQEYv4fL
TiFfIAnSBOC7AAC9+Jjwpyf3XuwsXz2XCpJkEZOeOrHRJMoePaXR2v/vsHIwe67m
uS8P8FtJ/glUfWD2nhBq0F5kw35KU7sj85X+uh2ZXN4DUrH5uWuCYDo48dWtNwRM
AHU1wB/YpMGZn88rZprgkGu31IOiePRD1MoRVBhrBm1xeMHB57oLXcGic5ybkklR
N/fWczTaU7kumnDB9TRyhregupix2p+7ROJRfVd9F9lCELlsEDVhWt+/bOidl6Tu
mRjUP+Wx/8BQ4dPUW8KvI6bFPaIL0gH3Hpz29RdqNeZWzzFv8e/q4ak7EHKaeu2P
1VBtYTvX+9Xm2GSIXo9psvQv+qLyydQ6w4dqAzMXsawyFqOMem3xy3reR/Rk/N3/
TJZ0jHTYo7Snrs77LIzQTQD3p978fdZK64qv6OyfoA/Zs+d/5Js=
=c7y9
-----END PGP SIGNATURE-----

--tmzC9/e4IYft99h0--
