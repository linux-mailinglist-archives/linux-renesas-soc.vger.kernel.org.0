Return-Path: <linux-renesas-soc+bounces-14787-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1333A6E753
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Mar 2025 00:48:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F434174F70
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 23:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1037E1F1519;
	Mon, 24 Mar 2025 23:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j9pVbmml"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33A71F1314;
	Mon, 24 Mar 2025 23:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742860087; cv=none; b=r9Y8sPxyAgk/Se/G4VqfBC2EJhGV0lboF+JL7eAx7RY26kkAqNsMjKX0p3C7fzMrPxdaa7dfIbW3rjNprKURHq1qck/0JJ3FKA0kcM5zZCQrbTtD5rHeREtzX0WlQMBIsRZVGeLAXZktsCakmcVjwh59MfSnQf9plZRb51zBiFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742860087; c=relaxed/simple;
	bh=9pbvWGuCUC/lSizIPrL6Lycw2q6fYbAE1Krp64S+MJo=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=MJaLvGWzXKW7KrV4Wd0r80PpIAn4JJZqIVOh8iKz7t0ts7bxWNdBWVNrjUsnp05tiN3paW/mVcPfCBTa17QAg3U9z0OcGxLu+dzOBvqgauQVKXCmkMRwm7rYNLKQss1hAklolv1xhDvaJs8sTNV5+RggiFRWFNMHeHIlK3sjIFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j9pVbmml; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22F55C4CEDD;
	Mon, 24 Mar 2025 23:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742860087;
	bh=9pbvWGuCUC/lSizIPrL6Lycw2q6fYbAE1Krp64S+MJo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=j9pVbmmlVIUqQUkkqSkobpwM1ZeV3sh1BMk6UQAUlp8QKxB0dtOAkrqVgirLcerbf
	 zOTPM4W+kMukxC9iHTAJxraW49m8B90wX+mmuzYw2YPaLUKPpPLOn8mT7s/GpUt7Ka
	 fljz9TwV1rwEdqVVVbKzhPvR1Bnca6prTzsVlXBjb5C3iovNeJJPmMMHAtbuMHO/BF
	 R2ZYfEQLrq6wTXNnC3RuWwPBYGERcRGRtMdLFYNXnWKrdDBZ/4wq4zGDSJ9zfz+lqM
	 zoU7OChiU28GKj2jODtURLhTDIxk30LdLR8/gQG9bQRyYi9IrrpgUIK9Qj46vtx/7u
	 CeFxr+jjJJBvA==
Message-ID: <a6bd517263b66bc69a72d74aeb88cbf5@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <TY3PR01MB113461FA9BBF036D285AAC8F386DB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250303110433.76576-1-biju.das.jz@bp.renesas.com> <20250303110433.76576-2-biju.das.jz@bp.renesas.com> <1347ee4d678ce81c33917b3802601aee.sboyd@kernel.org> <TY3PR01MB11346C31C2533FD074D87BBD286CA2@TY3PR01MB11346.jpnprd01.prod.outlook.com> <98c8c1eab30fc333974bd1ad88791356.sboyd@kernel.org> <TY3PR01MB113469E04E10E3D14FB3F69F186D52@TY3PR01MB11346.jpnprd01.prod.outlook.com> <TY3PR01MB11346D2881A8CC9C3019C978386D22@TY3PR01MB11346.jpnprd01.prod.outlook.com> <983e0e616d62f236dcbc3eecbeab5ab4.sboyd@kernel.org> <TY3PR01MB113461FA9BBF036D285AAC8F386DB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Subject: RE: [PATCH 1/4] clk: renesas: rzv2h-cpg: Add support for coupled clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org <linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au <biju.das.au@gmail.com>, linux-clk@vger.kernel.org <linux-clk@vger.kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Mon, 24 Mar 2025 16:48:04 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Biju Das (2025-03-21 07:21:24)
> > -----Original Message-----
> > From: Stephen Boyd <sboyd@kernel.org>
> > > > > >
> > > > > > The parent clock rate of spi and spix2 are different. If we use
> > > > > > an intermediate parent clk, What clk rate the parent will use??
> > > > >
> > > > > Alright, got it. Does the consumer care about the difference
> > > > > between the two clks for the gating
> > > > part?
> > > >
> > > > Although gating bit is same, for some reason their monitor bit is
> > > > different. So, to confirm clk on status we need to check respective
> > > > monitor bits. Parallelly, I will check with hardware team, does it =
need to monitor both these
> > bits??
> > >
> > > According to hardware team, the spix2 clock is twice the frequency of
> > > the spi clock, and the clock ON/OFF period displayed for each bit in =
the monitor register varies
> > slightly due to the difference in frequency.
> > >
> > > So to check the status after changing the clock ON/OFF register
> > > setting, please check the two monitor register bits together
> > >
> >=20
> > That answers the hardware side of the question. Why does software need =
to care that they're two
> > different things vs. one clk?
>=20
> From software point, Consumer driver bother only about spi_clk.
>=20
> So, treating as one clk(spi_clk) should be OK and we should drop
> handling spi_x2 module clk in the clk driver instead treat this as an int=
ernal clock
> (".spi_clk_x2")??
>=20
> Then we should update the binding to have only 3 module clks instead of 4=
 by dropping
> the spi_x2 module clk.

I don't see why the binding has to be updated. Can't we return a NULL
clk pointer when the driver calls clk_get() on the specifier for the
spi_x2 clk? Then nothing will happen for that clk. I guess we may need
to return the rate of the spi clk multiplied by 2 or something, but that
is far simpler to implement than arbitrating the hardware with custom
logic and meets the same result.

>=20
> Geert, what is your opinion on this?
>=20
> Example:
>         DEF_SDIV(".spi_clk_x2", CLK_PLLCM33_XSPI, CLK_SMUX2_XSPI_CLK1, CS=
DIV0_DIVCTL3,
>                  dtable_2_16),
>         DEF_FIXED(".pllcm33_xspi_div2", CLK_PLLCM33_XSPI_DIV2, CLK_PLLCM3=
3_XSPI, 1, 2),
>=20
>=20
>         DEF_MOD("spi_clk_spi",                CLK_PLLCM33_XSPI_DIV2, 10, =
1, 5, 1,
>                                                 BUS_MSTOP(4, BIT(5))),
>=20
> Note:
> Currently I am facing an issue which is popped up using single clock,
> If I use spi clock for rpm, then flash write is failing. If it is turned
> on permanently then there is no issue.

