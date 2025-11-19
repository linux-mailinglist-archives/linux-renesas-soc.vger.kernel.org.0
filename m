Return-Path: <linux-renesas-soc+bounces-24858-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E25F5C70AFE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 19:47:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 473C34E1EFB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 18:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB8071D5146;
	Wed, 19 Nov 2025 18:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QQK1f0Lo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C6B30B52F;
	Wed, 19 Nov 2025 18:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763577726; cv=none; b=nDQ69XVP0km6FDfMJra1jo+DDaq0KhMTTdNnKG50MHZQ3nvM4h/DVqs7GM6OlrmQlEsJA1qxMbE4dK3KxN9nSkAmMgh8TTqyt12Ltccabyc/TKn9SbZHhk9fMhyJLFPgEMkgL5wyzcjdaocE1zU/5lJmUQe4XmH0H52gFKHe49A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763577726; c=relaxed/simple;
	bh=vlYVqg/cfdCFAIFw0YrOuAFDsNg3JNUJuXrR99WuvA4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=nNiASOJgxV95bPXlmU2Tcmt/dzrqmbTS6j8Ofhjjfe8bKdipPp5MLPfrHZIp2c4RRlEi3raENag8TVCmrrs8z4MdCCLQ2jpPYheXnmCEJheHr+4UGxgvJJxXfCHtUL3qP/oq0AxsRa2P0hf0onQqkvppI7yMx/e4wIGBHOskZ88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QQK1f0Lo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D11AC4CEF5;
	Wed, 19 Nov 2025 18:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763577723;
	bh=vlYVqg/cfdCFAIFw0YrOuAFDsNg3JNUJuXrR99WuvA4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=QQK1f0LoPWDzHyH8nlc1hTLOSlu6X2xOCaG+WXuqqKBlSFWjh7i12xqMhS+SqJAd9
	 nm6itdf0IOfWxrRhZtm87Qq77mn67lKQl4jrOURciyMPWB5VLG+paC6m/qHCxFfhJh
	 UCprzfscMiqARZ1cNfKIgyQM8hsyCv46Rp6Q2XeyayNaACjxsnAYLcTECtquD/Ys9P
	 YlpQmK7Q8t2/dsnNElc9ESiLyysB/Vl2q9IbmpXBsRgOnlH0n1ww/x1sb8cHKe4QnI
	 JQNmHRRmerD2sNRe2cP5AsfalB7CSPwKi85C/bmO0U8u7BFF+nyuyQ22iedQeFobJY
	 JM7KTCiKxxiJQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1763115635.git.geert+renesas@glider.be>
References: <cover.1763115635.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.19 (take two)
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Wed, 19 Nov 2025 10:42:01 -0800
Message-ID: <176357772108.11952.7470125231714339784@lazor>
User-Agent: alot/0.11

Quoting Geert Uytterhoeven (2025-11-14 02:30:41)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 07525a693a5ff6592668a0fd647153e4b4933c=
ae:
>=20
>   clk: renesas: r9a09g056: Add clock and reset entries for ISP (2025-10-2=
7 12:15:00 +0100)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.19-tag2
>=20
> for you to fetch changes up to 5fb2f67341bd4b7c482f2bbda6b78244a51c3923:
>=20
>   clk: renesas: r9a09g077: Add SPI module clocks (2025-11-13 21:18:25 +01=
00)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

