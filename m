Return-Path: <linux-renesas-soc+bounces-26901-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F65D2A35B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 03:37:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BCAA3020377
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 02:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80ECC33892D;
	Fri, 16 Jan 2026 02:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K4ugeUP4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EF2338916;
	Fri, 16 Jan 2026 02:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768531014; cv=none; b=Iy/WkSx/iFOjEYCCypeg0+ofyX5tJINEd02YsvUBLO1Z+pFht8wMFyPtBHz2QGaOTpymMi+FXRDGopW+Efa/vR3vaxsNu4khiCLARqDcp9zsVZUARLyAeglsq43X/gIkxFPYLyCNtqOBPHx4ZO7U4cNvD75pKZqp8JlkEmyxfpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768531014; c=relaxed/simple;
	bh=9PSVuZ3i4p6SOOLjxeLoGYrvLW2I91S5Yw031MXewM0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Edma4+kKynt9FKyEDlGGTaDsEoPqpROryGWvZxahf/qaL0QbVQJQzjdcZluvvX3phwln9u55D2oM2cN4tkHg4Pkt4kjvj7fOHqNIQTckpFgGMVdzPemrMVM34MFlLjFnmYPDiYRf+a3C/zDFpTGL30y9xiDq+d9QrdpHOkSHfPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K4ugeUP4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A91CCC116D0;
	Fri, 16 Jan 2026 02:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768531013;
	bh=9PSVuZ3i4p6SOOLjxeLoGYrvLW2I91S5Yw031MXewM0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=K4ugeUP4eP4/pJYO7jbJbwfWaFNpOE5/pkUWQZ2kZNXjk9eiW37viatzw215JSZly
	 acBfZvTEP295WajNQMkO4on1p7WxozavUOtI+rXIU9O+EUO/3eLW0zEL0JtK9H6thx
	 z2ldfwsqrfJIr8v8omibB/qu8dKkkqXQ1jV+xi+pV/PHg/cWek4X1S0hIcbK70bESS
	 TIxbcv3RixvSy0H2pVzsElusGDnjh0tQVj02ISe/3+pXVR9UtCFVxOIQs3SJMvUjbu
	 gj+CE3+hSzkKHZ1TJCYZGtPAHj0gji89kvakj9V90NxlF5slTGQ83+QFYwY/57N5HK
	 dRqlQAFdRPcEw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1767628282.git.geert+renesas@glider.be>
References: <cover.1767628282.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.20
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Thu, 15 Jan 2026 19:36:51 -0700
Message-ID: <176853101190.4027.4476160254080292922@lazor>
User-Agent: alot/0.11

Quoting Geert Uytterhoeven (2026-01-05 08:57:26)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1=
e8:
>=20
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.20-tag1
>=20
> for you to fetch changes up to ebb3acf4d7c95b52265084168b59a565bf972883:
>=20
>   clk: renesas: r9a09g056: Add clock and reset entries for TSU (2025-12-2=
9 11:43:22 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

