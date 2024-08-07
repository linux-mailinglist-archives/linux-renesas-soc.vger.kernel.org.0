Return-Path: <linux-renesas-soc+bounces-7769-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0965E94B19E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Aug 2024 22:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3398B1C21101
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Aug 2024 20:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D1C014659F;
	Wed,  7 Aug 2024 20:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dSqNjpDl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D138144D39;
	Wed,  7 Aug 2024 20:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723063947; cv=none; b=qmZn4RwqtzdweJs6/dhYw8nzs+qzdSgUNC9MK7GfgKrdeuOENR02vdvOeYNTGQmJ0jHddyF97fbwCiYNSG218BLiZamxd6zOdYvDiAQREtNAzbA+zQmW9iuROixfipr7jNh4JJ5Rt3L8HC47USbwDC1j4Tt01t91nFEeJN9am3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723063947; c=relaxed/simple;
	bh=oj70GTHHWvPsRBx5GczXvZFla0MTvPyt6ASgDnA5YR4=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=Uff0Vz8pxxMH4FsN8c5MKBBGd/1DGRyD+ge/2YmCf8H6M9fU1xugCY34nQANRcJ39rrJTwh+d+HVCPbKhyJJDTywftY8hA5O9/MQnc22JU5TKvpSR9ln3S538pr4XznkJnnd6TvjPdHj2vHbudhGirdHLPAurgLrLM1Ss4dlJ0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dSqNjpDl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A930C32781;
	Wed,  7 Aug 2024 20:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723063944;
	bh=oj70GTHHWvPsRBx5GczXvZFla0MTvPyt6ASgDnA5YR4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=dSqNjpDlDZBAyB5EyI+LYsy7nnQHn/jUtw+F7FvPM7rvlnD3UXSqGabVUw5efHwVH
	 k5vH0uEo8Y2W8dkme7QQfWmt0paR8bSNMcHB8tOD/H3X9HJsJeauh8hX3cJq3BptqX
	 pFESMPq7witMNuohNEbAfOreIk+LxPd+cQJvJk1yIYhpYNje1tSs2JxueA3vhikZfU
	 JvnLr2m9W4CK7P6N8PUcc6g6FY74fnJF8jYqI/ZG8JnOW6bCXcD0cHbgT0PAGU0O4Z
	 DT6Z0lUu7o6rae9S7SAwj4PZTLlyS8Cvde6DxzwFWVm6zHtY24YP5HZd73lHrwxZ/V
	 h/AGuKTz41S2g==
Message-ID: <a0c8bb91f1645d1769e4cd2945bf36f8.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240807075714.2156445-1-arnd@kernel.org>
References: <20240807075714.2156445-1-arnd@kernel.org>
Subject: Re: [PATCH] clk: renesas: fix r9a09g057_cpg_info link error
From: Stephen Boyd <sboyd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Michael Turquette <mturquette@baylibre.com>, linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To: Arnd Bergmann <arnd@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Wed, 07 Aug 2024 13:52:22 -0700
User-Agent: alot/0.10

Quoting Arnd Bergmann (2024-08-07 00:56:58)
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The rzv2g-cpg.c driver unconditionally links into the r9a09g057
> one, but that may be disabled:
>=20
> aarch64-linux-ld: drivers/clk/renesas/rzv2h-cpg.o:(.rodata+0x440): undefi=
ned reference to `r9a09g057_cpg_info'
>=20
> Use the same approach here as with the rzg2l variant, using an #ifdef
> around tha data.
>=20
> I think both drivers would be better off doing the abstraction the other
> way round, with the platform_driver structure defined in the most specific
> file and the common bits as a library that exports common functions.
> Changing it that way would require a larger rework of course.
>=20
> Fixes: 42b54d52ecb7 ("clk: renesas: Add RZ/V2H(P) CPG driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

This is https://lore.kernel.org/r/20240805095842.277792-1-prabhakar.mahadev=
-lad.rj@bp.renesas.com

