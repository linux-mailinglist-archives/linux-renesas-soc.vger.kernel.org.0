Return-Path: <linux-renesas-soc+bounces-17117-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BB1AB7978
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 01:38:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40D274C5722
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 23:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AC6D224882;
	Wed, 14 May 2025 23:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VEJsKmD7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD69F20F079;
	Wed, 14 May 2025 23:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747265892; cv=none; b=TZSuHAJ56fYo6ZkMbCDUSvnu8NELIKaZGlcdWaEaU94dQqzVBUFfsH8NVnr2N65g1N60TlPiPpV2KbO+9q2yWt+JAi4SCPRy1TWIV3u5QD64EvWFxi5HI58t3JZef2PMWo7NlZvKvMDaPcaDtktHqiSM4/x/se6AS21SHKuTS34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747265892; c=relaxed/simple;
	bh=fMgN8H20j6fjGmOB6Do0od3pTsVMS4dLUjRsiHrNSrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZuX+KzRKxWrI2UfFAYpQuTH763pBsByjLR6VKyg8DHDrIEv5kQj2nR9WdxZ1qkxBR7pUKbLO+szluoJVQxT2aRtUUYR3sUnkaRHMRci8KOFXyuqmNlN/4FE62Hi0UmtBkAoESXB5/UnHPBx9H+va52AJk9Y+EQTu20SGuHfUco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VEJsKmD7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08098C4CEE3;
	Wed, 14 May 2025 23:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747265891;
	bh=fMgN8H20j6fjGmOB6Do0od3pTsVMS4dLUjRsiHrNSrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VEJsKmD74HIr/lzVxqQslVP7sSfUwUHHmnpYsPrqKDje+keTvI/yKSuzqvvi+h356
	 isiu/F5UwV1OVkVvjeBUsAzujCuoIjsjOqDHXUdjLctWKg+B1F+YEM7FqrRCQCS9Sk
	 BF56NrdnH4CVjMYQhZ2CakuI/TVXJ7UfHYJxkNlv8DIR6UxyTd4WuOi6UGNEWCVwf4
	 IQ1e1Si8olN/tAJ8pzBr/3v56lq4ZJIT0/76eF4tcFBudDrbL40HKM6hBgvwo06/p5
	 9DrZGTmkCmwL4obLTQTEHaGMWNxwGFaBh9LUTPrWkU/moknZMoA9ELLhH1AyyUCJrq
	 LFuH5T5HILOZw==
Date: Wed, 14 May 2025 18:38:09 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Paolo Abeni <pabeni@redhat.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: net: snps,dwmac: Align mdio node in example
 with bindings
Message-ID: <174726588872.3257951.8711420031182949720.robh@kernel.org>
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


On Tue, 13 May 2025 09:33:56 +0200, Geert Uytterhoeven wrote:
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
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


