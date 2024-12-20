Return-Path: <linux-renesas-soc+bounces-11667-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6215D9F9D4B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Dec 2024 00:52:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 186B3188EA59
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 23:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58FB0227575;
	Fri, 20 Dec 2024 23:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m4/tLde1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C7321E08B;
	Fri, 20 Dec 2024 23:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734738744; cv=none; b=ufY8aEw80LTL8QNLY/zpGtoidIW9EdfTg9skqwUWdBH4FdiFQpKUByeJ0DDffksTBwhid9HdptmTd/rKGetjksKvZJLc8nNzXd6eC73Lj8+b6/G+KZ75tkiVaD5EQwo9X0Kf0nj7UfdplJ0tgj4vmnKqlDTWlYSu6EU/at/6lQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734738744; c=relaxed/simple;
	bh=IQfTnIpxRZ8LRQzTZXm1IQtHdrJu68H3mCkUxSx08Og=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=KJiOIW1uLnXbItJfDXP0PJQiLlH3WCGSWv3KR/PUMMwBN0baHubHx7cv3VezHp3GrTpK4iYbuKKHnjfTMLIxV2YMtzaE07wFltcu58mLc/+mbF6kpxE/C6+/VvX22JKxaqzobkri0WFGXQ5hKGiq4OUo9O47ntc4M46P3CsIH5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m4/tLde1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8424BC4CECD;
	Fri, 20 Dec 2024 23:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734738743;
	bh=IQfTnIpxRZ8LRQzTZXm1IQtHdrJu68H3mCkUxSx08Og=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=m4/tLde12C10aw39FkZtfrBNBfXSnVHf6Ir9jOLaaefyTs/UFxINY8UpMx+cTelnZ
	 eol91MzR9FfpfjhAw2XuV8rNinjkWXNpCaL+2duj4pRU4ikw/3VMFqscfy9H7j1O80
	 QyoIRq5DimmOwKy+NzfCkKMjCx5F1A5kF1RbpK7XJo2QWgI6q5hmRLnxsrKyQDHxxQ
	 2wIYtu+iw8q/WuDoxjYwgDBKJ9V0uq8fnFpBKpuRpbvoYju89cnQJLulRm/ln5GsLr
	 im5ur0s3mktb/rN6edd8P7sWaRjAjPOjcuSeInJzN+beqG4sANkAZLXrFxiphhYiA5
	 3ryU5kWMGVSYg==
Message-ID: <e7b05a01a82fdc2b379f7fd902423a84.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1734689961.git.geert+renesas@glider.be>
References: <cover.1734689961.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.14
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Fri, 20 Dec 2024 15:52:21 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Geert Uytterhoeven (2024-12-20 02:29:08)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b=
37:
>=20
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.14-tag1
>=20
> for you to fetch changes up to f962745289958e89bf520407728e384e52ea8e27:
>=20
>   clk: renesas: r9a08g045: Add clocks, resets and power domain support fo=
r the ADC IP (2024-12-10 12:02:24 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

