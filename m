Return-Path: <linux-renesas-soc+bounces-23330-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B48DDBF21A7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 17:29:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A25224F8BEC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 15:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A366266B6C;
	Mon, 20 Oct 2025 15:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="DgsHzTC8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3024266581;
	Mon, 20 Oct 2025 15:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760973937; cv=none; b=ZaJh4cPP/2sKaWXZfF6sqx6YbYBbsv+P2S/nOPjt7UfWwi+z58Zh9F3raCrru5a5O7sYUVYaA7eKVr2l35Z9jXMYYQv/lV8kaMkeaNHoM7qFaMQmMEnqtxAFKndygEm/bENYhwpWzJghRW2qbI1hbDasIZV99bvNyunKwkXXBg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760973937; c=relaxed/simple;
	bh=YIMnYLiXyGoQJdrCsNPRieKK98fVQhstnDhRU3hZ8/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p6oA49Qk3578hvNfOHLt7A7/X7LIsQa8yCN35GOgVhAoLeR6B2DHko20FJ/E92jPpr2ZuF7TIDvt/R0X2x3HiPLyzEEOBYrO7jZAZX5Q50aWthTwRzuRdcTfytc4G5HHFDdDRx7kE7wEOkbmAPP7A3FBGrSzk5P9pP7mL0w3nBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=DgsHzTC8; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cqzlB5141z9spn;
	Mon, 20 Oct 2025 17:25:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760973926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PC4va8ieZUTwiJKFjsYUc7GcnfemHB6ncy9oeGC6/CI=;
	b=DgsHzTC8vUoQttocqBG7Rb3P6fORbPUaL1HS+TClgbD4WCuDuScV1SUv6EeodBiOHdzCov
	ABI9ec3z2KkzHVIUpO29I9NVD+HkLoeyLwfqGKDQErvlvrl35szgbbUWn92JT1LyFblCHI
	+Aiy1I4AGs0lO4CeUsjyFynwV30IsExl7xh6cx0JImy36XG8fsJ94iCUz8URzMc1nu9y2m
	rxD/2CHMHBvgbE6xkw5774ibSJtGA3a37+NiHPYM8iOZxRehpKq8GugWVERhRUR4/ZxrGm
	xmJ30rAd3gNpTz1OoZcy9MzuiS1EtXJk0lwui5e0L5rGl38CqU2zGxwHTBA4uQ==
Message-ID: <2e12fed7-21c0-48bf-94c4-a3d2850a3f0c@mailbox.org>
Date: Mon, 20 Oct 2025 17:25:22 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] dt-bindings: gpu: img,powervr-rogue: Rework the allOf
 section
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20251018130147.12831-1-marek.vasut+renesas@mailbox.org>
 <20251018130147.12831-2-marek.vasut+renesas@mailbox.org>
 <a6d42c7e-1146-4bda-baf6-be04f3185c5a@imgtec.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <a6d42c7e-1146-4bda-baf6-be04f3185c5a@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: a475670c6e47efa9a9d
X-MBO-RS-META: 36hnykyaspk5t54jm87kde8k79k5kbzw

On 10/20/25 5:12 PM, Matt Coster wrote:

Hello Matt,

> On 18/10/2025 14:00, Marek Vasut wrote:
>> Rework the current allOf: section such that all handling of
>> clocks/clock-names properties happens first, and all handling
>> of power-domains/power-domain-names happens second.
> 
> The original layout of the allOf: section was power-domains first, then
> clock-domains. The actual ordering really doesn't matter, but I wonder
> if it would make for a slightly cleaner patch to do it that way round?

It would, but I also wanted to sort this DT part alphabetically.

If you want, I can split this patch in two, one which does this 
splitting, and one which does alphabetical sorting.

[...]

