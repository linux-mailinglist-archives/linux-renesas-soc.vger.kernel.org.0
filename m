Return-Path: <linux-renesas-soc+bounces-12595-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1C6A1D8CE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 15:55:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51648165635
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 14:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0FC855897;
	Mon, 27 Jan 2025 14:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAgdN5Zi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FBD17D2;
	Mon, 27 Jan 2025 14:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737989750; cv=none; b=lD3V6yUHP6jHIRNB8LesHaatghqKMDAxN4Fc3erXbdN/PPUykfJeDoKemuoexVIFzLAi7lTO+o6ZX2Kp7KoI6yLJZma24i0VptaN5xJ7/RriY5PvDnBkMELq5VcSfi/lhdukwEN0CfPZkmo/vigG5KkvHjpIGF+cyGM8xGRUFsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737989750; c=relaxed/simple;
	bh=CEp9Gx55T6zpuqWZkJF8JFIM3G1E/ghQlVEB7+6Ylek=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jiBevpzLSyutzkEbR1ecd2k9DoyARUoZlE7PwP9a6pBxxb2p5DGZB/V5bwQUpgTZSKF1gGvz4KJJ8MksFXUgJFYDYKn79Wlqm9+3a4CvwG9NxQOtHJp/Z1lU+IDPUSVhsnrXRQMtF509HEuYD3Go2m1sxLnAK0ndghv5nrmYErw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAgdN5Zi; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-216395e151bso57490305ad.0;
        Mon, 27 Jan 2025 06:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737989748; x=1738594548; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=nNiNxCC6weilHsFerg9QH3W496S8axT2kKVp6XqugOs=;
        b=MAgdN5ZiVaYF6R4XjHrk5K1FRkqHfDeFzFaIo00jbWisZNWsQs86XW1XKFwC5XsLo5
         TDqaT8ck5XRFg2kWP+TguSNkcOl0/tX21g+Lt0Lo9zoSIFyUfk7u+IWiz5dvYW8vpWwW
         ioPj5dUPfsHDDT5JJek+GAglP+xmwSRhUY/oJvjtTOtsrfuqRSV+gL1FC+01UfOvRN/+
         ITtYlZs7NCkwmhNqBo7HDpVRqnx0kIplzDLaD3RDcxzgIoflL/eEdq+iBCxRYZRY1BIS
         pTem2wMMdcLz4l5FpOH6f5NTMouhVM79BbOOSEZZWBaCZXMs20UhrIePaAiVYTCasWU6
         8VOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737989748; x=1738594548;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNiNxCC6weilHsFerg9QH3W496S8axT2kKVp6XqugOs=;
        b=WHeaQW2Ug24R8JeIyLwySuOIww9KetI3C0pbKQ87Ks2/lU0QfcY1Y1fa2/0g1WkMvl
         dUMuimeVvPmNnUqWB8sGuCvyr2g/EYTJTmImsQDsgvtEHk9O7nyDlYvF9yQsdFHp5s9F
         6QEKYS5LE9mr690kcGSyCT9kOkcyskqjakfHpXgXbarGBtKMyRhns4wKoUUbpIEurWm9
         Ix9U12vrs3AaXvsGg6k3pS/oVv5W2NdcUP2+FCXDoaQamke/C0C6OwJQXGtke/sXNAT8
         j2PBZyeFwqTt00TMYSwYaPdt5155z2vXEi/7C0sYYquP8oofZn4CZv3zEE+VPF8eIi0k
         TTvg==
X-Forwarded-Encrypted: i=1; AJvYcCUWgR6w3REKZseCOn0XxzTbfDTysN9CbyAQdZdCTggYKhTzmwqrnnjQ6MqEUU64nyUApmobYDEpFE0AkA==@vger.kernel.org, AJvYcCWA0pFvgEPfgZ7gJdhzQp6eL32IMa+a1i4epIk52fUoY5P2B3Ro5VFCbY3v4IcjqWsnUnm6z8F7U+fTEI4Ll5CDtro=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTLuM957krHs201iCKOoeXnFruwWk/Qgfo3uJ4VTa07fszUn+8
	JUhT145UpQCofr7jOBZUs4HVluYmVALCLiBBFom4rg3rGfKWA6BGpXA+jA==
X-Gm-Gg: ASbGncub5srafEZNLDh5Zo5uDZXQgcavcUQct5b8wmnzWnUWuf2foUPUPc//Uew4ih3
	0LchJJBgpln2f3hdj1RKujf+24cDmLtUhcvJVudsIvFpx5miwI7ybGqQPQM8E+sPBcPDJ32CosZ
	ma1d7K1DEYyGOmtNVCUqGSJFNI4MYamPWQp0faU+nrDa0e1+tOIkFRYtftnJyjE5C1SUoktDBQ4
	PyOVTYs+mmd/FieNG0TI8qMr5VXoi5bzOHzdAKEpvfDfK39cYiJ13GZX8Tgh3pnew58WrvJxTdG
	kHIvrMDv72KbhYS3tvoXkdIcwdwIMLOHzPshUsslg3SPgJmyBsvhmQ==
X-Google-Smtp-Source: AGHT+IGZj/Eu5lGh+OMmhgVeErGckCRLnCKrQFr835twGbp1Xpl15udk1sJbf1X/nGqtYBgpTBrdSQ==
X-Received: by 2002:a17:903:2445:b0:216:11cf:7b1 with SMTP id d9443c01a7336-21da4a54444mr198706295ad.15.1737989748110;
        Mon, 27 Jan 2025 06:55:48 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da414daecsm63701355ad.177.2025.01.27.06.55.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 06:55:47 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9bc2d621-65bd-44a0-aa2b-c123ee901722@roeck-us.net>
Date: Mon, 27 Jan 2025 06:55:46 -0800
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
 <abe834aa-4989-4480-9f68-3187e0d113ec@roeck-us.net>
 <Z5cvxJoXVP5QqbEH@ninjato>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Z5cvxJoXVP5QqbEH@ninjato>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/26/25 23:03, Wolfram Sang wrote:
> Hi Guenter,
> 
>>> Your patch is definitely one solution, but give me a day to think more
>>> about it...
>>
>> Sure.
> 
> So, the results of my thinking further and looking at some other debugfs
> handling resulted in: I think your patch is fine :)
> 
>> In this context, it would be great if client->debugfs was cleared if creating
>> the debugfs directory failed. While debugfs functions check if the dentry
>> pointer is valid, that is not the case for other kernel functions. Knowing
>> that the pointer is either NULL or valid would simplify drivers (such as the
>> PMBus code) which need to make that check.
> 
> Sure, we can do that. Can you add this to your patch and send it to the
> lists? If possible I would like to apply it this merge-window.
> 
Sure, I'll do that.

Thanks,
Guenter


