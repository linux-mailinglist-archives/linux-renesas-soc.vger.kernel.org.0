Return-Path: <linux-renesas-soc+bounces-25640-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6B0CABB79
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Dec 2025 02:25:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C5A03007FC3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Dec 2025 01:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B731F7569;
	Mon,  8 Dec 2025 01:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="upv/2HJq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69391F12F8;
	Mon,  8 Dec 2025 01:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765157110; cv=none; b=IY5sAoRJ6+VBF9QOdJvsm4pKkOtaCUF9PncttBhUR2kUFK4EHcAD30NkUWFhrtxryEKOUh12WnGlyIDUqVtujtbPOckh7Si2OD1s4fPZoZ0w9KXJPH7JQgXxriF64K3qV8xgcToNTZGMLyeUS0Dsu0cJHsadM/ULTJqYS+9YGbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765157110; c=relaxed/simple;
	bh=SIUmbkmj39x7+DTGXk4yiFSzm3KeeAhkXRfI0TJm1tQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CT+UYsdWkaptx+rrx+dTS4Vvjiiq9PMDjU02OwwRsFExzTCNziXvEi9Hmt2VY3YRsZG3XD7/LjDLUzOj+DZnRSIbRAghKu0xW2vjXh0Wytz83x1wOw758qFauWAARZp7dastak0OTdZDIy0ChUVKxoWfDDn1TR7n+x9RVD8e9DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=upv/2HJq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C01BC4CEFB;
	Mon,  8 Dec 2025 01:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765157110;
	bh=SIUmbkmj39x7+DTGXk4yiFSzm3KeeAhkXRfI0TJm1tQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=upv/2HJqMvnHSj513L5kQcuG2BDQw5tqvgLdda1Q0H5XBXiLpS7wXJyGXyr6a5yY3
	 bic5eGinc9xietrLwwdlXlvYDGm8SBTrCckbIA6arpuHOi0xPPaRn/dfJZ3Smbu4yU
	 YqsPkChC+e8J0CeU+kb1UwF3XfwODByVt+LtjJlZPOxEwcZbnhKaszMvjuv1Aq0myX
	 Y+RGaoOBN289d2DiHRu2zHhevCNRfBcj7yzF/tgoP4o3gw0uJ8xO3qHoePPm+mPC/+
	 DpeA4RPO4xPH2omL0BQrgiivQXtdsBaYj+5pSQGu3iCq3oc4XBKrii0y7a30ajgJyN
	 T2TDzv6RUgHnQ==
Date: Sun, 7 Dec 2025 19:25:08 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: linux-mmc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Jon Nettleton <jon@solid-run.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: renesas,sdhi: Add mux-states
 property
Message-ID: <176515710765.339992.15158298928196406784.robh@kernel.org>
References: <20251201-rz-sdio-mux-v2-0-bcb581b88dd7@solid-run.com>
 <20251201-rz-sdio-mux-v2-1-bcb581b88dd7@solid-run.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-rz-sdio-mux-v2-1-bcb581b88dd7@solid-run.com>


On Mon, 01 Dec 2025 13:31:10 +0100, Josua Mayer wrote:
> Add mux controller support for when sdio lines are muxed between a host
> and multiple cards.
> 
> There are several devices supporting a choice of eMMC or SD on a single
> board by both dip switch and gpio, e.g. Renesas RZ/G2L SMARC SoM and
> SolidRun RZ/G2L SoM.
> 
> In-tree dts for the Renesas boards currently rely on preprocessor macros
> to hog gpios and define the card.
> 
> By adding mux-states property to sdio controller description, boards can
> correctly describe the mux that already exists in hardware - and drivers
> can coordinate between mux selection and probing for cards.
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


