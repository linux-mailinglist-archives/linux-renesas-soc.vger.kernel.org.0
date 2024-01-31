Return-Path: <linux-renesas-soc+bounces-2169-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB21844703
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 19:22:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DCDB1F234A9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 18:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6401F12FF8F;
	Wed, 31 Jan 2024 18:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gRQp8upK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961A512BEB7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 18:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706725360; cv=none; b=CQGybc2CenPbpqPcEAXOLKBcFgUPIy5GdUq9vsGBH0stetXBtkXXNdWBDx5VXCcyGtX1gDzHNIj4UGsyWUQt7Znar5U8lGDhrfWiZfu5wtCaY8HqhyZt2payRnQ0quk1q1vQ74vv6o2RKiDpjhTDmkIeDe5buH5BQy1bvpNAWyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706725360; c=relaxed/simple;
	bh=z16ACY49/1e7bOj0OReF7J/eAVkgaJxbfAVjTzxIMlg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fjf3yXDIVGj4XpibtBEQNAU5yXEY3y+8QxCHh1Wu9DSWtKS8Ja9DAf1T56tExkm5c8ZaItTuW2qgZcqp4njTqrv3rrF9GviDnE/KPtcUMmpHpERCtxJ+HWsyEnDHS0DWBSlYhgPfGEtzvXgXL2r8f7d3LKx0VNH26f/LUYHWnhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gRQp8upK; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40fb63c40c0so1044475e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 10:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706725357; x=1707330157; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gHKzDZd1mqTqqV0mGTc0u8ONZh6m7/ntJ7FejoiVhh0=;
        b=gRQp8upKrzdbHPzFknA2xC4HI9oTtNLKbM/lKq4jht0nc5h7S0hGRzZkQzkg9YYDzJ
         mifkC1vfwvAraF3+07bXaLreNqablDAvQb0eR9VDBUpH+9eOebcD69dW9Qm2J9l09tZk
         q1It7ij8l8w67bxmzP8UL85Sk+V+pmMX59x0e0qxb7VWlfRN5CnkqKHmn8lCeFS9UCB5
         GY3W4ZKzKdhVthVNowO1M8ezKQWuDLgda+dI5CeLrQI/23bWUq5ow6M4b7vANiVWeQWC
         Jo1mXXCz1krUvdThzNREB0/QrjYQOrQ2qSbX74UZ8erSgtjVuiPpa/eDpv77y6VgZYF6
         HIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706725357; x=1707330157;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gHKzDZd1mqTqqV0mGTc0u8ONZh6m7/ntJ7FejoiVhh0=;
        b=DskaEm/BcS2sDoazOE8nlCJYdXzCThQo2DfWrBgrwnjFaKP6gjh/Afn+2yydQU6zrv
         vumKoWcJ8gRN8B3BhL6CChYp9uTcc6hsw9HQeVJswtgUUfndqmCrho/0WgAFshmnEMIK
         I/zJq5pQgg9fX+hDCccaWwY/CuFlDcW26j7UFhBetzYLwcbEMP2g1ZEn62TBDLFAtuWW
         jGO1LPtSlz+E2PMkNJVobD8x8SG1SsbrO6mGB6fy/6HSJgmPUKRooCZeQQoCcgeQTYdX
         TWWE6f3PLIb1an7SBQSDvvlXcipcPNeb3j3+PcOAhNy7q98E+t+Of/+AqfVdCTINeJzF
         ZNNg==
X-Gm-Message-State: AOJu0YyONvfBA1VUqFzR5x3gipu89TqGGLHGDaFA/2N4J1Vd6vFgoxCn
	aVjZUSfj1cLifjch8NoyLyfdjT8brwaBipf96JNPBz5YmnN2Azgm7M68obHX0aE=
X-Google-Smtp-Source: AGHT+IHlqZn5apC0OcSNN2Acf7t6Aaryh00SY4kbBmWqx0XsIPRgDEaqwCciuHNYKlmHRmoA8cxoSQ==
X-Received: by 2002:a05:600c:138e:b0:40e:fbdd:238a with SMTP id u14-20020a05600c138e00b0040efbdd238amr2123576wmf.37.1706725356765;
        Wed, 31 Jan 2024 10:22:36 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id n36-20020a05600c3ba400b0040ed1d6ce7csm2265786wms.46.2024.01.31.10.22.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 10:22:36 -0800 (PST)
Message-ID: <4e8c1025-fcea-45fc-bec4-5b377b7064ac@linaro.org>
Date: Wed, 31 Jan 2024 19:22:35 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: timer: renesas,tmu: Document input
 capture interrupt
Content-Language: en-US
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <8cb38b5236213a467c6c0073f97ccc4bfd5a39ff.1706717378.git.geert+renesas@glider.be>
 <20240131180013.GE2544372@ragnatech.se>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240131180013.GE2544372@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 31/01/2024 19:00, Niklas Söderlund wrote:
> Hi Geert,
> 
> Thanks for your work.
> 
> On 2024-01-31 17:11:45 +0100, Geert Uytterhoeven wrote:
>> Some Timer Unit (TMU) instances with 3 channels support a fourth
>> interrupt: an input capture interrupt for the third channel.
>>
>> While at it, document the meaning of the four interrupts, and add
>> "interrupt-names" for clarity.
>>
>> Update the example to match reality.
>>
>> Inspired by a patch by Yoshinori Sato for SH.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


