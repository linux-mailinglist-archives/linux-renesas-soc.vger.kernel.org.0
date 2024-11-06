Return-Path: <linux-renesas-soc+bounces-10376-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8039BF88F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 22:36:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DABB281C3C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 21:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0925420CCDF;
	Wed,  6 Nov 2024 21:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HtNBm92Y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D339720C47E;
	Wed,  6 Nov 2024 21:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730928987; cv=none; b=sbAH5EnCb7UxrybK5DM5njN4Aa9yxmydHhjEvVPedjO3fSsMlABDY2m0i9Uk/1QFj85l2/Z7mOi+Mwrko/JTwrUBfYq/382RI8IOUd9k5ZdpG/vidGYHMmCFYssou4W6K6X+2bYlvEmxXr2GSDhL2InPIE740koPDE4NqGXE130=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730928987; c=relaxed/simple;
	bh=UhYC0o0g+74GhDBmiunUWVD3mp/0fkTpmdCaxEgCT/E=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=WrMjfYoVvl8D8PnZeQkiOJPwZlyNuqv9tL7rwPqexNZpMMptwABL13Z2BQ6jtiY4cL0WQU8L8N7DTDq3hFgdrk6Lrq3nJ5GoXa//XP14GSbGhAPGJzyTlXEoSTmhPMcWYDQzpk/CqLJIsEHoOu4nuueDc1QOqO5A1BnLsj6yIoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HtNBm92Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AC4AC4CEC6;
	Wed,  6 Nov 2024 21:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730928987;
	bh=UhYC0o0g+74GhDBmiunUWVD3mp/0fkTpmdCaxEgCT/E=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=HtNBm92YHzwsHpo1VX7B/rwBq5Vqu0zLsUB6DPWeEO2ezxfGHq6/ZyH84T3CkDpPD
	 hqgb9VW12Luc+9erCYm4PYLwQpI1QCBA1MS+ltfq1jEtLi3hdAKQ2AFgf1r9J1tAVz
	 +hn9JwSksr7j2WaujXkVey/yUfEm3rcEU9lflfgUN3F2RcLbI3q3Rj08UJr/vDGM6G
	 OtN/WEJx82p13eiMFncr9XCSqA7Gvj92zHq+AQQsb9q4tro5ikUHaD7ylQxZaNTOXQ
	 Y1T/UeiPVx4c3A+RdoUcRGnD/qnpjubc0JLc3lpJNFjI1e5JPUH/ggsNnpUvKVIXrT
	 Llofm6K3VSiFA==
Message-ID: <f29493e30f535f7130f263113d00719d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1730879827.git.geert+renesas@glider.be>
References: <cover.1730879827.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL v2] clk: renesas: Updates for v6.13 (take two)
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Wed, 06 Nov 2024 13:36:25 -0800
User-Agent: alot/0.10

Quoting Geert Uytterhoeven (2024-11-06 00:00:12)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 92850bed9d4d334ee502a035ed5750285faccb=
ea:
>=20
>   clk: renesas: r8a779h0: Drop CLK_PLL2_DIV2 to clarify ZCn clocks (2024-=
10-14 10:04:31 +0200)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.13-tag2
>=20
> for you to fetch changes up to 3b42450ce1771c7b11d8f3563f4bbfe9b8d26611:
>=20
>   clk: renesas: vbattb: Add VBATTB clock driver (2024-11-06 08:52:45 +010=
0)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

