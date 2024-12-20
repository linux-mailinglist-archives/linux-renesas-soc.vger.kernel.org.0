Return-Path: <linux-renesas-soc+bounces-11612-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7ED09F8EA8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 10:11:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE6101893F41
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 09:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC8CB1A83FE;
	Fri, 20 Dec 2024 09:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="kkKIr3qm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25341A83F7
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 09:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734685896; cv=none; b=EGT8MHuQFh2S/B6Hg5aJqvQ7cuVaIzDbyoAsrNjWI9MaM6mwBwGVK2brgUE+es6pROF5xCApg4Eev0mfjgP0A6gwgSdZDrJ1Y8sS7KJK/jfdWm6i9kpu0vwBXNhrN8bwTWZ7nM71w9KmI+KPMlTN/+CbhikfMGuQtXAlDEL7+kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734685896; c=relaxed/simple;
	bh=huyKTAD5TizUaeXmtPHdaMmKMkdO1y4kWXduIO+yhSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ULNMmN+8Uc5YnyQqFMR1LEbx0GNHw2AuxpurfkRBwCaMF02q0PAKoX3DI33EnDIQ+npR3/4yoJOC8pcH+3ZSPOtyiyk0oqkID29hOJ/lG8zVJuMBevxgNh86BQsYRLoixjWMHogNm9uhBBcG9O5CmIkLf5Nn7UxhdIw44oZTGVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=kkKIr3qm; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54025432becso1789866e87.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 01:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1734685893; x=1735290693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yPPsIlWtoiJzR9IRsKw7Ht2hqc4uWrmKnxf2DzBaodQ=;
        b=kkKIr3qmu6jI2MxvE3szsucxusogeDdblF/KG9+r4KghGU2iKNRunYFhknj5GH9XrV
         4pApE7XuUIfPShPh5eGAqF4oDIg0naFVd6miDDVff/E3vkxw+WhfuCcK8wjFxt3clG0Z
         i4yWgr5DXLWic77706zuWxamCLhbo/TTfEBvWD3317giJEOzwJ7NjCFLz/Ucnb23QRw3
         jcqStDn+5znO62H57gfb2HC4G32ibleC8gkyLWHqEwAhHZ78O8V6SIjD7I3bcNtj3Q/8
         EKNccfwSGYkA5WpfRFb5QTeFz03f61KbYGXYj7Qrig8VsWSedOW0yTo6d9MpnNZVWbX4
         KOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734685893; x=1735290693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yPPsIlWtoiJzR9IRsKw7Ht2hqc4uWrmKnxf2DzBaodQ=;
        b=F1CHDShoU8XgycQUsebUtmSGqktZKoN9ayRMvPHOES8YBK/5KsZWpVxanIpKlvvOGj
         Yn+5LTQQvkoqltkIHX6waqyfbt/L9oPLPz10EADFBgCcwwmI9LHW64Dvm8oLFtsONuP0
         5i551OM92Dw+Vy56BNa0xRZ1sCzIiYla/2zb2+Ate2/1ZsliO3qnXuOsCa0eM1iWK/dr
         vxXJWWA+DTqKqiAiL12Hr0I4LiM7n1NrayKR/soOMWV23UpurgVSzi3Beq3dcadL2KYl
         Qt0TboEh2djcQ6ExGi3685IZpSli/+h6aqsiEgnwU37Uafdhs/DDSD/gpEpVWpjs9Mxy
         dg0g==
X-Forwarded-Encrypted: i=1; AJvYcCX75TeEBBvnpzMaf0ecjjSuhCkt3ZRgNuoqMXwmLdbLiS+sN71/mQ05Ruawz5lt3epQrvwAOYNmQ0/IfR74ixew9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8dyaddxivWwizFIuJ1+TOucgMa6YlLqkVp0BoxU0WujChr2g+
	8oTEMVhBop+1SOqGjlFo2t1G7DyB7PZHALnCEZhLqH7WC+zN/ZmlA0rwYCefwF0=
X-Gm-Gg: ASbGncs5/iiot/Hllj56ugQqGNqw1ZS/y5Ff4mstyUhPbXp/mbssg4GMc4KwmBvpCHf
	q37Rg3Yc0HIvu5okBm91ymUrK96YSK6o+QiLCqohk2FfvwJyhRYnRNRQzgSNz9bIjJ6tmhmimbO
	04XM1T6MdQaNJCUA1S6InoIAzr97HIGCIRppug2BxAHofuNrytV36X730VxZipUFHBXnQDFQJX9
	lKFLWkKSKIQ1a0Ga0oeK1dvttESL4E82DxFrwlsknL0QBMSJ1PeiRyhFmvwvb1M38rboRO+sgcz
X-Google-Smtp-Source: AGHT+IEfNicnTZkEytBBHq6sbMYBDDsi515rs7GJGYu4kBt4EJniWkEN+7wvu29GWJPtgOjQQ8cCFg==
X-Received: by 2002:a05:6512:1387:b0:542:213f:7901 with SMTP id 2adb3069b0e04-54229582367mr581669e87.44.1734685893124;
        Fri, 20 Dec 2024 01:11:33 -0800 (PST)
Received: from [192.168.0.104] ([91.198.101.25])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235ffe72sm431810e87.77.2024.12.20.01.11.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 01:11:32 -0800 (PST)
Message-ID: <0e95c4dc-e155-4860-b918-13e47bf9b9c6@cogentembedded.com>
Date: Fri, 20 Dec 2024 14:11:26 +0500
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/2] net: renesas: rswitch: use per-port irq
 handlers
To: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Michael Dege <michael.dege@renesas.com>,
 Christian Mardmoeller <christian.mardmoeller@renesas.com>,
 Dennis Ostermann <dennis.ostermann@renesas.com>
References: <20241220041659.2985492-1-nikita.yoush@cogentembedded.com>
 <20241220041659.2985492-2-nikita.yoush@cogentembedded.com>
 <Z2Up3mE5ED6uYVGP@mev-dev.igk.intel.com>
Content-Language: en-US, ru-RU
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <Z2Up3mE5ED6uYVGP@mev-dev.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> +	ret = request_irq(rdev->irq, rswitch_gwca_data_irq, IRQF_SHARED,
> It wasn't shared previously, maybe some notes in commit message about
> that.

It can be shared between several ports.

I will try to rephrase the commit message to make this stated explicitly.

>> +	err = of_property_read_u32(rdev->np_port, "irq-index", &irq_index);
>> +	if (err == 0) {
> Usually if (!err) is used.

Ok, will fix it.

> 
>> +		if (irq_index < GWCA_NUM_IRQS)
>> +			rdev->irq_index = irq_index;
>> +		else
>> +			dev_warn(&rdev->priv->pdev->dev,
>> +				 "%pOF: irq-index out of range\n",
>> +				 rdev->np_port);
> Why not return here? It is a little counter intuitive, maybe:
> if (err) {
> 	dev_warn();
> 	return -ERR;
> }

It is meant to be optional, not having it defined shall not be an error

> if (irq_index < NUM_IRQS) {
> 	dev_warn();
> 	return -ERR;
> }

Ok - although if erroring out, I think it shall be dev_err.

>> +	}
>> +
>> +	name = kasprintf(GFP_KERNEL, GWCA_IRQ_RESOURCE_NAME, rdev->irq_index);
> 
> In case with not returning you are using invalid rdev_irq_index here
> (probably 0, so may it be fine, I am only wondering).

Yes, the field is zero-initialized and that zero is a sane default.

> 
>> +	if (!name)
>> +		return -ENOMEM;
>> +	err = platform_get_irq_byname(rdev->priv->pdev, name);
>> +	kfree(name);
>> +	if (err < 0)
>> +		return err;
>> +	rdev->irq = err;
> 
> If you will be changing sth here consider:
> rdev->irq = platform()
> if (rdev->irq < 0)
> 	return rdev->irq;

Ok

>> +	err = rswitch_port_get_irq(rdev);
>> +	if (err < 0)
> You are returning 0 in case of success, the netdev code style is to
> check it like that: if (!err)

I tried to follow the style already existing in the driver.
Several checks just above and below are written this way.
Shall I add this one check written differently?

> 
>> +		goto out_get_irq;
> If you will use the label name according to what does happen under label
> you will not have to add another one. Feel free to leave it as it is, as
> you have the same scheme across driver with is completle fine. You can
> check Przemek's answer according "came from" convention [1].

Again, following existing style here.

My personal opinion is that "came from" labels are more reliable against future changes than other label 
styles. But if there is maintainer requirement here then definitely I will follow.

Nikita

