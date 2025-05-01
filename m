Return-Path: <linux-renesas-soc+bounces-16575-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0365CAA5D34
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 12:25:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DCC71736AD
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 10:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31B9C2DC79C;
	Thu,  1 May 2025 10:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CzBCQPet"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629D91E5B62
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 May 2025 10:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746095114; cv=none; b=ecIEAUEzfupvP+C+QQlMjlPC8YT+gWNtp8fhjW4WrbC6B4SbqhWQPqrgvvNxOM7e8eNwP9pVmU++xpeE3U21nyR8wgtOE1BrQ2HkEFdgKxo7uR1kfDObw8/EP8GxrWv9cE5r5rgoTJ3KBKgsGTArT5K2wuKYZyVcraJ3781gnVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746095114; c=relaxed/simple;
	bh=vTMjmHueD8LyqEO4j2pTs9YueCSPiZcaVhMCnV5QXdU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=X63rLu2Zwx1pBjK7OmnfF+A5M/DmgKF6zDiisegPGLn30tWiCK2UAmp6OiAHLVB0rGolLMkDIlITSXg39/TTIj1uxp8E2u/ahbxSkEixX+CFPIEq3C/L7KFOFtYeHZIeBLQS9zJmz2ETUIaBEvfM/Gpqs066JceJp0PLV60rwS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CzBCQPet; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf825f46bso1012025e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 May 2025 03:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746095111; x=1746699911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oDUg/frJtTueIRvt99k1wnpIN9w/DfhCAdM7ZmNccRs=;
        b=CzBCQPetI0v1kE1FFt0PKy8NYSVmUnao+ZVy33GVb7X67BMo+kD6dplaZUPDpqt7SP
         AvoyVSyiq1A/GS3FBd69LVXeFHqKqrsDs9uYa7wq/CmyJSedVW80ExwvoA1bLthJcP9k
         rwwLFG9/nuGA6Bk70IN+9z/VHTH1T2lJYyN/q1jsTkXAPd+zUNdYYkYviaQeAXX1js0l
         fqdAyYPJssaX21xFMH0F0Hx+hZGIDoUmcBt0BuGtalOYkRk+SRDCzmbkxZxtvMs/xoCy
         Zwy/FtWaJEtkAlSXm8+5d1lhHOkFcdq11V6Yy9yM5auxmxipdmsgTutSO+GqrcE5j2zU
         eKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746095111; x=1746699911;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDUg/frJtTueIRvt99k1wnpIN9w/DfhCAdM7ZmNccRs=;
        b=jajrh3hg+LJFpHH224R3hVeAmerM8jpg7DOuj35dUXjWd1ryJ1B4Frlu9Zfya45iZD
         SYW0fJ0au5F/eycosLRb+qQK1R5gMz41KkzJ+VgfIJ9Kc/vpX4f+Dnx0X0cEJgQGwf8G
         oGLccRZTVGFBcljDObKQLvfdfbDP+xR528qKOqjYIz0BBy5UQhE18r3jqURNAavqNQO0
         NboXy1rDXtm/eviww+JVTMoaPiIFJJghgcp4XUqZlwoyD7BdXIRpjlm1ZDo9bA/BGUvu
         nvO4GON78EAMGSvYq59hiDtOb00Y7GBvBg4N1piGKb/l9oypFjow4zmllznb96xCF6sd
         L5uA==
X-Forwarded-Encrypted: i=1; AJvYcCWwN9LQWfsECTBB537RLS6WdeSS1bKD34yc2l4ycvTyiKNyI1nUQrkVNBY8pOQXl5VKt0g7oespxm4hv0Rj0tGa4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgaQh2cKbdPZhSCVnbNBDi5kHbcQcgnGgoN533fFBwOfS1NpCC
	I/Uv2vjxj/fWTMkJbnXvrk8aw2Bj1pR8zfVsF/gfKJJrTvJLVLqtY6a9EjF2LU0=
X-Gm-Gg: ASbGnct7k5xp1ciozoKhbjq2DLOPoAFhNG/07AaYuwlCHwPq9+rM7RNznN5x9ZXnppl
	J9wk6OZHTYwoX1Y0rQb/9FN/ljPr6xUmCqbzaHR5qlkMXwgoC/AQWZgvvHONnz/Mz3V83P8dvQn
	GMN3S/YY9RZP3WR9Q6MDLbH0xgRzNjQQbzyAogko2A5vQskcwNPMcJJ6laRTDwg6C/q+V0+N2kq
	lhYIbNinuJxbnJFt9IFeGP9/Bi6R6NvXBtmM1/8lrrB5oF0GGcBlsYu8uVeGo+rh3En+O55g8xU
	2sADbU1vieXyrJAQQQzNsulmAE7453GDF6ytPJ5vZ4mfb8Ipoz+dS+GwHO27ZhXQWOIrhQ==
X-Google-Smtp-Source: AGHT+IE8o4v28m7myEavVlwfm+wURsX5uM1pR+XFHD72EUebgbLU1YifSOKR9FnINhiDvJD3bjzmng==
X-Received: by 2002:a5d:47c5:0:b0:39c:12ce:697 with SMTP id ffacd0b85a97d-3a08ff740cdmr1869187f8f.7.1746095110724;
        Thu, 01 May 2025 03:25:10 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a8f7e8sm460820f8f.100.2025.05.01.03.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 03:25:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20250424090000.136804-7-biju.das.jz@bp.renesas.com>
References: <20250424090000.136804-1-biju.das.jz@bp.renesas.com>
 <20250424090000.136804-7-biju.das.jz@bp.renesas.com>
Subject: Re: (subset) [PATCH v5 6/7] memory: renesas-rpc-if: Add RZ/G3E
 xSPI support
Message-Id: <174609510963.12307.3296406989299384452.b4-ty@linaro.org>
Date: Thu, 01 May 2025 12:25:09 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 24 Apr 2025 09:59:54 +0100, Biju Das wrote:
> Add support for RZ/G3E xSPI. Compared to RPC-IF, it can support writes on
> memory-mapped area. Introduce struct rpcif_impl for holding the function
> pointers and data to handle the differences between xspi and rpc-if
> interface.
> 
> 

Applied, thanks!

[6/7] memory: renesas-rpc-if: Add RZ/G3E xSPI support
      https://git.kernel.org/krzk/linux-mem-ctrl/c/687cac9559d8e9277830bdfb68b57d7403695b1d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


