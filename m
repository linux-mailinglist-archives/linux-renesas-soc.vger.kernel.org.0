Return-Path: <linux-renesas-soc+bounces-21297-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 114D2B42718
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 18:41:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81F941BC2E13
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 16:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD54230100F;
	Wed,  3 Sep 2025 16:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hZOZ8YC6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8883229B77C;
	Wed,  3 Sep 2025 16:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756917659; cv=none; b=XwEs9JhzpDNUE8STZr6j/yCt+n7SYq6bs+nE0l9/FSDBZgvvu2pX4VkxKrolU8zqqXbL7Ukjhrfxz/Mre9Cm2+64wCeL6Wye++6SB+ekZhje6+Q/7+QhCN4yo+JSgrqOJjX1wLhjgo7Kd81Vh4W1bHjiwETqK2E3NmMwkG91Ee4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756917659; c=relaxed/simple;
	bh=SsiclISk443zkOK/H3wMBLBs3D4jxyQEPB6xGixEaKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LL/Wxzq7bmrygSVwyO/P/BFBTp+zOy4+Dv77R/LPKJNoGQ05vlXfpNiKAWzfUFlxhDJbx5IRvo7uITrFpHoCZw57VTGMJMgjxV5ys3s8sVFkMCTSkNlshEnRmsRdnFx5p11NfTvBDvCE1j1B7kqsuDLteGmF694c3UAETtGGGJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hZOZ8YC6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A0BC4CEE7;
	Wed,  3 Sep 2025 16:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756917658;
	bh=SsiclISk443zkOK/H3wMBLBs3D4jxyQEPB6xGixEaKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hZOZ8YC6UQdFrcZMTGlBg7kafdrpx+RnTT8cCfWGSESuJ8j4KdS0rbRM+1MCroxyU
	 Z4pooXVOYQ8SHc0uWLKMQBmNq/Pr6E3VF+1zWS/bdtgxEidW2zi1wzC6/DSqrtNHKl
	 5W9c4/IDSCOJ5fPusqW3HNNq1GdDRy/MjIFfFNIxzfDrWbdy8C36fkTDsQPSHYqXBD
	 X7864DmEJ9Pq6D3WHYk9yxwcIGZEJyd4xh+EUuyrYS/h6Ivq732V22jN+9or3bvJ6F
	 3T8eahvr8M7uHRyKBnNUxggnNLoE2mBbIupVTvjsIdzF2EWQZm/3Db4Z4127t0lEfw
	 6SERT7dpGm/fQ==
Date: Wed, 3 Sep 2025 11:40:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Matthew Gerlach <matthew.gerlach@altera.com>, netdev@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-kernel@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: net: altr,socfpga-stmmac: Constrain
 interrupts
Message-ID: <175691765626.2450401.13914030815174267647.robh@kernel.org>
References: <20250902154051.263156-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902154051.263156-3-krzysztof.kozlowski@linaro.org>


On Tue, 02 Sep 2025 17:40:52 +0200, Krzysztof Kozlowski wrote:
> STMMAC on SoCFPGA uses exactly one interrupt in in-kernel DTS and common
> snps,dwmac.yaml binding is flexible, so define precise constraint for
> this device.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Minor typo in commit msg.
> ---
>  .../devicetree/bindings/net/altr,socfpga-stmmac.yaml       | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


