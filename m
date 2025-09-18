Return-Path: <linux-renesas-soc+bounces-20193-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7960EB1F89E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Aug 2025 08:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 900C016E737
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Aug 2025 06:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC1B226888;
	Sun, 10 Aug 2025 06:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="H+ZolKtp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1CB223715
	for <linux-renesas-soc@vger.kernel.org>; Sun, 10 Aug 2025 06:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754807772; cv=none; b=Zxhvyumdw9FXLyRGrEnxeuplMxLgnvGjsHcrOn/YnoA7F+GbbaV37+XHZpXo3E5QemywbyxH+9twlf3TLd36OoB9EWaY46A+SOulme6O/qwY/ebZm1gkLsoT+wPMq3H4gunbk6vaY2s0bVkpbn3v178odqnybsmwDfDYpzHaVRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754807772; c=relaxed/simple;
	bh=dxYJkPeB4UxLDG5tXiuCB4IDTXdl3DcJy1aWU+3GruA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YjlaIz3WLO/NZgK4UkqpOYoFhQo3p9zUen8YFOfl6MR4N2nMLmmoWMj5Gfc6FqG06ViXx2aeIgDoPnBl0wTYZtB3qZM6eJoKizV2ELdD4Cx0NN47rKHrT1RDl9upxpVSEDUlPAOj/aQM4DMwO5ygfqC0yJvY6xZorraeOPfCSgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=H+ZolKtp; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b78d13bf10so3624609f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 09 Aug 2025 23:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754807769; x=1755412569; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=enK6t5KGIg+LruZrfThBHUu3Mt7qcO2z+leeT+ugu7M=;
        b=H+ZolKtpo3Y1RSHPNtgszjhNSsRwsnSNOUrxoGi8YnLHvzMaf2aanlVkunZgJhQXdC
         hVh3w/Oxukbd6m7cRRV8L4t7mNyeAPl7peXNHrxwMNnM2d1ptkznlzxyRCVTFXudTiy8
         ttDs4W/bvKEM+qddZyKZKDYXCaD02QmTc+fNN+jH3WGJe4CP3DZJxioiDDyFymyhH3+J
         0D+K+nbeQ8xDEZfKpHCmOq95EOoIgxX/hE1j+GYDPyRmwaccF4v6bV89d0SQ07SMmmyX
         tVcccxq0jx5sF7BbQfw5I1NKmJLvSASUTy66OPycNKdks8czNvSsAzl2gKTentve9URR
         QX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754807769; x=1755412569;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=enK6t5KGIg+LruZrfThBHUu3Mt7qcO2z+leeT+ugu7M=;
        b=hBYYwKkWh/iGlup2QvDl4U3Y/AJYRHR0La4evhh4vzQtgsyxJUCMEkYOOpuRPyjFk4
         mqQlpAEK1FKMEpyE7Y7552gq1QJ1EwyAore2x/I7RmpYEoDAJyxStBzRZBwEU7d1P/jW
         cCtdCqLpg63FOFLpXZDFSzi8vkViMx37zV9wQpw1d2HhaqigMvxM2O7DTLql43bnA58+
         VLhHg76b2nVvljFzgtJ4ak6CFBEZaCJ7iOpKij62DUzTq7SgDsahjuZu4xUF+WRMyqNN
         dC9FCx1DMiV7FmKL6ZZvWBZ6aBurS74wlnGi6eYQmoJoiONV9pkfpJAeB6212QI25j/U
         7Z3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUn+8A01y1l+iFs8VsXdySa5li4mnta+TxKVULb8yWnBzoT5jzcGQanucZoW4d+80fL4L3aSZF6HYoTnfnFwnv+8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWuvj+6HxX+q2VRjBx9S9lTUypwXsnkZUOeJy/7vRGB6ZXRs0X
	lYhfBAlJPsJvimdONbdGqkkg1HveyXiQpyMlrXbb6WvzGUgIc8vLIaFW6kdRtgM4Ff0=
X-Gm-Gg: ASbGncuR+Fo/LPyHTGG4ItD4qFbe/uvyKuwORZRaxIAuhCaikixLPYPBcAPEIrAxmQ2
	DdaMWxkIhb9EgdYnrpxshutYuJQfoKHClG8AfKrGlRjYzti9bxHw5h3lbPT+DH2kpwA1L9G7s3d
	S3WAkPFxA7oUpQ9LQAIl1PISlyjwFdNlcWDrrSQcUEBlpmrBv1jqpUmNU5dBaAjLK/oXZ+JuroK
	X2JzaUhlsgRJHng/RACi7MwPlseNiBzS/NK9CGaVCFrDfRMHZWUAUhA0iGNoc2VCJJcJLz+lCEN
	8JiBKDZgI3UiY+KArFfHaWEKH2ytQLgwUERKc5Upn0BjffDLMo9abFgXc5af1hGHcNjuQrteOsi
	FhnQsxTOiRiP8RIOQFxA8EvnS+bR7D0STSb94iEeXMA==
X-Google-Smtp-Source: AGHT+IHmNQ00RBKMICMOm289G3m3lvi/tK0YBzD0KPkGdwuOB4ix5SW7xxWMXMIQt9BAVjaFLPdtNA==
X-Received: by 2002:a05:6000:420b:b0:3b7:9b58:5b53 with SMTP id ffacd0b85a97d-3b900b78614mr7383299f8f.45.1754807769119;
        Sat, 09 Aug 2025 23:36:09 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b95f4sm36052015f8f.23.2025.08.09.23.36.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Aug 2025 23:36:08 -0700 (PDT)
Message-ID: <8963764e-0948-4f11-a907-de74b0f8ba3b@tuxon.dev>
Date: Sun, 10 Aug 2025 09:36:06 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] thermal: renesas: rzg3s: Add thermal driver for
 the Renesas RZ/G3S SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
 lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 p.zabel@pengutronix.de, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250324135701.179827-1-claudiu.beznea.uj@bp.renesas.com>
 <20250324135701.179827-3-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdUUNFo4pqbXh1xMatsv7T7cnq0SmDxM_o9em0=gpurdCA@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdUUNFo4pqbXh1xMatsv7T7cnq0SmDxM_o9em0=gpurdCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 26.03.2025 15:26, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Mon, 24 Mar 2025 at 14:57, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The Renesas RZ/G3S SoC features a Thermal Sensor Unit (TSU) that reports
>> the junction temperature. The temperature is reported through a dedicated
>> ADC channel. Add a driver for the Renesas RZ/G3S TSU.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v3:
>> - drop the runtime resume/suspend from rzg3s_thermal_get_temp(); this
>>   is not needed as the temperature is read with ADC
>> - opened the devres group id in rzg3s_thermal_probe() and rename
>>   previsouly rzg3s_thermal_probe() to rzg3s_thermal_probe_helper(), to
>>   have simpler code; this approach was suggested by Jonathan in [1];
>>   as there is no positive feedback for the generic solution [2] this
>>   looks currently the best approach
> 
> Thanks for the update!
> 
>> --- /dev/null
>> +++ b/drivers/thermal/renesas/rzg3s_thermal.c
> 
>> +static int rzg3s_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
>> +{
>> +       struct rzg3s_thermal_priv *priv = thermal_zone_device_priv(tz);
>> +       int ts_code_ave = 0;
>> +       int ret, val;
>> +
>> +       if (priv->mode != THERMAL_DEVICE_ENABLED)
>> +               return -EAGAIN;
>> +
>> +       for (u8 i = 0; i < TSU_READ_STEPS; i++) {
>> +               ret = iio_read_channel_raw(priv->channel, &val);
>> +               if (ret < 0)
>> +                       return ret;
>> +
>> +               ts_code_ave += val;
>> +               /*
>> +                * According to the HW manual (section 40.4.4 Procedure for Measuring the
>> +                * Temperature) we need to wait here at leat 3us.
>> +                */
>> +               usleep_range(5, 10);
>> +       }
>> +
>> +       ret = 0;
>> +       ts_code_ave = DIV_ROUND_CLOSEST(MCELSIUS(ts_code_ave), TSU_READ_STEPS);
>> +
>> +       /*
>> +        * According to the HW manual (section 40.4.4 Procedure for Measuring the Temperature)
>> +        * the computation formula is as follows:
>> +        *
>> +        * Tj = (ts_code_ave - priv->calib1) * 165 / (priv->calib0 - priv->calib1) - 40
>> +        *
>> +        * Convert everything to mili Celsius before applying the formula to avoid
> 
> milli
> 
>> +        * losing precision.
>> +        */
>> +
>> +       *temp = DIV_ROUND_CLOSEST((s64)(ts_code_ave - MCELSIUS(priv->calib1)) * MCELSIUS(165),
>> +                                 MCELSIUS(priv->calib0 - priv->calib1)) - MCELSIUS(40);
> 
> This is a 64-by-32 division. When compile-testing on arm32:
> 
> rzg3s_thermal.c:(.text+0x330): undefined reference to `__aeabi_ldivmod'

Thank you for reporting this! I'll switch to div_s64().

Claudiu

> 
>> +
>> +       /* Report it in mili degrees Celsius and round it up to 0.5 degrees Celsius. */
> 
> milli
> 
> 
>> +       *temp = roundup(*temp, 500);
>> +
>> +       return ret;
>> +}
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds


