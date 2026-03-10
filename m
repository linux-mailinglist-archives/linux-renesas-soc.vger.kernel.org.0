Return-Path: <linux-renesas-soc+bounces-29125-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCktK5IcsGkJgAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29125-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 14:28:50 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BC5250439
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 14:28:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5825C334639E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 12:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14CC03D3CEC;
	Tue, 10 Mar 2026 12:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Np5CKVoD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4225E3A9626
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 12:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773144316; cv=none; b=BjSHrl0ySkHBfjXDg3qH/++s9Pc/PGaQGzbObyoKrCTSqGYawBuJaDXT+c0blrZdn6epGLpys+eF9KcpFimUD6N8a+rGAeizJK6kgs7YKRBmGkfkYcsk8cj5G9g2cFYRnq0ZowMEUvCqKOU13tyLvRz4cd5eWUpv9gbfjLSl1sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773144316; c=relaxed/simple;
	bh=UPNSnzaNstwMAqgCUiJAj9O9oSkFKISI+ZEMSLuKWBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HJs8noC7LSzBBtip313B8UaIcpdmSJP3VmSETfJ50Z2/lqmi9KtW0YbUt9uWQkzG/O7dFAGwlX01K6+tM176EuuH/dt6pQmzdeuQiPCh/Ip5kFkS9PHLUZL/VizHe46Rica86kMhTEdsBahrd1/st0RnfJ+v1Nx8NCuftPY0Zsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Np5CKVoD; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso13208045e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 05:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773144312; x=1773749112; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UGYa5Q4cyUckI5eNtSwyfOWNmMFs0j1Kmh9C/7v1S9A=;
        b=Np5CKVoDHGNLcdrJZzQQyQZ5T2ssDNlotf4xekCjmk/s4L84VyjAqZNezvGUDr8hFe
         +Di87NZlnqlbeQ48YA7nJD9l6jdbTKBiJuptLeVXXapW92yYzQU616Opqp6TciyEgxsh
         HA8+MCcHBVeH1UZlySGviNS1DBU/RVm2EpMzgMoYBAGj5sEfrwq+LK9SynlgiCSJA82Y
         RBKg4YrzOyq7vr1ZZGXUo6mdSgfg/k6O7eWt1F4bdVad2jWpzCGOk7jJ4+jf0vlXVBwB
         +oc3TqmV951iu2c7edMU0DoDm5EVrKOY5gj90q5I4QVKuf6efIl5VUoXvEgK16zeFqsp
         z5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773144312; x=1773749112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UGYa5Q4cyUckI5eNtSwyfOWNmMFs0j1Kmh9C/7v1S9A=;
        b=qpg91/DrbMAvReDcHnJHzI8LWa/fHuMXeOq2bHHRnjMqmGFCbUhqY8m8KQhENC+kvt
         YykTjIcdhD6aSv1EJED45RXWwI0dWwqbQR3k8nGoMHxzxuQZZzzlg154ZWTw5k3AARSK
         WanUkQAVEDoGPaOhv5WgwSIZHOEywcpZ7mvhXFMjyViYBtIdJzlnK5ganCaEYqW5z2AE
         LmN3W4KzwgT+UXOMGbNXzsxaPUi7K0qvdfS4cirJLLck3VOAyzL92NnUdZ4Ksb1UvL3w
         qa3Tew8JEab/WaQrdSLpKCM2SPAQnuM6WfynTCM73Hc5LlblK0Fuy6KZjhVj6wVJCm/7
         MwzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqNzEMwS/eT3KdnvXivtrR6jkeCRv3iXQFGaNVuV67kelymfR55T5cW/zrbhv0mGi2a25Jmh2J2AYNOm/lhL7NWA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5M0oYjmuSbtLkRrAjBwoFZI/I4pDVzK8XilfHYsZrgF+cYiUV
	360wrqGR2ZNKfaw7KlhsqQ8F+1E9ST1rNWdCvnMvlj7pwaFDXXiXNuWpjb7febeH8zk=
X-Gm-Gg: ATEYQzy0Ro7owpgj74eT4p63TllqPl06w/urlTGl5oAfzVgwuspFOjCpAibh8CzpAce
	CscRfl413iHbhS4tY139RNNTobpZS1LZpnz6YKpyVIkLB/dBauqhXnlLAeisMJRzCm3uBHTR72p
	qb81KWYKJLkGa/wm7d+LOd6Gix7zYdhY2widVG5PwoXuQK9VgJF8JVGTYWh/pdsU0fgp+lDAwlQ
	pZM7AJHiIWqr7MgvdRzC3pgyh/+9CE44d/5LugcKo/bADEDy0iaF8PjWDwB8HHWXNBcqb44vSxE
	rNcRdAWI8jA6JywDVbYnhDW7f4pn7/NVHL9LqsxTpq5yJfatqfFgKEDQV9+XL5ysU2I0thy4htq
	neZHK3LGspHXHo+Oceu/9muP5ODjCog6aByrfDKbKXRd4sQDS7+H407HgaBOIZdTl0sFX1piTSq
	Lp03plpv0uNstd102IgmtSICkVl6Uir9g=
X-Received: by 2002:a05:600c:64ce:b0:485:3ca4:4ef4 with SMTP id 5b1f17b1804b1-4853ca451d9mr96446965e9.9.1773144312371;
        Tue, 10 Mar 2026 05:05:12 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485358cd26bsm133729565e9.8.2026.03.10.05.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 05:05:12 -0700 (PDT)
Message-ID: <fe5c34fe-9ddb-4a7b-ac2e-5854c624abaa@linaro.org>
Date: Tue, 10 Mar 2026 14:05:10 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT] mailbox: exynos: drop superfluous mbox setting per
 channel
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260309074210.2279-2-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260309074210.2279-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 19BC5250439
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org,samsung.com,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-29125-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tudor.ambarus@linaro.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Action: no action



On 3/9/26 9:39 AM, Wolfram Sang wrote:
> The core initializes the 'mbox' field exactly like this, so don't
> duplicate it in the driver.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Tested-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> 
> Only build-tested. Found because I made the same mistake in my
> to-be-upstreamed driver and then looked for that pattern. Testing would
> be still much appreciated!
> 
>  drivers/mailbox/exynos-mailbox.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-mailbox.c
> index 5f2d3b81c1db..d2355b128ba4 100644
> --- a/drivers/mailbox/exynos-mailbox.c
> +++ b/drivers/mailbox/exynos-mailbox.c
> @@ -99,7 +99,6 @@ static int exynos_mbox_probe(struct platform_device *pdev)
>  	struct mbox_controller *mbox;
>  	struct mbox_chan *chans;
>  	struct clk *pclk;
> -	int i;
>  
>  	exynos_mbox = devm_kzalloc(dev, sizeof(*exynos_mbox), GFP_KERNEL);
>  	if (!exynos_mbox)
> @@ -129,9 +128,6 @@ static int exynos_mbox_probe(struct platform_device *pdev)
>  	mbox->ops = &exynos_mbox_chan_ops;
>  	mbox->of_xlate = exynos_mbox_of_xlate;
>  
> -	for (i = 0; i < EXYNOS_MBOX_CHAN_COUNT; i++)
> -		chans[i].mbox = mbox;
> -
>  	exynos_mbox->mbox = mbox;
>  
>  	platform_set_drvdata(pdev, exynos_mbox);


