Return-Path: <linux-renesas-soc+bounces-26859-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFD5D24B07
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 14:13:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4FC413003FF1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 13:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B17039E6E0;
	Thu, 15 Jan 2026 13:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="e8KMlEet"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E89439E6D3
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 13:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768482807; cv=none; b=S/5ZS8P6eKsSHIsrOyiBYr7PCoiqlDw9pk7cXgoWldrRRTNp5nOHS4ovG6xLRnDWTCPDDpjab0wq9hCcF9DWS8dCA9zjn9ZAMfr+Ot6b5ylmI55/1E/+UmNlpRY0xUqLmqCsG4FCrPqtq8SPWm7tJHZ9aExDz2y21Mc4MsiaNc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768482807; c=relaxed/simple;
	bh=oGBIY8OHbiaA6AKM7iezNk4OT2UqUM41E+jU3AXFh04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XLouGyyHFUmG/aKxKRbNZ5m87iW5oavUh4P6B7lxw0VNgbOIQZSrF7hyOeQVffw6fLQwrM4H0lC/hNW3MfcFq3ZLJHxiXh+ySmNR8NPayEYiRbIJPtd99Xda11codfrEkOEeUEHQ7kjE9IZpVmGubOE3rSh8j90uhgtw+26xLcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=e8KMlEet; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b8765b80a52so153086366b.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 05:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768482803; x=1769087603; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OcKT38A0UUvdoSzqayVq/UaeSYTimcTVzwN0DmjbeBE=;
        b=e8KMlEetorsdjlDu4nCOoTy3aocLVWJp4SGBuk7cPT/nyqbs17/jVUSlljjAcH0029
         YjJoNxfiJo5dWfbNVhiiFRZDoPxNpNAe4olDxz1YnU84kktRng7PUK+VuLwzBWrmrgMv
         Pm/GaxLWAJN4ulMJAvrmwnpg2E7P3NQHa0L4IwkeO8THc7G2QGJSgEOVwxWMBy6D3wtF
         RuFbc1t53DtFvVMIAxL/9TM8eTH8nJvXULwWBrWe+87wfngBJ7tvd50bi4gS4z7Qcctn
         SYx+sBMVhLtdc83/I20p+/2zFWwYP8AUCpr9hbFV7QSQyl3gk6i7jjHGKFvko6GrY0Ge
         8Fhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768482803; x=1769087603;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OcKT38A0UUvdoSzqayVq/UaeSYTimcTVzwN0DmjbeBE=;
        b=JpBOftJZcpleC4JGKHqyU+/b9BhhTwkzsBTAmfo+2m4Hi7SG68VXB0HxStSrLBZ3lQ
         HEZ5ptVANG+R7IF9qHSsUSoaQ8HBa1KMeKkVYKJyyjvZgZqtp05p5ZopphuMOw3UD9K+
         qA7DZyP883D+Io6ppxeDFBKRQ/xrBWy0yObkg+00OxHlK0PQBZlaSzoW5gjy40/y9BqF
         eNeXlj2jD12biUBJw6rsb5u/pQpscgLv2O8C2V01Ox/MRnOi7wFqMXbFSPem+ywuTxGl
         v8VMTyCcYxTtN+BPdEH34rjD5RUUpk/YZ+ykmfvI74BtZkpgjEqBoWrfn6IEh+2Bu5ZZ
         hF1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVs9oWTLCgoCdn7lWl7zcbpf0FGgmZ7exZVAKJ3zmzrqIQk2c2g/v8fvJyoW1BrVZabDmpwO8z+KxVpVDgB/A7PZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzO/ow1GwR0OUp1w6ZKfzgYRAUrLMxt5qE0biGXFMGPp+ZytIzP
	gFnOpiVvu5mtl31wKQ5dqFqtHpScXRrsW4QCaG4boX38ywWenbE2DlcBGFDzImvL5Wk=
X-Gm-Gg: AY/fxX6U/pDSME8Z6XfH3gpbue8akKYiJGK9O0n11vR+V5DrJCsHO4PFIW1TTb5xQQb
	RqD/ru1ttEa2VQ3WYcuSZ9okJaoHudmEwueaZlpgAGKHzsnuwPGSv6JhbqsIZjdob2nrB6X2AHv
	/AmGGlrYlQxme+PoC1zy6e349h8vrs7xxFB8385nnv/+h3PT/a7pZR645WVobsUqAC6odJ7eYH1
	m6z3OnQAUYoVs5NdkkZyintiZxqL1goSOxy8dZDEiAEpmQ1hP8Xocay0+GsDCWfWN6z99SZlvNm
	w9MMtkGSYNqfVymk7boL/IspszKrRYjoY1FbodzxLgX096Pg28A71z4rgguvCiMIQv5fDCFg8US
	mCCrXOAqp2hCjWeasu/8+flR7faGdl3cZjBsDDfcBKnvQiD6Fw9r22w1jnfPgs6e30PvKtSH03q
	KTB6LoblrOzja3jSPuaWYEM/0Gig7twg==
X-Received: by 2002:a17:907:72c6:b0:b87:5d59:8661 with SMTP id a640c23a62f3a-b87677a7930mr370290966b.42.1768482802627;
        Thu, 15 Jan 2026 05:13:22 -0800 (PST)
Received: from [10.78.104.246] ([46.97.176.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654118772e5sm2534012a12.4.2026.01.15.05.13.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 05:13:21 -0800 (PST)
Message-ID: <2e05a458-b055-44d0-91d5-63091b9eab91@tuxon.dev>
Date: Thu, 15 Jan 2026 15:13:18 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/16] PCI: rzg3s-host: Fix reset handling in probe error
 path
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260114153337.46765-1-john.madieu.xa@bp.renesas.com>
 <20260114153337.46765-2-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260114153337.46765-2-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, John,

On 1/14/26 17:33, John Madieu wrote:
> Fix incorrect reset_control_bulk_deassert() call in the probe error
> path. When unwinding from a failed pci_host_probe(), the configuration
> resets should be asserted to restore the hardware to its initial state,
> not deasserted again.
> 
> Fixes: 7ef502fb35b2 ("PCI: rzg3s-host: Add Renesas RZ/G3S SoC host driver")
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>   drivers/pci/controller/pcie-rzg3s-host.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
> index 5aa58638903f..c1053f95bc95 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -1588,7 +1588,7 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
>   
>   host_probe_teardown:
>   	rzg3s_pcie_teardown_irqdomain(host);
> -	reset_control_bulk_deassert(host->data->num_cfg_resets,
> +	reset_control_bulk_assert(host->data->num_cfg_resets,
>   				    host->cfg_resets);

This now fits on an 80 chars line, could you please update it like:

	reset_control_bulk_assert(host->data->num_cfg_resets, host->cfg_resets);

Thank you,
Claudiu

