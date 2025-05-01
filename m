Return-Path: <linux-renesas-soc+bounces-16574-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 058B0AA5D35
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 12:25:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E1881B67A25
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 10:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D28821B9F6;
	Thu,  1 May 2025 10:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EPzg8agO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA1B2DC79C
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 May 2025 10:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746095112; cv=none; b=He9eT8J7US/6a/4SiQN3EoPwwta+pNuuwwdeic+pO8fzM9yeSFE+qPdjqYzwUzFk4j8YRT/IIOSsmQy6/eKZ1rt2QK50SFd2SjWDzjLmxTtbl8c9VpV5iFl+fUEyANdhkea7X1Mb5Bsz6kiXiViNR84wTjAtNUGnVf+DpwUu2kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746095112; c=relaxed/simple;
	bh=nu0uD8i//fXUmOskDNuc2VtMXuY5LXG/Wtk7pmZb3C0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=A8Lmopaoip9xzlxScThbxo8OgZwChqk5VULP1Mq/WaGHpXU1Uc1SLDb76rXFByAFJ9PvQTkIznuzuEMW19ixTJps7BH+gVzX4dbvtii14PEk9HHfK33hUDWnooGy/H5F5G4WgViam1oDP7IldW5M5uaeVGLOjBkkys829MHWeqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EPzg8agO; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfe99f2a7so1286455e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 May 2025 03:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746095109; x=1746699909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHoQo2oUS/kJ896yHbACJOU1lCdNVx+uYGunxKrDMrs=;
        b=EPzg8agO28c1e9RtcaboA9x17e1khkQ7CdhyyzD1hhTr9KwAMANMky7TKnln1uQ99W
         CbSMDTJTiTVSAwVk4qMr7uEQWvD8NvQQWG2GFXPWfxxrmaFBlmtrIaea5IkLZOX9mMrl
         v1zbXD0UjTlK6eaIMK1RH7XYTh28DP0F5jf2VXwDK2vwMVf5IyBHlIq23dNHsZ5wo3g9
         QyaAZWoB/40NRPYQiXsWugvQAUzrs0jNaEZqEL6i52VqMBPXewAPCvxbAhDOGUQcd/12
         WM1ePp1qV50AxWwfMeAgMBtGmEeW2klCQnm56S5s+UvDSekk65Zhpz3Ys9epT7g04Fb9
         e8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746095109; x=1746699909;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHoQo2oUS/kJ896yHbACJOU1lCdNVx+uYGunxKrDMrs=;
        b=TlcOSn355/Tml2yDWbtM4NKKQq4EV1/0fRP4GOFqFIOvGjc/n5gAERGqWJHaEyiqwq
         ow2zPQlJ9MCNKQvR/PDTg8gaLQlTZWxTHj/mYCi6unSKNIEdKGFIKcQsD7wmsp4jEsnj
         CLFGfpUxhKNHzs95Mci8InKinZGEwpEDD4sIOEOc8ZQURa5rRNfN6UtjHczaUNaVr48H
         ROwZ3+SlOZWNtjQJSAOQ/D3PLWcIPB/lejyO1bsiamHqiAYV4ppF8pDshvCPzy8pZvow
         AGQZiWOy7WGWOy6Z9GUEG0m9SxLB2WuFG7Mh0NwzgtQe/5/uUIebu6ZPhREXMfonGBl5
         Txng==
X-Forwarded-Encrypted: i=1; AJvYcCXpgIZYvAo3eOvNsMvwEmPSgCe3NXhStmP1bVK511OqcjlDjUNtwbgviOx3mwqTZ5Q37wdvprfbvpkq79Ghv/eEgw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/B/oJlxOSUc0o+CHBpsV7zF+HFj1DAuUo7h7Ae1B16X2awfFX
	WEOGulmeK7Y3Rog4iCvq0nD+ybsSy4r5S/iHsXOEFoA85/gyQWBlqz1YH/NcYAc=
X-Gm-Gg: ASbGncsk9lv0zMPU4mWGKVzVDSJCNxpLO99LDQEVcJjk5mkpOf1uMjXFCOy3NVxbcvB
	gbGXJo3kC7Mqzis57EcWppWf9Wx8sQmIio/Z2K4y8Oyg5olxlc8nS2P8N+wCcQusB0iEdvRig2W
	P6me3MzSwXug3xyMPiDlh18MCBFA/Y4AlmJPgeQRaFlanL1BvXPW7KEBzMgUe5SCHpTyBOx8pCn
	7HF0hfULUnTg7jrmuNXu8alC7XqnGSYMJPXryHfaF0o/eoWiPMfc4frE8GC7h1qAhklPtllEkq3
	EDKNQ04WdIfD+gPoLOEyrLwArCLkf18/zimZOLqergLv66+gH7Ekv78XUYs=
X-Google-Smtp-Source: AGHT+IEJqTz++RNb7aH0M4xbqHnAQV1Iq2v8zuGAuKB3HO1jlNiiy4V+GZFqfQVJILC1QlzzBxMQdg==
X-Received: by 2002:a05:6000:22c3:b0:3a0:678f:8023 with SMTP id ffacd0b85a97d-3a09404cb0fmr494349f8f.4.1746095109478;
        Thu, 01 May 2025 03:25:09 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a8f7e8sm460820f8f.100.2025.05.01.03.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 03:25:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Mark Brown <broonie@kernel.org>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20250424090000.136804-6-biju.das.jz@bp.renesas.com>
References: <20250424090000.136804-1-biju.das.jz@bp.renesas.com>
 <20250424090000.136804-6-biju.das.jz@bp.renesas.com>
Subject: Re: (subset) [PATCH v5 5/7] memory: renesas-rpc-if: Add wrapper
 functions
Message-Id: <174609510832.12307.13259226741780364388.b4-ty@linaro.org>
Date: Thu, 01 May 2025 12:25:08 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 24 Apr 2025 09:59:53 +0100, Biju Das wrote:
> Even though XSPI and RPCIF has different register layout, reuse the code
> by adding wrapper functions to support both XSPI and RPC-IF.
> 
> While at it, replace error check for pm_runtime_resume_and_get().
> 
> 

Applied, thanks!

[5/7] memory: renesas-rpc-if: Add wrapper functions
      https://git.kernel.org/krzk/linux-mem-ctrl/c/e1c200a4c7f0e8b842a9a5b7f38fa7036c0df417

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


