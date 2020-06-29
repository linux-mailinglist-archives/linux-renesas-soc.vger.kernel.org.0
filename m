Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E224820E544
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2020 00:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728588AbgF2Ve4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Jun 2020 17:34:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:60654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728566AbgF2Skz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Jun 2020 14:40:55 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 51FD823D25;
        Mon, 29 Jun 2020 12:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593435478;
        bh=bcyRH8SrIJRpWOCioAE7dQk1Zwno7fu5lbGQHD57n+M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aSSuD7UPU9scWauVRzNqe8ZN1yN6QlsyN7rZk8VrNsWYDgD/+hATBOQzmvBCe2E+t
         D3Xh+qBwPFvd/SS8ZHrwu7i6dNvNqobYG+MXCWb6C9721v0VwWQxe/CzBuVBy5sWdE
         YIMT3SzvxnbDL+UZ6JEuxwTiUHnlnblRL/az3+KA=
Date:   Mon, 29 Jun 2020 13:57:56 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH/RFC v4 2/4] regulator: fixed: add regulator_ops members
 for suspend/resume
Message-ID: <20200629125756.GC5499@sirena.org.uk>
References: <1593163942-5087-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1593163942-5087-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20200626143914.GE5289@sirena.org.uk>
 <TY2PR01MB3692A3B12CEF7F9708A8A59CD86E0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vOmOzSkFvhd7u8Ms"
Content-Disposition: inline
In-Reply-To: <TY2PR01MB3692A3B12CEF7F9708A8A59CD86E0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
X-Cookie: Real programs don't eat cache.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--vOmOzSkFvhd7u8Ms
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2020 at 02:42:26AM +0000, Yoshihiro Shimoda wrote:
> > From: Mark Brown, Sent: Friday, June 26, 2020 11:39 PM

Copying in Sudeep for the feedback on firmware interfaces.

> > According to the changelog this is all about reflecting changes in the
> > system state done by firmware but there's no interaction with firmware
> > here which means this will be at best fragile.  If we need to reflect
> > changes in firmware configuration I'd expect there to be some
> > interaction with firmware about how it is configured, or at least that
> > the configuration would come from the same source.

> I should have described background of previous patch series though,
> according to previous discussion [1] the firmware side (like PSCI) is
> also fragile unfortunately... So, I thought using regulator-off-in-suspend
> in a regulator was better.

> On other hand, Ulf is talking about either adding a property (perhaps like
> regulator-off-in-suspend) into a regulator or just adding a new property
> into MMC [2]. What do you think about Ulf' comment? I'm thinking
> adding a new property "full-pwr-cycle-in-suspend" is the best solution.
> This is because using a regulator property and reflecting a state of regu=
lator without
> firmware is fragile, as you said.

TBH I worry about a property drifting out of sync with the firmware on
systems where the firmware can be updated.  Personally my default
assumption would always be that we're going to loose power for anything
except the RAM and whatever is needed for wake sources during suspend so
I find the discussion a bit surprising but in any case that seems like a
better option than trying to shoehorn things in the way the series here
did.  Like I said in my earlier replies if this is done through the
regulator API I'd expect it to be via the suspend interface.

> [1]
> https://lore.kernel.org/linux-renesas-soc/CAMuHMdXjU7N4oG89YsozGijMpjgKGN=
6ezw2qm6FeGX=3DJyRhsvg@mail.gmail.com/
>=20
> [2]
> https://lore.kernel.org/linux-renesas-soc/CAPDyKFpiBU1D+a7zb+Ggm0_HZ+YR4=
=3DLXJZ5MPytXtT=3DuBEdjPA@mail.gmail.com/
>=20
> Best regards,
> Yoshihiro Shimoda
>=20

--vOmOzSkFvhd7u8Ms
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl755VMACgkQJNaLcl1U
h9BCWAf/alYjM1GUf8o0xC1cfZB+/ZQDJlP1ynAY3yBAz6znDVqyB0+0YHESvJeZ
H9rCGXZ4YyH+CRLnd3TzJrAYfJ9wedaSQiabb5GE7hUKuC/SYPgLHX/3201Kgwl+
+MNM6w0kvzjyU/0OzvYI0SXBFu5g21LAZLR5FSaYcReUfqOJah+OtilSFdO+z86h
YsX6CMecRYl+4gwHkKlr1mQ7ZvrdtFkYynwxr3CZaD/ZsxZQ5DFL/p4h46D/ewKJ
qYoD8RX0S5QnWLxNBWmy10XtW67Rznftmh5lSBV9UkG2zxIIYL8878fmVecdLsiI
ZeLVxrKgg+Jq0Jzcy+7yux7aucvd+A==
=ENZF
-----END PGP SIGNATURE-----

--vOmOzSkFvhd7u8Ms--
