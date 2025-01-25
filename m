Return-Path: <linux-renesas-soc+bounces-12503-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9437CA1C4AE
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 18:42:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28A3D3A4E83
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 17:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16AAA7082F;
	Sat, 25 Jan 2025 17:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1m7gNn2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0786E43AA9;
	Sat, 25 Jan 2025 17:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737826955; cv=none; b=KuAg4jpfrMJE6rhCY2WLypoj3fx7T81mMZtBSTRIGZrx5eQ3LoDwRb84SIebdHdtkael5txy9fpJ9W5Bn4WwJtCCNxJFQEVZ+9hx4o/cOvK5z6zeAS3B3tHgrzZDUmsw5YZzIh6VHFz2kFQIaPG7AdRqbjujCCr/dGYtPoFWeLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737826955; c=relaxed/simple;
	bh=qdJptF6DYpb9/kDa+ObM6v+RLGwy0e5oCttnzauADzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=butpDm+WJmK6WUULwd8+ifJzmtsCHtOJqpKOqkcFrsZroqE1ylWgP5IJboYhInQmwgX1GcxEjWtPsjmhJplh6KD75HosHyQuGOUOQsmuRBO7NQB4G2FnmvAQMfdBc/gpzxG2zpuc44/S930Io32mU1XsJcp8Iljol0+Mw1NQdTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1m7gNn2; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-215770613dbso39397705ad.2;
        Sat, 25 Jan 2025 09:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737826952; x=1738431752; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=z7H/WULdiib1xR4WJ8Z8VTZBxloFoD7QfaoT5kBFHCc=;
        b=i1m7gNn21Prt+L/VtWOFUCRxZ7LAnDzLgwQjZl3jjb0J31zg4p6gYkY0y6l+1HQlqI
         GFnlarNi7sjxKd3S/lVjtOhLaUsJT3cS+ilEZM69EFRwQOPI6o4rbCzzLjDQsvyb76x/
         Lw/aIAx5OK5aN89UxsUGNKGung5pkHyEApGiS8EaG3YxcTshQh26/5M/nQHKWbTf5hPu
         Ru6hJrSQd5onpZcWNk8XkzhsXeOUjUpeCXOYH5rGAxlyocBnxaTKzDrlbLJnP1hu039O
         k3QtNWrDJhoSLinNZR+mYX+sVrjUv1q/vkFs/uyJv3UW1LnWBJ1pLvUuUEPJRS6er9dk
         MUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737826952; x=1738431752;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7H/WULdiib1xR4WJ8Z8VTZBxloFoD7QfaoT5kBFHCc=;
        b=qndMIzG8RNqvykWdSLcm03LO7UWbh3abc9PMuCRujF6vt+1COOpXmkF1yZ/0bW+WTs
         8w++NzkGkyaGkkpO5jjROTyoeX0aNqrxpdsUwlUJMk8aeZcD1Y3s1pJn1MzcsDiOdOiC
         P4zvk2nAUqdXYQky0FGu19B4EYE7YZDeAv7lkkvF02ZD4bhVDJVXSUpSjlu+b8ofbhsy
         40KEZaMygQZgLtN8mk/Rb3j5pRVL+d1sup41u+SCrDxdMSpPVAvt3R0OjN8Ol69zw+nu
         tglLjX58VDcPAJbFiZKqqvNZStLkqKSuQFOS1rm/0+jq8N17Zm7hNzuzOOjgO2SWFMee
         f4xA==
X-Forwarded-Encrypted: i=1; AJvYcCV3tfTQfYTW/cmio0GqqP4jHuNN0/buz2lM0jX0U7eWyMHRNTw2esNCFxeYmNgd8tiUim+eREVZMdPydu9xG6+AGe8=@vger.kernel.org, AJvYcCVDnQkghwOZHQBLF7YmVHkKejcmI/WVM9FgJID8/JlSD0YHu5QoJrJgN7HtCrgZy2721f4P2adpA0puuw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3bbz8dFzBx3skVgHw6PWHfEParMzhC8bKUWBgzLe80tygfcSN
	WURJUthQ4CPFXDwIu7Fk0mMHDtTZOck0omep4xFRtEs7X8us4OaYbQ6jyw==
X-Gm-Gg: ASbGnctE6dh9mwdjYnyNMgkFLGJS9u+kDRm1ZgbBoKTNSWXaol9O+yQWRdKEX6j7k/B
	yK0vx3PzdRXtYAkKPL9xSXstfMvUUv5zTKL7R+buEvBBCH2lqAmAkUg8S6MPj9G5oQpZkdbEch9
	8yJBO/p2SW12SUR0nFjCcCQW/1yenzlcgGtOKA4rYg3nyZgdI5H6BYe2fwAsuNCmqwyLnBUR/MY
	VFCuKfLIJT1wpT9/8K50rV1/xft8uqnK+TZ9yLm3ZjOUCSJyuD7G0i3QXJtczKJotRa9S6Ev6vj
	6KDuGsAIINC6b73nMx9pKfTVwaJiaX9DD9o557V/VpdxfHiykRq+2Q==
X-Google-Smtp-Source: AGHT+IGdu1rlzQSXzCQQkMRohOo0o7WE/85u3b9JapmsqS8GfDmPAbivwuPvWAxyHauoJtKOWSF2wQ==
X-Received: by 2002:a17:902:e548:b0:215:e98c:c5bb with SMTP id d9443c01a7336-21c3555353dmr536918585ad.28.1737826952124;
        Sat, 25 Jan 2025 09:42:32 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da424eca8sm34910525ad.241.2025.01.25.09.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jan 2025 09:42:31 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3c265d34-9442-495c-a715-be2eab3b37d7@roeck-us.net>
Date: Sat, 25 Jan 2025 09:42:29 -0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] hwmon: (isl28022) Use per-client debugfs entry
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?Q?Carsten_Spie=C3=9F?= <mail@carsten-spiess.de>,
 Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20250123160347.44635-1-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250123160347.44635-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Wolfram,

when playing with this, I noticed that the i2c debugfs directory and with it
the files located within are only removed when i2c_unregister_device() is called.
Unfortunately, that function is not [necessarily] called when a driver is unloaded
(for example by executing "modprobe -r"), leaving the debugfs files in place.
If the driver is then loaded again, the old debugfs files still exist, referencing
the previous instance of the driver.

I don't know if this happens all the time, but it does happen if a driver
which was instantiated using the new_device method is unloaded with modprobe -r.

Right now that means that the driver has to delete each individual debugfs file
it created when exiting, but I think that defeats the purpose of the entire exercise
since it would make drivers more complicated.

Do you have an idea how to handle this ?

Thanks,
Guenter

On 1/23/25 08:03, Wolfram Sang wrote:
> The I2C core now offers a debugfs-directory per client. Use it and
> remove the custom handling.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> ---
> 
> All dependencies are now in Linus' tree. Thisapatch can be applied now.
> 
>   drivers/hwmon/isl28022.c | 44 ++--------------------------------------
>   1 file changed, 2 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/hwmon/isl28022.c b/drivers/hwmon/isl28022.c
> index 3f9b4520b53e..1fb9864635db 100644
> --- a/drivers/hwmon/isl28022.c
> +++ b/drivers/hwmon/isl28022.c
> @@ -324,26 +324,6 @@ static int shunt_voltage_show(struct seq_file *seqf, void *unused)
>   }
>   DEFINE_SHOW_ATTRIBUTE(shunt_voltage);
>   
> -static struct dentry *isl28022_debugfs_root;
> -
> -static void isl28022_debugfs_remove(void *res)
> -{
> -	debugfs_remove_recursive(res);
> -}
> -
> -static void isl28022_debugfs_init(struct i2c_client *client, struct isl28022_data *data)
> -{
> -	char name[16];
> -	struct dentry *debugfs;
> -
> -	scnprintf(name, sizeof(name), "%d-%04hx", client->adapter->nr, client->addr);
> -
> -	debugfs = debugfs_create_dir(name, isl28022_debugfs_root);
> -	debugfs_create_file("shunt_voltage", 0444, debugfs, data, &shunt_voltage_fops);
> -
> -	devm_add_action_or_reset(&client->dev, isl28022_debugfs_remove, debugfs);
> -}
> -
>   /*
>    * read property values and make consistency checks.
>    *
> @@ -475,7 +455,7 @@ static int isl28022_probe(struct i2c_client *client)
>   	if (err)
>   		return err;
>   
> -	isl28022_debugfs_init(client, data);
> +	debugfs_create_file("shunt_voltage", 0444, client->debugfs, data, &shunt_voltage_fops);
>   
>   	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
>   							 data, &isl28022_chip_info, NULL);
> @@ -505,27 +485,7 @@ static struct i2c_driver isl28022_driver = {
>   	.probe	= isl28022_probe,
>   	.id_table	= isl28022_ids,
>   };
> -
> -static int __init isl28022_init(void)
> -{
> -	int err;
> -
> -	isl28022_debugfs_root = debugfs_create_dir("isl28022", NULL);
> -	err = i2c_add_driver(&isl28022_driver);
> -	if (!err)
> -		return 0;
> -
> -	debugfs_remove_recursive(isl28022_debugfs_root);
> -	return err;
> -}
> -module_init(isl28022_init);
> -
> -static void __exit isl28022_exit(void)
> -{
> -	i2c_del_driver(&isl28022_driver);
> -	debugfs_remove_recursive(isl28022_debugfs_root);
> -}
> -module_exit(isl28022_exit);
> +module_i2c_driver(isl28022_driver);
>   
>   MODULE_AUTHOR("Carsten Spieß <mail@carsten-spiess.de>");
>   MODULE_DESCRIPTION("ISL28022 driver");


