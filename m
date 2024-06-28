Return-Path: <linux-renesas-soc+bounces-6871-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1159791BC2D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 12:06:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0EB01F23CF4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 10:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5ED3154420;
	Fri, 28 Jun 2024 10:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="m6x7R2n8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C64B153804
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jun 2024 10:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719569201; cv=none; b=BWjkmE8ina8KdqDlbWZ8BkNHOQXqwgFWXOEEHDdfCdQV4wnj4iNs05u6zumnqhzZXlKN0jHBARwzTFGL2oB/0tRVCV1X5byA6QCRqHF0tyTeZBV2cQiCzcvaqe4MAPpt0M9SJdxHsvuxJ9ZjknpbtEvKVX3Pl3uK4pg8MGEgzUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719569201; c=relaxed/simple;
	bh=554rv7ILaI0W5+ES2xN0Mj80VLudjNToHmaWVUKUFz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TRpiTNxpYkr+9YKwsIEkgWxFcbfAqJZG0tLBgmlqhmOYVUFi/ne7/LNcgLmQafrAGTk0nKfAamBUsEps/L7ZDApSlGh1k6ojTjCOwIjefLlMa9IXcRnenJl398cYufEpHP4tQ35ERPl2FwGmfBBpSi2b2iQnFEP6fwSqndG2fJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=m6x7R2n8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42573d3f7e4so340435e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jun 2024 03:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1719569198; x=1720173998; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gw70QDn056qg7oaUBIoXRrI2jVe7rzNbyDJqb6JO4Ps=;
        b=m6x7R2n8KIQTb7E7G7PRldpCYcSX+Zgvw20dJ7WyxbgnOYGrfNUKvVqtcVlx9PNZ3/
         JSsFprpTW6RZiboUg46iY4+9E7Y/GJGH2+2765BmtKBIdssyrSSDWjNWEswV/v/gZDA8
         Kjnaj72I9p7nqh859DQXGD36jf4vrCPrT5XJgH5zYFBvF5m2uDAMkBGMB7wGLvIEYoE7
         929QJzNgJFjeOs4BORXS0E7CUsK3fwVILFTiCG4ar9BgSaWIXMfiskxiM/yFeh1SGagd
         nrM//NtXdQZcPY16w18lOq7i3qljeMvy1XtJ3LE6W4PMeLLknhMlhb7Ie1Wp5yNQ3IRo
         BUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719569198; x=1720173998;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gw70QDn056qg7oaUBIoXRrI2jVe7rzNbyDJqb6JO4Ps=;
        b=iEnJFZhv9SXhnF2X2ODXjSuGAwPdR6stDDTW3MoONEUVS5AfB1/NsXeEE9suMhBOrx
         s+rIVYAzJI4HgkJEX2S4p+NQR8JBU3DxnyeJlAd6a+8qQYqdVX1Hu3KYGcDjiR2JSX13
         MT3jDFEtuK1RiwUEGc00hj3PXI0B5fjMXpwh3MXUiAJcN4SqLoUP2jdlmHHATaUYo/WH
         owD7L8m5IKoj3BpBApM3FsHUrTGk+YYX10tSOTRsLPcWOeXjCJkp7Wa8t3NL2iIEODRy
         ElXGRi+s+aQBECkhQl/zyhIbZnALNBgt90vAEnV0st8w9WB8N6/ZtPGboOYPtJp4GECL
         SHDA==
X-Forwarded-Encrypted: i=1; AJvYcCUAj2tnylCB0S65lZTuywsamZ5X04uuZ2zRgLd+2W21p2/wBeyrqaWkfii6LahelNWb0j4Uo2vYReobZG3VrE8SZ7NRG5AFw39OHvptq/m+mgU=
X-Gm-Message-State: AOJu0Yy31cbOOuck/XpSrKuhPLsm03IvCPi983WFhZj2wmoBGxwyqDSU
	N6HqrMVzHxB8jn4SZbPmKixEMtGmjtm9P5zAyAw9IqXAK1CCO9x25OSfEZ6zYiA=
X-Google-Smtp-Source: AGHT+IG/cTqSbLLJarU954uRr4h4rooJb5GMdKHqFk3VcZ04Ym71tvdsyg6BUa/QaZ22pRgr5ASXug==
X-Received: by 2002:a05:6000:184f:b0:366:ee84:6a79 with SMTP id ffacd0b85a97d-366ee846c15mr14725435f8f.51.1719569197705;
        Fri, 28 Jun 2024 03:06:37 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fb950sm1758171f8f.83.2024.06.28.03.06.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 03:06:37 -0700 (PDT)
Message-ID: <89b7f219-8e22-408d-b49f-c69f59377b88@tuxon.dev>
Date: Fri, 28 Jun 2024 13:06:35 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/12] i2c: riic: Add support for fast mode plus
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 wsa+renesas@sang-engineering.com, linux-renesas-soc@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-10-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdX4hWou9OtdE8XgU7-U0ghJ6vk2kVqgT90U0ZjsxzR5DA@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdX4hWou9OtdE8XgU7-U0ghJ6vk2kVqgT90U0ZjsxzR5DA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 28.06.2024 12:22, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Tue, Jun 25, 2024 at 2:14 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Fast mode plus is available on most of the IP variants that RIIC driver
>> is working with. The exception is (according to HW manuals of the SoCs
>> where this IP is available) the Renesas RZ/A1H. For this, patch
>> introduces the struct riic_of_data::fast_mode_plus.
>>
>> Fast mode plus was tested on RZ/G3S, RZ/G2{L,UL,LC}, RZ/Five by
>> instantiating the RIIC frequency to 1MHz and issuing i2c reads on the
>> fast mode plus capable devices (and the i2c clock frequency was checked on
>> RZ/G3S).
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/i2c/busses/i2c-riic.c
>> +++ b/drivers/i2c/busses/i2c-riic.c
>> @@ -407,6 +413,9 @@ static int riic_init_hw(struct riic_dev *riic)
>>         riic_writeb(riic, 0, RIIC_ICSER);
>>         riic_writeb(riic, ICMR3_ACKWP | ICMR3_RDRFS, RIIC_ICMR3);
>>
>> +       if (info->fast_mode_plus && t->bus_freq_hz == I2C_MAX_FAST_MODE_PLUS_FREQ)
>> +               riic_clear_set_bit(riic, 0, ICFER_FMPE, RIIC_ICFER);
> 
> Unless FM+ is specified, RIIC_ICFER is never written to.
> Probably the register should always be initialized, also to make sure
> the FMPE bit is cleared when it was set by the boot loader, but FM+
> is not to be used.

OK, that's a good point.

Thank you,
Claudiu Beznea

> 
> 
>> +
>>         riic_clear_set_bit(riic, ICCR1_IICRST, 0, RIIC_ICCR1);
>>
>>         pm_runtime_mark_last_busy(dev);
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

