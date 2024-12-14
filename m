Return-Path: <linux-renesas-soc+bounces-11347-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D03DF9F1F91
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Dec 2024 16:11:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9AF6F7A05EB
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Dec 2024 15:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5469194AC7;
	Sat, 14 Dec 2024 15:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1BNpHHJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E8E1E502;
	Sat, 14 Dec 2024 15:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734189052; cv=none; b=cfmpED4/KmT4/s7g7Cl7WERsSzEtdSVGmH7w3ZYVrPAA9MjlQOeo6hjoD3gQHxS+osKwF+4TXlADO+ZVc9rzGWC1IUnFdAsauv4MlgrwtQHPO3CI9NGTJOEAp0trK0xSSSpPP8A9ZVL0MLKfg28t1RQxH36k8J0TURtvkyMQVm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734189052; c=relaxed/simple;
	bh=A4CTFXn1CaMS8B9XDFVEJSEh3NSWRI2qaU+9qqP+0pY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YSCjnx/kkJA3nYvONQZFI+l37nQX0uqJNSxIDIbjyxHzjGT46Ie2j21W2K7nGrWrFYavR8WOLR/ybpYjMGebgxSdu1KOK1Mgb7vCNLlbJeBQRtMpEWCVQA8ndhJcVlh/5x5o9Bs3bd9AXA0Bmwyo31KL0QqaLbEBty981Y0E1RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1BNpHHJ; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-725c86bbae7so2227981b3a.3;
        Sat, 14 Dec 2024 07:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734189050; x=1734793850; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WQg/TEKib1Vx09oB0VZbtpCFUyyBgLjzrx1tv/xwDTw=;
        b=i1BNpHHJjTLvTf4vvhqyOVBFxX1jSKpsolXUI7EE+u1AbnxVq61QrIGj8EQmn9Tpy9
         Agq2kagYztdGvf+fmnomRv3vohAx+u5yJOBozEecyn5Miu8Kv8ecAD1zvkztMOEqvwIK
         QLQbeks4lZS4xgz2qlRN1ONDLDPs5HEz19yh31Y7DsdzCT29UHeh/c4OF88JfTFEgSQ3
         vc91A4V23fc5MnvYyMPp/Xa+iGzo3lulwb5qRxKyGU9l0z/46mpeJVrbce7C4CwQcvg6
         ptwVGUr3L2VFXmUWanZ8xVxTRxHeKWFy5IQIN0D2f2Sih66IE0Nme+qqGYkICwyd/mlo
         biqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734189050; x=1734793850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQg/TEKib1Vx09oB0VZbtpCFUyyBgLjzrx1tv/xwDTw=;
        b=gi+5znKArHnbYDdIpctyLaUHakbO/QqkLrGZIqbhrvPWdDcCGkNE83SmHnlWeV1hkJ
         ihFgarOHVgDzvFzGsmNbFVhcxw/Shtvj7NtpJgjRz8qd2p7WVRXqJXZXNrt60E/Zz1zf
         PnSG+FCYPVmDfIFPmgNQPC1q+4ydQMZysNnMbIVz6ahAseCa+5lc/xv4ZUUolb/yiJ7V
         I4hgpdzpc7Aa6C2OqBepDGBJll5ghiYV/Za4y5Ed8NWGd3WGa4IDS59Ke3YX3WNcbmXb
         PVNuNK6+qKOeuinYjf4JRN07gL0tGqdbcQFOJxa8wc8GHUlr+bRsZ+OangOrm9tSx4Vw
         XM0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUS6WfeF2oAlfJP7vuhvKiKpBhsRwD5oPlKUiLri0tjH7FmST15ANe4MWYZQBYd04UJZBa+k1mBFNW6fA==@vger.kernel.org, AJvYcCViTCowSzweixGeVS9Ppf+PwM37v3TBn2AMjpNYlc2QdUZrJDthJw8url3Mkz4xTu7fQVyEOnc2GLG4+dRP@vger.kernel.org
X-Gm-Message-State: AOJu0YzW0QbBz+dqHZdligjZndXURfGMtWOLNdN+tlTnBm3tiowXmUuZ
	ZhNH5NT4Nlf7mmRZc/mV3TgB+WgG/kkR1+lTt6lKLnoVrLvSX08wiC1sYA==
X-Gm-Gg: ASbGncsvuznqs62NlpYWFps/qfkA096DkRjxylLT84e0ajwUWTGYoZY0HFPnkbpRalQ
	s+pETTNHoJSouWyoAlVL85HPavvxfb2S28oc90MYQg/2zy3uKr88XS/V6LjQs4Ash/IX3yqRihm
	X/FNJwWI1kHgRtL7Vxdn4lErSQ6ajwXmXYttRvKN3VO51PSEd6XI3VCxX46PUcJHFxLLOJnONT0
	Qg3idDGtg+3S5HIWDAF2jt/3xLBQDBEI7FTbBUwAD0afmgpWM/wxH5QpV807FKTUbm62w==
X-Google-Smtp-Source: AGHT+IGabGy1BOtVVwUJQNafKP0LScMV3AwcBnH4fcEwfR6AEG+2qybmJTDnWTaMwcNapELiXep+Nw==
X-Received: by 2002:a05:6a00:8019:b0:725:e37d:cd35 with SMTP id d2e1a72fcca58-7290c25d901mr9008695b3a.18.1734189050317;
        Sat, 14 Dec 2024 07:10:50 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918af0f01sm1527119b3a.87.2024.12.14.07.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 07:10:49 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 14 Dec 2024 07:10:48 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [RFC PATCH 2/2] hwmon: (spd5118) Use generic parity calculation
Message-ID: <5aa00bde-17e2-49bd-8470-b946f7604761@roeck-us.net>
References: <20241214085833.8695-1-wsa+renesas@sang-engineering.com>
 <20241214085833.8695-3-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241214085833.8695-3-wsa+renesas@sang-engineering.com>

On Sat, Dec 14, 2024 at 09:58:32AM +0100, Wolfram Sang wrote:
> Make use of the new generic helper for calculating the parity.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/hwmon/spd5118.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> index 6cee48a3e5c3..07ab3a47b00c 100644
> --- a/drivers/hwmon/spd5118.c
> +++ b/drivers/hwmon/spd5118.c
> @@ -291,12 +291,6 @@ static umode_t spd5118_is_visible(const void *_data, enum hwmon_sensor_types typ
>  	}
>  }
>  
> -static inline bool spd5118_parity8(u8 w)
> -{
> -	w ^= w >> 4;
> -	return (0x6996 >> (w & 0xf)) & 1;
> -}
> -
>  /*
>   * Bank and vendor id are 8-bit fields with seven data bits and odd parity.
>   * Vendor IDs 0 and 0x7f are invalid.
> @@ -304,7 +298,7 @@ static inline bool spd5118_parity8(u8 w)
>   */
>  static bool spd5118_vendor_valid(u8 bank, u8 id)
>  {
> -	if (!spd5118_parity8(bank) || !spd5118_parity8(id))
> +	if (get_parity8(bank) == 0 || get_parity8(id) == 0)
>  		return false;
>  
>  	id &= 0x7f;
> -- 
> 2.45.2
> 

