Return-Path: <linux-renesas-soc+bounces-1155-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B098815CD8
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Dec 2023 01:38:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85BBF1C2137F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Dec 2023 00:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375A365F;
	Sun, 17 Dec 2023 00:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ba7HsRqv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B4A382;
	Sun, 17 Dec 2023 00:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F90C433C7;
	Sun, 17 Dec 2023 00:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702773514;
	bh=KZFR+aM/3mY5Gu3CtRE+Xo3wna6pmvl70M9VtVOxAq8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ba7HsRqvjPKBK6O80HYJsZZb+gO+FB0SVHSegByzVh7+QFDtylZaIuTvLT77LyAjI
	 W83S2g6nxyeLYnzTrxtUPiERGqIQtqoFbFQPS6gNQSDUH4lc8Utt8AXt2MaWslaVJd
	 Y6neUktAlIgO+IHR5vKVGBeVeMsCxytgtpOQk1aMcrw/PW+LqlJy8PnOLRP4IoXLR6
	 /Uh4bPq9SrpjAVc0Ic5tC0cu/WxwIN4gxsRk1NCS/p+90BSJsmekLrDbODz5MH7hpc
	 VW7ILauez6PeqlqxvafmGy5R65FIw4JIaNcd2k5jakKJ0z65jOvCX6Up4da7gRaogq
	 mvPuIpbV32XlA==
Message-ID: <2e3886f8ccc97faa340767dc7bb71433.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1702642574.git.geert+renesas@glider.be>
References: <cover.1702642574.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.8 (take two)
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Sat, 16 Dec 2023 16:38:31 -0800
User-Agent: alot/0.10

Quoting Geert Uytterhoeven (2023-12-15 04:20:44)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 5f9e29b9159a41fcf6733c3b59fa46a90ce3ae=
20:
>=20
>   clk: renesas: rzg2l-cpg: Reuse code in rzg2l_cpg_reset() (2023-11-27 11=
:09:53 +0100)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.8-tag2
>=20
> for you to fetch changes up to 515f05da372aedf347a1ac99d17fb832ba371d4d:
>=20
>   clk: renesas: r9a08g045: Add clock and reset support for ETH0 and ETH1 =
(2023-12-13 20:05:55 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

