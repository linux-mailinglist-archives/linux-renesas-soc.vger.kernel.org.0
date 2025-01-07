Return-Path: <linux-renesas-soc+bounces-11938-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B493A04A70
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 20:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E6BE1886C87
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 19:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B8D518A6B7;
	Tue,  7 Jan 2025 19:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H0CSjGgv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543FF18BC2F;
	Tue,  7 Jan 2025 19:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736279177; cv=none; b=oByY60cQKIty+e8/IHwD7QI9KR5zs749hX+RfEpgD6JpXmfEuzziqvjQ64tJAhlzLiUbqiWK/zrEIuIyB3SlqITsKYgKpCwR4Ys32Haw2BlRjd42qg1w8VVE0gPFLkUsWKmRmKwZl0wNFyT8eXTzQCfBDS3TRa0fLw9Q57WwIgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736279177; c=relaxed/simple;
	bh=yMH/AA8yA5oBjguQozADNzh+FTMjBSQL953ePmP40bY=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=Bu8JXiH5zPJonL61hzdZ1sNsU6Q+bVGcBt3eDgDY6qctznP12nyKoIM73IQSWF/iA8JuLHtMI7EaTm7WxU63xITF8dBZVHDSJN9yehZkzclE5YQUlGG05YMh6Q60zmhqZu5RZ1ZlsU4tz8V0yHIboN0kybkyguDJWyv4/FsjFrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H0CSjGgv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42C5C4CED6;
	Tue,  7 Jan 2025 19:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736279176;
	bh=yMH/AA8yA5oBjguQozADNzh+FTMjBSQL953ePmP40bY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=H0CSjGgvY8qZujd1cUv/4ZeuTYgsdipBDJ6hGQOfxS+J+7WaUrAAPmcJo/SneOE2a
	 VEhXd1YUdPoDXt27WTfG800YF0EZ8y6tRPZpA4dOIvYOSWiAd9xFA0hmPzpuWm3YwQ
	 pvsEKD8+mwKMg5RuqsSpIdZFwFVO+iCQPJEC9xI3hxqJMLevBnBp8auODW9XQKrirb
	 FdYg7FyN4MfFIWViWbOKusENSvKiw+Oo21Bs5kxu9A3VsM4bZCxoTo2g2N6W2kn2Mq
	 6iVDwBUaLq/fwFStcpjMieh9JbhrPcjxG/FvbXEi1n9tmzV1taaCFRQQQAaJKd0uLK
	 N2DBZCzPhJj5g==
Message-ID: <7084be40e8a77a5b47b64cb41d66437f.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1736266782.git.geert+renesas@glider.be>
References: <cover.1736266782.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.14 (take two)
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Tue, 07 Jan 2025 11:46:14 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Geert Uytterhoeven (2025-01-07 08:25:28)
>         Hi Mike, Stephen,
>=20
> The following changes since commit f962745289958e89bf520407728e384e52ea8e=
27:
>=20
>   clk: renesas: r9a08g045: Add clocks, resets and power domain support fo=
r the ADC IP (2024-12-10 12:02:24 +0100)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.14-tag2
>=20
> for you to fetch changes up to e91609f1c3b0ce06d80b1b3bd0e6b942782be016:
>=20
>   dt-bindings: clock: renesas,r9a08g045-vbattb: Fix include guard (2025-0=
1-07 17:03:01 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

