Return-Path: <linux-renesas-soc+bounces-5784-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E74358D84B6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2024 16:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39C7FB20BCD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2024 14:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 578BA12E1D4;
	Mon,  3 Jun 2024 14:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f60kxw0t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1722757E0
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Jun 2024 14:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717424237; cv=none; b=AZPNWQ3hsUKYC+kQl8zzEbDNAv9vRRrjwehcrCgez2zkmPWfvluT/TnWD/mK8vwzIBoOt5JhSaZd8n9vG6Sdvs/UNi6yg3iXuXlMX8WV3GeQiqCzB4A5Va2iFw4R4s40JFxhxatpP74jgESn3OUJcrc+uJD+fgjb2cmMvSkMvLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717424237; c=relaxed/simple;
	bh=mB42GeWihI/UnySxYDKsPF06FNhZIZVrKClUa6ZXkK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qzsdJ3FueR0jhR0261A7bltNLoAaYNxBbcEX/EhPugrO9mzlmltPqKY7rlQJos4LzdT5hDUb6Fmt0Pcf8IzskAa59A315al8AtoSihly9NcSNtdPNaGy6FL/sANrXRaylWUXagsNYXeAVo5oHGVTeFJ2UU/OF2AK1qYKutuST3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f60kxw0t; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717424234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLk9HWXXmuijfDLUc7HCk2M98+TmBAchEzBPpKKETig=;
	b=f60kxw0twgK7HfJe8hMvgrKoQu7Ubjbse6TJ9FqJHRKsNPUXir0P2fe6qtByBV0Qxs2Dgw
	GIA2dihdT2s8Et0lNdB/sxCG1utnkQhYXXQFzXuuT2KNRat6cHhb1pTQoyo7goP3HUAqnX
	T1mem2eP3ICmSdKQiDbeo/HVVetBDt8=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-3W-qTcmwP7Kcjhap434vTw-1; Mon, 03 Jun 2024 10:17:13 -0400
X-MC-Unique: 3W-qTcmwP7Kcjhap434vTw-1
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-7eb10ca258eso225756439f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Jun 2024 07:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717424232; x=1718029032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLk9HWXXmuijfDLUc7HCk2M98+TmBAchEzBPpKKETig=;
        b=szdGYsek3fEUsNS70/ROjCkLBxr1feXNO5i9tA0t+A60/2PKdtgqEymMaHKo/ZV+YE
         rsKgrJXJZRgzE/PPsfcnAubOy3wwx0bbo/EsiA0eb5K0P27sGAhYx+wPLXhuo3uDylgE
         6qy6H3eHE7rypb4OF3NYvudk/w65a+KwqpQ9WwKH2o5Q4zYW+nxnq3RJ+d5zrZIdZl81
         sPKp9eBPI4K4HQAS4s2lckKcX/CQP7xnM5TkY26++lHo8maYBrSmO7jL1rIypjU4YgU0
         urXF/9FW09iHh4AHqTZ38CVVWqZfR4R//3clFC5Cu/35WBDpiO0BRScOcHnS38iWw1rU
         jlAw==
X-Gm-Message-State: AOJu0YwNMQhUoyyG5cp+rrk2dBS/qk4k/czVfH9CYDv36PU3WiT7gx6X
	u52W8nt8MPNvNsuUhPExcpXEtFFKLG4gVk3sBwFXDa6f0WEDz1/yNXC3UUvG8V7BZV5JTrxAIFr
	h1ONLxVwywtPavqun8iTFlP0N4pr5pyYURu/YlI1iQagyG4LwMytpNhhgWfDfax5l40V6
X-Received: by 2002:a05:6602:1603:b0:7ea:f970:36d9 with SMTP id ca18e2360f4ac-7eaffeac9aemr1169892939f.12.1717424232572;
        Mon, 03 Jun 2024 07:17:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSK0JZd22UF2ZfugGWJ6NPGbhYoYtjjYlIjpAxF42ITiFy/yYyDhpybZ0dOX6ZyTHfgp5QxA==
X-Received: by 2002:a05:6602:1603:b0:7ea:f970:36d9 with SMTP id ca18e2360f4ac-7eaffeac9aemr1169887339f.12.1717424231706;
        Mon, 03 Jun 2024 07:17:11 -0700 (PDT)
Received: from [10.0.0.71] (sandeen.net. [63.231.237.45])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b5f1291571sm131336173.16.2024.06.03.07.17.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 07:17:11 -0700 (PDT)
Message-ID: <7e8f8a6c-0f8e-4237-9048-a504c8174363@redhat.com>
Date: Mon, 3 Jun 2024 09:17:10 -0500
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] debugfs: ignore auto and noauto options if given
To: Christian Brauner <brauner@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, David Howells
 <dhowells@redhat.com>, linux-kernel@vger.kernel.org
References: <20240522083851.37668-1-wsa+renesas@sang-engineering.com>
 <20240524-glasfaser-gerede-fdff887f8ae2@brauner>
 <20240527100618.np2wqiw5mz7as3vk@ninjato>
 <20240527-pittoresk-kneipen-652000baed56@brauner>
 <nr46caxz7tgxo6q6t2puoj36onat65pt7fcgsvjikyaid5x2lt@gnw5rkhq2p5r>
 <20240603-holzschnitt-abwaschen-2f5261637ca8@brauner>
Content-Language: en-US
From: Eric Sandeen <sandeen@redhat.com>
In-Reply-To: <20240603-holzschnitt-abwaschen-2f5261637ca8@brauner>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/3/24 8:31 AM, Christian Brauner wrote:
> On Mon, Jun 03, 2024 at 09:24:50AM +0200, Wolfram Sang wrote:
>>
>>>>> Does that fix it for you?
>>>>
>>>> Yes, it does, thank you.
>>>>
>>>> Reported-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>>> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>>
>>> Thanks, applied. Should be fixed by end of the week.
>>
>> It is in -next but not in rc2. rc3 then?
> 
> Yes, it wasn't ready when I sent the fixes for -rc2 as I just put it in
> that day.
> 

See my other reply, are you sure we should make this change? From a
"keep the old behavior" POV maybe so, but this looks to me like a
bug in busybox, passing fstab hint "options" like "auto" as actual mount
options being the root cause of the problem. debugfs isn't uniquely
affected by this behavior.

I'm not dead set against the change, just wanted to point this out.

Thanks,
-Eric


