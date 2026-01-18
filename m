Return-Path: <linux-renesas-soc+bounces-26976-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 980DBD3959E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Jan 2026 14:55:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A1E83009F90
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Jan 2026 13:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B38D332EA4;
	Sun, 18 Jan 2026 13:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="B/wLK2Ci"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5703321DC;
	Sun, 18 Jan 2026 13:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768744504; cv=none; b=nba84Wrw0AYot83rFghx7fSSTv6UiVfQnHyKA4NcQFYD4fo5X5x5hCKkhw4y4tx/hTxzgRLnIyZn9fuGxRcV3sbs31ldmDdh4fJ8sPs9TM9z6qqa85aqKoRPRe2r6HZQAhpprwXJ5pkouJgoh+WnlAkwFaVnLLsNd4oad6yu/ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768744504; c=relaxed/simple;
	bh=Pz1fvAdA/BXOQvWaaEr4o/d2vKuS1QcdUUSk6kNPU40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XVUAoHOV4ll1YTUEWap5pZH4KQA/xLKdWfDUk/u5DQ4NAlfU0bGasD4EC5Ci740s8awzRQ3DqGi0oKHHXk3QGysdsWn0NIJgHTzpfDoV/8qMw0ljgkVT/ad/kJnXnIGixu7OrGBrbF0Try5S268S/hyLBmbUycd0v2eM7h7m96U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=B/wLK2Ci; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dvFTC4SJ6z9tdy;
	Sun, 18 Jan 2026 14:54:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768744496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w74ArzlzjcPgIlfF59OMXGcYRU6Ba0ymJHHl+heNzkI=;
	b=B/wLK2CiI0lKZqJ4DWQ55I6ThcIUjD3f710b7R6jJ3FtMesJqMEj9CmXpw7cPrix3LVA0r
	mWbGEDWKhGEE4hGDc+szxP3zZcNHBS93AIQKCpWDN6IuVdaZlYw4BmlbziacetPXldc1Uj
	589yyJOpxCSbeBRTrbBXYFY0stF94eFl/hKMisjFVnW+6njpxsxK72Ry0t40q5uVZTJpq8
	QtYi6wwnnuWpISoBFXo1UhdnP0g9k0OChC1SKCOGoM7qLtQsyrAEH7XlM8ucuI6S3tyt3m
	FbjU2voER87RPx10ZYTaA2ZDgB3n/zTmRaQkZUNsB9AQOvCqxZ5dSuhS5jQJWg==
Message-ID: <2b6f19f3-aaf9-4fb7-bef7-f38e19f94351@mailbox.org>
Date: Sun, 18 Jan 2026 14:54:53 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 00/11] Describe PCIe/USB3.0 clock generator on R-Car Gen3
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
References: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVyQpOBT+Ho+mXY07fndFN9bKJdaaWGn91WOFnnYErLyg@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdVyQpOBT+Ho+mXY07fndFN9bKJdaaWGn91WOFnnYErLyg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 1cc39rfaycx644jqxqkndht8u7hjy46g
X-MBO-RS-ID: f7f2d39d9d798953f4c

On 1/13/26 3:19 PM, Geert Uytterhoeven wrote:

Hello Geert,

> I do not know what is the actual issue.  Adding debug prints to
> rs9_suspend() and rs9_resume() shows these functions are not called,
> while adding 'status = "disabled"' to the renesas,9fgv0841 clock node
> in arch/arm64/boot/dts/renesas/salvator-common.dtsi does fix the issue.
> 
> Perhaps you have pending patches for the rs9 or PCIe drivers?
> Do you have a clue?
I believe this one should address the problem:

[PATCH] clk: rs9: Reserve 8 struct clk_hw slots for for 9FGV0841

https://lore.kernel.org/linux-clk/20260118025756.96377-1-marek.vasut+renesas@mailbox.org/

