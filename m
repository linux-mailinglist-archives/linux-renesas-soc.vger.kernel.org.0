Return-Path: <linux-renesas-soc+bounces-3057-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D6385E70B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Feb 2024 20:14:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 327381C236BD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Feb 2024 19:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A03BC85C47;
	Wed, 21 Feb 2024 19:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V7OB+AfS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7826879DD6;
	Wed, 21 Feb 2024 19:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708542886; cv=none; b=kezLqcJ8DTNKsfm82371whpfkZ1BKUH6puHo6ABIB6qQe3OUpG8NeKiO+bN7oxjwACiTdwtNZFvb27984hPJsLGmtvSsRIxHUZ4DrTj39YexQZv23KcuWlfeBB9IPQht30tW9HFJ8OEJ+nd4WLmD0QkoCWjStKRv562rdnMRYXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708542886; c=relaxed/simple;
	bh=zANAkyf/heA22WD+nmjgPqi08fXUW0P+IVVOqNNtubA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hn24maG7WxReQEQkflnN8SnaDqofxXYG/Xe9Q9FpwmlX8z1DUCxaSjyYN9i/sgFFNtSXiSyqxVcj/n2sG8SMGywmnXRVqGjVm0zAbFhUEa2nIjwRNUnyCzJCt2mNmo1ZVw4CZrzMCV7pASCNDAASaP6Df/MWQ/G7UabTrp5wBOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V7OB+AfS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 531C6C433C7;
	Wed, 21 Feb 2024 19:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708542886;
	bh=zANAkyf/heA22WD+nmjgPqi08fXUW0P+IVVOqNNtubA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=V7OB+AfS59fqaEHtD8jj4h2KNB++Nc3OAxOOfEdNmy+xWmUA0pUhHNguKCuo2KRoN
	 S98aOeDVxf7fO5hNCY+3IIfHnYxDCPJTdqMQoz+ygT7m6W4Znloqpou9U1KjTyyNeC
	 VofqSex0omZ0Ckp5qqG+b4P0lZpF5GF0UBno6aL62wroJGFDtXPJiEA8Hmng4q42lZ
	 zrHbAS1CCyGiDSG8zypJKpc+FJwZfrpzs/POauHvuBLb4Cw2AEK4vqg/0aFW8h7RTK
	 q2+FwFj2All3X9xTTFB0oBkzpp480TVjJCyIR/6NSnug7psjNOoJ/ZQ30UAx5pSQ+0
	 7iPrOndB5aO2A==
Date: Wed, 21 Feb 2024 11:14:44 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose
 Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, Maxime
 Chevallier <maxime.chevallier@bootlin.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 Clark Wang <xiaoning.wang@nxp.com>
Subject: Re: [PATCH net-next v4 5/7] net: stmmac: Signal to PHY/PCS drivers
 to keep RX clock on
Message-ID: <20240221111444.22fce1f7@kernel.org>
In-Reply-To: <20240221-rxc_bugfix-v4-5-4883ee1cc7b1@bootlin.com>
References: <20240221-rxc_bugfix-v4-0-4883ee1cc7b1@bootlin.com>
	<20240221-rxc_bugfix-v4-5-4883ee1cc7b1@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Feb 2024 14:04:22 +0100 Romain Gantois wrote:
> There is a reocurring issue with stmmac controllers where the MAC fails to
> initialize its hardware if an RX clock signal isn't provided on the MAC/P=
HY
> link.
>=20
> This causes issues when PHY or PCS devices either go into suspend while
> cutting the RX clock or do not bring the clock signal up early enough for
> the MAC to initialize successfully.
>=20
> Set the mac_requires_rxc flag in the stmmac phylink config so that PHY/PCS
> drivers know to keep the RX clock up at all times.
>=20
> Reported-by: Clark Wang <xiaoning.wang@nxp.com>
> Link: https://lore.kernel.org/all/20230202081559.3553637-1-xiaoning.wang@=
nxp.com/
> Reported-by: Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com>
> Link: https://lore.kernel.org/linux-arm-kernel/20230116103926.276869-4-cl=
ement.leger@bootlin.com/
> Suggested-by: Russell King <linux@armlinux.org.uk>
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>

breaks allmodconfig:

ERROR: modpost: "phylink_pcs_pre_init" [drivers/net/ethernet/stmicro/stmmac=
/stmmac.ko] undefined!
--=20
pw-bot: cr

