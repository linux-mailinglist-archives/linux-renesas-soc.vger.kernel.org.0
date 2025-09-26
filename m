Return-Path: <linux-renesas-soc+bounces-22397-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2FCBA2659
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 06:42:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43F151C00691
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 04:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12EB6272803;
	Fri, 26 Sep 2025 04:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Nui8T7fH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338BB2727E5
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 04:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758861760; cv=none; b=ZmFwrdfKL5lQQcnZCV2T4Vr+ZqQ9f+g8pADjFcQ8tpLyR0o3+lzMt/XHztEMHjx8Sy25473B/Bs2YusHyKL/rQfcwzUweXCc0gugfIv1pbjiVk+EAhxxpng2Js9ldtbgJ1VDoiceppBsVfuV537JZW+9qKMGyZGcp8D+BujNoiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758861760; c=relaxed/simple;
	bh=fEauAJYcUbua+cmvgc3OmlOg5F7hAKqTIEP40tTkZjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gELvj1RZFYIO+YZ96tY0A6m73wlwSmpKJPUP993WuzH5bI4qhnmHW0krrZRW1pd5aQrwQyZf6sReyy3oF7xJSmntPDVG4s6pI8IHTJAzlOawDYtEs4CytAwIc8p7VtsLzGoY2lAhZT873CmyulrlHU6+yfspm1QN7AEky+K+qs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Nui8T7fH; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3ef166e625aso1333381f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 21:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1758861756; x=1759466556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TLGY1bfUCfvvgSQwYAf1vBj9u82Y/c0FBRs2wNpuwOU=;
        b=Nui8T7fH5wzqOXlynwLj3xh+sI7sW9Thl56x6qqBUrg1lzL3nBXAvRZgTYNfmvzYJp
         w4cY2BilFGsyeoZVlXPXYzTto1dHX/hHANVY8NujU2Js40Ik6+RWx7pq8M+D8d0jOdLM
         r7TrRHDRzvxFJpv26MmYLIn3rLMmuthcxE/lDqg2oXtzgYbJNj1DzdFLFBDNlg7IvW/z
         VsWcv16VZZ0sHNGcYM4TJXfmhMTxqtvjYGCEzHjwVGFj/xcIOjTaJKZEWNIJAg4BOk9o
         4hSZQrtm+uu7oMaXw9z0cO/EdtYMn0V989WXqrbOBWtTAqhZykqUimWM52LzEx8ERSWo
         fNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758861756; x=1759466556;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TLGY1bfUCfvvgSQwYAf1vBj9u82Y/c0FBRs2wNpuwOU=;
        b=tmek0Vykp+cDm+Dg/23SjMoTjsqmJ4oVhWc/2UJsIlSj2RyL1pKNC3X0sH0R968VAZ
         NauMGL0c4zZHBoT5E9R26D9Vu8qp4/esN9YXbKerN28JQi34Eo8eAujGhdtjhSRi4lNV
         N0PIIIbCkgqpRgkQ4NS4Yi5EgMRu1cLo4+/Rz0ahaS9/FzWReNBnz68jV5IrxY8rvMRy
         03FXWxLvu7jZXtxpT5LJq2DOFiZfTQhf8JhabojAq6vclDYRE1dvke29f09qxLw6HOXc
         BMpDtu5ttOkytYMn/z21JnG7cZg9VvaCtxX6ad3hLvB5uTskmcwVKFCGRjqbV5z6wFfr
         YQmA==
X-Forwarded-Encrypted: i=1; AJvYcCW3LvvByPih9Py0DeRXW2RqHBunnw0SZ2ThBDYy3BSpgvVe4/4vEJfiRxAJ/efJGaXEvGkD/w3cQ7/81gmO7V8jXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa5f3EnQCv67q3FQwvigCv8tzk3FElRzUx2wUMLuGWtYQFMGp8
	lAwL2db+yJIEbB2uzPEgZyBIkaWAmlcNGB337xM2dWt3saIcSXqkxGGMvk5jXeKb1rQ=
X-Gm-Gg: ASbGnctyxImwr2py1bBl4sE/VXbaFf76a7FQdNJHcIUPaOa3z61Em47cJlLl7LRqy8u
	ahUln+AOAMyhUWS00tNsWTcwf8bxO5nMOjjQqcS2HVvJzXwSOVyw9R6bxKEoO0ODzTPWiucGJa6
	wLO0+V4oFEdouvBNzlBpDSKWKK6W6eYDuM0+hYkaQ8+OP0Zgzv200M4JTpcpmre5JWeFeVmuyF+
	y3x9t6Byi1zpGzI5CTRAUzZNVrs43s94k9af7t6PXpUNlgmS00KXOqmmTL2xNjIn4ZFTN1OsCdm
	H+RDNyIZ48cuYwEimLx30zEoYTH9/D6P8A+9WnHL/p/IVfie2iFkrjDtyLYRZVrFeEZ7hHdiUjT
	PsJBaEEZ6Tgdz4G1eQPSUzlwl+wBwdRc=
X-Google-Smtp-Source: AGHT+IEcWDDzdBLvASMwHVBQJF3Lf+PtK0CqkPG0drCL4iEC6JWFAWRCy5oEosu1Iyq9sP+wEPuLDQ==
X-Received: by 2002:a05:6000:40ce:b0:400:ac58:b36c with SMTP id ffacd0b85a97d-40e50f57256mr5069817f8f.62.1758861756442;
        Thu, 25 Sep 2025 21:42:36 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e33baab12sm58199575e9.8.2025.09.25.21.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 21:42:35 -0700 (PDT)
Message-ID: <1708d3bb-20f7-4b33-b3ce-f69b96ec07ba@tuxon.dev>
Date: Fri, 26 Sep 2025 07:42:34 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: rzg3s-host: Add Renesas RZ/G3S SoC host driver
To: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, robh@kernel.org, geert+renesas@glider.be,
 magnus.damm@gmail.com, p.zabel@pengutronix.de
Cc: linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250912122444.3870284-3-claudiu.beznea.uj@bp.renesas.com>
 <20250919093741.1695015-1-claudiu.beznea.uj@bp.renesas.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250919093741.1695015-1-claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Mani,

On 9/19/25 12:37, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> The Renesas RZ/G3S features a PCIe IP that complies with the PCI Express
> Base Specification 4.0 and supports speeds of up to 5 GT/s. It functions
> only as a root complex, with a single-lane (x1) configuration. The
> controller includes Type 1 configuration registers, as well as IP
> specific registers (called AXI registers) required for various adjustments.
> 
> Hardware manual can be downloaded from the address in the "Link" section.
> The following steps should be followed to access the manual:
> 1/ Click the "User Manual" button
> 2/ Click "Confirm"; this will start downloading an archive
> 3/ Open the downloaded archive
> 4/ Navigate to r01uh1014ej*-rzg3s-users-manual-hardware -> Deliverables
> 5/ Open the file r01uh1014ej*-rzg3s.pdf
> 
> Link: https://www.renesas.com/en/products/rz-g3s?
> queryID=695cc067c2d89e3f271d43656ede4d12
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
> 
> Hi, Mani,
> 
> As mentioned here [1], I'm seding the gotos variant here.
> Please have a look.

Could you please let me know if you are OK with the format using "goto"
instead of devm action, as proposed in this patch?

Thank you,
Claudiu

