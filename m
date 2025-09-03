Return-Path: <linux-renesas-soc+bounces-21298-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABD5B42724
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 18:43:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C525169EF0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 16:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65CEF30504B;
	Wed,  3 Sep 2025 16:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bq91ZOLs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B73E2BCF6A;
	Wed,  3 Sep 2025 16:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756917807; cv=none; b=E3e1n3ToWfPAE0vqSHEZvhbqmdEaTrIJC1KdJQnD/raqu1b0l9tc/EONm21gplcnU3su7g4/ITyvRnBH3VtycoHs4M5vf0O6Sqny5MevWIwrUakTh1OvsIOA9vZaHFS4+uVGtheWOe6Zo6sxsPitkiqgqC2ZWKF6ZQEb10XGvMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756917807; c=relaxed/simple;
	bh=AkA4dzUeMeAnqy5b40dZ57UDlURr08Yuge2wOJ7h2Lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YGg3eLayNxAC+DZqt6N2RVuiqk9kI9ics/a0yxEL89P1NLEsC/Ad3GnR5FCfiQbre8kAcJ3w+2Fh8FSW6xkgFPXhywARSqklsZd1jYhj/zNLIxttP3YbboPvQwMV67rlkNp6AO45awd7RrHl9OpWbF6FTWApQv5tbB96P3DqdTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bq91ZOLs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F85BC4CEE7;
	Wed,  3 Sep 2025 16:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756917806;
	bh=AkA4dzUeMeAnqy5b40dZ57UDlURr08Yuge2wOJ7h2Lo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bq91ZOLsPXtnywSL0n01fUFf3HGbluHxTTlrKq4YOWy+oSiYHQUb8lH9kDHubCn3r
	 y5gNxmYsAiIK3CH9q0yk0xu01AsEU/Z2pZd5Q/1aFa8aeKR+nrpXtcabeqzr+D502y
	 rByVLKZblyDw7pQOQ7L38CDLNJ++FfwiPvddveK6RIHLPtmnm3Y1Wug2f+9WiW/ryS
	 jhCmrok2BLBGvhmpUTx4plIHYBrLYWVV8nbwyruYul4jDYoHnYAd/QMJLYv5/anwR1
	 EctRN/T6egnHSW3kKkCMoImAJ772lynQ1mtEHt+K++Jlv0y7ubSfJw2lX3ZS5RUdY1
	 OFkdPx/DBKZzA==
Date: Wed, 3 Sep 2025 11:43:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	Jakub Kicinski <kuba@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	Eric Dumazet <edumazet@google.com>, linux-kernel@vger.kernel.org,
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 2/2] dt-bindings: net: renesas,rzn1-gmac: Constrain
 interrupts
Message-ID: <175691780521.2465839.12589280217452124752.robh@kernel.org>
References: <20250902154051.263156-3-krzysztof.kozlowski@linaro.org>
 <20250902154051.263156-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902154051.263156-4-krzysztof.kozlowski@linaro.org>


On Tue, 02 Sep 2025 17:40:53 +0200, Krzysztof Kozlowski wrote:
> Renesas RZN1 GMAC uses three interrupts in in-kernel DTS and common
> snps,dwmac.yaml binding is flexible, so define precise constraint for
> this device.
> 
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Minor typo in commit msg.
> 2. one->three interrupts in commit msg
> 3. Rb tag
> ---
>  .../devicetree/bindings/net/renesas,rzn1-gmac.yaml       | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


