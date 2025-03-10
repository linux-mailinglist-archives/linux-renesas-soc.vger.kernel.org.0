Return-Path: <linux-renesas-soc+bounces-14233-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53557A5A643
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 22:31:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 062743A7E5F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 21:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D0111DE3A8;
	Mon, 10 Mar 2025 21:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cbG9E9tp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FF41DFFD;
	Mon, 10 Mar 2025 21:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741642298; cv=none; b=WhvslzuehoM65UGW9k8VQBI0a9rikTYf7JOmhMeddnmNGOU5YZg38gD55GUcJV5Ex9bx7BRJO4u4kshDkTmiP2vsauz6E23GNiryGmN6sLy+d3LKEaQgzX4gKIwzQf9MdaKpU1GdRGTlPaaD6AIeyDq2BPCAGqKKnLX7DgusS10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741642298; c=relaxed/simple;
	bh=GyvmZKSkYFeoRrE7nWpBBvNJolQlx/1JVvsWmw0SGAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fkqW4Q5dAHnNrretoP1PMbTOHzYr3o+LC+8+Rf2AANy4bYslbthHPW6ePDLtjaq8Dphg/eSG8LR/Fo8RDvVRcbowd92+UCPkQoHq5FyXKT0YtjkdNG+INCnf5G6ghdreRAU42ZtOctavCmSLmeTn2fKjvVr9nGWNSA6osjmJiXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cbG9E9tp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 382BEC4CEEA;
	Mon, 10 Mar 2025 21:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741642297;
	bh=GyvmZKSkYFeoRrE7nWpBBvNJolQlx/1JVvsWmw0SGAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cbG9E9tpyKG17zT9aRNqSSDoMJ+TAkA8KrCGGbaRJ+MkVn4kklYE4Hzvs2YMYrDJ3
	 ukfncOH0mSjgu5XBm+PZnVgshHfAznY+3Uk9B5QEpXImpGxK0dofi9B5KPAbC9tAWr
	 R2wD/mSgsVsUWAMtyt1KKtYCYbLBEEq+B/RAB3vWfdSl/ZVpHEwbfN8fUwopql7l1b
	 HTBmZXlKEomMqDlkmqAQO16WLlVQJlVmgfCZSJAKjbtCqv8NWVgfkzpu5+nm0xYOCe
	 EqsqKo75i2h6jSmoMeLoVjca0VWRBMwcw/s8TrPhCHYG+eLKNjEaomAINjrCE+v7/u
	 19f0nl5Iit8EQ==
Date: Mon, 10 Mar 2025 16:31:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: devicetree@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-renesas-soc@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-kernel@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jose Abreu <joabreu@synopsys.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH net-next v2 2/3] dt-bindings: net: Document support for
 Renesas RZ/V2H(P) GBETH
Message-ID: <174164229502.924583.17160313707373753465.robh@kernel.org>
References: <20250308200921.1089980-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250308200921.1089980-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250308200921.1089980-3-prabhakar.mahadev-lad.rj@bp.renesas.com>


On Sat, 08 Mar 2025 20:09:20 +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> GBETH IP on the Renesas RZ/V2H(P) SoC is integrated with Synopsys
> DesignWare MAC (version 5.20). Document the device tree bindings for
> the GBETH glue layer.
> 
> Generic compatible string 'renesas,rzv2h-gbeth' is added since this
> module is identical on both the RZ/V2H(P) and RZ/G3E SoCs.
> 
> The Rx/Tx clocks supplied for GBETH on the RZ/V2H(P) SoC is depicted
> below:
> 
>                       Rx / Tx
> -------+------------- on / off -------
>        |
>        |            Rx-180 / Tx-180
>        +---- not ---- on / off -------
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - Updated commit description
> - Updated interrupts description for clarity
> - Updated interrupt-names for clarity
> - Updated example node
> ---
>  .../bindings/net/renesas,r9a09g057-gbeth.yaml | 213 ++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>  2 files changed, 214 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


