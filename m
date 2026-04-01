Return-Path: <linux-renesas-soc+bounces-30699-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMovDgQ/zWkkbAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30699-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 17:51:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 990F137D79F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 17:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6633F313E351
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2026 15:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA90D3B47DF;
	Wed,  1 Apr 2026 15:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FeJx3dzc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC7C36AB5E
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Apr 2026 15:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775056936; cv=none; b=BariQf9xtEzAcDnW82zKb3GskcWkcMGfYeXzLsk2WWzNGzbnkx5igGpzGKV1uad2wOEWHiQcPOjRxhz81OKmkQAfsuqiTqwEb+UgwttVLbppA+ZzM30nLoRBT9MOw4PGuMvD/7HrUbzm3DtHraW5EOT+UJXQF7fDb7H8RDz5Iyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775056936; c=relaxed/simple;
	bh=mz/6XSKEQvWVakb/B9VwWSerZa3ZCo7z3B8Ucb8XDsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mxZDys/8zO14t2UyhlT0PFB1EYeefgAtv5D9guTyDlu/yOw4k95IXeZnfM+wVnEeVC9elvMkF5aDt6a7SeWsQAGkOlc/vB5UvQhcVWlGgmtIn8+jVNSKkhciJxhY2sN/GPnSTXF+RkjDCI9EH29Nlr88RvsC3DQuEDWxr60uTvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FeJx3dzc; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-486b9675d36so57756435e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Apr 2026 08:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775056933; x=1775661733; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BOBGuHFIMrZTBevCjGxHETGuPLUyx6fAMEiWAck+cW4=;
        b=FeJx3dzcz7qq0PDzbTPJYYEXLLVefoaIOsVhFqQMA1NUHvUYX47D2XxMviTaynX+/l
         tjfrBsVWdTGkfHahpgYQdICgBj5b1NRFmQPY2uBCOnsCdas/r0KnXuQw//ouQjRUufIx
         X4j4+efwrAD40xS4txHkAkaYrRHxJFceKD5FbMy6ipEpBZL4TNrm+Ah15qA4Bayl9Rmq
         CO76wvBk+HbNg2jQdvH6gC2V2wB/8oD5cDYkF1yHaMPYIaL4c1Mflg88ZSpb4QPK8IPo
         QyC26bKR+wMB7xDSve0NPGhEZfTt4vM7DXq5hr8Vs2acmvOEVgu6qpkDhcJSfqqcpiUM
         c5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775056933; x=1775661733;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BOBGuHFIMrZTBevCjGxHETGuPLUyx6fAMEiWAck+cW4=;
        b=ZpkruNE7illtsvwfPLm8mkKrEsIfiv/herbD4gHlPP8IBY9EjpPk9Vk6qL9iwZDfhA
         D1VKdux3mq8eaPTlqplFwFEG/0C0GIKuY00ZsO4/OyjFpHjcAj97RHleVO8FPaR72nNL
         tiqQswiAwwj4JR0MBOJBHB4tXL/qUVxENLT92anEzTSTcMK3TfuPTRPaX4+baLCQglZ5
         ggGruHdTztLYuchmI4bZFTFP/xSk65se579MqiM9Z/mUhTRDdJtaK1WuKusrAifcelhm
         ltVrKbZbvGbdz284iWhAnRW/am/yKF8PhfVrrLDrcyCjclVIjd1vU8DWaXvdoFrTHz7O
         27mw==
X-Forwarded-Encrypted: i=1; AJvYcCXONbKM8URt9vVIu49deYrgV3LSrqzMT2bzY4X5e1cpE/cm/1set8SebGHg7j9mhV5GLdFRBx9zEJVQV3su9VrNZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMinB7xroqFW2VNmttmN7NjmDmT1+hyVtMLu2kj+0wHQU0ZAQd
	N9vhw3sl7D8hNJ8xmPV036icxK3mfXc6cN1AZREEguOXTtlcJDxxxFwjsvh5tGfViEM=
X-Gm-Gg: ATEYQzxNlS6UzTDN9zXOhT7C9oCjJsbZaInTUB5iFP/mugEn7cfkRdysCSfiruePHWC
	Q85bWnttEmDedvS4Es7x/Up857jQ4mKWShcC29lIM65oPfBPTZSQN6ApFMH5kvX5kFiuDbXRgQf
	m64xdMy4774IWpKRMlQvU2SXzDN0FPPcE4KDaBdQL6OBytARuZ7e99CLIr6gDCVaMlM1buwqwaw
	/fqT701j+UGnrPTgk10At1jiuSufbW8ZGP3UGdiNwcsxUIZuKts9KCe/I3oi0GA1lm9205gsaW+
	FgxAbxDu18Hx/XIQi9kYKjICi93d/7DlZaqFEcc5CEYLARXs7Vn/9FAow4fVg6juZCpXztJY8/V
	rofb3+4pJLp5FWcCBXCvI4Wb+upG0GChvqqyLceyCAMbIC4ajUv3pS2kkXjNxj1dFyvytlfGWFS
	TUTgK1bwBmzt2yzMNRqDfSFu9tGB07vXHNcYBU23x/pA==
X-Received: by 2002:a05:600c:45d0:b0:485:2f4a:6ae6 with SMTP id 5b1f17b1804b1-4888355ec51mr65757245e9.6.1775056932471;
        Wed, 01 Apr 2026 08:22:12 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a63c963sm5807005e9.4.2026.04.01.08.22.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 08:22:12 -0700 (PDT)
Message-ID: <532d1691-f5b6-4fbf-8236-8861e3853ae6@tuxon.dev>
Date: Wed, 1 Apr 2026 18:22:10 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: rzg3s-host: Treat link-down as -ENODEV instead of
 error
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org
Cc: robh@kernel.org, john.madieu@gmail.org, bhelgaas@google.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260401143347.8463-1-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260401143347.8463-1-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	TAGGED_FROM(0.00)[bounces-30699-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tuxon.dev:dkim,tuxon.dev:mid,renesas.com:email]
X-Rspamd-Queue-Id: 990F137D79F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi, John,

On 4/1/26 17:33, John Madieu wrote:
> rzg3s_pcie_host_init() failing to establish a PCIe link does not
> necessarily indicate a hardware or driver error; it may simply mean no
> card is inserted. Demote the message from dev_err_probe() to dev_info()
> and return -ENODEV so the driver defers gracefully rather than printing
> a spurious error.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>   drivers/pci/controller/pcie-rzg3s-host.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
> index bfc210e696ed..03be10aa5b54 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -1653,9 +1653,10 @@ rzg3s_pcie_host_setup(struct rzg3s_pcie_host *host,
>   	if (ret)
>   		return dev_err_probe(dev, ret, "Failed to init IRQ domain\n");
>   
> -	ret = rzg3s_pcie_host_init(host);
> -	if (ret) {
> -		dev_err_probe(dev, ret, "Failed to initialize the HW!\n");
> +	/* Failure to get a link might just be that no cards are inserted */
> +	if (rzg3s_pcie_host_init(host)) {

However rzg3s_pcie_host_init() can return other error codes not related to a 
link being down. In that case the error will be masked.

If this link down message is necessary then maybe move it in 
rzg3s_pcie_host_init() itself or move the link up specific code outside of 
rzg3s_pcie_host_init().

Thank you,
Claudiu

> +		dev_info(dev, "PCIe link down!\n");
> +		ret = -ENODEV;
>   		goto teardown_irqdomain;
>   	}
>   


