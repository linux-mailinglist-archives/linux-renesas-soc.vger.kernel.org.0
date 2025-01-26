Return-Path: <linux-renesas-soc+bounces-12511-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8AFA1C7D9
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Jan 2025 14:14:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE46218860B3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Jan 2025 13:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 030331BC3C;
	Sun, 26 Jan 2025 13:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sga8YK/q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6E025A642;
	Sun, 26 Jan 2025 13:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737897248; cv=none; b=Of67c6emRYCfHAnBnL/nxduvVR3ogRC2gmRX1PPBtNYU90Xjl8CYeHc1BXYFnLbvAZcqPMJO0jqVo+WyKG5Srjkq/AwNMgilRH0Kb1ajWcRDOq8JGRe7BUQXw4ABktgCN8/EgXrtLYjeVNycXW6bN5pFIGT+BcNQ5IJIZKGK0c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737897248; c=relaxed/simple;
	bh=RO66gov6nya+5jLxxjtlnbewF/WrhoQWdeMhfxD4I7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BIJf+yjeJQ0EzbYJi1Cq+Y/z7qvH8xDafPBl1alw23BsHoEDQPdYamOwQ1OsRBVydIqpSASVu+45uO/NjFEvYFjhPdN8mpVuKFDm7/by1WrKghUHL4eRCsaHaSh8F/wBRWU1YDQuJO865bB9Rf/3WkpcK71VUAHKaMGhjrK3fXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sga8YK/q; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2164b1f05caso60382065ad.3;
        Sun, 26 Jan 2025 05:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737897246; x=1738502046; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=L5TACNV8jHE9GFf+sHJchBx4g3muny07jODzR7Nmr7c=;
        b=Sga8YK/qtjlCbdN1XZ9ejRjeteBTtvXw/UQ0H0ISIWJMH+M/zXdvoM/FVQDteNtU7A
         ns8vDEjKdWCSrjD3QMN4aSNnCWJwH/E4ZfG0cXfRx6ULquBltllkj3yx7i1SMsMKCfcA
         1onUv4RGRBKg6/aKrs6gaQZBj8h1FbZD1yfp9qP3BwTme04pauijrEDYqn1MH1Yd5DP1
         AwCfhQH/5LfYH7eF2zyOAy/vk9kmCf+4bWytGcu/z2P1t8hk2hyHFjrsYOPaOgjrsjqE
         +TpUbuSxKWtDN+fYeOJJmD2MPgjiGwolGlMoZfEOOTqW/Lquf5jcz5ScNe0HwA50MSBz
         4URg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737897246; x=1738502046;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5TACNV8jHE9GFf+sHJchBx4g3muny07jODzR7Nmr7c=;
        b=mwRYI04w+u+WblbrWZGzgZefcOQTRyIhL+s95yRD+1z3qjoMpQZkHxo5F0EhWY2tTg
         7OsqSSHYY+NaDZVuXt0WtV2/xZixVB7gB0LRlPAqEDBZQQ4AZwCTv906R3DOmgfN9TXD
         I7UlmpBZ/nEYXblJUetq3uweXWMK0+qdHc8MvdEAL++c9fAvP1Bg776q9Wd0JM4YoLdd
         SW2iLXOtFjhJwczs3e6Czdlarm3X+it9XHysxRx5l2yHq1Efrc1IOQLQJfSxC5/xep5v
         JRcRmKonJXrEbPSqxQCSJWtz/EghkwwSLlhkxJZO0fwHAAcC9QRwB3nG0bPrUDJAhziT
         Fwgg==
X-Forwarded-Encrypted: i=1; AJvYcCVVQ/StQhbV/rvIE1QU0VR3gAP4CZqd6ufekFlM0IOD8gLEHjM/Qq0vDMBUr7V5ftZ4XiuzABi9mb89HcZfVGdmsNo=@vger.kernel.org, AJvYcCVsuCaodgZlUpyUVNX9PIIkKFKVsz98PjN+2CnBqM7SYdRwWFxcwfYsMGXoFe1U2Er9UFweL3NSvwgyjg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxle6PqNFSxkUMoR/MOhlXM95gBWdgwYIuAqlG+bWum6hvsvA2O
	M6N8EBLN+bFT2ISabpyACCtpILn5F4BimpSjbDFhcIO8Dq1MjSxqeuQRZQ==
X-Gm-Gg: ASbGncsyTik5AD1pDd3YvP3HDr6F+sViVGlzgM4depfOCqlviwFv9+hMqkkLWl9Qvs/
	Mj57di/OcItIFJuT5toi+iv/TV502KGEaqnxZ+GRQtLbjWv6Jg3MWz0fh3c61FAlbVZr/Ky0bW8
	PQpCD2HwgifYXQa4Fc9/dKK8gz00H1Kh+KHdozQ1+BKDAoJIsRWIMvCneloJI1RhWOJ1Jf22TjD
	LKSosCd2/YcC1Lm/k5yi/aJfCjTYU1+4D5SrBH9JUzRYmBVaDjK92if5B7iHOGAu5UdfgNabyPO
	OL/BWs0g/SDy0efmqyq9bT5yuTiFP9ujNHYlUlWmYZJ7Su0ep44J7Q==
X-Google-Smtp-Source: AGHT+IHFBXAIP2qMI4za84brGN5AoTHmLfscUOZqjQPw0xOwR1mO4yhsDRlLpuAc72v8fHTq59inzA==
X-Received: by 2002:a05:6a00:2e15:b0:728:e906:e45a with SMTP id d2e1a72fcca58-72dafbfd7e4mr57912507b3a.24.1737897246481;
        Sun, 26 Jan 2025 05:14:06 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a69eb69sm5336665b3a.13.2025.01.26.05.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2025 05:14:05 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <abe834aa-4989-4480-9f68-3187e0d113ec@roeck-us.net>
Date: Sun, 26 Jan 2025 05:14:04 -0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] hwmon: (isl28022) Use per-client debugfs entry
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org, =?UTF-8?Q?Carsten_Spie=C3=9F?=
 <mail@carsten-spiess.de>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org
References: <20250123160347.44635-1-wsa+renesas@sang-engineering.com>
 <3c265d34-9442-495c-a715-be2eab3b37d7@roeck-us.net>
 <6da29214-9ea3-42af-9ec1-7ed5a2da7bfa@roeck-us.net>
 <Z5YgfT1JhhzlLdeD@shikoro>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Z5YgfT1JhhzlLdeD@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/26/25 03:46, Wolfram Sang wrote:
> Hi Guenter,
> 
>> I don't know if my rationale is correct, but the attached patch fixes
>> the problem for me.
> 
> Ah, yes. I didn't think twice when seeing that the debugfs entry for
> adapters is created in i2c_register_adapter(). But, of course, this
> function is called from the probe() function of the parent device.
> 
> Your patch is definitely one solution, but give me a day to think more
> about it...
> 

Sure.

In this context, it would be great if client->debugfs was cleared if creating
the debugfs directory failed. While debugfs functions check if the dentry
pointer is valid, that is not the case for other kernel functions. Knowing
that the pointer is either NULL or valid would simplify drivers (such as the
PMBus code) which need to make that check.

Thanks,
Guenter


