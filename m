Return-Path: <linux-renesas-soc+bounces-16728-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2CEAACC93
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 19:56:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D63351C02E9D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 17:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5AAD28151D;
	Tue,  6 May 2025 17:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZYuHGDDY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973021E47AD;
	Tue,  6 May 2025 17:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746554174; cv=none; b=tuh3DRL9oK2T0GH4djcHGxcBxai6pCmscJ1jab1t8E6I2s/ZGHib+P0q2UhU1ZDl27NYYgD9QNOE1EtVEzx10WKZKHPvB1vglmYXZAItvkd+x8mxFQ4mWSbc5HH4vh0d5kNLYKvYTU6wrOdxJ3V6cfikReQYW8SR5CZltkdrJHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746554174; c=relaxed/simple;
	bh=PqRjL5S+HA2si33b8AJu/6SHnmiXcHLFiRDTjVc1wfU=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=kmGIzxUnZiXfZoRrRPwoFzrOof0e9HNz8fSbWBkvNOF+Qjfmp3LovPdXdLYnxfzKhM2u9bgGKkUxjkW6FNasNyCMtU7RNmnUeXWoa1K3FqouL/9X3n2/md0Ft2M+m4sRQBJmdRgnSqtDVkZTZ14m7Ay+MXxi5QjmoCIBPJvzgLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZYuHGDDY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED771C4CEEB;
	Tue,  6 May 2025 17:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746554174;
	bh=PqRjL5S+HA2si33b8AJu/6SHnmiXcHLFiRDTjVc1wfU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ZYuHGDDYUGfKR8elEx0UdvjR6a5lFT0/Go0kaBKvU4GpikASAmsSdal8iiPTp3oUL
	 lTGbWuVE/FF1Bcu1yq+zj+/EKJCivXyMJU1lCg+YWGRaYPXYHCPZ3vNWeelAOKz99R
	 CCqgxuuCDl0CUPMutTv2JFH5i2YFKosH3K53UWFvdEUxjeeZ5Ufk/0ijV8C50K3gU8
	 nKLvK3AUx069PQOfnAkRwwSAu8gfS9+eoaJ1bl/fulnv2zow6W2KEShajmTGN5WLg5
	 slAZrTySWMopoW0inbl7OJ7SsNu9Y4MkxPtGaipYPZy8KivtKONXE0ns5mdMb3cmK0
	 fpHIrT+XjXqig==
Message-ID: <ea1555766be390ecc140b0b79380dd81@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1745583433.git.geert+renesas@glider.be>
References: <cover.1745583433.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.16
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Tue, 06 May 2025 10:56:11 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Geert Uytterhoeven (2025-04-25 05:35:16)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089a=
c8:
>=20
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.16-tag1
>=20
> for you to fetch changes up to 93f2878136262e6efcc6320bc31ada62fb0afd20:
>=20
>   clk: renesas: r9a09g057: Add clock and reset entries for USB2 (2025-04-=
22 11:38:28 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

