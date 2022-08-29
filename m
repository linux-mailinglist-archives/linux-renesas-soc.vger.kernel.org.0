Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A68585A4E25
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Aug 2022 15:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbiH2Nbq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Aug 2022 09:31:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230330AbiH2NbV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 09:31:21 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E94978E0DF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 06:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=IQ2hFha6i+sS7y8NTx8a++uNRtZQ
        T9bLku8bmTdfjoY=; b=HvFW4VXFdlRh3JI3t/9fy8VZ2juEmFG3lnwjL3zPdDys
        S15LnVBvrKTW1+NXdcqp85v8lFI2dSGhRvpDA3gsxnV9qmSV3MurAAYSpafwxpzp
        vx7P1n+0C6xq4azNZ5r3gGWV/i1ThztG8Za4ve2pCkQUheZCdkv8AGTt2WXjOGU=
Received: (qmail 83842 invoked from network); 29 Aug 2022 13:03:37 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Aug 2022 13:03:37 +0200
X-UD-Smtp-Session: l3s3148p1@PNYxN1/nPKwgAwDPXyz6AKlRFcsoQyrD
Date:   Mon, 29 Aug 2022 13:03:37 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/4] clk: renesas: r8a779f0: Add MSIOF clocks
Message-ID: <YwydCZoi7g52tvvF@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20220824103515.54931-1-wsa+renesas@sang-engineering.com>
 <20220824103515.54931-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdXnV3JTtGSTRObSn7qNkyZVUS9743swg3wk+DdPvwk9vg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vDX/Z/4gtqMcgXIo"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXnV3JTtGSTRObSn7qNkyZVUS9743swg3wk+DdPvwk9vg@mail.gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--vDX/Z/4gtqMcgXIo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> > For V3U, we also used "msiX" as clock names, so I followed that. I
> > wonder, though, if we shouldn't keep using "msiofX" and rename V3U as
> > well?
>=20
> I think we should use "msiofX" for R-Car S4, as that's what's used
> in the documentation.  I can fix that while applying.
> On R-Car V3U we used "msiX", to follow the documentation.

Ok. Thank you for the clarification and the assistance!

Happy hacking,

   Wolfram

--vDX/Z/4gtqMcgXIo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMMnQgACgkQFA3kzBSg
KbYxzhAAnbZ03o4w06l7ES1i9yfe0zuoA0qtAWjymnv8P3wGpH23JftL3Ii0uH5S
oE+orVMGqeLQmf2YgbuhOswrmuRDOxeuEfysJhkMeucZottWwCFUmtLVZawMwPxR
iLvLPe8kI5IwXoyCsdQJgfqgOBqOGHoWq0NhleLhZKiRekL5hFWTD9kvcWLg8oM9
X5LWi01PePdWTK5TMen2vk81nEltvnPgNCy5bLbL+OIqFcNhNjt3xZQDf7coLRcv
52BLzXiKykHISqSUQiJGhMP78MGiTk5YRkftMWjTGlVUr3TjWprdit2rxrmoe6+Y
+ajWKLGZGuhJbR7tvg1vI6T5eDcwKPox09/V652E0r8Kn37knWD2tbjWFWyBxflA
VnGbeYqYGzmJ/6Sha6l0QLyLvgN0H5lWh5PvOY0MVqQ0YpO1HEv2ZobVkziAhaIZ
bthdehHZt32tYrhiHolefHR5e3bmOz/K3EVwYF91btr/P49ZSOdAeyZNxLmbjAed
ZIcqNLESddFdKlbc2LIkuCmUXD4Wx/7/cCltCkcS78VorMCpGu1Yo+k8OVxdlftX
OPG17KpCAuvpHfz8SrAOIEQoxAgxNR027rRarWrrbWaqFO8eeMAg1FqQAMZQXkjc
xFr6p8kx96jK6t/7fTejtheYiJnORdZFUixtlGGhoLBNx4sPPNM=
=px9/
-----END PGP SIGNATURE-----

--vDX/Z/4gtqMcgXIo--
