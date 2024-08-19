Return-Path: <linux-renesas-soc+bounces-7919-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3699571E6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 19:17:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 611141C232B8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 17:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD3218950C;
	Mon, 19 Aug 2024 17:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OC+U2BTl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A13188010;
	Mon, 19 Aug 2024 17:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724087707; cv=none; b=kSt5OI6dHU1Ujh7ilUVIk/yDZQt/h2628g2DgjEz5fC0w4xrib+QSoYK7H/SO0v0nS1AAb/LvTp4qdhn7Qh15OdFNk3cLELzhwe0G1XRLH2Ig+4SSesNzev7gTdi+OlHLSh0zKISeCSAXL1vanZ50jzOEqJ5j8UkOCLt+tta5dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724087707; c=relaxed/simple;
	bh=OE/RHkNYDMlFrxPN4ocnZguUrifbzdwI4ehlWTxsrR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f52/2PcA9WVX9isZ07YGbtVS6k0nIcfFLDpakJAbGWLG7TORlrQYD57YTf6h0f/2HU6jgIL35DcbKrWrHBzntOBH74MVhxQJGZTu93wWhqDcu5DpX6grVYNHIyHhNvdNS+7InN6fv4UbGE/28XE+p5monzc8XSVAG3G5JqNh9No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OC+U2BTl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD85C32782;
	Mon, 19 Aug 2024 17:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724087707;
	bh=OE/RHkNYDMlFrxPN4ocnZguUrifbzdwI4ehlWTxsrR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OC+U2BTlj2oEcHBpjVJY4h1rRr5Wd0NGSzTcMVxjtIqe+BXa7bbGZ8TcLx/UKA3I+
	 dofXLiCOsl3QuvEmQa2It6cIM8FrFRthx+2gybF3ZmNOD4cRITrchGPfgJVHiTYCdJ
	 mRs8cWl5gDJS8a/rY3W6d0ba3+dTYHqpRoJUPITODA8OQv3Wt97hURYw1ad+OR0qZx
	 5nlzGpAZLYfwxBN/wTULm+5NBCCDiUvbANzmHLZCZN0ibYaHLR+W4UBbZm3VkDgNl3
	 R623TEP7NclNwMAxGCYk1XTWwC5LE5QXekd8X5oDyOiQZRNr2nWrapCVn1JZp6Iv9b
	 kNRvwGxrput+g==
Date: Mon, 19 Aug 2024 11:15:05 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	"David S. Miller" <davem@davemloft.net>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Eric Dumazet <edumazet@google.com>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: mediatek,net: narrow
 interrupts per variants
Message-ID: <172408770465.1699134.17451371912936634019.robh@kernel.org>
References: <20240818172905.121829-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240818172905.121829-1-krzysztof.kozlowski@linaro.org>


On Sun, 18 Aug 2024 19:29:02 +0200, Krzysztof Kozlowski wrote:
> Each variable-length property like interrupts must have fixed
> constraints on number of items for given variant in binding.  The
> clauses in "if:then:" block should define both limits: upper and lower.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/net/mediatek,net.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


