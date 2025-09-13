Return-Path: <linux-renesas-soc+bounces-21844-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47688B56355
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Sep 2025 23:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A761D189E65E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Sep 2025 21:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C5826B95B;
	Sat, 13 Sep 2025 21:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DFP+cBEm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF90D2C86D;
	Sat, 13 Sep 2025 21:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757799505; cv=none; b=anL6UwD4MIS1ZKytMSxHNxECIGVQb6ErFsCrsv9R1sWjohw0/z5VqSEBprMUTAYD7DWePXsriV/g7z3utcFkytiE4lznIQ5btpbiis3VH+CEdnyZmvt6LSUhleufaGaTw9m63eiwp+P1yYFN3/riUwIULLr9SYpVD8bBqV0GXcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757799505; c=relaxed/simple;
	bh=gagN3D7yAHDBul/fKGawsMYfkGpbiPdtmFHgGsey2V4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=AYCFE9ECGM5W5fPUJ6uZyM5Kj/vNjrGzH3gFlI6SS5S52FK896UbhxTUQhcUIpSKMSblFyUueYzKAs7jNWbCwX21NwRIcjwSx+XKRUvjuEYmldRON6lMNJzsk/O57i2aWniYX7U2/jUvVedt1Zx27Kmssiut8Yi8IJt0KjQnHH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DFP+cBEm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66164C4CEEB;
	Sat, 13 Sep 2025 21:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757799504;
	bh=gagN3D7yAHDBul/fKGawsMYfkGpbiPdtmFHgGsey2V4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=DFP+cBEmTnGGf0pwHrGTg40Tq8uZsova6l/B3+P+nM7Ng8GNQaaF4Ky2In3CM3nl0
	 hDtCkaHwUG5cC+Yvl06iw1VrAJHpmsTQn4gDfVNlC2WbSAw4AyYGkwMmr8LcYspNil
	 Jff2Xzg0p5cFvSK5IJ+CfjnvpqbXzpTHUSsQI8PvGobagDLF0yuS3m4cmfNaSwolpO
	 SV5VUukKiYKUeet59bo9LNFsorq0XCvstXQecLzaBCHiICp73tRfYuzzzvhsZ5Pnt9
	 kNT/4d6RpNlhBTPFxgwQxqMBK9TB3Z28Nm8xTSm67mn8J9E+KBuMa/rMBfW7dfYQaJ
	 78fRi32P8Y5jQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1757670020.git.geert+renesas@glider.be>
References: <cover.1757670020.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.18 (take two)
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Sat, 13 Sep 2025 14:38:23 -0700
Message-ID: <175779950371.4354.13784247156491523670@lazor>
User-Agent: alot/0.11

Quoting Geert Uytterhoeven (2025-09-12 04:14:15)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 6bbf77bb22565332744c74e9806f8fb50402d7=
3e:
>=20
>   clk: renesas: r9a09g047: Add GPT clocks and resets (2025-08-25 15:57:49=
 +0200)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.18-tag2
>=20
> for you to fetch changes up to b5788b96cba97da01e1f0e1316133427c1102ff6:
>=20
>   clk: renesas: r9a09g05[67]: Reduce differences (2025-09-12 09:53:37 +02=
00)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into to clk-next

