Return-Path: <linux-renesas-soc+bounces-21829-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DECB54FED
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 15:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A53DF17A782
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 13:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DCEA30B527;
	Fri, 12 Sep 2025 13:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="LL2IB630"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F712F4A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Sep 2025 13:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757684758; cv=none; b=c8OUMHzTyommM2fhblSFYp4ZmleYJloesUDp1CNR6BcVNa4SAhf0UQZhy7fwjsW9hK/NGJnySQuLn8GbLaky5ugBWwXVqmkgKFIcsHC3tCwUza5/ZvuJqQ1TXXtM/Gg6FKQ9BF/CA4HkWezDymV8y0HZVOVBs2r4M7C5bF3J5VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757684758; c=relaxed/simple;
	bh=eZ/3k8S1FsU7ViCaeVzf+yLWQczlSilj3ntqWZdSbS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hlB/0sy2YrHeb13jeAtSLzbmSmLN4+pqVEv3zLHIELB/QpZXKFkALhWSQskDrrQOItl1erjE+8+0H549xv9eZ2xpczGMQTzKhw1gQUTICnCpLhVVKKvlNESqTYsljommcv7+NybOBzZajFR5/upQ/z9aIGIsfIHS+Q2BDi8D1L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=LL2IB630; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b07d5e67a95so37782066b.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Sep 2025 06:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757684754; x=1758289554; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bEDg70Jj7YKjT08by451j1eysJp3oufT9qTjoaWDXNc=;
        b=LL2IB630We+CcGmz/4ip+YdvQYC7ZEhje5LLh7aIkWTJLl1ZRTDlJ1J5cK7nUlSQ+p
         JFMcRJiKW/WVnu148MKr+8QLdgNRWeX0jd4b1IsUw2hl8QGvOn+jTNZ6lbKDJyW0zrwK
         dMadsOqI/ZJ7t+gA8GVQh9Y46ROrIumpwUskPOAhWn80eOb1i1GJL53Zl1dzLkM1OJ/S
         hVazPivgCmRlNOtBplI9OITuh6OQvkGhWxI4qtxWOQ4hac4g5zFbns5bdMEAhy1y6LsQ
         1NkgEcPCmva2aD2LiZKFy/rU5nYNEdMjSrkRT1VyqVb8iyc0ZdEZGFuUuFSr4Fc08pJ2
         cw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757684754; x=1758289554;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bEDg70Jj7YKjT08by451j1eysJp3oufT9qTjoaWDXNc=;
        b=biM+YpeHQYEz1mC0DTdRRFrBrCVi8Ec/fGC4+dopm+j1IwqRvofc7FcsAcMKn+Hbji
         c2KowNgCMV7Y5HxSQ92vUC3d9RiUiMMysplgZgVGFOOWEgnqM6zJkT76B3m/lzIZxh1e
         mAexMECdbijUkgVa/9uDGkXW6oVhU3/c2JNq8n1JZu/kqUx7wBLYjprRRm0kGD/52a8h
         WSV3JnRJQTRSeAzR0CIDcZ5uvvkL3+Gr7/D/3o28CVcaEIrhV6q8hYhKqWPZ9+iUfUod
         otkDtkOzIY635M7It+VYEWy7jKyVeUZBZe7TJq9U43eyeu6dhmB1g6i/P/WiDyoim6Bg
         r3XQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMGAU67iWDJCHfDJfXeO2tgCJ2MSqmXJJ/ypWOx9U7uwgwWKjG+Gi6alBDB+2KWb9oZhdvJKXl4m7PKQKs4U4YCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSXx4osLXI08tf1CinDgspG0AKCBo9iDHoU/LsIR2e8UGEsfuY
	wsBW5vfjzcIgpy0zXnM+3YWmSq5czDkWmiug84P/gJWsRLkFoZDcvLJUclXH1nPom48=
X-Gm-Gg: ASbGncvDbRd//Y3Dw5Eg2sq+4QnUuyEbYhiZmeuJhlYnv8tlAhISPPs0slTBRFzjzN7
	xDij9OOstSjH+ZYV5WPaOErxuAz+I5tC9oUxaI2W2oSLcXsFiiaPOq7+zHRQypWqLc4b4Vchfo2
	wxAYbAsDbWzeowv8VnrzaJIX12PUYQFw914to9KNv0qDNPHVHEte5Blxco+BMh//Q7ktFCOv1AF
	mZoTVp6wWrL22YhxE0yQMaNg3UxjnDoEmfxT3K80B48fSTs9itEb8MXjHS9IMHZqK295iBCRl+5
	mYsBzoA+g4+MF5fjwcHeFq50Hy4ZnQ+GoxLUIZADlPJa99hL7Jf5W5n8nUB0G+/bApU94QGLPye
	Yq/OemDMaY4ldl7ACPmILHf9y1fSkGZjiVBdvw3KVzA==
X-Google-Smtp-Source: AGHT+IEsCimxO1uS8fXVfh+sRS/G5aXdz/QiPj+EdzJelEbwTklRPu2BA2r4RlFn2GW1OHK5h/DRUA==
X-Received: by 2002:a17:907:d64a:b0:b04:6f77:9cff with SMTP id a640c23a62f3a-b07c2597b06mr320087566b.27.1757684753981;
        Fri, 12 Sep 2025 06:45:53 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.153])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b3129199sm370798366b.36.2025.09.12.06.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 06:45:53 -0700 (PDT)
Message-ID: <9af52f53-1060-4311-85bd-e0539baf0a4b@tuxon.dev>
Date: Fri, 12 Sep 2025 16:45:51 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Add
 documentation for the PCIe IP on Renesas RZ/G3S
To: Krzysztof Kozlowski <krzk@kernel.org>, bhelgaas@google.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, p.zabel@pengutronix.de
Cc: linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250912122444.3870284-1-claudiu.beznea.uj@bp.renesas.com>
 <20250912122444.3870284-2-claudiu.beznea.uj@bp.renesas.com>
 <d40011bb-8e03-402e-b343-7331d51e2427@kernel.org>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <d40011bb-8e03-402e-b343-7331d51e2427@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/12/25 16:41, Krzysztof Kozlowski wrote:
> On 12/09/2025 14:24, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The PCIe IP available on the Renesas RZ/G3S complies with the PCI Express
>> Base Specification 4.0. It is designed for root complex applications and
>> features a single-lane (x1) implementation. Add documentation for it.
>>
>> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> You cannot really test bindings in that meaning and build tools don't
> count as testing, just like building C code is not testing, running
> sparse is not testing, checking with coccinelle is not testing.
> 
> And it cannot be tested even in the meaning of building, because:

That tag was picked by b4. I'll drop it next time. Same for the defconfig
patch.

> 
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
> 
> 
> ...
> 
>> +            interrupt-controller;
>> +            interrupt-map-mask = <0 0 0 7>;
>> +            interrupt-map = <0 0 0 1 &pcie 0 0 0 0>, /* INTA */
>> +                            <0 0 0 2 &pcie 0 0 0 1>, /* INTB */
>> +                            <0 0 0 3 &pcie 0 0 0 2>, /* INTC */
>> +                            <0 0 0 4 &pcie 0 0 0 3>; /* INTD */
>> +            clocks = <&cpg CPG_MOD R9A08G045_PCI_ACLK>,
>> +                     <&cpg CPG_MOD R9A08G045_PCI_CLKL1PM>;
>> +            clock-names = "aclk", "pm";
>> +            resets = <&cpg R9A08G045_PCI_ARESETN>,
>> +                     <&cpg R9A08G045_PCI_RST_B>,
>> +                     <&cpg R9A08G045_PCI_RST_GP_B>,
>> +                     <&cpg R9A08G045_PCI_RST_PS_B>,
>> +                     <&cpg R9A08G045_PCI_RST_RSM_B>,
>> +                     <&cpg R9A08G045_PCI_RST_CFG_B>,
>> +                     <&cpg R9A08G045_PCI_RST_LOAD_B>;
>> +            reset-names = "aresetn", "rst_b", "rst_gp_b", "rst_ps_b",
>> +                          "rst_rsm_b", "rst_cfg_b", "rst_load_b";
>> +            power-domains = <&cpg>;
>> +            device_type = "pci";
>> +            #address-cells = <3>;
>> +            #size-cells = <2>;
>> +            max-link-speed = <2>;
>> +            renesas,sysc = <&sysc>;
>> +            status = "disabled";
> 
> ...you disabled the example.
> 
> I don't understand what happened here - why this got now disabled.
> 
> Code was correct before, but you made so many changes including this one.

I reordered the properties in the device tree to follow almost the same
pattern as other already existing nodes in the SoC dtsi and copied that one
here as example. I missed to enable the example.

Thank you for your review,
Claudiu

> 
> Best regards,
> Krzysztof


