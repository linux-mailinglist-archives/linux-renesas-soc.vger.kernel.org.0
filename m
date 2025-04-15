Return-Path: <linux-renesas-soc+bounces-16038-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6F2A8AAEC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 00:10:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A14B7A2DE3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 22:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB4CD27466E;
	Tue, 15 Apr 2025 22:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nrNpJFHq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9312566CC;
	Tue, 15 Apr 2025 22:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744754987; cv=none; b=HB43KVTtWCOHeP/lkHm8jhCY3UohAmuKw7LZBcHytNHJ2rXCWuZs/xGlcSobqeKUqjihgE8LXOZKtDR1h2PiBprMw/vsJuQAqWX6wZ35hBf8ytrM8WIhg9WcMW8u1vOq/ViOxai96A5EcLf4mq14XxzRpKnqJ50SB726TVurzPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744754987; c=relaxed/simple;
	bh=vepstU+VeqHh6+qowybjXxUtB+33ICGyCl2PjWvB54k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZMnWcgTVkpjp5qb3nBGCVUzFUL9BwslFkI0J606ubrwHa7tgSOrSjgFa1Q8jXB71MFhE34Ynzm+pVGS+hwwdiZmkTrkH3McoW8IWlg+vo+s8q4ojhGyo5RweHuGfngC2O5orEONzDlRcfi+pxeNURDizFt7dH7G7TsveCxZCu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nrNpJFHq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F269C4CEE7;
	Tue, 15 Apr 2025 22:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744754985;
	bh=vepstU+VeqHh6+qowybjXxUtB+33ICGyCl2PjWvB54k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nrNpJFHqxnf7NuMjQ7A2rLJfEiZp/qUE+pTwIFP9WvmsQymAs3iOysdoMzq07esey
	 ECQ63f0Z6p2cXP3+v+h9RxOivgatgmqqctGsDIev9rNjbrJYBIRZt+7slWSQq/1BEW
	 3q0klbefSoZdlKSrBMlY+wudQDsYkjSC3K73bRINAl0oq0jBpi/SB5edCi2zeRT3ch
	 anK6KLLg9I2iKA295/swHvIGlgZ4qv3JWQOFYq8Vl52q1AOzLpfHP7VlYABQh2U0tW
	 CdELjZnRqxCGU4EcsWMKe3l/dLq2Q0LeQacAYkmIDdoHll0b6WklFK65X1DJMwBGwL
	 +Ksg5n09OYcxg==
Date: Tue, 15 Apr 2025 17:09:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	linux-phy@lists.infradead.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Vinod Koul <vkoul@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: phy: renesas,usb2-phy: Document
 RZ/V2H(P) SoC
Message-ID: <174475498350.920532.9822490271876719178.robh@kernel.org>
References: <20250414145729.343133-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250414145729.343133-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414145729.343133-3-prabhakar.mahadev-lad.rj@bp.renesas.com>


On Mon, 14 Apr 2025 15:57:27 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Document USB2.0 phy bindings for RZ/V2H(P) ("R9A09gG57") SoC.
> 
> RZ/V2H(P) USB2.0 phy is similar to one found on the RZ/G2L SoC, but it
> needs additional configuration to be done as compared RZ/G2L USB2.0 phy.
> To handle this difference a SoC specific compat string is added for
> RZ/V2H(P) SoC.
> 
> Like the RZ/G2L SoC, the RZ/V2H(P) USB2.0 PHY requires the `resets`
> property and has two clocks.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


