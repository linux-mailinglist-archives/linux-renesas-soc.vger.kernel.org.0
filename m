Return-Path: <linux-renesas-soc+bounces-21843-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC15B56353
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Sep 2025 23:38:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B04B0A00A6D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Sep 2025 21:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43FC3263F32;
	Sat, 13 Sep 2025 21:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LIuVGZ0/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A79B2C86D;
	Sat, 13 Sep 2025 21:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757799499; cv=none; b=mbMCoaqlwZ/TTKZKeYsAdxmaptV8oVNbvxam75BfJF6Q/PmWHUMCN+6rNuG5JH2NDbz+HpIeQnwiULHYroLI+jBKLxyPEJvaKKFbaydo7weIPNKkDbqNGJuSACfz/7QK9P7y5gQDY2w3VsXxlrsVc0VzXA5FKvkYX4RAkCnhhs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757799499; c=relaxed/simple;
	bh=Rq/pJpYunReX1Wb1nBbMhihyMed+D4MkQ0qWfPo1tvY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=aNTGlhyQUqIJYavjGnf13HGibsZ5ZcplyVI7lYHuiVu+jDimAOV3FHdukajc+0BuLIEHdH8gqrtsdovC8BjpkdRIRNJh3qL0tTfPy71kO/OCnp98UHRMNU9DG9SiyfFb8TiWlSlQ2kAqgyoOV8j1a2UflkLwnzDnV2dqZ5ZkYh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LIuVGZ0/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FAF9C4CEEB;
	Sat, 13 Sep 2025 21:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757799495;
	bh=Rq/pJpYunReX1Wb1nBbMhihyMed+D4MkQ0qWfPo1tvY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=LIuVGZ0/zmsGLGSfyCUn9kG66PR8x09tnuQQd63S0LqCWq9XzBu/XV5YzMBeo4M0q
	 ONlG/rJ7VVAr+L3MI99YqpBT04SShoYLxk4qHWnBDy7X+BW1C2u4FB9/BoOumbdr2D
	 MER5kx5l/cWcnaBVz0l4N2FxLQhDGP8ZUw4xXor2tztgJBrbAL6nCsmyXdrfuv/OFd
	 jqAFJq56TO94JlgaFmEAHw6LGX1X012+7vrk5fuwgsp38j7KxpXZ/QjWw8Q+t/ocfd
	 /YGSojRiomu4ptm7k6HbWGtxF5DA6VzO/p2ijV5/7+9M2fyD9GzM7qWk1+sKZwrdLj
	 RZ0cB5KKl8R2w==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1756469006.git.geert+renesas@glider.be>
References: <cover.1756469006.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.18
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Sat, 13 Sep 2025 14:38:14 -0700
Message-ID: <175779949457.4354.12610830662149565985@lazor>
User-Agent: alot/0.11

Quoting Geert Uytterhoeven (2025-08-29 05:18:34)
>         Hi Mike, Stephen,
>=20
> The following changes since commit f63aaf6e71de897954fbde4e4a17a9dcdbe5e7=
e1:
>=20
>   clk: renesas: mstp: Add genpd OF provider at postcore_initcall() (2025-=
08-18 09:36:55 +0200)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.18-tag1
>=20
> for you to fetch changes up to 6bbf77bb22565332744c74e9806f8fb50402d73e:
>=20
>   clk: renesas: r9a09g047: Add GPT clocks and resets (2025-08-25 15:57:49=
 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into to clk-next

