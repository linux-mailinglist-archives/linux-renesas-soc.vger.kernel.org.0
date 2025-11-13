Return-Path: <linux-renesas-soc+bounces-24540-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F3609C562D8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 09:13:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BD8224E31C6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 08:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3969821254B;
	Thu, 13 Nov 2025 08:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ToKW0Nt7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3856832ED2F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 08:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763021583; cv=none; b=SbrfafoGtrIn2Hgzq30NrBNyxA1HmXUQA7ehwWFpXmbusFhy8aeF6qL5QqBMkBgpGGFSKX9Tc7zxlF8q47y761IPUYDYX0tZeqqDOgeQJ7Zb+v+OkmOJWvQq2vmZwqaK2vnd2tzbZMONCRAiUfQumjaARkYb5mUiohqhkpJIhyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763021583; c=relaxed/simple;
	bh=nGH0At8qBu3ZNnQzaOXu/y9T18HN37RDrbr9MtEfacg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Scsh3P9OOpjhrAX07CoKpm3WIfm+9iA/WKUVUS4tzAD6RsmrqJ8HLrJfaThg++TgNPB0KKLvPeCIGesj4K0JK60gltsS0odSGEB2txkuOEtiHWSdcNO03G0HFyOTWSJDtvsnv4a6QoFNK7wNCkXYTcJowXyRQlnd29gqwOqTU/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ToKW0Nt7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4775ae77516so5412505e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 00:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763021578; x=1763626378; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F0hgBMveSb7cwa3tNC9/2B7T1+14tCA7kB4oFGdjB80=;
        b=ToKW0Nt7XN3T9j1BAEs5KLpLV/TLsRYtzzJrfXARrQtkPa4j1zxkL4uoZ1hxc384hl
         W8UJlGCttL6cjlDK0pH1w4Fiw0DFI+XIAN4RD8FphugSoonoKLZs/4TwyhIsjuKIagSx
         tzK/8mEw0MGeNodQACJFaZI978riOsMoQkip9jPgymLFOSZfqJW+3LU6hioxSOBCa+3n
         dS0WgEldtmtdM8fJuGzVIWPkr8iATUZfvIiCGhhlS2M70b/rF5vtPGWvxm7TRpJaM/GO
         8dyBR1nHBEZ8mzWemUy2Xam5icOcg7F9iFRGtQAs7xzvuOPtVEPh7O9dc131cOJZi7by
         Srgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763021578; x=1763626378;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F0hgBMveSb7cwa3tNC9/2B7T1+14tCA7kB4oFGdjB80=;
        b=jaTwM0qXSx4LECKF3a5h2XBfblrGvfoqAu6Z2ehNisBLm961W6Y4Gs3YkiRFlrHGH/
         e/otMjqqiG0SHdQh0rl3xcLiJgx6nQSXRVhpLHCSds+ktiVAPKuaPBvthCSvVRoPD4YL
         mT2bU3i9fcwlpLdbO2cvA3clBTqatqU9cPtMB29B95T3SWgeMsqCA4QTPRewuf8R4aPQ
         jsXW0+T3pS3PlzGQjNQ7ZWmxqKcddcRwIngQZVjTnVdtH4lNhYIpgvI2AmoQHuVBtXdM
         oASkCSfbv7ao+oBzbOVecQbwZfLwdJCs/1lmmN7zE1NUaIlMmSkS96zUVrqd69XBM9Ku
         kYrw==
X-Forwarded-Encrypted: i=1; AJvYcCX1h5PRYTmAekkolmzoJCSP2uYxU919xLVzDVtcLAQr5A1qgs7pW0w9A2cjsV3hx/ZFp6/AUtxOBZICbqkncXNCoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YycZ9TahhwwSd8HpT3OCjtvLTWAsahNHTHaZPOLmBuNaJu7c/Gw
	HE8TvAEhW5Kx6rVa66MKtLhPqfanj8RrVskrxUZvUu7xgyxcCMfjYZ5Z2n/pRK3uCEk=
X-Gm-Gg: ASbGncvbk8gyXhy/dyS9Yfa8iiyObmIduxNCS+mnwYqDnonNlbGakYJlpkBM8uQoV8N
	AU69QFE5Q1jiQD1vyFnEsCzPP1irutzxW47uXwuC6nSPJ9LFUyNY8grEREhso5WVK4hGYzFKRnh
	33SFoTzjYNJikb8ug3UjgdnJAuEfXhsNPtzCACeIhzco7ZadSRDu+rJtZsraAIjG+XgSA5SAWZG
	EFIvS15PPDUHXbpnVaJBrtAA2Og804BrKPGqCfa891UURNEtm+O7VLc6nZe4ZLWPYEtOMhjAn1v
	ZY4CXMont2i27Ipw1flIG4nucYa8rhaX//PMKLvPmyl450oSWA6Kek8yCCvo7cKUsqiCtk/D961
	RI67jA5+8A8CBlEoTLb1+fxWJKXxk53bmsyjcnOOrtlDcI8F+4zvpJ2ykYAnTrMX9z+fksKrDS7
	csl7xWfM3n
X-Google-Smtp-Source: AGHT+IEl052iGPh1sTMIdYe2mp1cm5U3r4OeUXO5rJooo4iRckSr2LlzUUnEDP8iWmIaVkMCxaoIbA==
X-Received: by 2002:a05:600c:8b38:b0:46e:4b79:551 with SMTP id 5b1f17b1804b1-477870b39e9mr54164035e9.31.1763021578138;
        Thu, 13 Nov 2025 00:12:58 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778c8a9456sm20676475e9.15.2025.11.13.00.12.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 00:12:57 -0800 (PST)
Message-ID: <55e9c0c8-4360-4d08-9269-27a3ff5ba38c@tuxon.dev>
Date: Thu, 13 Nov 2025 10:12:56 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] mmc: renesas_sdhi: Handle resets
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: ulf.hansson@linaro.org, p.zabel@pengutronix.de,
 linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20251008042526.3312597-1-claudiu.beznea.uj@bp.renesas.com>
 <8c654a1f-2513-4afb-b33b-fabbafbbe845@tuxon.dev> <aRTRLW4bCoZMtCaB@shikoro>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <aRTRLW4bCoZMtCaB@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Wolfram,

On 11/12/25 20:25, Wolfram Sang wrote:
> 
>> Gentle ping on this series.
> 
> I had a look already but want to test this series on R-Car SoCs. Which
> tests did you apply?
> 

On RZ/G3S the following were checked:
- run bonnie++ on all the SDHIs (with SD card and eMMC, where possible)
- unbind/bind on all the SDHIs and run bonnie++ (with SD card and eMMC,
  where possible) after re-bind
- 32 consecutive suspend/resume (s2idle and deep) and run bonnie++ (with SD
  card and eMMC where possible) after resume

bonnie++ tests were executed after boot on RZ/G2{H, M, N, L, UL}, RZ/V2L.

Thank you,
Claudiu



