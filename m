Return-Path: <linux-renesas-soc+bounces-19568-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0F8B07E68
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Jul 2025 21:52:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 347253B85D9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Jul 2025 19:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0633A29AB1E;
	Wed, 16 Jul 2025 19:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mandelbit.com header.i=@mandelbit.com header.b="PIcgM9WM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1EA1EEE0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Jul 2025 19:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752695531; cv=none; b=EMhnz8RfCXBN8oM0F1O5nd7Au3ZrV49bQR4TCzWHUfPzvnYg1Nxf9lMMTlJoCc347EmFWfkJ5FWQ5i9GcOSQe4R+Vkbq43MkWPCYp0BglM59iWaq26lF4nOdITSf5FiB8YD5tzTZWiN49OZYO8cwCvTYCxEYFc3QwiLN4a9Ii34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752695531; c=relaxed/simple;
	bh=THJNPOJI+8yk3e7ji9GKoObOrORfiNfsXOXESwcVKpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eqCIO38NdmjqHf7VKc72yj8Qsu9gqjqxdo7BjTBGiQXhRRHPMP/lhrPPBJYKrUt35Ci7e7d2Tq9xacThRx0KhXDmqdH5UqLm6U3WdDDodlLMdVhEFSUIP2U7Jr9Vk6zuR0vryOnk+H9/v1vsF30YsxCk/3YZwlnWS1IsDIz4x6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com; spf=pass smtp.mailfrom=mandelbit.com; dkim=pass (2048-bit key) header.d=mandelbit.com header.i=@mandelbit.com header.b=PIcgM9WM; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ae3cd8fdd77so40410166b.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Jul 2025 12:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mandelbit.com; s=google; t=1752695528; x=1753300328; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WylwH9udkWEirydfFpUxcOPjDX2jBvnP9PP0c6bnys4=;
        b=PIcgM9WMq74cZiVXAFuHWpFQJ6K83tKfxIrkCbd5nhVx+mlqlYUG+FDv1jh10qvazO
         NC3YqVCjIt6/d1r+coRehKaRtH/VdOBLdRPuxrcBQMRicFIapXmdRuCq76KfVj9rrT4B
         9UZUF9ATjyRfEWMPoM5jCF/Hnr+uyuFB/wmn64pA2uMsAbxhWAIoZRbuZEza7s105HzM
         aCAdsTQR6gcLxHiZKg35Fpm6FyNWMsn5I0lmwuVxpdvYKqf6vHOyEhRMZdJzoK9JzvUT
         WWDxO53r/JjudXQj4UjMgH9IXYnwlT8AXYJoHo4lZIcXsO8V4FhdXKTW6Xcu/V8/SjQy
         4zQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752695528; x=1753300328;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WylwH9udkWEirydfFpUxcOPjDX2jBvnP9PP0c6bnys4=;
        b=CK9RSvPdrJp9E1kOhkQGFbV7FRGpdU7cOgP6Yf/KlHov+14URwDMkLkeNe1ANwTWk4
         PylUAvabqhG+xZ3uIf5S+QIA/cVhlBqoq8JcwR53I5OfQljMXoBOm5EXfKyZk09uhxWr
         xU7JJ74ISqepzNcrmZSG1A5p7JJ7ceL5X52ifXrsTep85dNzrTrBQ8UyNHwEC9A8H20N
         2VcRU8VVn+cWmzAm27DTLLNSRkY2ULkESz+j8RPmsxk3pb2K3sRc6StaY4wPztigkB+Q
         EYiSt2yUTPD4bemWUzjYsoLQv50XAEmK+H+qJcAjG04q7uOI866eQK33XZTBgpjVgrLz
         mWaA==
X-Forwarded-Encrypted: i=1; AJvYcCUAMeFM9EgpbjY2gUe86v+1KHzyNYO2hQXnhsqTeULhhidU2pCsNa7aDRkXJNplNL36Q82B+SjlgtipKOG8MA84JQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNmqegGLlhO9YNBMqNSelC2LlsR4yAApLkT2UWMF1nOIgxeTM0
	4MtpailYwLtYEA8rOqB7uxYNrhlyRBUhGUZYMPYz86kiSHjz5F8FGwo4fO+a/NjYzFQ=
X-Gm-Gg: ASbGnctUKaOqEe0tjnVC3lE6fDX6e+pWcoXux8FndarUIHQPJZT8DI76WkKKXoCXe/5
	TuFDtnqanFVw3k9PRVqOP0RD4cLgZzt7Zas3DQJJbw42V285NmUzrO3HZMror0mGxoduQ07MRwM
	UeRHogH+v38xmj2NpAC+Fg3bqOJBfAzc5nQWv8zeGqJvk/1YzoifS81dUKdfOmHLM9jj79CBUk0
	bALakAYm1kcXgcDr1AIkeYuSZjNCi+QTqOxH8gOssyCouxW7bnciLzBl1NurkyRuZMAZViaX39e
	kRcGpVM8nM36UBy7FGrwyrBbCgpv2UedKNdnFTKkcCArjvoJIYUJUvboB4lYgT/bJdXyujNJz6D
	52i2K+Lbuu4x4/7yvQZsID/1c5XGcQQAtuc5KOURcbi/mTNmX8j0EbE76ZTXSGlHRrf68W5hbfA
	==
X-Google-Smtp-Source: AGHT+IGygX1TQGdl5nkgUTMKIPJDS7d+3SCAT5BWxK31nx9sZBIZYAxyDokvqQUYUkXglqscKniUyQ==
X-Received: by 2002:a17:907:983:b0:ae0:54b9:dc17 with SMTP id a640c23a62f3a-ae9cdd8605amr388186566b.11.1752695528420;
        Wed, 16 Jul 2025 12:52:08 -0700 (PDT)
Received: from ?IPV6:2001:67c:2fbc:1:a864:eb02:add4:d64a? ([2001:67c:2fbc:1:a864:eb02:add4:d64a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e9105csm1233073666b.20.2025.07.16.12.52.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 12:52:07 -0700 (PDT)
Message-ID: <7d8cfcf5-08db-4712-a98f-2cbfb9beeb85@mandelbit.com>
Date: Wed, 16 Jul 2025 21:52:05 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/16] PCI: vmd: Switch to msi_create_parent_irq_domain()
To: Nam Cao <namcao@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, "K . Y . Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Joyce Ooi <joyce.ooi@intel.com>,
 Jim Quinlan <jim2101024@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Michal Simek <michal.simek@amd.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Nirmal Patel <nirmal.patel@linux.intel.com>,
 Jonathan Derrick <jonathan.derrick@linux.dev>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
References: <cover.1750858083.git.namcao@linutronix.de>
 <de3f1d737831b251e9cd2cbf9e4c732a5bbba13a.1750858083.git.namcao@linutronix.de>
Content-Language: en-US
From: Antonio Quartulli <antonio@mandelbit.com>
Autocrypt: addr=antonio@mandelbit.com; keydata=
 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
Organization: Mandelbit SRL
In-Reply-To: <de3f1d737831b251e9cd2cbf9e4c732a5bbba13a.1750858083.git.namcao@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nam,

On 26/06/2025 16:48, Nam Cao wrote:
[...]
> -static void vmd_msi_free(struct irq_domain *domain,
> -			struct msi_domain_info *info, unsigned int virq)
> +static void vmd_msi_free(struct irq_domain *domain, unsigned int virq, unsigned int nr_irqs)
>   {
>   	struct vmd_irq *vmdirq = irq_get_chip_data(virq);
>   
> -	synchronize_srcu(&vmdirq->irq->srcu);
> +	for (int i = 0; i < nr_irqs; ++i) {
> +		synchronize_srcu(&vmdirq->irq->srcu);
>   
> -	/* XXX: Potential optimization to rebalance */
> -	scoped_guard(raw_spinlock_irq, &list_lock)
> -		vmdirq->irq->count--;
> +		/* XXX: Potential optimization to rebalance */
> +		scoped_guard(raw_spinlock_irq, &list_lock)
> +			vmdirq->irq->count--;
>   
> -	kfree(vmdirq);
> +		kfree(vmdirq);
> +	}

By introducing a for loop in this function, you are re-using vmdirq 
after free'ing it.

I can't send a patch because I am not faimliar with this API and I don't 
know how to fix it.

However, the issue was reported today by Coverity.

Any idea? :-)

Regards,

-- 
Antonio Quartulli

CEO and Co-Founder
Mandelbit Srl
https://www.mandelbit.com


