Return-Path: <linux-renesas-soc+bounces-14703-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C48A6B034
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 22:57:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D954F189E3C0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 21:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C555220696;
	Thu, 20 Mar 2025 21:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W7WMQ+5s"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7966190072;
	Thu, 20 Mar 2025 21:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742507819; cv=none; b=LA1EwBjM2jSR5fT5cw8S7AKo/N2qIctLDlUMKfBsvqClcAEBXDzm+k+mb+ikpg/ymoYlHOZ2R6Gu90p5Ix4nzGWZJlKXpYzXNskzzbNnZpFZORlRHb7wZ7PdPIUY6/wcCTZki9FWCwK1WnvgeCH6lVF2Wbx42suIGMKUPWDBQTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742507819; c=relaxed/simple;
	bh=yvyJEB9EXfAAkC1ilk4/0tKZ5NC+WqsaLqZ167Krv+w=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=GWKmh702b9YKALedadisAI/zaTfS1dOP0/jTtfnlmIC3z+5eB+ca4iln6gfPL7lE6/UswtCleyOoaXdXH8y/IQRzogEBjlOXtLQngwkOknDfda38EcXEVew+7tQoGuzQshMZQFIFD+PxerwdYCpoGHUo3g1Er59qhf1rV/RLaQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W7WMQ+5s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38BD7C4CEDD;
	Thu, 20 Mar 2025 21:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742507819;
	bh=yvyJEB9EXfAAkC1ilk4/0tKZ5NC+WqsaLqZ167Krv+w=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=W7WMQ+5suxcsBMdsRP1pwaPaeQFjZ8NdX8Wif1WF6csaZyEse4V9yZh5GpRQrTtHj
	 pjeePOUW1jLK7ZQzsjAfYSEe+PF1FWyegd/hZuqNIk04D9sDZiN8Th2z2hA4dZir0a
	 MfpoMLajsNjmRJHdRwW498pLjrbRUQkR0OnExoSabdEhrjEq8nZAfJkbBKxDbcEHWd
	 gZlNLmiqC0BvRZXWVX3MHcTjnTZDyaORnX4WUWL+abYEoFjuHVFU7IaF0fbX+eRnu2
	 oYQ9wWFY4s2FA0bSh5LfvZa+SYlWdhwi+eqx0st5VumisLKN46DFm8R8QnEQZnt1Ri
	 eetTlc74ob84w==
Message-ID: <983e0e616d62f236dcbc3eecbeab5ab4.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <TY3PR01MB11346D2881A8CC9C3019C978386D22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250303110433.76576-1-biju.das.jz@bp.renesas.com> <20250303110433.76576-2-biju.das.jz@bp.renesas.com> <1347ee4d678ce81c33917b3802601aee.sboyd@kernel.org> <TY3PR01MB11346C31C2533FD074D87BBD286CA2@TY3PR01MB11346.jpnprd01.prod.outlook.com> <98c8c1eab30fc333974bd1ad88791356.sboyd@kernel.org> <TY3PR01MB113469E04E10E3D14FB3F69F186D52@TY3PR01MB11346.jpnprd01.prod.outlook.com> <TY3PR01MB11346D2881A8CC9C3019C978386D22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Subject: RE: [PATCH 1/4] clk: renesas: rzv2h-cpg: Add support for coupled clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org <linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au <biju.das.au@gmail.com>, linux-clk@vger.kernel.org <linux-clk@vger.kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Thu, 20 Mar 2025 14:56:56 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Biju Das (2025-03-14 00:18:33)
> Hi Stephen,
>=20
> > -----Original Message-----
> > From: Biju Das
> > Sent: 07 March 2025 07:02
> > Subject: RE: [PATCH 1/4] clk: renesas: rzv2h-cpg: Add support for coupl=
ed clock
> >=20
> > Hi Stephen,
> >=20
> > > -----Original Message-----
> > > From: Stephen Boyd <sboyd@kernel.org>
> > > Sent: 06 March 2025 22:37
> > > Subject: RE: [PATCH 1/4] clk: renesas: rzv2h-cpg: Add support for
> > > coupled clock
> > >
> > > Quoting Biju Das (2025-03-06 02:10:50)
> > > > > From: Stephen Boyd <sboyd@kernel.org> Quoting Biju Das (2025-03-03
> > > > > 03:04:19)
> > > > > > The spi and spix2 clk share same bit for clock gating. Add
> > > > > > support for coupled clock with checking the monitor bit for bot=
h the clocks.
> > > > >
> > > > > Could you add an intermediate parent clk of both spi and spix2
> > > > > that only handles the enable bit for clock gating? Then the enable
> > > > > count handling would be in the core
> > > clk code.
> > > >
> > > > The parent clock rate of spi and spix2 are different. If we use an
> > > > intermediate parent clk, What clk rate the parent will use??
> > >
> > > Alright, got it. Does the consumer care about the difference between =
the two clks for the gating
> > part?
> >=20
> > Although gating bit is same, for some reason their monitor bit is diffe=
rent. So, to confirm clk on
> > status we need to check respective monitor bits. Parallelly, I will che=
ck with hardware team, does it
> > need to monitor both these bits??
>=20
> According to hardware team, the spix2 clock is twice the frequency of the=
 spi clock, and the clock ON/OFF
> period displayed for each bit in the monitor register varies slightly due=
 to the difference in frequency.
>=20
> So to check the status after changing the clock ON/OFF register setting,
> please check the two monitor register bits together
>=20

That answers the hardware side of the question. Why does software need
to care that they're two different things vs. one clk?

