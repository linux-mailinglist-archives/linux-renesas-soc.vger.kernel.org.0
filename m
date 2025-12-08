Return-Path: <linux-renesas-soc+bounces-25655-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F68DCAD8C6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Dec 2025 16:18:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC8E5301E141
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Dec 2025 15:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AC432BE657;
	Mon,  8 Dec 2025 15:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="He/yxqEF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F3123B61E
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Dec 2025 15:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765207128; cv=none; b=H8zEgDMrwM7oaOYrwdE+fPbawirq8dG7pdrFgfFVF7DCOfDRPl95QCnpopbtoj+2D/RPMQ6r9ByEtocsSP4Ob0NzTqAyFaZz6rfIjhfSNd/rQ3Nmyy+n7O+CBxoe7A7zkDNHAkCO3gRfneeHz3wH03U49BMZvRdjlqLM72GI0cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765207128; c=relaxed/simple;
	bh=vrMgUbPiviHCE/vtM5qKgmAf1NEAPRzc7KsDqfydLp8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ckTvkvuHlEPrxSQPTJaa2l8gf7Fgry63CmpW9uu8P7fXiWC59qqTdvygUV4d0l7dQCIwY5mMD2A/7UrhW5QxHRC42loxASSf6H4dC4ImIX/fA5GEJK9K17W73REwEDNoZ9r2nBKcH5evKs9cjnqq1ZebNsWFoAwW6uJ9rv1K6WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=He/yxqEF; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b79e7112398so760008466b.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Dec 2025 07:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1765207124; x=1765811924; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EyKkwg9npizIf2XwQV5tQ96E9Oa/5ROifR9l0/m15Fs=;
        b=He/yxqEF0ROYMeBxeVjeHz8V6N96/gHInOf/SbLGYNcWfuUvBUlhmH0fXJLBJ9ulPH
         cwxMaiQMO2nKr70N4Ja091awPZcgdG08knifXabrUecM1IHP5DhORGfj4Zkv1w2oWtvl
         cV9sqSSuXFBjs2rW2PxbLtnwERWwGmCLkFdr4YJKQizhIFCR1DIol4cP6L7GHt5KyciD
         2J1vSm3efYsIGsS/wY77KHzZP1FD0ji895ghgg/w29YmlXK1Nxc0RGFNCYJdE0I4C0PC
         s3zQ02m+hLLo7vwzW+lTywRsihy+ettpzYwLfBCywtBrCuBqJKpKOUwWDaHGK4H2pmBE
         awKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765207124; x=1765811924;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EyKkwg9npizIf2XwQV5tQ96E9Oa/5ROifR9l0/m15Fs=;
        b=qi9GIPMpprWCxCU0gnSm5quEWMT/umQVzLWC0l7c8UrYvJVwpR8rQcxzAAGosuDMz0
         98kYlZ01RUBRssl9BHQtG3Sv2ZxC6rDSdJBpHi3EhMcjowp/m6JHKCmj2FLsgOBLZbW5
         mpIkurfVXVqBfr4JJsccIYuUDJA9gCVeSIOotBv1L5REBgf/5qC6MZPWXVim+Y1/F+UX
         4CfhMdjfqdn16P4uFBS7Sx7ZEkxIcadT7TO2I9TIPQyib7kLXrcW0VQhBt3QSgcHGU0J
         kIRTNa5svWeGXhG+hqOUh3GDsHp7X4Pe1bZVPnZaBN8zjNGBGX/ARQZiiC866uaYqI9V
         N2Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXrj2EVb7mfXR35q/lZkV3cebs2kVt8DpQEWA95ZubUdYjPSofR5fGd3dZty7OTqaRcJIZXxzU0nbI3HmGgdyow2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeWcRIQctNJY4eUYOnTZDPz8wIchTtDztfw/Es1onLbdK5ugvH
	Te50GmMmovn6UpUkrlFpFDTLNbzPAA2Y7bqfFArRGsqQnnN9tg9RoYQCF9CM6UCcL08=
X-Gm-Gg: ASbGncsfwhmg6BnDCJ6nCyzdPbDNpwJ9uv4RwX1TCiQg/rE0+Wf/AgAL/yOaU4K+nou
	dDzOjR5mdo/YJkd08kMsbwURL6niEpFyxKAw5RXq+23aQZ+BSOxLvqP8qFu5DznMsqTnFzOFkPb
	QfehrZogEOAoCeolMDdnDXLMky8Neg4HJ/y22JKomCYygHOfk6YuZ6w7w7AXiphamwwdsumsE2y
	lfR8jxw7ADVUkDkAS/rLh0OldYEhLFmkVip++fIHj0P5mqrR6PnNfu+32s+oNPzrYINepRBg+9X
	AdJCd0PU7xz1SH4bLygw/FaMm+xakaQed1lShcXzoaVhuk1k4CjWIz66mkXCPIdGqCOJ2VLKRw3
	I5YzLkZLAk/A38j3oJusropF7MD0dvPH1kNLGgM/GYjYSA/8NMgufvwvelm65WVmsT0QC1SY0/a
	SCFyjjOU7LFwkYlPMNX1LNXT0Jqy9+Ag==
X-Google-Smtp-Source: AGHT+IHmHAEWZzpXs1rtpanOldqfAtwXfDY30WfUvr0qkz0J9ZX8JM3l3XG0gNeJ1TSMmiLgbzx9AA==
X-Received: by 2002:a17:907:5cc:b0:b76:25fd:6c26 with SMTP id a640c23a62f3a-b7a243047b5mr747928266b.6.1765207124126;
        Mon, 08 Dec 2025 07:18:44 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f49c94fbsm1100880866b.53.2025.12.08.07.18.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 07:18:43 -0800 (PST)
Message-ID: <ce0d29be-bdc5-415d-b6c0-00bd76d9919b@tuxon.dev>
Date: Mon, 8 Dec 2025 17:18:42 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] PCI: rzg3s-host: Use pci_generic_config_write() for
 the root bus
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, robh@kernel.org
Cc: linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Bjorn Helgaas <helgaas@kernel.org>
References: <20251205112443.1408518-1-claudiu.beznea.uj@bp.renesas.com>
 <20251205112443.1408518-2-claudiu.beznea.uj@bp.renesas.com>
 <a9b02517-0743-4716-8ffe-e2120d9c611a@oss.qualcomm.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <a9b02517-0743-4716-8ffe-e2120d9c611a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Krishna,

On 12/6/25 03:29, Krishna Chaitanya Chundru wrote:
> 
> On 12/5/2025 4:54 PM, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The Renesas RZ/G3S host controller allows writing to read-only PCIe
>> configuration registers when the RZG3S_PCI_PERM_CFG_HWINIT_EN bit is set in
>> the RZG3S_PCI_PERM register. However, callers of struct pci_ops::write
>> expect the semantics defined by the PCIe specification, meaning that writes
>> to read-only registers must not be allowed.
>>
>> The previous custom struct pci_ops::write implementation for the root bus
>> temporarily enabled write access before calling pci_generic_config_write().
>> This breaks the expected semantics.
>>
>> Remove the custom implementation and simply use pci_generic_config_write().
>>
>> Along with this change, the updates of the PCI_PRIMARY_BUS,
>> PCI_SECONDARY_BUS, and PCI_SUBORDINATE_BUS registers were moved so that
>> they no longer depends on the RZG3S_PCI_PERM_CFG_HWINIT_EN bit in the
>> RZG3S_PCI_PERM_CFG register, since these registers are R/W.
>>
> Don't you need fixes tag and back port to stable kernels, this patch looks
> like a bug fix.

I consider it was not a functional fix. The driver was just accepted for
v6.19 and though it will be included before the pull request is issued. Due
to this I haven't added it. If any, I'm adding the tag here.

Fixes: 7ef502fb35b2 ("PCI: Add Renesas RZ/G3S host controller driver")

Thank you,
Claudiu

