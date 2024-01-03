Return-Path: <linux-renesas-soc+bounces-1278-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BF682371A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jan 2024 22:28:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F050287CA9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jan 2024 21:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 007771D69C;
	Wed,  3 Jan 2024 21:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ecUTs7UI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83E21DA22;
	Wed,  3 Jan 2024 21:28:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B636CC433C7;
	Wed,  3 Jan 2024 21:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704317292;
	bh=lsIltowJTF2uPmkvluJHvqzbq5Y1CclQ0kHOdf4F8/U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ecUTs7UIgS6ZiKnr0JIwImr+ok5K/x+CfGqILIaRm4v52MUZeR78LgRqd+i4BpzfD
	 BAAb7VMM+veGKEdWwJtVg8B/SwdrHUWN8/oPWfC26PrGtw2rvOCxkevmZF+SeRI4cJ
	 CTHblMxY7P2sCczM1kL4dzzf4dzmDtLNIdZpoDj7S5FZ+H0crZBatAPk1FtFN4ZHgi
	 261b/tBYjrre/HjHOZ+ZcwZ8MnLb9F71elJNoRc0czmCMVHouCFtUKsz868/rHfDZ8
	 U+1DqSuAJ5GTjwnZANtDAb8HY8p9P0+X71imJyj/D3y84RylXDqKbX3Y2QxZI6X8FP
	 VxykDzWZ86tbA==
Date: Wed, 3 Jan 2024 13:28:10 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Russell King <linux@armlinux.org.uk>, Andrew Lunn
 <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, Marek Vasut
 <marex@denx.de>, Clark Wang <xiaoning.wang@nxp.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Sylvain Girard <sylvain.girard@se.com>, Pascal
 EBERHARD <pascal.eberhard@se.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net 0/5] Fix missing PHY-to-MAC RX clock
Message-ID: <20240103132810.1aae03e8@kernel.org>
In-Reply-To: <20240103142827.168321-1-romain.gantois@bootlin.com>
References: <20240103142827.168321-1-romain.gantois@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed,  3 Jan 2024 15:28:20 +0100 Romain Gantois wrote:
> There is an issue with some stmmac/PHY combinations that has been reported
> some time ago in a couple of different series:
>=20
> Clark Wang's report: https://lore.kernel.org/all/20230202081559.3553637-1=
-xiaoning.wang@nxp.com/
> Cl=C3=A9ment L=C3=A9ger's report: https://lore.kernel.org/linux-arm-kerne=
l/20230116103926.276869-4-clement.leger@bootlin.com/

If those stmmac/PHY combinations never worked upstream please tag=20
as [PATCH net-next], we should consider this work to be a be a new
feature / HW support. If they used to work - we'll need some Fixes
tags.

