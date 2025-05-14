Return-Path: <linux-renesas-soc+bounces-17100-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC85AB6BBD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 14:48:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9EA87B3BB7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 12:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A372750F4;
	Wed, 14 May 2025 12:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d2HXVbNd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA34225795;
	Wed, 14 May 2025 12:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747226908; cv=none; b=XCLEKw1FJc0+oAfgw3iqwm45/Ko62mWNERpLy9AjtxCU7TF6WXuipEM33FO5w+UmBo9wrM4W+zuMwnHGP7HMXENKFr5KHwoGKeDrAKu3K0P2mICeTbddKMMID610ESuIRMwAIG5vLIUOLJRTY8qNRriGgaVi7QnOLiZ3FEtNz3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747226908; c=relaxed/simple;
	bh=JvckJKmu5BRwtj6wUulWClHYn5tMXs/RVyyPpWAuGVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pk5wSevLHAExMud5dZKX3VReoEH+MIST0niKTALEdIdkN8FtoyrToijrRxk/G53jObjA9+vIyDlebkjmo7scNlKR7jBZSIJAmHysJPTXM0lycVWCBwkhliTBTVDLDN6z7y8V/Sfc2BATJbQYtogp03DG2mEYqezqjSvxX5Mxr+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d2HXVbNd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA1BC4CEE9;
	Wed, 14 May 2025 12:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747226908;
	bh=JvckJKmu5BRwtj6wUulWClHYn5tMXs/RVyyPpWAuGVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d2HXVbNdDY24IvOD/CoiYHpsEYP1SvQVtlymzRnF7Ay5M2BA92tWZZBU5+beupB7y
	 zs7YeMWlLcrJcl1e5zLjALjkmLBy6vIk5LiXWNhvL55l7lerlt9KV6p0e0mzGxkf0h
	 GFacBAtgSgGG/FGFzzH/UN9nAVh5BMxBQXFPA6GxYVhsRLCMbXole9NxiiWNlRVrGl
	 q3ARmhDCo7BXWLAY0p/c5QR2Y9JIa0d9WuZU20zHBGBdlq6eZ4Yu16yJDtQGh+Kdj7
	 PKDyjm418VqlYpnBisQ368GwV21DibEK1T+26YPvy3LT5pWZa3gu00W8wYNxE08ZVg
	 GEqrQiPT6MHzQ==
Date: Wed, 14 May 2025 13:48:23 +0100
From: Simon Horman <horms@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: net: snps,dwmac: Align mdio node in example
 with bindings
Message-ID: <20250514124823.GL3339421@horms.kernel.org>
References: <308d72c2fe8e575e6e137b99743329c2d53eceea.1747121550.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <308d72c2fe8e575e6e137b99743329c2d53eceea.1747121550.git.geert+renesas@glider.be>

On Tue, May 13, 2025 at 09:33:56AM +0200, Geert Uytterhoeven wrote:
> According to the bindings, the MDIO subnode should be called "mdio".
> Update the example to match this.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> For dwc-qos-ethernet-4.10, the Linux driver insists on "mdio".
> For other devices, the Linux driver does not seem to care, and just
> looks for subnodes that are compatible with "snps,dwmac-mdio":
> https://elixir.bootlin.com/linux/v6.14.6/source/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c#L302
> 
> Lots of DTS files are using "mdio0" (copied from the example?).

Reviewed-by: Simon Horman <horms@kernel.org>


