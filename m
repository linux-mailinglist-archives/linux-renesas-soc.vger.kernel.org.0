Return-Path: <linux-renesas-soc+bounces-14129-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6EDA559E5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 23:36:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D22523B2178
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 22:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A1627C84F;
	Thu,  6 Mar 2025 22:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A9ytwqXU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A161F4185;
	Thu,  6 Mar 2025 22:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741300603; cv=none; b=WHccKXGoBOabVao1PIN4Yn0wCGhJGiKAyDK5DQy/qsGCbCwFc+HX4Y+cV3xyeW4rPjeWJmo/wQ+6B6QhVVKZRI6zox+L8Pjr4OoJLAIkBcsEUzJJPq+UWKNplcKL8j6j0X3cmGvaneTwOzH41J9LBT+UYaYD+xRuTW65Rtu4egs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741300603; c=relaxed/simple;
	bh=Ato4boEnWCd84rJGUkCXyj1rsGt2ocMrcSgyrAz+xoY=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=eP5ZsLkzfaUs1L5VC42dWAdxb6bbUsuAYCo1j3Vsq2k/sSg2MHdtm4sjTpdExR+4MhTM339pfMlNO6px7B1PgUVAaCeXC6IjwGRR+02JMjGbrzJumlD6Jc3O+lFNMxMaUvDyf1JLT/z8h7ngu0D67YIqy4Y4t5f7FFhCEAPotIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A9ytwqXU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01C46C4CEE0;
	Thu,  6 Mar 2025 22:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741300603;
	bh=Ato4boEnWCd84rJGUkCXyj1rsGt2ocMrcSgyrAz+xoY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=A9ytwqXUAxQtt4eMZ8LunxK940zADb5sgyFzUwk3xvQfvCDI9lUpliVArL/Ye/YXC
	 7l51kQJJw68KwSm/shJDysCUKCfayiakzGLIp1Yz791buiumLzOgHtTblR2YwOdNzB
	 8myuLWRlMf/X556u/mBroAROZygTVGTpCgzFPlOAojkdAHSc0beTMMQBBwBEfmA1/H
	 i1pWwvV2yYz9XiFXi2itf4/UuOObym1bVFYN90UNT2F5Hfaajl4K3jGPK2lyC9glMi
	 kM8pZSH0tGmI7MJIJ76OiZSCp4FpUbIsaV5aiPzjrkaOujIBuTM3MRrhS0Ri11YLrm
	 uZ0JxEmOLm7Rg==
Message-ID: <98c8c1eab30fc333974bd1ad88791356.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <TY3PR01MB11346C31C2533FD074D87BBD286CA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250303110433.76576-1-biju.das.jz@bp.renesas.com> <20250303110433.76576-2-biju.das.jz@bp.renesas.com> <1347ee4d678ce81c33917b3802601aee.sboyd@kernel.org> <TY3PR01MB11346C31C2533FD074D87BBD286CA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Subject: RE: [PATCH 1/4] clk: renesas: rzv2h-cpg: Add support for coupled clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org <linux-renesas-soc@vger.kernel.org>, linux-clk@vger.kernel.org <linux-clk@vger.kernel.org>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au <biju.das.au@gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Thu, 06 Mar 2025 14:36:40 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Biju Das (2025-03-06 02:10:50)
> > From: Stephen Boyd <sboyd@kernel.org>
> > Quoting Biju Das (2025-03-03 03:04:19)
> > > The spi and spix2 clk share same bit for clock gating. Add support for
> > > coupled clock with checking the monitor bit for both the clocks.
> >=20
> > Could you add an intermediate parent clk of both spi and spix2 that onl=
y handles the enable bit for
> > clock gating? Then the enable count handling would be in the core clk c=
ode.
>=20
> The parent clock rate of spi and spix2 are different. If we use an interm=
ediate parent clk,
> What clk rate the parent will use??

Alright, got it. Does the consumer care about the difference between the
two clks for the gating part? Presumably it's all the same SPI driver
here, so could it ignore the second clk and do something like
clk_bulk_enable()?

Put another way, why does the consumer care that there are two clks? The
hardware seems to want them to be the same thing for gating.

>=20
> The parent of spix2 and grand parent of spi are same. It is a mux.
>=20
> Mux->spix2->clk gating
> Mux->divider->spi->clk gating=20

Is the divider fixed div-2? Are they supposed to be at some ratio with
respect to each other?

