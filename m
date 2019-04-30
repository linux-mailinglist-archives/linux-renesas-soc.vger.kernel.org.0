Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD30BF1DA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Apr 2019 10:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbfD3IMr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Apr 2019 04:12:47 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43851 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbfD3IMq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Apr 2019 04:12:46 -0400
Received: by mail-lf1-f65.google.com with SMTP id i68so9973477lfi.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Apr 2019 01:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9ozURogrBkqi6N/9N92/2fxrEWVZwyBMFji8R7JKkYU=;
        b=M7/9voiOZsA0i1tciJ1pUBbgPG/0StQIPxDKbDg1g11ZPSQamC313AwO8BFToT/wgy
         jG5v7Jaa1HuDkspbMSzWg4k/0BPxqnWvC7d0HkRJXvOE+JgIfSQ/HrDd2aKFR8RoBjyw
         hc10L4REu9iSGrekmG8BkHY/7uXuiagFhqAR4tpIikdIw026IAXARahgOqOjL8SJLwYe
         cajE7QCavHx+j0JgCM7Yj7oy9Tit01jlFZIBFKrIWEF6Viw+CYaGg6488w6erNBKtIQh
         dRqHKyhDfAXQ7K43g2i74TUI40bO0jJXM8JkJmXXkgbOS9whCTc2J9jGj1ybM6iLdH7c
         Aviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9ozURogrBkqi6N/9N92/2fxrEWVZwyBMFji8R7JKkYU=;
        b=f32x/6l+LDITlem6hYuHP+zr5it2KoQs3BWqinPxcCrevy7N0vtqeaLlnirScvZWWL
         nUoMbQB3DW27SQRIrBrqGz6nL5Z2ow9PpFm6ya0ra/nADBhw5hGCEQf9L/VFs/0+h8CZ
         4xFdATMeaHQpoMAmDe5KAFuA7wPcU5kQzVR0g7O29KI3GIzhPyB4+xXzdlLwgHLACQ3B
         6DuP+YqkgOS1VS5tT7dTHJwcNrcE5+DQ/eMpUXKykuqBPs6Tr46D7FMrIMt/0NCjun5w
         CvH1Yqo8DCvMqMNWwtzcLnpFOnEW4fGggsjzk/EHD0phszVh0v+x5MFEX9hJXykI55Cz
         3mYg==
X-Gm-Message-State: APjAAAVVph7p7eTaMVWEQO7bueSI6zhNgsC3sOSVn0uugxm78KtHsW7T
        wiJaGva8SHVten9WwFxUfX6OJA==
X-Google-Smtp-Source: APXvYqyi6TzPSwc+vP/6cCmv5b05hWr4xC/ARTHKOTUqoAS7o4TuMr/9HAqCRgURLMrWPpVgpHblvA==
X-Received: by 2002:a19:f801:: with SMTP id a1mr36540071lff.150.1556611964646;
        Tue, 30 Apr 2019 01:12:44 -0700 (PDT)
Received: from [192.168.0.199] ([31.173.80.195])
        by smtp.gmail.com with ESMTPSA id h21sm3290136ljf.16.2019.04.30.01.12.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 01:12:43 -0700 (PDT)
Subject: Re: [PATCH 2/5] irqchip/renesas-irqc: Remove
 devm_kzalloc()/ioremap_nocache() error printing
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190429152006.22593-1-geert+renesas@glider.be>
 <20190429152006.22593-3-geert+renesas@glider.be>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <3ecf87e2-4e70-9159-a364-d41f1b744f7b@cogentembedded.com>
Date:   Tue, 30 Apr 2019 11:12:38 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429152006.22593-3-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 29.04.2019 18:20, Geert Uytterhoeven wrote:

> There is no need to print a message if devm_kzalloc() or

    Just kzalloc() in this case.

> ioremap_nocache() fails, as the memory allocation core already takes
> care of that.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   drivers/irqchip/irq-renesas-irqc.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-renesas-irqc.c b/drivers/irqchip/irq-renesas-irqc.c
> index 438a063c76156d98..0955ffe12b32eb36 100644
> --- a/drivers/irqchip/irq-renesas-irqc.c
> +++ b/drivers/irqchip/irq-renesas-irqc.c
> @@ -133,7 +133,6 @@ static int irqc_probe(struct platform_device *pdev)
>   
>   	p = kzalloc(sizeof(*p), GFP_KERNEL);
>   	if (!p) {
> -		dev_err(&pdev->dev, "failed to allocate driver data\n");
>   		ret = -ENOMEM;
>   		goto err0;
>   	}
> @@ -173,7 +172,6 @@ static int irqc_probe(struct platform_device *pdev)
>   	/* ioremap IOMEM and setup read/write callbacks */
>   	p->iomem = ioremap_nocache(io->start, resource_size(io));
>   	if (!p->iomem) {
> -		dev_err(&pdev->dev, "failed to remap IOMEM\n");
>   		ret = -ENXIO;

    -ENOMEM?

[...]

MBR, Sergei
