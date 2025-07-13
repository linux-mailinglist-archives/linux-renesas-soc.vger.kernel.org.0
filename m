Return-Path: <linux-renesas-soc+bounces-19536-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A50B03222
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Jul 2025 18:38:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 698F418914BA
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Jul 2025 16:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD203279907;
	Sun, 13 Jul 2025 16:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h7haL234"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CF97D07D;
	Sun, 13 Jul 2025 16:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752424679; cv=none; b=MTgGptw6Rd3yqeJbp9VBeiQUYiYBivD0dVPA2D/D07qedrYz4jcOrDnAknoLOGXMWTtcvfQSA5KSJDdGsqzxTNdX8QQXCOnDr3PqEN/Erl3mm5H9rcK5CsHduyLeBh+ddQXdmCP/2lsUGby8kAlS0rdM0YDVkue3WAY5gfeHkOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752424679; c=relaxed/simple;
	bh=DyU87YM5r7JRWP5w5WS4pMNHSytfp53SAvVCiNhkD8c=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=RXTDamN/WPpK/zTn/JsDCAPhca+Ph3G1JbxUnj/KXysSGetnwWC+KOb56pnl1xaUTmE0I6TxMwsc96x6sogiy/KHtyCMt27STuC5oBn/Mcs425VPx0O5WpGl+U+NHf431x+pBmHffHbUrmGFiwr+4STB+dn/U8zsROjDYQDJEDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h7haL234; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71EB8C4CEE3;
	Sun, 13 Jul 2025 16:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752424679;
	bh=DyU87YM5r7JRWP5w5WS4pMNHSytfp53SAvVCiNhkD8c=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=h7haL234gIcr37jKHim2EV+Ngygz433XZo4cwf5pIzBbhSgJsRVkfOiEJvKFbg/7K
	 Lf0NAhuDM1hQsZmqXF+QdoSI3ngBTcLS0LtWEZ6AjhGGraEXKfQiP15mT75byP8TQZ
	 veG1QD54xJb6YSVaWclBfYACnqx+Ah2dgJWoIltLdQYvWzdIkwIpEpDENv3BIpLDri
	 lW4KMMz0Ubj7fUVs2LFfsaS9Ll7ZP69LHZ6WAv+Ws7lgdfnOeliAQWMQ7fqpuU07Fc
	 KnxS6YhF8Qlu3EkxrvxNIoWhvBl3fmHDtvd5thZHJscpWMdMSfUpkL0dPV0B1SRiNg
	 zsHANBiLa1Cyw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1752090701.git.geert+renesas@glider.be>
References: <cover.1752090701.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.17 (take two)
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Sun, 13 Jul 2025 09:37:57 -0700
Message-ID: <175242467795.1004940.2924957685701978498@lazor>
User-Agent: alot/0.11

Quoting Geert Uytterhoeven (2025-07-09 13:14:11)
>         Hi Mike, Stephen,
>=20
> The following changes since commit b7c26cbd5b704a350b3176669f47047153903b=
c9:
>=20
>   clk: renesas: rzv2h: Add missing include file (2025-06-26 16:28:50 +020=
0)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.17-tag2
>=20
> for you to fetch changes up to 0ab2d84f94dae48c3e7605cdc99dbb4e7c7b206a:
>=20
>   clk: renesas: r9a08g045: Add MSTOP for coupled clocks as well (2025-07-=
08 11:36:16 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into to clk-next

