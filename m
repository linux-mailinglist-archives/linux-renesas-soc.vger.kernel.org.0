Return-Path: <linux-renesas-soc+bounces-19298-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8B7AFAE3A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 10:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBDA41AA32AD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 08:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2447228C2C9;
	Mon,  7 Jul 2025 08:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Tg6+KlkY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353C228C01A
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Jul 2025 08:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751875536; cv=none; b=uJ5n4UCA+ezmm4QnKKO51Cd0PT8ePXVNAgwsjIRE7hbTQ1jNr+i/+NYgJD/WQ4z5d9pnDGgTYdsFveICKKwm/MBJ9JvSqjHv+ShU6NuaTzDoDHbatbKqEuyM60RoA75cMiteX8P3rMVzeRzgTa80veJNngcT9LXHuc43YOUIuZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751875536; c=relaxed/simple;
	bh=1TjqDgVep254QfrcOu3FK5y0aX/fhgV/uA6wQt9g1B0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hO8nz3DU1mnEtT4RRf2xuWXfnp/9kOi79P8ilHA4cLrz/RwakezYcEhgt8q/BYICj6VYjdO+ljHoWz6vJnHXQBKfibtQnyPeI7WCl3AjGr9BmuXi0iri4otWJ6SG8BLDYFC3fmReux6wRu9KqE42OpZQ47YHMyfyAizcclC6AuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Tg6+KlkY; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60768f080d8so5209121a12.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Jul 2025 01:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751875532; x=1752480332; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cfSK4wZ0IXAaLuWeqeSbn2/BZJH/6gHhbVTHrVcpn3U=;
        b=Tg6+KlkYIkFXgXxkf76IBjDYPoDHlDpa5+R9sQ9E0yxapxiDg1ZE3k2CpQNYBwvcJo
         i+6CMi17RguMUp7i2E4Mjkyt/uOxokXr6F1rGWafqb1mSf9Ss/MMvhyGaR1OE2k6d+M1
         V1lOeSCHbtVSOVWlUgia7cx96PPZwlvfwW7ZERFC5QkExixZ5Di+EkRKDx1KmvY0IQ31
         jM6bkw3i1maYUBjsTjAZXvB7aPbVBLsRjo3oZJ9cXRjrlCyzv5/PBI7LI2VKVTHEvd4D
         dVidOtE42tu+55CuhFyvk0Szo4uv9WxS0/XP9QV+pFwk6MBCd8bhQ8B74bpfUfwxFG5e
         bUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751875532; x=1752480332;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cfSK4wZ0IXAaLuWeqeSbn2/BZJH/6gHhbVTHrVcpn3U=;
        b=wFC9JPSPfli1Y9UbPHI4+e+3NdUGcoCOlqSoyvKzMC/avAgJ0Oea2R7fbLNIIT+pPH
         uv9enN7FFJpK6B+YQqNsqT/PvyScUD0wBiN7bn5HQIAr5T5uFLzPTNMJzBl3bmg6OpaY
         vq0rmALlMBFllojLTsir4Dbg+QWemiyZij71VWiuALdGG+tDUDkBz3Ky7YvWtYZMNcHJ
         JU0F62rMht2qnG1TjF+atHt7Ux+3hCoi69FvhZMxh8N4uH2EzTTkTAIuv2/sC+cFfxiV
         YuJ5OwQDtsuHUsEq0KZ3l1eVOBCaEHNzVGtgd/LGmrnmyaT0RVALeKmSZnJCaQAsEXV5
         91hg==
X-Forwarded-Encrypted: i=1; AJvYcCWHA5l17AxurMywblYD8aOeNaqRwOlBfVxy9r1peqTNjOjf+pgx4GYkVeAyqGqPUr3sClgZVbna4+QDYY17VGFAuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhY9+KQnwhI8kOe37Rt9jJzvijQW+3vz/QhD6HhWYjDisV9w93
	9hgjGFMTbWtT1PknWBPUHKM5gF6/cGEUsSZqfxpUN1KuLd0gDnA7SSfWx1XFtYc8PyA=
X-Gm-Gg: ASbGncuN7/6gceeyUYkLBwzo19wNGknD1GxULsMKc1mTnBHe6W+4R1Z+nGRjYTw32y+
	PogIrrKDfO7Kmx9961F6GFG2b3QNgXLlPNzOTJmhCcCmUVhYKHjhhFLmQ6AS9mjnbfq67KJxCa1
	EZ+bIuG/OcWmdRnB893RzZpzqLw9C6OWALRQDHMWcf/TvBO1egf6SjjE3K+27AFV+uBolYllAcX
	vBphPPn6IzWLA1Lq2JoyTHrXjmgqcU+oc2XaNtGc9FAK40V0H7H1zVRjhVzO5T3khTl6mGyZ79r
	DU6qSwR7HH+U/JHbz7lqZPtpX9YyRSshLGkky71SeORcFq/CqrrwDdVuGWzzC7qGnL+vrg==
X-Google-Smtp-Source: AGHT+IE0L5DPGdmdGEN0u5OQ9V+2BW3fc6+QE6pzmfgPPJld1q+jXk9TxJBBsXR1qKPnO0Xzg35V4Q==
X-Received: by 2002:a17:906:c14e:b0:ad8:914b:7d15 with SMTP id a640c23a62f3a-ae3fbc899b6mr1217341966b.7.1751875532226;
        Mon, 07 Jul 2025 01:05:32 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66e8c26sm650083566b.25.2025.07.07.01.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 01:05:31 -0700 (PDT)
Message-ID: <96af5f63-dbaf-4177-95e2-a6cc24019dc0@tuxon.dev>
Date: Mon, 7 Jul 2025 11:05:30 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] PCI: rzg3s-host: Add PCIe driver for Renesas
 RZ/G3S SoC
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, lizhi.hou@amd.com, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
 <aGtsM22QYqekuiQA@shikoro>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <aGtsM22QYqekuiQA@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Wolfram,

On 07.07.2025 09:41, Wolfram Sang wrote:
> 
>> Please provide your feedback.
> 
> What is this based on? I tried v6.16-rc4 and renesas-driver/master. Or
> is there a branch I could pull?
> 

This is based on next-20250703. I pushed it here, as well:
https://github.com/claudiubeznea/linux/commits/claudiu/rzg3s/pcie-v3/


Thank you for looking into this,
Claudiu

