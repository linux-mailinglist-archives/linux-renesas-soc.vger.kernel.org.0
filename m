Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B94A2C4A1D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Nov 2020 22:35:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731975AbgKYVeE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Nov 2020 16:34:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:58994 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731645AbgKYVeD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Nov 2020 16:34:03 -0500
Received: from localhost (p54b331e1.dip0.t-ipconnect.de [84.179.49.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B767D206E0;
        Wed, 25 Nov 2020 21:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606340043;
        bh=Ty4PS2hoOHfwiFICofoy8v3Nwo5RWqEqodE3I58vYcs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PgBeh78mE1OrXSeJOZOPGSSnJcobQ+RPhhMyKfpvue7NPG3/5IqIy06WjzUSkW/Yf
         MWSZ3ctRyAMtYbFkR27VBtnGDiju3kqQJItiR+5GjgLBMXBtOJG5AmjvmQORw7ChH4
         NzGAkrtrls8eFhGcY/vf7qgnz+ayRJFLYRRyikmc=
Date:   Wed, 25 Nov 2020 22:34:00 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 2/3] mmc: tmio: add hook for custom busy_wait calculation
Message-ID: <20201125213400.GB14913@ninjato>
References: <20201125213001.15003-1-wsa+renesas@sang-engineering.com>
 <20201125213001.15003-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5/uDoXvLw7AC5HRs"
Content-Disposition: inline
In-Reply-To: <20201125213001.15003-3-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--5/uDoXvLw7AC5HRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> From: Wolfram Sang <wsa@kernel.org>

Same comment as for patch 3 :(


--5/uDoXvLw7AC5HRs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl++zcgACgkQFA3kzBSg
KbaYRhAAq128yivg4SRP2cBnOmsVhizDSinw1nItD6kXaWeoBbmolHMyU+81RQxg
yY3Im+RYYdqFX6wCkjYNq80PSJafff0j230McB9UFgbHmKgn2pi79nDnt1WZGkz3
pr/WFOp4syvBCKINVT7X7is0PAJCQ9rDkYczqb/kikVVjFoOUJiL9qjyanSE06cP
Awg4eTJMThiye9K+9boMOsMyfDU9DaZI1IA3sEBQKX8vvFaOt6S+i/DT4os1I+Cs
pSkZQHa9qMtXHAK/6/N6Yj33aUor36084tnIEfuz+V31qGf4gwni4c4eUFOYiU1v
v3BHSuBxWXNUYHEM0G9M6J2owqss8q27QVj70u186b0TmLI4UVeREZqUXKSn8fp1
uGkKl527efqfJKBRiUU89g50f6x7Kd8o5owJupqyhk1KnLkQVwpmDEACVaAxhozQ
hpiMB0JzH1SdWHxj1+xkt/HaRjrdB52qvK6m+5AeJwTRMubaM3xk8N9aRyEFWLmI
Igq3qqgVkglDTSPmGBudkJDgFxk5hSM+JA/5G9PohK6UoVfZqzxxqy3JFJKDdFoa
+xvb1Hym+l/PLoVQe03FMjTRTvePXqm4QgrhH1NzKymCYzGBtqRpJgqOxQGIRgnw
RfRDCVLt78FqJFfcoElIQ8fLduDTKT53lXRMWdUmgsir/EF9u0g=
=A6qF
-----END PGP SIGNATURE-----

--5/uDoXvLw7AC5HRs--
