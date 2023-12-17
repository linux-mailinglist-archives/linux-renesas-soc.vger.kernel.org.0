Return-Path: <linux-renesas-soc+bounces-1173-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BC481639D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Dec 2023 00:57:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EBA55B21257
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Dec 2023 23:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1B3E4AF92;
	Sun, 17 Dec 2023 23:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FVpga1JV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAA74D581;
	Sun, 17 Dec 2023 23:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34CD3C433C7;
	Sun, 17 Dec 2023 23:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702857451;
	bh=q7bTFPsj30hO3VQ/Jw8eFniKJQ0LYbpH0+DSDeIsx9s=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=FVpga1JVmyUyystOJCvpMBXveKKJD4nAjSHPuHnRGeyf3b4sNNwyaZOaubHnvFrcY
	 mpd+XrMtemrfGOpXDNIqdQxG4+PdcVvejxRwiBKlGdr4nwNzTGqsDT9l/a1sDt7xqD
	 XYRfmF/LUavIwDPpHHo3EMNuZrBE2kvM8F/LU9YVjCWaBj1PYkWBiJ/Vr/JwM7SiWu
	 4kNTORXOClGfUA7Anr47R/p4/7FrJ0yh4jWIn1naxFgvQPkDu0ZULrLW/TirSieeOn
	 9Kxx03HavYEd9LFAwhS9WLUUNa3VwzeV4FHFwttIk2r7+d64aPg1mGIBLyabtT1Nll
	 hhfafuAhgCvbg==
Message-ID: <8f7fa7ed5578cd52db7ed431b52cab03.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231122142310.203169-6-biju.das.jz@bp.renesas.com>
References: <20231122142310.203169-1-biju.das.jz@bp.renesas.com> <20231122142310.203169-6-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 5/5] clk: versaclock3: Drop ret variable
From: Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
To: Biju Das <biju.das.jz@bp.renesas.com>, Michael Turquette <mturquette@baylibre.com>
Date: Sun, 17 Dec 2023 15:57:28 -0800
User-Agent: alot/0.10

Quoting Biju Das (2023-11-22 06:23:10)
> Drop ret variable from vc3_clk_mux_determine_rate().
>=20
> While at it, return the value returned by regmap_*
> wherever possible instead of returning 0.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

Applied to clk-next

