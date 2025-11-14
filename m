Return-Path: <linux-renesas-soc+bounces-24659-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54553C5CEB7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 12:46:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C38A3ADE45
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 11:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02AC2F49EA;
	Fri, 14 Nov 2025 11:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mP9f2l6w"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532AA314B95
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 11:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763120784; cv=none; b=ArieBcHWcgAXikS7wAE5s9/lU/TVTMZa6vaiOw1ILrRokFoLKK7nf/VQh6y6bCOHb+hmVbqNCXIQd5g74XNHopeI0UD1kUiAOuc+x2Pn2wXMVVMyFbAMDmDKSNoV7K6uYrP/xhxB9nf+6VRAw81rKOdlcMO9DkChADwGsYvACG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763120784; c=relaxed/simple;
	bh=ClyEX/UdSIvxAWtBly7g+z49oKCbuS+x8mSBPL5MNLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iJ4zfwzXXp8Lz3SGPoX7tCYCjrY5WwSJ/hST7YOKUoL6qAvysXAWkI2lhQp+JplZh8EZp9MA0audwQSqCU1tSsGONqyqrtF233WouBlpgShT++wD4vR8KUIrprHIK6aqZMN6ZT4KvTItIVb4AuuHwjbqZ3zWhYvTJT3njCNCt+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=mP9f2l6w; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-471191ac79dso20348415e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 03:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763120781; x=1763725581; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=znLCrhy9lpNAONuTg2xRmGuiyu8L59rUC76EGOeDmjo=;
        b=mP9f2l6wy6RDmZKVx40UDM0jwIvCR/Z5U5qLCMA0PxPsk9WknFxpZSUmb/2u+XRsC9
         1Z4jDYUk1zpbsQRaUqho96L5zPyIiGXEFWDI0BiipJK8BTudwIB7iXe/CNweyaobd+Va
         ys39fk/SvlolOiydku5/HjvFpLPTxl6FaYroVzbF8udGyK+YPh94Goniv9fTamOgXEQO
         fCmFWGDk50y2I8/1KikPLc5tfLNSu1/VLy7Tn2M9F8asorB3KJRgPsz0XLYzdEcO4Bta
         jTSIJ571fQfEb0i3Xrehhwz2AaToKTXjEIP1f/a1egnutAUCDnDRm5PUqKsUMEFlkiGG
         9xfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763120781; x=1763725581;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=znLCrhy9lpNAONuTg2xRmGuiyu8L59rUC76EGOeDmjo=;
        b=UhepN5XHwsLMEJlV5m7nmCLhWkWadAIeLo9MoWimnhBsyH3uC8UaK6XX5UeFB++9CW
         PI5W2YWJ/D6zTqx/wKV/znzH+K7IAd9pf236BVYf0g4YXWQqyB9T7p2P5gU0lns+RGIf
         6Qs1VSn+9xQaqGlOxzKdkYA9HehhoBsP9IiQ8oHVdGP+U/vzEETVqAFy2T9m+tx3OCQN
         CKRD58dGtT2vUiK2QPKnqG/xiMyNfu9dogUxz+fDI7ligVE2QM90bHY6pzFJfX0hkSUA
         hu08X8eXFcq9o3tO+474JNgGxfc6iPcuiGM6cppu88PkDqBBQYDNP25NS/iNcns9uznX
         9W+g==
X-Forwarded-Encrypted: i=1; AJvYcCUVxCP90pwHdKfr0UGrRIHDPUrLB8vYmU2Nggi4WOUwhZaJgcFm1hGKs70c1Wb1+2hvn22C7HFwJ3y5oPgU5hFExg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9rK0BCVQuIPGflzyUSaaJMEoX1zq9SFB7p3e+qbF0Q95XcEWp
	nsq5/jOnke0nico1fd/yX/wti+BACCnZPN196fYYrN1JIl06s1jAZR1YR2GjUMCgwOXZaCMPOzJ
	92LtqAcM=
X-Gm-Gg: ASbGncvio+j6nvXEWkapDCLrtj+fErs2wYp95KUOga/F7Zm5F9hypV4185jSfmMeGqT
	Co85NTFGOxkqU3qy2qf4XUJ7uOrL0h4EgsQaMiM8pMWjKcgzSujVY7XNl6LWivPoJ/xUW5kj9NO
	XupRO9MB9Ht/L9elh66M0d6FanIKxUgm2ostqlXLLH1pbO2tdLIkjGqS/MtDiyzDNG+7VkjMeeY
	Gxq8u+XyRZCSw9aokEN6yJ2ko2fcj9b1VkGGzP5TvHSgKUrSNBHeR8I0z/x6+x/5FzCaTpxxpzT
	5m6YoeXDTSQ5RufL7F0LhrpPYUG6OTotLBMtDXRi2OZ0F7t7LFQtwKUN+G+hpGbfa+MBkrGijz1
	28bOrUypDdETQyT7EtgttP5S1BJB37kgm933jkt6xtcnLyupOGpP+o1TNMVJLxtwY01lPgmzhLN
	2nGwjREsJZ
X-Google-Smtp-Source: AGHT+IHd8efwk69AkGC0dC+aoNu3UXanrxPaqPGOFcaBMBsiZZZtiL5xbItNnE8OzZdW6v9qCsuKsA==
X-Received: by 2002:a05:600c:c4a3:b0:471:13fa:1b84 with SMTP id 5b1f17b1804b1-4778fe5ec01mr28007085e9.12.1763120780484;
        Fri, 14 Nov 2025 03:46:20 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787ea3b56sm140685375e9.16.2025.11.14.03.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 03:46:20 -0800 (PST)
Message-ID: <6369d978-a067-42b3-8384-c5d8814a1506@tuxon.dev>
Date: Fri, 14 Nov 2025 13:46:18 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: renesas: rz-sysc: Populate
 readable_reg/writeable_reg in regmap config
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: magnus.damm@gmail.com, john.madieu.xa@bp.renesas.com,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20251105070526.264445-1-claudiu.beznea.uj@bp.renesas.com>
 <20251105070526.264445-3-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdUwVeLtyQ9X-Lz16W=KtbfjiPqsgWfuDc72B3u6OCtqgg@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdUwVeLtyQ9X-Lz16W=KtbfjiPqsgWfuDc72B3u6OCtqgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 11/13/25 21:15, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Wed, 5 Nov 2025 at 08:05, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Not all system controller registers are accessible from Linux. Accessing
>> such registers generates synchronous external abort. Populate the
>> readable_reg and writeable_reg members of the regmap config to inform the
>> regmap core which registers can be accessed. The list will need to be
>> updated whenever new system controller functionality is exported through
>> regmap.
>>
>> Fixes: 2da2740fb9c8 ("soc: renesas: rz-sysc: Add syscon/regmap support")
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v2:
>> - added all SYSC registers IP specific, except the SPI
>>   registers on RZ/V2H and RZ/V2N as these are accessible only from EL3
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.19.
> 
>> --- a/drivers/soc/renesas/r9a08g045-sysc.c
>> +++ b/drivers/soc/renesas/r9a08g045-sysc.c
> 
>> @@ -18,7 +37,57 @@ static const struct rz_sysc_soc_id_init_data rzg3s_sysc_soc_id_init_data __initc
>>         .specific_id_mask = GENMASK(27, 0),
>>  };
>>
>> +static bool rzg3s_regmap_readable_reg(struct device *dev, unsigned int reg)
>> +{
>> +       switch (reg) {
>> +       case SYS_XSPI_MAP_STAADD_CS0:
>> +       case SYS_XSPI_MAP_ENDADD_CS0:
>> +       case SYS_XSPI_MAP_STAADD_CS1:
>> +       case SYS_XSPI_MAP_ENDADD_CS1:
>> +       case SYS_GETH0_CFG:
>> +       case SYS_GETH1_CFG:
>> +       case SYS_PCIE_CFG:
>> +       case SYS_PCIE_MON:
>> +       case SYS_PCIE_ERR_MON:
>> +       case SYS_PCIE_PHY:
>> +       case SYS_I2C0_CFG:
>> +       case SYS_I2C1_CFG:
>> +       case SYS_I2C2_CFG:
>> +       case SYS_I2C3_CFG:
>> +       case SYS_I3C_CFG:
>> +       case SYS_USB_PWRRDY:
>> +       case SYS_PCIE_RST_RSM_B:
>> +               return true;
>> +       default:
>> +               return false;
>> +       }
>> +}
>> +
>> +static bool rzg3s_regmap_writeable_reg(struct device *dev, unsigned int reg)
>> +{
>> +       switch (reg) {
>> +       case SYS_XSPI_MAP_STAADD_CS0:
>> +       case SYS_XSPI_MAP_ENDADD_CS0:
>> +       case SYS_XSPI_MAP_STAADD_CS1:
>> +       case SYS_XSPI_MAP_ENDADD_CS1:
>> +       case SYS_PCIE_CFG:
>> +       case SYS_PCIE_PHY:
>> +       case SYS_I2C0_CFG:
>> +       case SYS_I2C1_CFG:
>> +       case SYS_I2C2_CFG:
>> +       case SYS_I2C3_CFG:
>> +       case SYS_I3C_CFG:
>> +       case SYS_USB_PWRRDY:
>> +       case SYS_PCIE_RST_RSM_B:
>> +               return true;
>> +       default:
>> +               return false;
>> +       }
>> +}
> 
> As all the writeable regs are a subset of the readable regs, do you
> think it would be worthwhile to write e.g.
> 
>     static bool rzg3s_regmap_readable_reg(struct device *dev, unsigned int reg)
>     {
>             if (rzg3s_regmap_writeable_reg(dev, reg))
>                     return true;
> 
>             switch (reg) {
>             case SYS_GETH0_CFG:
>             case SYS_GETH1_CFG:
>             case SYS_PCIE_MON:
>             case SYS_PCIE_ERR_MON:
>                     return true;
>             default:
>                     return false;
>             }
>     }

Looks ok to me as well. I chose to have it like this as most of the
readable/writeable function that I remember to have seen in the past were
in the format I've presented in this patch.

I noticed you already sent the PR. Would you prefer to return with a follow
up patch and adjust it as you suggested?

Thank you,
Claudiu


