Return-Path: <linux-renesas-soc+bounces-12506-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E28A1C4E1
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 19:24:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0DCE3A6DA9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 18:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C9B7346F;
	Sat, 25 Jan 2025 18:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MiC4g7Za"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B068494;
	Sat, 25 Jan 2025 18:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737829468; cv=none; b=spbP9d0zLc4IGYSDqUmoW2BRuBhZorvz9ZPSa3qKyDr8+j20DcnPwzZzU9K2jXk9ZxVZgbsgJs7L9cCOJrh3uzYuG+154mFLJfmbUgZ/EEaLDlbhDHK6UDDFReqHdeN/sf1T8hZsTWLFj5sGh9I6bLTdneTMLk48Ejc44m5GsdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737829468; c=relaxed/simple;
	bh=wPBa9XSwu8kEEJLVpgu5u1dTqm8OsIYyhmMMlfIRpvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sp+wjLGPDsmRCWxhL2KYjXYBbK/CVg6KD2DyUxPoaMUF/+eKxyVRIA7WAWnjmTgjl/8lfrJPMt2C3HPOvKfb8DruSKLz921X3rzq4se6b/5KJyR79RAbTxkpGq+gXeJ15Rq6aKUO3gRs5aaz7p02rjjRKxFvRm/E7gNMrPtkXXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MiC4g7Za; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21654fdd5daso53561665ad.1;
        Sat, 25 Jan 2025 10:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737829465; x=1738434265; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=UgnaR4DQbu2Rc54l9FtTJH3B7EqE1mHfRy1C5GnskeA=;
        b=MiC4g7ZavyCA4HxefbEwwtvVZYr4wupCDg09KNN0Wfsho52ZYKQcocpgafI9uAPDNC
         SvdCY/RPjCZz+lP9yAWO1W9GkqsGwKNVQVXv1/NVxLyjWg46KMvLfEp9j4iWTbKqyyF/
         lSaeg8rBQ4EtDyAARAzMWd0u/fj1y00mIhi4waQaN9QTPfmscrdVp+iGAKgL27ZYbGOR
         c2nM13f2hpGOktXUBiXvaTjTRZQWmscssHUOgArArJtWQg7oD5TAjJK8dvtNIXQg1SH2
         nYyyFxrqU4neKcK8nPxlr351Pt8KuJmOpFIPnPSsdGZt6icFRkYuZHIXBT0NxcLzCyUu
         WxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737829465; x=1738434265;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UgnaR4DQbu2Rc54l9FtTJH3B7EqE1mHfRy1C5GnskeA=;
        b=Cy8X5YQoUmHsxNtM+V/ppM6CZdP/XizJySF1ycsTPm3HwoZoTx7wme+bgTrFuDW7L6
         Lxw6Heaiz2PIBPrd9OWp4WeqmMl7Yb46PSctnYoJv8yGANL48wInEzcYYWH9Cgbe5WKD
         8iav6KMjPJWBOROb4OkKcUji1uoIlxgbykrT+4sHAeDHEBt4hdHxKShY7YZ1qUdkPld8
         ZPRvIPl4bwDLs2RcGuC4IhZBRijuwLIr5pqWl485u+J47J0iJh7ZPMoAy0m2KFxNPnCt
         Cbnsh5u9EQK00tYo/L8s6xe+ZMJYEHy6B2IBpOKdQvCIzhH2eBiUGBjj+q3a1Fhst6CH
         DHPA==
X-Forwarded-Encrypted: i=1; AJvYcCU0Nm7zMd/AXgAQ/aLmr0TfHnfmZmFjV/owc5GRzLhGzkuNBhQqekgONGDxM/ZT8y0CPuLY3Ps42MdjgA==@vger.kernel.org, AJvYcCVcYf0KcgPTjm7+TnLrh3NkzysAmx/RlvICFOJyO+OjPM2MW5/iNky089hfKhPozT1HF1y+JNK4cUOTFjB2234Nrng=@vger.kernel.org
X-Gm-Message-State: AOJu0YzArf8UvafkzSx1hN7I/HEJTxTVglCoU7HpoLGhbt1yzfoE2ZDv
	P0/tuW4NKOqjQQE2/M+rNgQEXNJgJgCf5TI9LLsPAgz6nlkLbnpV
X-Gm-Gg: ASbGncv6VwMp0PJNQRoJVUg6d3YcnGz9uNepfqvJ80UJvYBvF2JROD6g4nCGDFdGf6C
	9hyBVux3DjBWQ2pde316SK7pQH6UzlO8L1wwMO8JGORjsbHiL+bZTz4PycZUtl6+976LtHyFUHQ
	LWQh+YLrH8R9A7Fumr9e712FHs65PG9HYEMbd8MGrvWWqyvX1tQiilG7uLVo9J2R0M4XfWAij43
	ycgBm2zpHU0mA0iPfgATqSOr4Qt38E03wmairKbdh0anf2jjmEfazlC/H68fG0Y66pHrlfOKDo2
	WlFDunKdgbFqhphpevwleMME5p2D559zmsK1HdGML51HDciLUEcVBw==
X-Google-Smtp-Source: AGHT+IFMLTe+nmbnBJgomA91A9aW/tLcQ6bxonRqUod5pKLjOtbKu8IrfpD2QI1kKTjFfBggXooQZQ==
X-Received: by 2002:a05:6a21:7896:b0:1cf:27bf:8e03 with SMTP id adf61e73a8af0-1eb21585e4cmr54095589637.26.1737829464968;
        Sat, 25 Jan 2025 10:24:24 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a69fd40sm3968966b3a.3.2025.01.25.10.24.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jan 2025 10:24:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b59c8757-97d5-4d87-8648-adf27d7866f5@roeck-us.net>
Date: Sat, 25 Jan 2025 10:24:22 -0800
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
 linux-renesas-soc@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20250123163304.46034-1-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250123163304.46034-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/23/25 08:33, Wolfram Sang wrote:
> The I2C core now manages a debugfs dir per i2c_client. PMBus has its own
> debugfs hierarchy. Link the two, so a user will be pointed to the pmbus
> domain from the i2c domain.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> @Guenter: I don't have any PMBus device here. Would you be interested to
> test this patch? It build tests fine at least.
> 
>   drivers/hwmon/pmbus/pmbus_core.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 787683e83db6..510b88aed326 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -3517,6 +3517,7 @@ static int pmbus_init_debugfs(struct i2c_client *client,
>   	int i, idx = 0;
>   	char name[PMBUS_NAME_SIZE];
>   	struct pmbus_debugfs_entry *entries;
> +	const char *symlink, *hwmon_name = dev_name(data->hwmon_dev);
>   
>   	if (!pmbus_debugfs_dir)
>   		return -ENODEV;
> @@ -3525,13 +3526,19 @@ static int pmbus_init_debugfs(struct i2c_client *client,
>   	 * Create the debugfs directory for this device. Use the hwmon device
>   	 * name to avoid conflicts (hwmon numbers are globally unique).
>   	 */
> -	data->debugfs = debugfs_create_dir(dev_name(data->hwmon_dev),
> -					   pmbus_debugfs_dir);
> +	data->debugfs = debugfs_create_dir(hwmon_name, pmbus_debugfs_dir);
>   	if (IS_ERR_OR_NULL(data->debugfs)) {
>   		data->debugfs = NULL;
>   		return -ENODEV;
>   	}
>   
> +	/* The default i2c_client debugfs dir should link to where the data is */
> +	symlink = kasprintf(GFP_KERNEL, "../../pmbus/%s", hwmon_name);

This would have to be "../../../pmbus/".

> +	if (!symlink)
> +		return -ENOMEM;
> +	debugfs_create_symlink(hwmon_name, client->debugfs, symlink);

As mentioned separately, the symlink is not removed if a driver is unloaded.
When it is loaded again, dmesg says something like

	debugfs: File 'hwmon9' in directory '3-0020' already present!

Also, the symlink ends up in, for example,
	/sys/kernel/debug/i2c/i2c-3/3-0020
and looks like
	hwmon9 -> ../../../pmbus/hwmon9

meaning there is an unnecessary "hwmon9" subdirectory in
/sys/kernel/debug/i2c/i2c-3/3-0020

I would prefer to have the actual debugfs files in the i2c debugfs directory
(here /sys/kernel/debug/i2c/i2c-3/3-0020) and create a symlink from
/sys/kernel/debug/pmbus/, such as

	/sys/kernel/debug/pmbus/hwmon9 -> ../i2c/i2c-3/3-0020

I tried to implement it, but right now that doesn't work because the
actual debugfs files are not removed from i2c/i2c-3/3-0020 if a driver
is unloaded and I don't immediately see how to fix that.

Guenter


