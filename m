Return-Path: <linux-renesas-soc+bounces-11599-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D4E9F8C67
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 07:10:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7256C7A03C6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 06:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC838156F3F;
	Fri, 20 Dec 2024 06:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iovqx9nh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA6A19F116;
	Fri, 20 Dec 2024 06:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734675005; cv=none; b=N0Hk662q0dDSVvJLGrnrSd9B/VtsOLGfH5eYgW0Z6N7yn6aB+hbyZmldiTER8SAslVBBAK+ckWv2ikP3OvWHLslRov/VsUldPMJ7/OpGKfdzeQPjmed5AcYTpb3CxIBF1f7Rh9NNVbp7j7jqYGWZXyIqi1A7WvRmHO/McnGeBQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734675005; c=relaxed/simple;
	bh=7OemxBPo0GJ1lbWrPIDNkEG4CyQVVJ9v9rxOhdsG0rU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OywlIhwVE3v4XsRYV4b8zO3SS8CKfNYFjiuLGdZwTgzt+MIl3mlhrjpGa2RkLRPEAOXUT6VJD29CpQVk9QDhzJHIzUQ14qajA9XEYC1QFTGN3esS1zbl1Tv4XmbiVZ2sGsNmLnE4s4S8KUIWdUZ9oTc/sVaMZ4t9Ka6K/xavoiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iovqx9nh; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7242f559a9fso1934186b3a.1;
        Thu, 19 Dec 2024 22:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734675003; x=1735279803; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0NIRSlMXhSQScXDpvmztBclFzm6Z3eif6mK4KIFcCaM=;
        b=Iovqx9nh2sGeIaEipxbX/kbU/tOjb2wggL7DfCyD0Bi6B2vdNL8KKPwNDi8CWs1M5P
         uU+TZfk+7bKRvEvLvPQwZMopbKRs/t8ToLGCwsxRUaK6SgV9Y2OT1H3tkjFNtyEJHFZZ
         dxiPq80/rcvdV4zh+FnWPl3oZKofzTUSt8Uit6qFTPoMRMGk6O61YVuMtillwUCQosMv
         EQ+/AfO0Tx7YTCa5BhDN97QH3SNDdAzScL3RmrW5xnaK6+HUPhLtm0SiAAIGAX3kutM6
         A68n0CcY2qwrZJT7FBTGzIdtN2LHJRxyBMW1p7tYb7nekBqMg/2jQW4QS/8xrcTOrpsB
         Gm2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734675003; x=1735279803;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NIRSlMXhSQScXDpvmztBclFzm6Z3eif6mK4KIFcCaM=;
        b=JPZgnU90vgGJ0xyvzh0gl+urc6ZpVnya+w5TaJRFAJrpzi07CzyYiqNIngmXFNF8LM
         ZnlTziZg0wVVbiw0yr8JQtcDoQTbPtBe0OUvNaECbOT+T9MURxzGrJICbGeuT1XLVFAB
         ZcQmrRvD8+5x1GIlC6RsoJhjvituBhD1sfG77kqNa5zkqGW2s4MlyVVhDvCr6u+bgQ+h
         N6vcSYVfIH8nFJWU3dbMyOlW1HKl85gZZC+RmckAkCGO/iZ63nEEUksV6a4iQVqGmNRI
         jBDudrtbWJJLKd72Epi4KF+pgEwQC6rP+8cIkRs1XIYUBtTueedC80PKYVSDPVQeu1Aa
         EDsw==
X-Forwarded-Encrypted: i=1; AJvYcCUv8MR/irDx9a/1kNQJPgXq9OPyJGafIQ7/GnsCNS7MzIPrakLQZ3XGslkKSPEPhLtX40XBhX+rtmVWcw==@vger.kernel.org, AJvYcCXvQTUFjAn85QbOvUp17uOcZzc5iZ50meFxwoac7v6+4xMVSquMHWQqaax9yATp468j3KjMX6eeGXgEz9PZS1BQXog=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx23uKuDjqRl6jmJb58GDcNeuA7GOzyegcNFuTo6j8+25NcSX4H
	U1wYgXHuCBCttPm1gQW/pMeW9UVlqvfX/I6b2og5z7MvqV+FNpKm
X-Gm-Gg: ASbGncutkf87KZAX/vG0ILiEiijL8HHh26NOEAty0bH1bB2K31KwVHjGOkAfC4jngFF
	1JFWZ3cl5IsEsZlFwhtsTPX9eRGb6xHK86h1+9ztRus++OSSDtvCuzaPVxHQ4zB6dVKCGm4E+6w
	vDFs40vpGeLEiMHZwVKdQJ6HPzuRZQtynDX29D3L5Th6TpfKltsqytedCWnMFkb9HUiDjmG8KsM
	ANOchXYCWYwrALbSEFTZMGyDAOSAIzYSpMjUHPXb4IdmBGS2bgDwAEo1Kaojw4jKn36JPQmsBcb
	BWwvXE2O8wfJlJ/uBb6QTDfGWALAnQ==
X-Google-Smtp-Source: AGHT+IFJktsBaP9Lf2FJCyt1YcK6ZFjdxwAUUVsrR91VI611AUP9j1Wnh/P9/ZVfHHBi0taZRxXt2Q==
X-Received: by 2002:a05:6a00:2d0b:b0:72a:83ec:b1c9 with SMTP id d2e1a72fcca58-72abdd7bdb6mr2139337b3a.6.1734675002773;
        Thu, 19 Dec 2024 22:10:02 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad83616asm2333772b3a.76.2024.12.19.22.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 22:10:02 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8c8b2249-75ca-4835-a693-a5df841190b7@roeck-us.net>
Date: Thu, 19 Dec 2024 22:10:01 -0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/5] hwmon: (lm75) add I3C support for P3T1755
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20241219225522.3490-7-wsa+renesas@sang-engineering.com>
 <20241219225522.3490-12-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241219225522.3490-12-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wolfram,

On 12/19/24 14:55, Wolfram Sang wrote:
> Introduce I3C support by defining I3C accessors for regmap and
> implementing an I3C driver. Enable I3C for the NXP P3T1755.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Two things I would like to discuss:
> 
> - Shall we reuse i2c_device_id's to get a proper name for the chip?
>    Looks strange, but adding all the info again for I3C looks strange as
>    well
> 

I don't think there will be many i3c devices supporting LM75 compatible chips.
For the few i3c chips which do happen do be lm75 compatible, we should have
something like

struct lm75_i3c_devices {
	enum lm75_type type;
	const char *name;
};

with an instance for each i3c device, and then point i3c_device_id->data to it.
And I think "lm75compatible" is really a terrible hwmon device name ;-).

FWIW, it is too bad that i3c_device_id doesn't have a "name" field. That would
really come handy here.

An alternative would be to just use dev_name(i3cdev_to_dev(i3cdev)),
but that would not reflect the chip name and thus be less than perfect.

> - are there some suitable kernel helpers for dealing with big/little
>    endianess in lm75_i3c_regmap_bus? Note: I also tried to use the
>    non-*_reg callbacks for the regmap bus. But the constified
>    void-pointers make it ugly as we need to change buffers because some
>    registers are big endian and some little endian.
> 

i3c doesn't seem to have any access functions (kernel helpers) similar to i2c,
other than i3c_device_do_priv_xfers(), so unless those are made available
I think we'll have to bite the bullet and use local access functions.

The other patches look good to me. If you send me a Reviewed-by: and/or
Tested-by: to my patch, I'll queue it all up (except for this patch)
for 6.14.

Thanks,
Guenter


