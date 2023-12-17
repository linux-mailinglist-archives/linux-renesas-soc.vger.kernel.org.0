Return-Path: <linux-renesas-soc+bounces-1174-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D7081639F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Dec 2023 00:57:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56CD5B20FEF
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Dec 2023 23:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB2D4B12C;
	Sun, 17 Dec 2023 23:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PRgV1fjM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4504B126;
	Sun, 17 Dec 2023 23:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CEA2C433C8;
	Sun, 17 Dec 2023 23:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702857464;
	bh=pcFZ8RvL6PeP8jRirQeprICtpVqqIR2EU9acA3fbEQo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=PRgV1fjMh8EhJRQskQJi5hbkRzUs2HKTjQkJmVf8P9Bu2rraRww8CDMHpnI3IaeKq
	 PS1EgMXWC6QuRqgE94uR+9tmJkha5pxDJJGaf7fvatA2kmfuY03rklSkfDIFa8bX9E
	 ri/E0LCsK9QMI2gwvlwwpITBaK967KbbGJ92TAivm8VJSPaWj5N1nIutyPQyFLuyAU
	 TBBMsZ8TUboJMeZHvV4arLZIgikotkp4MuvfN9C9st05ExvLBzKgy0xbftGbbMYvgB
	 Z3Gv1fcxdlcIMBBODh4jLyKkojx+7d7B80SXPTejY3wcSMdDPb1fBZ8XWbWi8gG8Rr
	 snhIdruZvbEMA==
Message-ID: <b1610443fdca3047cce89f67173617a5.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231122142310.203169-5-biju.das.jz@bp.renesas.com>
References: <20231122142310.203169-1-biju.das.jz@bp.renesas.com> <20231122142310.203169-5-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 4/5] clk: versaclock3: Add missing space between ')' and '{'
From: Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
To: Biju Das <biju.das.jz@bp.renesas.com>, Michael Turquette <mturquette@baylibre.com>
Date: Sun, 17 Dec 2023 15:57:42 -0800
User-Agent: alot/0.10

Quoting Biju Das (2023-11-22 06:23:09)
> Add missing space between ')' and '{' for hw.init initialization.
>=20
> While at it, update the macro VC3_PLL1_LOOP_FILTER_N_DIV_MSB
> 0x0a->0xa.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

Applied to clk-next

