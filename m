Return-Path: <linux-renesas-soc+bounces-22096-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD49B8A96E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Sep 2025 18:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E100E1C8588F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Sep 2025 16:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B2C9257839;
	Fri, 19 Sep 2025 16:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v3+qTFoG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB4D481B1
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Sep 2025 16:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758299848; cv=none; b=ZUGWY+WLmU2AgUH6ObeVhRHcUQJowgWInTWWR+O/qpTzWUqR0J2exRWOeiQeFex7HuYeZtCx0CvJI6M19bqE01qG69UXY6v67hkoOUzR1QH6XcbpO0r+YGlBwn78uD75Vm5zRFf/GXUTVelnmLa05Xth4pkG6pLQkklYBkqLMP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758299848; c=relaxed/simple;
	bh=9uoHymsF5pX68JAjo3GeIAUB5sUaex0VrFvZfKwQZ2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yi3Z1PdmsEVKTzmXPpv0MzMK6u5MoHiLDE5KpYmZrkT40s0zrSO5hLMYQW7I1YSy+r8xe93oJfk9qRvRiQbDsYyi33krhCG10zPTLMycV7LmwbMs/JsttyCJnqMHGcn6hcMulCPBhoaUyhyOCvzJmbtrhMiWYd8l2Gzx5tP2FCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v3+qTFoG; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3ee15505cdeso1382785f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Sep 2025 09:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758299845; x=1758904645; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U/knhkAXouYA6Xl6JtvTXAsRE/iUR0XbPvcQV+3XkA0=;
        b=v3+qTFoGfh7ct5EmaNPLFc/HXb/1CKkEgnWzEM5nU31v3gzmJyQ14VNkJr8UqFnZuv
         hs67aI3JXi00LEwCnlIWeKv99VJigwSQr4GAiVhrABZfNyQ1zp/zWTk5k3WqqcEurU9l
         FHJ08GXmawfr6gpFAdfb/WaqUn6bBdKAgJeCZOYKOWoQ9+w6bzKXEdVRBnljKqIDBTDM
         Fc67CK/6F7aqoT1HXLkS/hldE7TLpKzWenR9AXNwzknbcTKFS+6Vp2Lc03vl2YZMsIMJ
         IivUfXhprRiyJR/oXv4Y6BSCGIxmh75JNBrcpS5s+0cf8xsHG5GJZdNsqCrH+mtpw4qh
         blfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758299845; x=1758904645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U/knhkAXouYA6Xl6JtvTXAsRE/iUR0XbPvcQV+3XkA0=;
        b=PQxy+Or37xFVvZ04NJ4kW3iSWZCqJ031dGiy8iG2plu8JfOJVSIf5j1Wppc3fwB0oy
         MtBoTDTivoegDl7ZMYV63Ews1cqp71TDgsGFsJNTBQd3EIHnIxabJckeF+NHPr1/2cjq
         Je7hGMhhlYoeJE/AXIjKJHt1/9f/RFcOP9iXPGwrXQ78TGCSlBT1CJEueaqbLl+3jEFZ
         RtGL2L/+rwR83YK6SknUdntdxuNOm06sunTC/11X12g+Iw+i6hoi1T0wXB2tYl3h+buO
         6oYUnjDuv1KgU8mxNUP6XxFW2fVWnCNnORPDIJ0kn2HrEKESqlt+tQaQNowJlz/Cuwwn
         /Ckw==
X-Forwarded-Encrypted: i=1; AJvYcCXhUbbHLBOWhyjR1iTsBSR9zlCu2mocl3xxLoiSyRJ2c0IYPY+KLb0+YNDx9Rf4m5WSTHHE03ZTELl9hA9cAVIQ/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPiJxM+vjRsYqOHrnYOTpzaAuMdo0MLuySJHaKd+0IKU0ceSUJ
	MpTqzgVXSzPUVn3HPqdGF7jixooE7rfJgGjjjZAXYmcmcQgHCdiZeTn45Y8RPKr9kC4=
X-Gm-Gg: ASbGncsep3nD0PnRNbVkUnx+eQKMaZngTClQ1DNOPWzGBp9puodcLqcZyg0ENBSylwJ
	weegsjWEPypeEXVFXoWAS0bwmAP2R+A/o4r0BZrUQ4C6J3wYO/pxHlASsEY7q+5sbPM7DiOQsl2
	fMCOSUKGwH/aLdtbJzKLSKs0zzUQkWQf/tEawdjU8zLt3JYSAKyK1uZSf9n2DpGrFVn0AOrwLCB
	J7kxl69Ehp7AONNBAjfGEgMdaYGAmamzm+ymb+H4kJbAKGX+pIhs82AvhPLHaLYlnnBeaaja9My
	eVvtoJZ0Byu+mhkbRkKSBr1AkHDRxwNugjL6rTt+XS/ydXvkB9pUVVPPqJ5aFi/6GTCxhSKuJ8V
	IsFS4m2Ph59LxAk9rHQOIuQCKx0vLMUpG3nk0pgI8Lz3l835L9iaJmxpFxE/TpufiK9pls9qWeR
	rndw==
X-Google-Smtp-Source: AGHT+IFLCUqUgGD2nd4xyiWXNaIfWMF8JqHjk07IMJDtnkFYT6wdV7TebvWGMsqzX6eS0i+DvItVtA==
X-Received: by 2002:a05:6000:1ac8:b0:3ec:db87:ff53 with SMTP id ffacd0b85a97d-3ee16600969mr4237445f8f.12.1758299844844;
        Fri, 19 Sep 2025 09:37:24 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:8ffd:205a:6719:49c1? ([2a05:6e02:1041:c10:8ffd:205a:6719:49c1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3ee0fbc7478sm8450648f8f.38.2025.09.19.09.37.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 09:37:24 -0700 (PDT)
Message-ID: <71ad53ba-7b72-481f-9b62-1b268cbcd912@linaro.org>
Date: Fri, 19 Sep 2025 18:37:23 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/4] thermal: renesas: Add support for RZ/G3E
To: John Madieu <john.madieu.xa@bp.renesas.com>, conor+dt@kernel.org,
 geert+renesas@glider.be, krzk+dt@kernel.org, lukasz.luba@arm.com,
 magnus.damm@gmail.com, mturquette@baylibre.com, robh@kernel.org,
 rui.zhang@intel.com, sboyd@kernel.org, will@kernel.org
Cc: biju.das.jz@bp.renesas.com, catalin.marinas@arm.com,
 devicetree@vger.kernel.org, john.madieu@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 p.zabel@pengutronix.de, rafael@kernel.org
References: <20250917170202.197929-1-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250917170202.197929-1-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/09/2025 19:01, John Madieu wrote:
> This series adds support for the temperature sensor unit (TSU) found on the
> Renesas RZ/G3E SoC.
> 
> The initial syscon patch [1] the series depends on has already been accepted.
> 
> Changes:
> 
> v9:
>   * Remove driver-specific read/write indirection and use readl/writel
>   * Use devm_mutex_init()
>   * Switch to syscon_regmap_lookup_by_phandle_args()


Any more comments on the patches ?


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

