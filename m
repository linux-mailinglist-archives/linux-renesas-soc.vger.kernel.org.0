Return-Path: <linux-renesas-soc+bounces-22348-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92281B9CD44
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 02:17:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B24BA1BC3767
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 00:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D9FE136E3F;
	Thu, 25 Sep 2025 00:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="OJ2QRaPE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792CC42A96;
	Thu, 25 Sep 2025 00:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758759420; cv=none; b=dW31vY0FnkCla8z3jfVPN/eJ+7IuMU1lFPUNZWy2krRadyK540KE+sGfGrK+9R/wMaimsDB5A3nAYQ7HfjUxvGTQuJgD+Etj9BGOdQQ4i3HlY2x5AP8rATkPPedceL6DwxmC0htKM5SI4B6c2Z5maPe5T9e0mqBvyNBhQeloeRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758759420; c=relaxed/simple;
	bh=trv/5zES0J71ogwwSlHNmpRE442auLyV/o1fTLjOtsY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TNvPOzTD7ML4fTTVU9JLXTdPYxRiBflvp7TYVE4sumFqivKBTjsvu7/HcJ74er4+aNGRjs7fkGmsu3yH+UugE6uJFFJbNKNtQTUpmCvjJrqIf7m3YJFFCuT/rnTgAK/Q84qubyKX36iWbc9PRtq+MmgbsGMj/EIdOuHJ0kzpUX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=OJ2QRaPE; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1758759414;
	bh=trv/5zES0J71ogwwSlHNmpRE442auLyV/o1fTLjOtsY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=OJ2QRaPE5M6I7OP/H1j/PrTVgCrSMP8UrZbzVbJyJ9se212oYGTasKT/W0nJ7I+XH
	 ufKTD795DRI0fcQbAbG4Akd1jFQhFgIBgbF9Hsd9dw62X2HbwkoHeOTNow7OPwDWHO
	 01TvqkRQaD37ozssgLvRxP2BAueimrUnliWp0A5eAXcAgpoXodP0Uz993+ElhG/G5j
	 hZb7lX1kvo7ItL6eQKyReGgHb3fIB4nnpYY5Psj6Olq3TMKiyomvU1KqwmUNxQA2bK
	 N6lSo2VEHUf2xwIN6720wRPNbNRpW4oVU/TXB1hs2vZgfs+iZTeHf20qDw0vajdGqj
	 k3l0y0U2BxUNg==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 55C40738DF;
	Thu, 25 Sep 2025 08:16:52 +0800 (AWST)
Message-ID: <090d0e196fd0f814b5385f2c6e47e5196f0be649.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 0/2] Add Meta (Facebook) Yosemite5 BMC (AST2600)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>,  Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Date: Thu, 25 Sep 2025 09:46:51 +0930
In-Reply-To: <CAL_Jsq+zBK1CBJX0XcaqaYeOPUhoRE-nMeYvkTNwQovJ+dakGg@mail.gmail.com>
References: <20250917074812.4042797-1-kevin.tung.openbmc@gmail.com>
	 <9bb9929a-8130-48da-983e-2901a7c3da36@lunn.ch>
	 <CABh9gBew1=hbJvg1Mhg5dE7Lr_Z442_kbBX6zTs_6_C2NRyLbw@mail.gmail.com>
	 <7e6f568da28d7a63738b6ed22b33db3df4c478c9.camel@codeconstruct.com.au>
	 <CABh9gBcoWbXurPo0f9U9+gz8k6gttUvj=NMMDVfgjo5dgaTLSA@mail.gmail.com>
	 <CAL_Jsq+zBK1CBJX0XcaqaYeOPUhoRE-nMeYvkTNwQovJ+dakGg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Kevin,

On Wed, 2025-09-24 at 08:34 -0500, Rob Herring wrote:
> On Wed, Sep 24, 2025 at 8:05=E2=80=AFAM Kevin Tung <kevin.tung.openbmc@gm=
ail.com> wrote:
> > I also checked the work with `make CHECK_DTBS=3Dy
> > aspeed/aspeed-bmc-facebook- yosemite5.dtb`,
> > and the warnings that appear are not related to these patches.
>=20
> Um, they are related because they are warnings for *your* platform.
> You don't care that there are warnings for your platform?

Which is to say, by contributing a DTS that relies on the ASPEED DTSIs
you're now part of the community of people interested in maintaining
support for ASPEED SoCs in the kernel, and it will be appreciated if
you could help improve what we have.

If you could pick a warning or two from the DTSIs and contribute
changes to address them that'd be great, as this improves the situation
for everyone.

Andrew

