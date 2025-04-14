Return-Path: <linux-renesas-soc+bounces-15936-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C4DA88894
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 18:29:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EE723B305E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 16:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D888284682;
	Mon, 14 Apr 2025 16:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sK929LWN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5B0279903;
	Mon, 14 Apr 2025 16:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744648126; cv=none; b=X3dS0ZVXpvQuyaoxrLoP4L6Fmc9Ubpb0D/WRhgV0xYuBgIlOYw43HyNvRMoOod1hbOukGPYWFRWEttyBG2Su+AHzqOedsZHIM6F4Wm5uSLARzyxSe5U0cCjE93OWK3x3JkLVMxOCwKkTBsuIGKCYNWDykwXhLuQYUFpTKdrcQSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744648126; c=relaxed/simple;
	bh=P/fa8u8mypyH0+6vdYrtZjJEaFzYh19+DjXazRmCLPg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZrJI3DAnTPTYoTrhSbqUdGvh31oYVxQ5S3D2j2SgdmUTj4uqeM4RXqV2HpKlQdJ0qoj7Zu4M+PwBaK3Qja1LmBCASB/oc8yLsvMzGWwz4awrOG7ARdCFK/11QWBB3SX/Do1XlEwBdAPkuOKSCX5UoXMP7SYRX3qkdLy9j167kf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sK929LWN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C61C4CEEB;
	Mon, 14 Apr 2025 16:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744648126;
	bh=P/fa8u8mypyH0+6vdYrtZjJEaFzYh19+DjXazRmCLPg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sK929LWNbvs845GbWY+rfc/M02ZlGNFxZwVDINnN5mSSEZOVzRx5BbM9eiPNLwD8W
	 VChZqkmLlSEFvE002cJO/oAZil7ruyP3ou8ywNsmPTUr9U+KvFoTT7byucRGAgYYlJ
	 3EzZvxi/TGFTic4AqyIL3GIrzC4L/P7jfKTEhAJyXKi2cTafz1/KXrppnOyyvRrfVF
	 NeqVXmnJNA9Gf9rxd8wW/13nU5uM4BDkclidQoiC4i2sLxuxrq54NrpHxfodDdyb/I
	 LCNHQaUuLSSDP4ke82MUU/9YDqui7lhAO1Bv2W3wzoUoHmTnpHKQmc4DAwuE2FIhPw
	 9wZ39T/yFzK9A==
Date: Mon, 14 Apr 2025 09:28:44 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, "Russell
 King (Oracle)" <rmk+kernel@armlinux.org.uk>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v5 0/3] Add GBETH glue layer driver for Renesas
 RZ/V2H(P) SoC
Message-ID: <20250414092844.77999958@kernel.org>
In-Reply-To: <CA+V-a8uqkG+u_ZXztPe7R0BNV6BA46KgGRHRW-G3axBt566pEQ@mail.gmail.com>
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
	<20250407104447.072449cd@kernel.org>
	<CA+V-a8uqkG+u_ZXztPe7R0BNV6BA46KgGRHRW-G3axBt566pEQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Apr 2025 09:52:03 +0100 Lad, Prabhakar wrote:
> > On Mon,  7 Apr 2025 13:03:14 +0100 Prabhakar wrote:  
> > > This patch series adds support for the GBETH (Gigabit Ethernet) glue layer
> > > driver for the Renesas RZ/V2H(P) SoC. The GBETH IP is integrated with
> > > the Synopsys DesignWare MAC (version 5.20). The changes include updating
> > > the device tree bindings, documenting the GBETH bindings, and adding the
> > > DWMAC glue layer for the Renesas GBETH.  
> >
> > This was posted prior to the "net-next is OPEN" announcement:
> > https://lore.kernel.org/all/20250407055403.7a8f40df@kernel.org/
> >
> > In the interest of fairness towards those who correctly wait
> > for the tree to be open I will ask you to repost this again,
> > in a couple of days.
> >  
> Are you ok for me to now respin this series?

yessir

