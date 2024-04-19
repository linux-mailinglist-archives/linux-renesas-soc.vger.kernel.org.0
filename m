Return-Path: <linux-renesas-soc+bounces-4746-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A24FE8AB668
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Apr 2024 23:24:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD3AE1C20975
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Apr 2024 21:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885C38562E;
	Fri, 19 Apr 2024 21:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cmhIgF8Y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0E13EA8C;
	Fri, 19 Apr 2024 21:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713561868; cv=none; b=F8dvuyvlsOAig2OM/N8sF7dKFAVcr1GEMUH3kCsA2toHoaSuaaWK5UHt44ItQHRo75mCvb2STe4Mzz0PhmwjUmt279FweUX3y8LBf5gZzekaxugjw1GYCEoZzkw0AQEfU1bFVbNh4OKFEDg4uR7bx5joq64Ppac8JwhshthsekQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713561868; c=relaxed/simple;
	bh=K5J/kePaaSx45e0RkhVp672o/wQZ5DHyDrYdfoqQS4I=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=Bg+lWK1QBoV/hIZs3Nz6iwONaQPAiV4NmryrqUUMByI8ODSMBqiQCM12l8z8hLJXPQojasJSOFtsOLohzb3+iGQaE7c9h9yMXszH0NdpRzjzAG96FLzq5X2Q2mQvvtv61ScjfA/lb9xkvpZwMAcvKbIoM/Kt9tDT7kXQYH75fiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cmhIgF8Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC5CCC072AA;
	Fri, 19 Apr 2024 21:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713561867;
	bh=K5J/kePaaSx45e0RkhVp672o/wQZ5DHyDrYdfoqQS4I=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=cmhIgF8Y/5JHXKsZJlv/yzHWee2zN8ZMfJT3+ZX0N/Lc5Uw6j14TmTfU2jGEor4IQ
	 yDCwZx2mELL687tjU3QYrqRk1H7K2N1Xv8h3zLbiz0pRoI/hAsdP2/Pw6Rtd94w+TR
	 sgapRQEAFtBHZOlb3TR2YGVSiop9dIJUg3/T4EpJVKFQ2rWVtTLW6Gmh8Oxxwi1z4F
	 TWAkLfaUArUpcgnSmwrcx0laVmccfS/9khzW+5AmeEXhZitAyJtz2FmhEMLkUxgLC9
	 GtjOqKjuXSR5KVhFEpgsRhP0DTW8qUB2WicI7sd2I2WUTuALmQzZlWtdD/jDzQYIPI
	 J0g8tYptFmjxg==
Message-ID: <68bbc2cf86668678731c742f63c96840.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1712915721.git.geert+renesas@glider.be>
References: <cover.1712915721.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.10
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Fri, 19 Apr 2024 14:24:25 -0700
User-Agent: alot/0.10

Quoting Geert Uytterhoeven (2024-04-12 03:01:54)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 4cece764965020c22cff7665b18a0120063590=
95:
>=20
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.10-tag1
>=20
> for you to fetch changes up to c0516eb4cf04ac61b6fe1f86cc15b2f5f024ee78:
>=20
>   clk: renesas: r8a779h0: Add timer clocks (2024-04-08 11:12:32 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

