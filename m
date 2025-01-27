Return-Path: <linux-renesas-soc+bounces-12593-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC23A1D86F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 15:31:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 506A97A19E3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 14:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE72F3D64;
	Mon, 27 Jan 2025 14:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8qzGeWL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39827EEA9;
	Mon, 27 Jan 2025 14:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737988274; cv=none; b=D6+ud7D73HUERW6FtWGp8ES1lkshzRQK+39SbW5tfsCoExNkxLea2OkkV94Cj7wdW/SXzjLZ9k6R/J+JhyTayLPy+4gUcWkQNA2v/4bV11T6RP8pA9KIDXtUnTAW8G3UdtJDyS+NBxZSMc8woYIkqumYzFO+iDiveN3WCFb0Fj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737988274; c=relaxed/simple;
	bh=zU0fxFOkvfzVrKZR7ViUcR1aZNwVNUwArGEz05+MtOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KAZF24Dnnq4ES1drJdRuPwBJwSq8iD3eycAs5Kb2IvVKban377B2+0N+ekqaJ8cLysAbEcg5LFwgfwnZIg9KpAuRzYhjrulloR5SdnAgbbM+tEiwtLQVXG5MDAPSrt7AnEsYn9SuCBTFFYxdDPsDXe07TJ0esuwlWJXm9StOs8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8qzGeWL; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ef8c012913so5900418a91.3;
        Mon, 27 Jan 2025 06:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737988272; x=1738593072; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=LuFEgyv1dedqXrzX/nsW3lcMJ2MZGzpR9ztFbQ4Hy70=;
        b=W8qzGeWLrjGnD7h/HtYrnWaJ+Hl/xAEYGGNYcZIslCeEp22tEAEXwkP5iHeB773QS8
         NosVu9OFj6aB3ECU5imv2HKkrnaBx6OWpGFdiQ+q9x3DPDlGICuRAaAL0OeaR9FqlJFJ
         jLGrMDiSPDuo1BGjMFKLQ2JXsZnxa7tOrPQNCYxBz14v8TdQl8ozTY8BkBxBqjZmPHoP
         FzTpjsc2dW6MvVV2DKhlSXbfEwBB6XUyEPXst8le9SFkrNMLGlCgjE3gu7Tt7nCwLXCj
         dgwTbrHAF1vbUfgnGJDfPzJTVx/x6JRP0gzchGjilPQ309d8IG0ln9aa51nvcA0g3p34
         MVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737988272; x=1738593072;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LuFEgyv1dedqXrzX/nsW3lcMJ2MZGzpR9ztFbQ4Hy70=;
        b=sS+reL0gYzepU7eXoJKqE+EVwdE0Y3Iruovm55KOgNi34vyqJALTKYAHGKD+ihlf+L
         PeXHc7Vy04YpbjZa7xHwYPJbkAt9AgVEeRQ/GDjkWhwqj6dbtoCN+JW+SQsGIX/8ZN9j
         CB9Hj1beG54/jl+nnY/5mrm2IRwKvxuFIbEI9Mm85W4yLyXFvIW0X6+Bnv54TKYXmG+Y
         CKoeeB2V2PExOasCP3mVvWjUVUk4Xn7ZM7X6mI8c0fzzWVBa7qSEXQxlX9vDlAlT2GmG
         CkeSp20X9EtgnFqVMjPPKO++e2Xcrjx7Gqk4I/wKNxzrzXnPXk2mIvLL4dej7P1tUMju
         KNgg==
X-Forwarded-Encrypted: i=1; AJvYcCUgUg6cw4lcHgG5BXW03F5k3zIpLpBbf3M4Wab8sreKgvo7TGLJ5wGKIKBWPSCcQC6tpxxO4kQjdQyfDg==@vger.kernel.org, AJvYcCUt55QqeGpBHEdK69kIFV01LoxgGPAqbyU8wrZmmhGucIxOtlm2CYPLEWEIjo/CpFCDuXVZVSAUgh3f3Xd0InfJlzU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkVrHh5T8I6kjAst8wzmnFmIAR80p9M2DU1j6yRHoIuRcDvxmr
	PoBlq/IAABZ3Fl0vHZCIsrpw3u9w8yiBcAcBbQGwuzkar127Hz9kQxOzbw==
X-Gm-Gg: ASbGncuv4qU0s5ZSoV4syep/GLeLWL3hilRZU9+Tph/zlni2mpsMn7+B/6ZIEAVoYzr
	YlUg9xNtpfk4tTeMQOjZtzV8l6sVOF1MSVK5ePH/YHr1UMcHYW2DsFrXmtm4A0ZzXNSy1PLwWf1
	qc5XkD8drR+QaDt6TKB904PLPRM8TS6KOn2xa8i8ljK80StdCpyFX7KWKT0aGajvlkY8TpM2dty
	JFlfGDWVeeGhXGWiZGryq06+fTK0FMYJCgceha5eANLE56xCXJcvX15iI0NKY+KqaQldkjuCfYj
	PfyDsPR+czPIjm/kh5AeYSPBNK1jOMgl1ryVLv05FOHwsSpvb4d6mw==
X-Google-Smtp-Source: AGHT+IH0yUo7CE5SQwoonyoCn6fSemc9kYO1FQ8c+GBQSVimLkrA5QfizCfLlSSi3V9LzMoGY+FCzw==
X-Received: by 2002:a17:90b:280e:b0:2ee:7c65:ae8e with SMTP id 98e67ed59e1d1-2f782c700c6mr59032281a91.11.1737988270876;
        Mon, 27 Jan 2025 06:31:10 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa6b4c7sm7220658a91.27.2025.01.27.06.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 06:31:10 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <352b56e6-dfed-4039-9f0b-ab840bea4d93@roeck-us.net>
Date: Mon, 27 Jan 2025 06:31:09 -0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] hwmon: (pmbus/core) use the new i2c_client debugfs
 dir
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org
References: <20250123163304.46034-1-wsa+renesas@sang-engineering.com>
 <b59c8757-97d5-4d87-8648-adf27d7866f5@roeck-us.net>
 <5c87e9fe-06dc-44e2-83d5-96bd6e799a78@roeck-us.net>
 <Z5cwIimymydU-xvT@ninjato>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Z5cwIimymydU-xvT@ninjato>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/26/25 23:05, Wolfram Sang wrote:
> 
>>> I tried to implement it, but right now that doesn't work because the
>>> actual debugfs files are not removed from i2c/i2c-3/3-0020 if a driver
>>> is unloaded and I don't immediately see how to fix that.
>>>
>>
>> I was able to implement this after fixing the problem in the i2c code.
>> It works quite nicely.
> 
> Ok, that means once your I2C fixup patch is applied you will send out
> your working version and this one can be discarded, right?
> 

Yes, I'll do that.

Thanks,
Guenter


