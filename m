Return-Path: <linux-renesas-soc+bounces-26310-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 782A1CF533E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 05 Jan 2026 19:17:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9CCE311B7E1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jan 2026 18:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD11933EAE6;
	Mon,  5 Jan 2026 18:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="TsAelbYn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1419032145B;
	Mon,  5 Jan 2026 18:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767636805; cv=none; b=fG6HLPH9LXoRdmo4zt7YBFAUHUVIjomJkPOBVBGpG7e2wdGxN7yfQuCYlaCOiodNeQPWvxeJ43huK2HLaSZoRTIEqxvxlST2vo+e+dYpJtt8UERQLqEW8Nq8wkk9NGOADWDvw/nLTSkuXMue3vPoFsC1Z9w7vz+ReDmQMZ+qCAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767636805; c=relaxed/simple;
	bh=lELGCe6zWDdgrkZ42gRUvTf54SnUdYF7s5/5K93bY3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HHenbB/NtgWyVY6jhgCXf0YWnE6jiB7RbOlNcRyOWL49TaLIs//MZcN+x0fNX02h6WGkAtV7zt59B8/HiXQALhkfrOEj40TP8jtUq4vVO1F7Ae1NT/BvUCBt42YymRnvbuyA8pP1jo+jBbIVGWmcV48qWNLuTvK50/XauWDPs3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=TsAelbYn; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dlMqN0VM4z9t0J;
	Mon,  5 Jan 2026 19:13:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767636800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qCMOp1uSSjiusbPyZHPXfp34jTJvXcna7CZDIpBdvmg=;
	b=TsAelbYn+3JjsTUrqsvLMfeoItA/WGqEd2lREeonf93hQ89eJ95AhG1c62XnVIDYkK+vXl
	QzDBWDGsppXj1GteYAVtwJJH3/uWC4W3K1hdIqKDfYK/ozTg68UJliaLptw1zB0p27bquL
	ZjYNZcs7E7yU/Kt6QA9csTFf5RTn5KiqVNQogdShJ1NwxK6aB5ODfwR2c7Jlb8pUMx18yY
	Vjlo/sfyKngik67KwzQyHw5ITtyTyyA+zZSCWFfZcNDpTRCP60TdMfVjrruLjFkyH+XojY
	oPNTWyFj6i2SVoHj02M+9IV0gSghq6B+xXmm4PnBg2L2gmNK/PYaeHwpmIBwuw==
Message-ID: <f0fdbe83-a06a-430d-b41b-7f63ad31509e@mailbox.org>
Date: Mon, 5 Jan 2026 19:13:16 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 01/11] dt-bindings: phy: renesas: usb3-phy: add r8a77990
 support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
References: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
 <20260101203938.159161-2-marek.vasut+renesas@mailbox.org>
 <20260105-beneficial-seal-of-swiftness-1c5eeb@quoll>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260105-beneficial-seal-of-swiftness-1c5eeb@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: a8iay7694du7guekapi7cikz73b85xu7
X-MBO-RS-ID: ecc22de2e5196f6c24d

On 1/5/26 9:31 AM, Krzysztof Kozlowski wrote:
> On Thu, Jan 01, 2026 at 09:35:48PM +0100, Marek Vasut wrote:
>> This patch adds support for r8a77990 (R-Car E3).
> 
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94
> 
> Also, you cannot add support in bindings. You either document hardware
> or you add bindings for or simply you add hardware.

I'll reword it this way for V2, I hope this works ?

"
dt-bindings: phy: renesas: usb3-phy: Document R-Car E3 R8A77990 USB 3.0 PHY

Document USB 3.0 PHY present in Renesas R-Car E3 R8A77990 .
The PHY is compatible with R-Car H3/M3-W/M3-N PHY.
"

