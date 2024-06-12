Return-Path: <linux-renesas-soc+bounces-6115-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7C3905DFA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 23:48:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C8531C2227B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 21:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC55D12CD96;
	Wed, 12 Jun 2024 21:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O4MafCLQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A195212CD8C;
	Wed, 12 Jun 2024 21:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718228853; cv=none; b=RPmQBk4tCVgNlc6f8rnCk2V0mM3cOkn8T7zZa980Cz7sNh+VDwr3/zdLsBV2tXPhCsA6tcz4rN/VcTGcIZFhEPUOqnTxiHcNyZ0gkvrLrauXCg2mzOLc2+Qy2Eoci08hMvf/Na5ylJFEmRQyPMwxFfoTlovzovIX4qN4bF+FJTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718228853; c=relaxed/simple;
	bh=4Dclw+XDECXOtLJQQNAyX1w756yS2jzixDMftX4w2UI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NV7D5U8G0z0zBdA6jBZqkavjwHYL+nysmWWl9iYVEBDZl3lZF5VFGFbae0glPkNaQOHlOLoh9RVRzJFO1Iyas0Owjp6vQeJUZlO3YrH3znIO3IUPhduaZVd3apppEX3iuUX6oMR93Zlesf8J92E70iIUjUAiIlBghWOtMAuz6ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O4MafCLQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDEC1C4AF49;
	Wed, 12 Jun 2024 21:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718228853;
	bh=4Dclw+XDECXOtLJQQNAyX1w756yS2jzixDMftX4w2UI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=O4MafCLQwND1WuimG6H710qp1tMidgzfrEN0Sht8iW7iAP+eA03T5C5SJsY1HvZnE
	 i/+3pycUg/t3dUniwtmzOx0mRFKO13X5kphagUzAnVz9BiYOo8tXP2uECfmKYcNtbT
	 dmuR9inyca0oCfz/lF7tXWZBNXeO9T/LYmbCkHvjvNV6Fj+TkJsWqr55ght22jg9Dd
	 0TcqisLR9SQtSvp5Uzlxa+mWWTKVIRy/TUN/dG421xxRKiUoJ9IifTaIQK+MPB0ba7
	 aRKxi8d5uroRlOHMcfUPx0t0g7TVuNvrgoNxMLOrqle6EId1svMxjEVrepCOAhHrwV
	 1X9HyG6JLIo6A==
Date: Wed, 12 Jun 2024 14:47:32 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?=
 <niklas.soderlund+renesas@ragnatech.se>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v6] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <20240612144732.137aae98@kernel.org>
In-Reply-To: <20240612114526.GF382677@ragnatech.se>
References: <20240610135935.2519155-1-niklas.soderlund+renesas@ragnatech.se>
	<20240611195616.2e71c334@kernel.org>
	<20240612114526.GF382677@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 12 Jun 2024 13:45:26 +0200 Niklas S=C3=B6derlund wrote:
> On 2024-06-11 19:56:16 -0700, Jakub Kicinski wrote:
> > > +	netdev_info(ndev, "MAC address %pM\n", ndev->dev_addr); =20
> >=20
> > That's fairly unusual, why print the MAC address to logs? =20
>=20
> Renesas net drivers print the MAC address in probe,
>=20
> * RAVB
>=20
>     netdev_info(ndev, "Base address at %#x, %pM, IRQ %d.\n",
>             (u32)ndev->base_addr, ndev->dev_addr, ndev->irq);
>=20
> * SH_ETH
>=20
>     netdev_info(ndev, "Base address at 0x%x, %pM, IRQ %d.\n",
>             (u32)ndev->base_addr, ndev->dev_addr, ndev->irq);
>=20
> * RENESAS_ETHER_SWITCH
>=20
>     rswitch_for_each_enabled_port(priv, i)=20
>     	netdev_info(priv->rdev[i]->ndev, "MAC address %pM\n",
> 		priv->rdev[i]->ndev->dev_addr);
>=20
> I have no strong opinion on if this is good or bad, but I do think they=20
> all shall behave the same. What do you think is the best way forward,=20
> keep this behavior in this new RTSN driver or remove the print from the=20
> old drivers?

I had a hunch this may be the case :) People invent local customs for
this sort of "hello" messages in driver probe. Developers consider it
useful because when you get logs from a user you can tell whether
driver got probed or not immediately. But there's no agreed upon
convention across networking drivers, and if we need to debug probing -
the device driver core should be put to task to output more
comprehensive information generically.

Anyway, weak preference for removing the print, but no big deal.

