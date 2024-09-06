Return-Path: <linux-renesas-soc+bounces-8810-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9329596F3D1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 13:57:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A76B28138A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 11:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B660E1CBE81;
	Fri,  6 Sep 2024 11:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jCMbPwgt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2874317C9B;
	Fri,  6 Sep 2024 11:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725623855; cv=none; b=p5EgA5WX3PZQ5WVB7GE6a3DJeU9Tp72hKLpPTb9tVzWr7U01nnPYpw2F7ehtbwwdHm+QGcAPMbv4dCfSx89wvCfUbKA8EjQXma6jrptjOalYZdfa+eB1I0/SS3N/Jlq54wxYK+pL9DBhED/OsjnpUwpH5Ee1frjBVof/CBZuD2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725623855; c=relaxed/simple;
	bh=b0CLLIv2PemEsUX45ms2pF+n3IYnuwP5pc8KKcHdHk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VQcKzl5ZI+BttPd5QWghsFPdlWjdvGCG1N04hGY1aHHnPXEBvhtTAtbc27nsII+GCA+moQiU0P+XdMMnpjK1zzflZC3qAbkCj3bAGRaXbcaaOhwExkBE69cwVlYytFxEZvLOmEyxkPzSxK2OriMQrMGJQ2V1ASqN9ZCbgQNgiak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jCMbPwgt; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20570b42f24so24964325ad.1;
        Fri, 06 Sep 2024 04:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725623853; x=1726228653; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=dzB5LBCMYuANzhHIIbc6CB10MPsKWXZD/kQlK4XkFtM=;
        b=jCMbPwgtRbowthknry7yFlWr7OFSsuMfzzyR26f2SzISSgUGw7nNiAyEFppst+doqS
         I3tDGRsXaG5XPrwMQoTNNPSMX0KW3mEL1tlAiubTyf0Cz9iHl8e13kZL6i2wirMmaMtY
         IAnmhJleZYD0YVZ3klLvIvsnWMy0RWE0qUVGjcx+shqJzt3is3L+/BxuUZK6WrOjYZga
         Jj9w/aTyMrpv9X5rAwexSDLSRlYV2/y4SZoWvv1tJ37vK4PcusSSCVDzwgD4JBoWMqzq
         ROkMNxoz5dPL8PFa3Ji9CfHJ76CiTUw+NmVB5cxYBQnxSGg4QpFs+D0YFtZmyfzAv88X
         hQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725623853; x=1726228653;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzB5LBCMYuANzhHIIbc6CB10MPsKWXZD/kQlK4XkFtM=;
        b=sw5Kn2LL1H5BujzlQX0ICpqrrXNLLqVJffpqXSdU+gdu3hp9E39Umgy0vqrcNapOMV
         gG/SA/4hSoF0SEuednK6xksMqQyXewe5EXgfed/1oJR3ZmIPROKCmsNRvMMF2oTafXxn
         usGzHCQNhFz4wd1x9uOZ1BmxKrBBGpvDMORnJc4plx6ptmUXCzOTML0I5Ym+B3wxa6TH
         ADJ4bRjPGmiN/th+kjUaFnjNHy+paLMghdnrZmYHDtXWWCZXwOgnzQFBIvxU939Un48+
         i6B8k4gAoNmvJusr1qNAneXE+qOCLQedreBzCZDflRfSm1U/w/+q+m3BW0RTeabwUWUc
         SUCw==
X-Forwarded-Encrypted: i=1; AJvYcCV2L1+q+0Rw1/Jkcp3kZJHTMygWOa7dfXnuEWkpPMU11VMSyZX8dY2nMniW3wguhMb1+LyGgYfkDbV3XHzsqEfs3PQ=@vger.kernel.org, AJvYcCV6p6ps6cWMFFoAUq1UEDmfdnvNzZ567zC71FRMbY+eVES5ErxgjgPwjWoaV8Ax1jqeCAHl86ChKs3gYg15@vger.kernel.org, AJvYcCV7qSH7r1H3MZ32jBXCtSPkYyOhRRcRIVrlT1tQGNv03kxmor0ns2iYOmTuBdIMxdzo2cs5YydBiVKenLU=@vger.kernel.org, AJvYcCXWk01cJt3F0/tvSSDF7f/ZTcmoJlGdz8A7Ay42hQvzHOai1Yx36X27qnJHqUJW9Y+9s27b24XMnGCo@vger.kernel.org, AJvYcCXYIoBPk96Ld4udQD/VpCoj4q7ePxy3T6tDzX7DO38Bxjpq9Kz3sicVXw3rvnWZ2vNjRVhNTvF4naBg@vger.kernel.org
X-Gm-Message-State: AOJu0YwjVm/T0rrbhVU1CCLME8QzHlMD7bj7j8QodNgFvJJV7AppkNpZ
	tlCKgZCGGdbEBIAg0mvdtI6yJ3jqoTGuEDIFOyjTtYgfXaCYPeNmsMr7Tg==
X-Google-Smtp-Source: AGHT+IGUxm3sEDjh74gWioKlJTNrpqFlzbVW9aixMNI5nXyCNfH6HSe+7PKOz73Ts03fHqGyhSEERw==
X-Received: by 2002:a17:902:e892:b0:206:8d6e:cff9 with SMTP id d9443c01a7336-206f04c9f2amr18439395ad.4.1725623853253;
        Fri, 06 Sep 2024 04:57:33 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea6707csm41942875ad.255.2024.09.06.04.57.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 04:57:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6eae121b-3b0e-4938-8527-ec9a8a0b9aba@roeck-us.net>
Date: Fri, 6 Sep 2024 04:57:30 -0700
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] hwmon: (isl28022) support shunt voltage for
 ISL28022 power monitor
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz,
 =?UTF-8?Q?Carsten_Spie=C3=9F?= <mail@carsten-spiess.de>,
 Jean Delvare <jdelvare@suse.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20240906061421.9392-1-Delphine_CC_Chiu@wiwynn.com>
 <20240906061421.9392-4-Delphine_CC_Chiu@wiwynn.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240906061421.9392-4-Delphine_CC_Chiu@wiwynn.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/5/24 23:14, Delphine CC Chiu wrote:
> Added support reading shunt voltage in mV and revise code
> for Renesas ISL28022.
> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
>   drivers/hwmon/isl28022.c | 93 ++++++++++++++++++++++++++++------------
>   1 file changed, 66 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/hwmon/isl28022.c b/drivers/hwmon/isl28022.c
> index f0494c3bd483..01220fad813d 100644
> --- a/drivers/hwmon/isl28022.c
> +++ b/drivers/hwmon/isl28022.c
> @@ -85,8 +85,6 @@ struct isl28022_data {
>   	u32			shunt;
>   	u32			gain;
>   	u32			average;
> -	u16			config;
> -	u16			calib;

I don't see the point of separating this part of the driver from the first patch
in the series. It makes me review code only to be replaced later. I am not going
to do that.

>   };
>   
>   static int isl28022_read(struct device *dev, enum hwmon_sensor_types type,
> @@ -95,20 +93,61 @@ static int isl28022_read(struct device *dev, enum hwmon_sensor_types type,
>   	struct isl28022_data *data = dev_get_drvdata(dev);
>   	unsigned int regval;
>   	int err;
> +	u16 sign_bit;
>   
>   	switch (type) {
>   	case hwmon_in:
> -		switch (attr) {
> -		case hwmon_in_input:
> -			err = regmap_read(data->regmap,
> -					  ISL28022_REG_BUS, &regval);
> -			if (err < 0)
> -				return err;
> -			/* driver supports only 60V mode (BRNG 11) */
> -			*val = (long)(((u16)regval) & 0xFFFC);
> +		switch (channel) {
> +		case 0:
> +			switch (attr) {
> +			case hwmon_in_input:
> +				err = regmap_read(data->regmap,
> +						  ISL28022_REG_BUS, &regval);
> +				if (err < 0)
> +					return err;
> +				/* driver supports only 60V mode (BRNG 11) */
> +				*val = (long)(((u16)regval) & 0xFFFC);
> +				break;
> +			default:
> +				return -EOPNOTSUPP;
> +			}
> +			break;
> +		case 1:
> +			switch (attr) {
> +			case hwmon_in_input:
> +				err = regmap_read(data->regmap,
> +						  ISL28022_REG_SHUNT, &regval);
> +				if (err < 0)
> +					return err;
> +			switch (data->gain) {
> +			case 8:
> +				sign_bit = (regval >> 15) & 0x01;
> +				*val = (long)((((u16)regval) & 0x7FFF) -
> +					   (sign_bit * 32768)) / 100;
> +				break;
> +			case 4:
> +				sign_bit = (regval >> 14) & 0x01;
> +				*val = (long)((((u16)regval) & 0x3FFF) -
> +					   (sign_bit * 16384)) / 100;
> +				break;
> +			case 2:
> +				sign_bit = (regval >> 13) & 0x01;
> +				*val = (long)((((u16)regval) & 0x1FFF) -
> +					   (sign_bit * 8192)) / 100;
> +				break;
> +			case 1:
> +				sign_bit = (regval >> 12) & 0x01;
> +				*val = (long)((((u16)regval) & 0x0FFF) -
> +					   (sign_bit * 4096)) / 100;
> +				break;
> +			}
> +			break;
> +			default:
> +				return -EOPNOTSUPP;
> +			}

Separate into its own voltage read function, and also provide separate functions
for current and power.

Guenter


