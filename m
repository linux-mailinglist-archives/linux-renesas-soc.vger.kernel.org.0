Return-Path: <linux-renesas-soc+bounces-12758-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1A6A230D1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 16:07:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 446DA1888C29
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 15:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC861E9B20;
	Thu, 30 Jan 2025 15:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GRkjz7JT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DF91E285A;
	Thu, 30 Jan 2025 15:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738249635; cv=none; b=nfwZem2fpVSJ8TRbCRKdUhXUTXu4A/e9AQBqOlqcAV3PFRPBpFuTR0nkGdQQkf6HQp42EN7VpRDO5XvuWzfgLaxPnIoVAX0nGjJTOxi22OJ/WIzXjRJUlc6dIqE5L0zCVtfEUut3yotXzgGChpE0kujvBgC8NIRe+7qtkKAC5Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738249635; c=relaxed/simple;
	bh=OM4ZUMN3E4AOrGfMH1ZnKp+ytJOX31xaBCGlwtu8Gbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ahluoZoIHtFsetDM6vOzVELmecbZ0+kt3uncawl13mK+IsIM2U09W5+aKHB1cJDT6xHCFvlmy7I0b2TSeE61vss2/I2pwzTzBEPFklQZO/wNh/LSmVhfDukp2XZtwjk1c3ShMEANyuOvhpDk99LOwLe62A0ByvlZpZXGiwzWMT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GRkjz7JT; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ee397a82f6so1550772a91.2;
        Thu, 30 Jan 2025 07:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738249633; x=1738854433; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O4BdXqqRK6ChuuCnv6AYgbUXHjwgrMPhy800wvIPI0A=;
        b=GRkjz7JTWUJdXYnfEPje+qQkyGOKZkY0LsgrnwRLc/e9n5umaWx7cvMNCIQrun0qBX
         9jkAWQSpNQU1JeUfUdIApmNwe6HGjIqym/ej4XCAtgkmuwjh8zSys9eNribkInJO+tIt
         fN0WHe0bhSs5BWQ3U6gFlxDM6+FjU4TZolZ5300MOCrXtEFXZGLnkDY9qR7xzl/qX9BE
         9VNroduCSSP6YLTGmmRxjvdzQZbd1w9h03xJXBZWOKEG8Tl7n7UDAdrZVYPbQspcH6nq
         ac2LD6Rn3+mDoNQKBo4LO54leGOLRJMwcj8DMu/XoGJcnGkO2syqv1KOPx1DO+LRSbPs
         hH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738249633; x=1738854433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4BdXqqRK6ChuuCnv6AYgbUXHjwgrMPhy800wvIPI0A=;
        b=ZNGA9iKXnBT/cNjJRmCTDk/+eXboN1X5RGxSQg0Kd7EH8weMA/VA3wPmMF449gmWt2
         xyvwvA2tLX+M3BzUCSoz63I92C4LnQoJ6RrWfNuIKBaKunH0kmIZnIYJygTwjAfHhUVI
         ebzIzMQDSQJM6YzAsrfwi+Qwtm4VJW22wJVEeXvnKGW5Luk32EQlxWOmIQClCneNicm3
         XBlZecpL4YjwihXObZyDV2pLuedJ2+SFS2pLGFFKyt2wza1jKydz+g5uqeflUr2vXNDY
         aQAkpUNydIKU4A1Yhhweul8dqK/0dxjOP17Ad2uWB66Ek6z5qZcU/MkVScTNP3heyOI2
         iJHw==
X-Forwarded-Encrypted: i=1; AJvYcCU6QnsxakDBtnm5lfbGrE1/eD1pqSq4lQBTOiQjAxc4bOm8CEN31yjxYE0csfsYogvM9Fp9t25rVkT4wg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr1yvsWe3sTdlmt2WE7Zk4nlB/hFIwkuU2pcz/CEiCduqYfyMu
	hGdkUcjvNoQzOba+AteJiJn72e1ELAn8KlwSlMfHORcf5n+IjtDP
X-Gm-Gg: ASbGncugsMQ3n3G72xkmENV/kaFBXGky0LdElZCJP2xD2wHz99s4KKteY/4jtsogBCn
	0B+CNyi5POUCGDMS2y8XYngfKrRzT72pz6QVBKdcUCoAv/8Yj8TJgZ9QPMxljDlPdTKEiz/M2th
	zZgjt5EaO4RUcTxe12bbHxrCEDqvusHh+tlVuHzzU49x0kYq/pMlOxmus+ugd58a3CKKMU1WqXW
	0wOafJO3y8x57WMNEpXfqFZM0M0VTnFFxCaz0JL8AR++Ln4QBvNd4OY4dSveHIJ0hDxiJwQ3kmd
	MJKQJ4fUc8Q+qYxPhCUmZ/MFwL/h
X-Google-Smtp-Source: AGHT+IEfCCjjeoVDWKTO43ixNfaiWgTKFEUMBc2wiPkHzy9xGgsbmHpHyRtYZsUgQBwt6JrWDCBd7A==
X-Received: by 2002:a17:90b:5188:b0:2ee:b26c:1099 with SMTP id 98e67ed59e1d1-2f83ac84510mr9322602a91.34.1738249632788;
        Thu, 30 Jan 2025 07:07:12 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f84897a50fsm1758153a91.5.2025.01.30.07.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 07:07:12 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Jan 2025 07:07:11 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH RFT 5/6] hwmon: (sht3x) Use per-client debugfs entry
Message-ID: <8c5a4221-f88f-47f8-9971-a4b08d04248a@roeck-us.net>
References: <20250125123941.36729-8-wsa+renesas@sang-engineering.com>
 <20250125123941.36729-13-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250125123941.36729-13-wsa+renesas@sang-engineering.com>

On Sat, Jan 25, 2025 at 01:39:45PM +0100, Wolfram Sang wrote:
> The I2C core now offers a debugfs-directory per client. Use it and
> remove the custom handling.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  static int sht3x_serial_number_read(struct sht3x_data *data)
>  {
>  	int ret;
> @@ -931,27 +913,17 @@ static int sht3x_probe(struct i2c_client *client)
>  		return ret;
>  
>  	ret = sht3x_serial_number_read(data);
> -	if (ret) {
> +	if (ret)
>  		dev_dbg(dev, "unable to read serial number\n");
> -	} else {
> -		sht3x_debugfs_init(data);
> -		ret = devm_add_action_or_reset(dev,
> -					       sht3x_debugfs_remove,
> -					       data->sensor_dir);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	hwmon_dev = devm_hwmon_device_register_with_info(dev,
> -							 client->name,
> -							 data,
> -							 &sht3x_chip_info,
> -							 sht3x_groups);
>  
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
> +							 &sht3x_chip_info, sht3x_groups);
>  	if (IS_ERR(hwmon_dev))
> -		dev_dbg(dev, "unable to register hwmon device\n");
> +		return PTR_ERR(hwmon_dev);
>  
> -	return PTR_ERR_OR_ZERO(hwmon_dev);
> +	debugfs_create_u32("serial_number", 0444, client->debugfs, &data->serial_number);

This changes code behavior: It now always creates the debugfs file
even if the serial number is not available. The debugfs file should
only be created if the serial number is available.

Guenter

