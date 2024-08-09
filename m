Return-Path: <linux-renesas-soc+bounces-7784-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AFE94CADD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Aug 2024 08:59:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60B9AB24160
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Aug 2024 06:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597E916D4CD;
	Fri,  9 Aug 2024 06:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ksmHMeM2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C49716CD25
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Aug 2024 06:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723186732; cv=none; b=BcyYil2y7JIAG2oMRcPlwOeHrZXUoLUt50Af1W6gYhKEzEKZSQoWklAh200Q5pTXp6zWiASlNr5jP3qSBmAGs6/O8o3hLhkLDAYuGor0a+FUwZalMT8H00UQmqFyANICb11PA3ThkLWzi0fiKbpGxOzbGqDqp/g0/W+nfWl+vIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723186732; c=relaxed/simple;
	bh=TxEuo8PSvKW7sduTd2C/87bj5Lf0zFoWEoWYisJcNJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QNbNidWGnBgAPAZqMtb0efEBdqn15rpGjNLsVHMONK+VxkYyxXkAZTPC+8ELuSFHxQI75EDbCJpIvB62TUbKgW9g2E6/+5VbJPfQqBG54tp7uCWBUX38niOc3D66UVlZ+ICt6wIAhZCObCH1ipE00piCdRhYQDiDFl8/MjF7SZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ksmHMeM2; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-426526d30aaso11661885e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Aug 2024 23:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1723186728; x=1723791528; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uGc5A46qV6UquRjkM3ksrI4LyOrgPjryvM1vbGxiy2w=;
        b=ksmHMeM2e8uvc8yogRehvFr1Ign4n0h2lQ81ghIlONzkHeIMO15w3ujKcuplxYx8cM
         ligaw2GhyOiT3Hi6G+7Znb6YAB3mRtlYJ9woD3O5zpNynn77Jzbtw92SBSVS4oSM7jLZ
         /KHyuaa5WcyTEuKAqESU18VeY0KPYldQEYd+oYFDAcdq4JeY6X/qqSVfNUDTWfc9zUst
         HspSXIxMfwvAeV/o7rxJjDV8WMV5c3qzwJdVmJzDGIEzX+9n1dFqfNnazHogCWdQRDVX
         fjNejHrioNcC3z2snm8Rp9XV3aFnSJJjSbDL8eHgZ51aRdHtIXk5RXYe5JEr02Lnw2AP
         VrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723186728; x=1723791528;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uGc5A46qV6UquRjkM3ksrI4LyOrgPjryvM1vbGxiy2w=;
        b=LB+1ADFWn5X0x592F9MM6EOY4/lLh5K7Uu0Tcsn1eSRLjh3ek4EOTd+PB9WTWn/gLx
         RMAh9RdAiJe5C1NdCXtYtB18O5t+uEOnxIQqNe5erMVjPxW1dYLR1XcdJ5TsF+VdMjXJ
         qKST7tGEiaRNY+l/Yu5l7WjL7awE+u002hKGa/247bycvV74i9KLYhpGDlILPgmoqAL/
         dn8FoIL5l+IXFNEKxSQOtqS2NqJZUNs7ADUB+J+Q+fYYCYW+5NcxDJRfd4vSi85bcegO
         HLDExhq7f7wV9M0LZw0ApKwcbenLK6RmK19GrshmV6gvt8vzSOu9orEmzYbmynumEr6D
         xV4A==
X-Forwarded-Encrypted: i=1; AJvYcCU5Xyuqf7KS6qfEsvxiTNjnCANgNnYfhZ/Y+QNX8nFpGRP4jBisk5BMPpi/vkpWHs5LpIFpVNf6TneXxMigQhkaPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5j+51Mtmu4lidBTwaZSphWmaGZ11X3SLsOBJjn5MLGoVD2T28
	u5zQXlOio4cTwalxlpXulh6fHHr159kQLMzrGh4n19edVv4xq2vUFjFHocpJFPE=
X-Google-Smtp-Source: AGHT+IGm/y8RDXHzdicUeoWix6eAGqqwf0eYXZPWoxOm/P5yFySKVcqSkslxkgIrKK/4iP9LU3HPEA==
X-Received: by 2002:a05:600c:1d01:b0:426:593c:9351 with SMTP id 5b1f17b1804b1-429c3a179ddmr3569475e9.6.1723186727736;
        Thu, 08 Aug 2024 23:58:47 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290597199fsm115055415e9.14.2024.08.08.23.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Aug 2024 23:58:47 -0700 (PDT)
Message-ID: <58117740-1414-49fa-b58c-db228079f406@tuxon.dev>
Date: Fri, 9 Aug 2024 09:58:43 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/11] i2c: riic: Enable runtime PM autosuspend support
Content-Language: en-US
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 chris.brandt@renesas.com, andi.shyti@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
 magnus.damm@gmail.com, p.zabel@pengutronix.de,
 linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
 <20240711115207.2843133-5-claudiu.beznea.uj@bp.renesas.com>
 <ZrTfc5imZgvduGc8@shikoro>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <ZrTfc5imZgvduGc8@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Wolfram,

On 08.08.2024 18:08, Wolfram Sang wrote:
> On Thu, Jul 11, 2024 at 02:52:00PM +0300, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Enable runtime PM autosuspend support for the RIIC driver. With this, in
>> case there are consecutive xfer requests the device wouldn't be runtime
>> enabled/disabled after each consecutive xfer but after the
>> the delay configured by user. With this, we can avoid touching hardware
>> registers involved in runtime PM suspend/resume saving in this way some
>> cycles. The default chosen autosuspend delay is zero to keep the
>> previous driver behavior.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Basically, OK with me. I'd just like a comment here like:
> 
> /* Default 0 to save power. Can be overridden via sysfs for lower latency */

Ok, I'll update it in the next version.

Thank you,
Claudiu Beznea

>> +	pm_runtime_set_autosuspend_delay(dev, 0);
>> +	pm_runtime_use_autosuspend(dev);
> 
> Other than that:
> 
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 

