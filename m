Return-Path: <linux-renesas-soc+bounces-12509-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D9AA1C5EE
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Jan 2025 00:59:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D5307A3657
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 23:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49CDE20A5E4;
	Sat, 25 Jan 2025 23:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tfrkebqw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7CD204C07;
	Sat, 25 Jan 2025 23:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737849581; cv=none; b=H6wmI5H9MWa5u10z84nc9EpZEMDFctxpWoR7lmALC7afyV572Zrkl58UEVYjeDbwBO+1GKcjGLcRGYKaf15giDcFl90ZMi2OrCiJLi1WQlhUfvPXycCS8GJ+AAnWN1a3+++y2AroPzcYH6J2C7Oleo7vfGTN8lG40VVd2pZbaw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737849581; c=relaxed/simple;
	bh=NC/+t2EQ4/Gno3l/NUpUzqeqFHfgAzKTjC7OZFu7Q9E=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=FLpa9IrtaOIPXHOZGyI7rzu+KaMtgHoT1tQ+HZ18hCfLzsB4A0y5GfWjRQcQbxreUWdrImPOcd+Jq8bX1sObYRp24EhaKLUzyHd6v70trRYyoHyME/pXxs5lphQToSTaxqHgG7OP+2YTxMC6n+xHMN6zRSBosKWHng1+h9P+7PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tfrkebqw; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ee86a1a92dso4700870a91.1;
        Sat, 25 Jan 2025 15:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737849578; x=1738454378; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3KRc2wzSvVwQowYjGidFePVU8XwZgBggdmoTc/eVljU=;
        b=Tfrkebqwsz6W7HJZFMby2+b2T+WMjKEIxXeBKkWkth5IgE8ANnI+kLUR7nJyXnrva2
         yxEKOuLou8KaTkiXp9/uRnaXYQjMKHO796KV/s6ZuAA7/ueNXr2dZiZk5DfDiDJDkhQC
         8C85DEwVXm1lNMAwgM3iLZJos8QHN1ERxt6mZBUdXN/0Z/pDHmoYAj1PDGsRC9feh8rV
         u7SQPj/0AKbOzcUt2z1DsnFXqlfhhuONr9kkQocj512+kIe3DJKqr4BU417saIzy+MlP
         /977/9RlP9hDcFZprpYXyAQm2KCmoqWw/hZLMI5MtiWzFfZtnX6j7E8uXf3atk4kHKUA
         BPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737849578; x=1738454378;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KRc2wzSvVwQowYjGidFePVU8XwZgBggdmoTc/eVljU=;
        b=UpRIyNrXgyPcOeWJgjt0RWLWagWmoBmM2ps+kBerWbA5Zwt8rZxQI8+QDMRdybTyyg
         /cxVVmeWip6D5JQNglEnEkPrf4aPHPInYyieSi7goXI5Y2UnpKP54MB1+ALhKxisaX3O
         aLHqE8dUhKfLLCTUViR43aTtQAMyphhyeA6HtsD6iO80juVZnUYQsxqAKHxcEON4Ywst
         ukaUBILpQ+Fq22zcZ4qNVqsdyqgpeG0RMPcJkO+oJRhY4fgGqrFPgNuG3h6TgWsDV2+C
         STVklBeNdkUpxWSfnXirbSwxdjnBlheGdplyFqGtjVQ+cwPBoXi2DVUNRTa7Q7krKKaZ
         QjpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMNe7pujx9XYp96uklA35SGIN4d118ioyZutmxl98/ty4xnMDFN/98S5eUbX2AKKkO0maVXnGFoZaXICHt96tT720=@vger.kernel.org, AJvYcCX+QDtn5jmApMLw9MHtTdNqMfdSFL9sBH4IKCKx+qw0iHff4p/qUI+lscY6BC6CW2r838QUw5630Zf1iA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRd6SDGjCUb2rogI9W90nv6nSFrWbqhYNnJE/XxJBcDL2+0Fk4
	qPZmt7Whc0U2ix5FbQloq6K5w5D4n8XhjGynkFIp8TgyE5WzZ6hJEudWxg==
X-Gm-Gg: ASbGnctsEAIdRaYla1x06To70KLctK+QikZES6BfAB9mxJ3SR9MTrI0NHIWAiR0lW9Z
	X2wYG6XviObj4QBW5AZgiqcoySVYyLaGepyK7IFMqeAF6QmDX+bc4vt5XaZGNELEvQvV/zaq8EC
	eS2yz1OWOq1e/uTD6JSHVRTtAzZU6RyrU0kZa8dyxDiE4s/3Ej31LjmgCiMJ+ffLBpqPm/bcRvd
	1XNaPCqFTBSvHw/8tJnqsnA99mBnI9X/rjrjDFWuaJ7omoqOEWL6AhU7BQ/P5/K17dKw6US/WT5
	OCDIUuMg+ldDE7xOeAJlAgaQewhznyS5L86RTXTZDYGPvM4vwncT8A==
X-Google-Smtp-Source: AGHT+IFKWV0GuQjKGvO+ImkifE7Bw9sW6JgwpSOQUE0baypxd68e0Pn+tbkSFQN53n9QlzfcvgfEPg==
X-Received: by 2002:a05:6a20:729e:b0:1e1:cd09:e08d with SMTP id adf61e73a8af0-1eb21485321mr52672959637.11.1737849578368;
        Sat, 25 Jan 2025 15:59:38 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ac496bbcdb2sm3799569a12.69.2025.01.25.15.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jan 2025 15:59:37 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5c87e9fe-06dc-44e2-83d5-96bd6e799a78@roeck-us.net>
Date: Sat, 25 Jan 2025 15:59:36 -0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] hwmon: (pmbus/core) use the new i2c_client debugfs
 dir
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20250123163304.46034-1-wsa+renesas@sang-engineering.com>
 <b59c8757-97d5-4d87-8648-adf27d7866f5@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <b59c8757-97d5-4d87-8648-adf27d7866f5@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/25/25 10:24, Guenter Roeck wrote:
> On 1/23/25 08:33, Wolfram Sang wrote:
>> The I2C core now manages a debugfs dir per i2c_client. PMBus has its own
>> debugfs hierarchy. Link the two, so a user will be pointed to the pmbus
>> domain from the i2c domain.
>>
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> ---
>>
>> @Guenter: I don't have any PMBus device here. Would you be interested to
>> test this patch? It build tests fine at least.
>>
>>   drivers/hwmon/pmbus/pmbus_core.c | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
>> index 787683e83db6..510b88aed326 100644
>> --- a/drivers/hwmon/pmbus/pmbus_core.c
>> +++ b/drivers/hwmon/pmbus/pmbus_core.c
>> @@ -3517,6 +3517,7 @@ static int pmbus_init_debugfs(struct i2c_client *client,
>>       int i, idx = 0;
>>       char name[PMBUS_NAME_SIZE];
>>       struct pmbus_debugfs_entry *entries;
>> +    const char *symlink, *hwmon_name = dev_name(data->hwmon_dev);
>>       if (!pmbus_debugfs_dir)
>>           return -ENODEV;
>> @@ -3525,13 +3526,19 @@ static int pmbus_init_debugfs(struct i2c_client *client,
>>        * Create the debugfs directory for this device. Use the hwmon device
>>        * name to avoid conflicts (hwmon numbers are globally unique).
>>        */
>> -    data->debugfs = debugfs_create_dir(dev_name(data->hwmon_dev),
>> -                       pmbus_debugfs_dir);
>> +    data->debugfs = debugfs_create_dir(hwmon_name, pmbus_debugfs_dir);
>>       if (IS_ERR_OR_NULL(data->debugfs)) {
>>           data->debugfs = NULL;
>>           return -ENODEV;
>>       }
>> +    /* The default i2c_client debugfs dir should link to where the data is */
>> +    symlink = kasprintf(GFP_KERNEL, "../../pmbus/%s", hwmon_name);
> 
> This would have to be "../../../pmbus/".
> 
>> +    if (!symlink)
>> +        return -ENOMEM;
>> +    debugfs_create_symlink(hwmon_name, client->debugfs, symlink);
> 
> As mentioned separately, the symlink is not removed if a driver is unloaded.
> When it is loaded again, dmesg says something like
> 
>      debugfs: File 'hwmon9' in directory '3-0020' already present!
> 
> Also, the symlink ends up in, for example,
>      /sys/kernel/debug/i2c/i2c-3/3-0020
> and looks like
>      hwmon9 -> ../../../pmbus/hwmon9
> 
> meaning there is an unnecessary "hwmon9" subdirectory in
> /sys/kernel/debug/i2c/i2c-3/3-0020
> 
> I would prefer to have the actual debugfs files in the i2c debugfs directory
> (here /sys/kernel/debug/i2c/i2c-3/3-0020) and create a symlink from
> /sys/kernel/debug/pmbus/, such as
> 
>      /sys/kernel/debug/pmbus/hwmon9 -> ../i2c/i2c-3/3-0020
> 
> I tried to implement it, but right now that doesn't work because the
> actual debugfs files are not removed from i2c/i2c-3/3-0020 if a driver
> is unloaded and I don't immediately see how to fix that.
> 

I was able to implement this after fixing the problem in the i2c code.
It works quite nicely.

root@server:/sys/kernel/debug/pmbus# ls -l
total 0
lrwxrwxrwx 1 root root 0 Jan 25 12:07 hwmon9 -> ../i2c/i2c-5/5-0020
root@server:/sys/kernel/debug/pmbus# cd ../i2c/i2c-5/5-0020
root@server:/sys/kernel/debug/i2c/i2c-5/5-0020# ls
mfr_id  mfr_model  mfr_revision  status0  status0_input  status0_iout  status0_mfr

Guenter




