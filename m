Return-Path: <linux-renesas-soc+bounces-8393-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 236D996156D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 19:28:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52B0E1C22461
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 17:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 068AF1CF29D;
	Tue, 27 Aug 2024 17:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bUWVrFz6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B931BF329;
	Tue, 27 Aug 2024 17:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724779675; cv=none; b=ZWZlkJCIIBNWUgmeehaDpp79aHmz1I9iNv35xOMhqDtoViuB+HHSYvbX/XDbytncrcq+xyxxy4H3Z+OK8HLOttVBPjHsH2b1Uw58eG0tOjwYIPiN19nZJ1xabnREaCFSR4TQN+2ol+4wXDkjzOsbHZ6Hr+REd3At1yw/BFP+ohQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724779675; c=relaxed/simple;
	bh=qyveMloOtvBmWMIDPNpWmLi0HPIYQ5qQSVfaoTEYwzo=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=tgQYkiwPG8ReQMulxtA3r91e74P4g1UrVvTOvJeT2ukVr4+uOsTSNitbu+1AC1DKiL+DDSJDxt8XBXwZHVJcIdzdMGKKyYLLyeAMP472KUDAb4CyfN0Muved7pfMwZGpwPu4qLWHIO26JuRlk+h816vuMkx8WOJOJb9w3KWYMDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bUWVrFz6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BEEFC4AF13;
	Tue, 27 Aug 2024 17:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724779675;
	bh=qyveMloOtvBmWMIDPNpWmLi0HPIYQ5qQSVfaoTEYwzo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=bUWVrFz6mkTxM49uq0pRJfEX7V0sIu9AcSiGZOGThLTHiwuJwmETL0e0m4vuGbw/R
	 wAWODlhD/wjLn9O8XXvTWUJikZbmsdr3oxofwZZZZMX3swhS8UOmobWbTXFhtS+V5u
	 8+1CcJkSuucKgWPDaiuGMCsJN+1estS0olRu+Ub6Q/8wjeIosMHw7kb5nXjjsiHz+Z
	 kapgmGUxBpdx1DXzob9Qiv8G8saDfSdoaKxmMm5UBbhrSWWI6+NdM0d3ASwu0zNIWN
	 Lcq3O0e1S3xtRkvhfyw9azgEfZ2d9OK7Pq4XUJvzeQm7/enrWXikgdIo8wR4EWVFy9
	 yL/BZE+s733UA==
Message-ID: <24a42ef9acd41710604307a1d990e4f5.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1724317714.git.geert+renesas@glider.be>
References: <cover.1724317714.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.12
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Tue, 27 Aug 2024 10:27:53 -0700
User-Agent: alot/0.10

Quoting Geert Uytterhoeven (2024-08-22 02:14:09)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f01=
7b:
>=20
>   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.12-tag1
>=20
> for you to fetch changes up to 120c2833b72f4bdbd67ea2cf70b9d96d1c235717:
>=20
>   clk: renesas: r8a779h0: Add CANFD clock (2024-08-20 09:48:24 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

