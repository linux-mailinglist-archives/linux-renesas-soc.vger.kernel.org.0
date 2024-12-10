Return-Path: <linux-renesas-soc+bounces-11203-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DEB9EBE9C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 23:56:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A92718842F4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 22:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE8222ACD3;
	Tue, 10 Dec 2024 22:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p64w2bPf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D58421126B;
	Tue, 10 Dec 2024 22:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733871133; cv=none; b=agiGpwZHE12zUbITnEhhKBPqB5yeBwh4WrW2Ocg6FTi0VZVH0APcg9UI//30gD58/dzx7jNRe+kecCqWKN6rGoHeNWU2cYWSm6nAMzrV/QG8YsbhaV72bgldmGxXHfhjD6qLynrsWkW7od2pUT31+f+pkRq7UC7TGCJCIu6LM2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733871133; c=relaxed/simple;
	bh=vOQZ+hRArK+7+2LfL9+F0yLhkn29I12pqL4H5D46RMw=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=k5cWCo94dnjxAgLVzhPmI38Uf2Cs5adrEhT97+XN7TWatxCSylocDA2YpHbnCN84wpsjgbif7FkQ3VjFT9WKDHJnZqmk79A85DnZR7kVOT6wkb3ikUY3A/mAKs0bYNPoZ1aU1IuwMkFtuAnszuEuVLH9dsyXK56976Lgtt8SCsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p64w2bPf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C50C4CED6;
	Tue, 10 Dec 2024 22:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733871133;
	bh=vOQZ+hRArK+7+2LfL9+F0yLhkn29I12pqL4H5D46RMw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=p64w2bPfQ7oTtuiNKwmmAgT/9L6cNOKg8x4DfbrKXPb8iTOd4CFIGFQtS3LvLtL7L
	 SydD40JGVlnh+Cg8WFdPHAJCbhq3iJDvRfeff6N/3wlo8gEfH4JXop42upI9abhFdC
	 39kYMU1Im8OJvEJtMUKZqRiw8zEWmRz8bAmVCM0mbEF5HRrgzinXnlxCr2e12XuNVQ
	 F1Bd0sdvhM2Ckd7TFQRPmFAAgGm5I38zBeFPm1sl2V7C4bmREiZUkIGYt2Zt3YoMxD
	 UcjI7SJQJvF0r4J2dkkDHVv8og18X3hd5hEZ9SzfB7nURvJ7VKJ0HaJ6mVNl4R/zB7
	 7dRE+vVESs5AQ==
Message-ID: <861ecb11ea5984a25699b3055599545d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241210170953.2936724-3-claudiu.beznea.uj@bp.renesas.com>
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com> <20241210170953.2936724-3-claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v4 02/24] dt-bindings: clock: versaclock3: Document 5L35023 Versa3 clock generator
From: Stephen Boyd <sboyd@kernel.org>
Cc: claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Claudiu <claudiu.beznea@tuxon.dev>, biju.das.jz@bp.renesas.com, broonie@kernel.org, geert+renesas@glider.be, lgirdwood@gmail.com, magnus.damm@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, perex@perex.cz, robh+dt@kernel.org, tiwai@suse.com
Date: Tue, 10 Dec 2024 14:52:10 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Claudiu (2024-12-10 09:09:31)
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> There are some differences b/w 5L35023 and 5P35023 Versa3 clock
> generator variants but the same driver could be used with minimal
> adjustments. The identified differences are PLL2 Fvco, the clock sel
> bit for SE2 clock and different default values for some registers.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---

Applied to clk-next

