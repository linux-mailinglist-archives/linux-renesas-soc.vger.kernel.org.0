Return-Path: <linux-renesas-soc+bounces-22092-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 33673B8A5E4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Sep 2025 17:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA2391896A91
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Sep 2025 15:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1701731CA58;
	Fri, 19 Sep 2025 15:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gOBt1FA3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3294C31CA7C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Sep 2025 15:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758296592; cv=none; b=jsQ1sS8nodkEBxSLUFgQ2kdPLMPy7IBDXMUT5OIAvcpsti2ILtyOfTWxvd/NkQjSrbUbS40gTYrTdyFDHAFUMIdbYEpKZ7NESJFWscJk21edN48NuFx46nTGMs6/bYBuLX0bizbrBI4YDhqLttxrLSOSmUmZmgrH6BD6LcxgHWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758296592; c=relaxed/simple;
	bh=GUWbbIoYuPxC0PVASkNOJOvzh3Uy4fRQSYTvrzvfFGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eP1PwwOAgesSwlojwpAQOl7rpEaPIKxNGKX+WPIeL6/foETps+ujy7UDPXuBGzP7ezm7kz9Oqd7eElTgB76ozj76+6MGRzWAnBYz4cg2Igb+NIe2Qn1R8CZ29pl0Z0g/ZfQqMVDoIHZuloFmN8o0aNSGgSAwM3DmO+B5TbzQQPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gOBt1FA3; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4619eb18311so15587565e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Sep 2025 08:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758296588; x=1758901388; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LkQpaDIpCuNqvddytBmuD6MDMQYm1NodhkCLcp7FXu0=;
        b=gOBt1FA3izxafufsChenpq9lm53BFHuBTsrYe0D7JJArrOYWcEYmrUEtUalZ4m0CAm
         lI2QBkV8Sa1/ma9lujhy2ub2z3c15IUdZ7W91nY+waxQk8kRysoujgJq7+fX6t5jgLvh
         IMw38jUxJTLqeBCGYJA3FOkrVT7AnrXLjUrPaSEQGFi24hYu9xAVd9H/lg0kgY04xyYg
         EemYDyyc5xxci+trp6fNj/wbKFZea50sOOn3LCTsDwjcKxgP/Scga01RM7bu5TPWn/xi
         6FWl2bkrUensrRhVrJ6rMptO5TjSJJ92PlbMLLjPwobUHyi9YtC+G7pRLV2GPu11QqBg
         PuPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758296588; x=1758901388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LkQpaDIpCuNqvddytBmuD6MDMQYm1NodhkCLcp7FXu0=;
        b=nVjqppTT3qRUeXQ3NktkdCWvk4RIgj027QPLcttz5MGwdAcbQ4DqpvcXvNLss7M3IK
         IpGNsAbP8dMQf6dnBWXXKdi8Ah7nI69GQrw6Wv/VPWVjYzcKtyrzhkzi1ipadJUfQnaN
         ABYwXOufM0yyeZRY5025E4DxGhI9hK6c/PAVJPSpYCBXcflcqXVL/LZjB+5+1YFo18mj
         asdLnx0s29Yi6IwmbyjrFrHDB8xOzdMpqLUB4+jWO3d6kdcRB9CUglYK4fCvoRJTx0Fz
         d1clGn7ePF2P1nOr33L5fIfaHTY3un0ER+eWwWaC1y4IUV4H7zSBRqGrrNfYtpv5Zx9k
         r4BA==
X-Forwarded-Encrypted: i=1; AJvYcCUvooKJPo64lHLESvi21CDEccO/Xpx6Dn7G1efJo6XdYLLDHyXQVrbWuKzfbv6ujlEvmH8EBCjtC72vrlQXC4Wl0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwkQ2P+4HGUZSpDOrqJKQl5KU2FYzKNbv2PAGovMYgazAH5njJ
	3m/qqPTWc8/Lj37ABbxmBa75+hGCm+rIgj+kzm3VrVZmDX70ER57+5odKNwhJIvtV63PB9R9l6G
	QWvSX91c=
X-Gm-Gg: ASbGnct/SuhqX4nm7ZshTyDrl+VEUElCM6zIgIZhnnAqFiCV2EEY9QeKDQR02Cxqv8i
	w094SolW7jm989kBcUFrj2rGE/lwuInQMaLXhQPvyPyNX6DbDQ4Uy0iF3VTVZV28KLSaVHVKSFP
	JEnoyN6CHmK5LOKC1MtO1BConcWEd3/XXnk6VII1ptekm5uSuJNjqhbrHnIlVD4T/F3o7oULosq
	CBBDjAzXgzq/WLdreFPO9PTUFKMaYP11sT+GDWgteQ9TaHY2vvolH0y5EXABtd0a9YzFrdD1s3M
	UnxEPafhRHhy6UVNYKSMZqT5kF9VWZKAUjHmydBTHQ3iqyxFcNHXY3S9URwOLhICwm/Ay/o5E7O
	Z+3kKenkTyrJ16WoxORjnvxirlJN3zjPPt2vdq4HMao5aWDoszSQgoiC35jDb37P2TZK4+w4kFi
	gJCA==
X-Google-Smtp-Source: AGHT+IFYvRcAmwC+mp+0+RFbvRArwGTpkTn3ZN8Wn5X+7lOF3PNWJMwXqY3LiyaPYA6nN2cvLS4FUw==
X-Received: by 2002:a05:600c:8b86:b0:467:f71c:148 with SMTP id 5b1f17b1804b1-467f71c039emr31089465e9.33.1758296588420;
        Fri, 19 Sep 2025 08:43:08 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:8ffd:205a:6719:49c1? ([2a05:6e02:1041:c10:8ffd:205a:6719:49c1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3ee15bfab67sm4605373f8f.43.2025.09.19.08.43.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 08:43:07 -0700 (PDT)
Message-ID: <f9554814-e5b7-421d-bef8-92131b1cc840@linaro.org>
Date: Fri, 19 Sep 2025 17:43:07 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] thermal: renesas: Add support for RZ/G3S
To: Claudiu <claudiu.beznea@tuxon.dev>, rafael@kernel.org,
 rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
 magnus.damm@gmail.com, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, niklas.soderlund@ragnatech.se,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250810122125.792966-1-claudiu.beznea.uj@bp.renesas.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250810122125.792966-1-claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/08/2025 14:21, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Hi,
> 
> This series adds thermal support for the Renesas RZ/G3S SoC.
> 
> Series is organized as follows:
> - patches 1-2/4:	add thermal support for RZ/G3S
> - patches 3-4/5:	add device tree support
> 
> Merge strategy, if any:
> - patches 1-2/4 can go through the thermal tree
> - patches 3-4/4 can go through the Renesas tree

Applied patch 1,2

Thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

