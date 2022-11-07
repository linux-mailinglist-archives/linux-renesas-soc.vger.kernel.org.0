Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C34B261FE73
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Nov 2022 20:18:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbiKGTSd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Nov 2022 14:18:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231865AbiKGTSb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Nov 2022 14:18:31 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E94F412D33
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Nov 2022 11:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=R4/8WDlh+QvIQF9JJDcK007Te26y
        E621ztQD4QOf3wY=; b=UcjqmI2KPOoUDWEcBRSH286l2sTZdZJgNZeFobH8DuPg
        Pnh4QahenZy5rRMv5lqyORnVOD8w6FgT9G77S8FHZQ3blRVfHIXo0ffuyHdYfdcJ
        t7iNzeqn8wPPluRaJWTYqUcsHI1AIeUE704IcQpmwG1FHMRATeayz0u3bIML/h0=
Received: (qmail 310455 invoked from network); 7 Nov 2022 20:18:26 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Nov 2022 20:18:26 +0100
X-UD-Smtp-Session: l3s3148p1@oLM0SebsiI0gAQnoAF0KALfe5HstmmzE
Date:   Mon, 7 Nov 2022 20:18:16 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: renesas: r8a779f0: Fix HSCIF "brg_int"
 clock
Message-ID: <Y2lZyh8+EsEGko6L@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org
References: <20221103143440.46449-1-wsa+renesas@sang-engineering.com>
 <20221103143440.46449-4-wsa+renesas@sang-engineering.com>
 <CAMuHMdWjGbP0zQ6ZzZZ4noNWrK7CrHR+W0GjcaApCAHbgELCvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="18olbLnfWfnD/lDd"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWjGbP0zQ6ZzZZ4noNWrK7CrHR+W0GjcaApCAHbgELCvQ@mail.gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--18olbLnfWfnD/lDd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 07, 2022 at 05:13:15PM +0100, Geert Uytterhoeven wrote:
> On Thu, Nov 3, 2022 at 3:34 PM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > As serial communication requires a clock signal, the High Speed Serial
>=20
> I see the missing "clean" introduced by me is propagating ;-)

:D Except for the missing word, this is an awesome description, so it
should spread. Thanks for fixing!


--18olbLnfWfnD/lDd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNpWfgACgkQFA3kzBSg
KbZmTg//SUHYUiFuxK6wRs2XWNTm8PoT58yyCzFTqnMqBJPXVIFcHKKa43KOpTds
NG0xKM6OfrC6ZhflqQju2az/yn0L5IuhWoV+RzqZCND3IJJInztc871RxAZiCQEM
3Ik2ZzAXsrFBE2Q/J2Z4MMZxuaHN8TkhAdWtWnl24+MEqfD0xHnA6IJNkGqymdF0
N1x5peI19uzjR9zUOaDPuLAuWSR+4MFe2HfscmUyDA2OW9tHNtgcl6zpfkt8mXYV
thWNyAa1zahB3/brRUKIxl8Q6CaMXsL2uFtLPknjeQf3PDgTmxeO6Yc7PixxSiUR
mbWXScjePvG+p6u43ItFVWD0yv/aljxMQbxzsCHC4KyIeayqo89ATetAmsJ09k+f
ngqCK8hi5WU1l41DhIyiguXb9OgZJ6M8o4gFmpu/TD1e1Lh89SOOHj1WD1JVOCjq
LlNtG2/4Lvj5wq6QnEibVWz79laO8NRU0CLR94xvy5TxqAL7HgO2s5uEr5cfimWK
+44Ure7sgEi0vm9Hkb/7IGlPPJ7dmpxUu9xhRkMOlDHPaicdGEK6WUNEXp6/Xc/1
NHxOf/gQhh4u2H7UnVO6zdrrab4QMHNwnO0VmyCcn6AmUMf4idm91S3mzqhzFIUr
F5oaXUMVdtNy+su2WytUKq7jsrkPTQsrjg363IXi2Da4hzpe540=
=4O4X
-----END PGP SIGNATURE-----

--18olbLnfWfnD/lDd--
