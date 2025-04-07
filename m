Return-Path: <linux-renesas-soc+bounces-15515-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C99FBA7E8FF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 19:52:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B82E219E0730
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 17:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA2B21B9F7;
	Mon,  7 Apr 2025 17:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rU9Zo7xu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5A31A3147;
	Mon,  7 Apr 2025 17:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744047889; cv=none; b=r1Mg21ZGrlPdLtfNZer318OCZhMhqT8V+K6al4kcy5KL2SxQcjbtFyZfS+srufVhKNpMhSmmJdnrcPa2dMpbeZPq9Pqra+euboDKTqqVfc6f3WPrUh2vv8DSi/n1eB76JvuA0dxrRyactQEIuALvwVF2x+/rVfO64pncK7sTGsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744047889; c=relaxed/simple;
	bh=xxHjDP+NyHgWQ2jb/v9uMp+G1hNt7hQcpSlTqvAxzE4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EDxKt91l9rjak8EbXmKRpLozf+geUtvkDCFQnLYdOEulrmzEIlUd63ZfARLvpNOyCmMb/cm7ytAvhUCGzypIgygSmIbqir8PZdwjDbY+nqRkc0rabWQSbevIwyyoGPuYuibKm8qpT6e4Cwmrh2pRYXt7rwRtlpPEAvzQdjOvbJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rU9Zo7xu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C23C4CEDD;
	Mon,  7 Apr 2025 17:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744047889;
	bh=xxHjDP+NyHgWQ2jb/v9uMp+G1hNt7hQcpSlTqvAxzE4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rU9Zo7xuCU1GBu8ICWZkzwDdIy9JRjkUCAis5IdHL5kK6hev+J2xF9tbUUYJfMJzb
	 EezmqeGNreOqRpIz+xYQ6Ah4ZhPosPCbLjcb5F0zDUWVrY2kR+nz8l8pEemNiDZc+8
	 V9I7LLlItTJfExgcXSmsuI1zV+QRxtU6EZfGYOM3+8OEsL7tzsTwvJXyqQiYG8jMKk
	 I2vTcXm5in4biyuNSWi01hMrjmxQXGcVboly/Ryl2y2I6l4CCacxKAwN31+FuX+8mi
	 J8nqdG7l4ohdEmGdQg5fiWLIJcHpXqYfchMmeCmhzxo7RGfZSmPjNDw26rzep1J/UQ
	 Bs9i3oQ1J8LMA==
Date: Mon, 7 Apr 2025 10:44:47 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
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
Message-ID: <20250407104447.072449cd@kernel.org>
In-Reply-To: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  7 Apr 2025 13:03:14 +0100 Prabhakar wrote:
> This patch series adds support for the GBETH (Gigabit Ethernet) glue layer
> driver for the Renesas RZ/V2H(P) SoC. The GBETH IP is integrated with
> the Synopsys DesignWare MAC (version 5.20). The changes include updating
> the device tree bindings, documenting the GBETH bindings, and adding the
> DWMAC glue layer for the Renesas GBETH.

This was posted prior to the "net-next is OPEN" announcement:
https://lore.kernel.org/all/20250407055403.7a8f40df@kernel.org/

In the interest of fairness towards those who correctly wait 
for the tree to be open I will ask you to repost this again,
in a couple of days.

Thanks!
-- 
pw-bot: defer

