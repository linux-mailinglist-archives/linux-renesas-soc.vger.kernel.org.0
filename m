Return-Path: <linux-renesas-soc+bounces-20661-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8F2B2B87B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 07:07:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E63FC196666A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 05:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2488214210;
	Tue, 19 Aug 2025 05:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="SoXSkFxL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341291A294
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 05:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755580043; cv=none; b=IeA9fCyhiFrH0VqL2vJWQk3VJQ1Sb+uJkcAzhcthPObf3z7tqY/En5tMg67k1XNlKaOc2Wlo+wHPcPW9gZurUyIk6D0+P3g5UuEED/GsKOv3GXqm5hh1EUBJiQJT3W96m4UvaHT99z5kywI+tbRFBsfFamlTa6ih6tdSH/ag4Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755580043; c=relaxed/simple;
	bh=ltXNHRhOhUUl4xR8T4+Ojndq1rFeuYUH2BMxeu0RtmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cZaZpD4H+BptctMe0o0CgeHm1t67f2jqp3Yg6NzzGLYmKA/kETl/u0UMpG8+qihE/n4srMbkIfo3dRiXi0RtSKa760ebp019C/Wi0/gA8bVos0Ue+thwLCVkOs31hHx1b2YTJFjYJmeWqvXJZ66zaaqbi2p8eggi+qGV1iqFIe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=SoXSkFxL; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b9edf0e4efso3371970f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Aug 2025 22:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1755580039; x=1756184839; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fga+lbodUmPAZazOf43yy1bTgzdU2LByeFqojuOQ83w=;
        b=SoXSkFxLAXwWKCM+ck4BQyG3Kz10Cs5HOEmcjcltNTbDIwHOC2NcX6ZR2ICOcmUNST
         7xGqEImExFpdAq/UFWqdegH0yflXjYvP+BgczT6shJ+am5rgG2vEtDimk9T+y46sqCWA
         tQwnxvxw63Mz37Pi2WtjyNSLe0Glwo6y1SsQtbA7Nns9qM9RfzYEy/Ghsca28B3oeTxi
         /CCHU6aHXS6A11DwC1s47+bAYeQKTTJ3f4tffSwJnt0ADdABgAum5xOjTSqo9pLf0G8l
         /DfrLBj/wSiVcgHPHfX2ZVnlwGdGeOp3mHl+cT4L28njTrhX95MSNL+G6N057lcG17yT
         MOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755580039; x=1756184839;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fga+lbodUmPAZazOf43yy1bTgzdU2LByeFqojuOQ83w=;
        b=KSuQD40WtRJFltdPluG4oXeXKc9bcWlYRzykt8QW8A9iYpqoEwEX/TnK1nZK/InGMH
         zKyh3uRhk8AAPEY4FGYvfBp9pr0aqtUnypqkVnDJts+ShFgfXIz2JHpnvkGpoejKNLCw
         FOnI0UU/iwDwn3mRKdg8MEnXTtmDoc+g3wAD0/w96L+eMu31SIqcOftXxCafvpEI46Ta
         UbyoVcMStO/a5vwbfeePc3SEfYk8Vw/QQZqptBcfhmORAxA/BWWfdfIb9YUw4mL7RQkF
         h3h1Lzg9usRI9xPDmf7VAvBDUWkf12GJg9pH5RbecIIlX+rzZ54Zeq5wP9kQA8czPhJi
         H1xQ==
X-Forwarded-Encrypted: i=1; AJvYcCW80rTLT5F8l9+5GlI+5bmgSUvSFRiQjMAHs9V+yfIA7P/quATR5fG89v8txy8664vDUarIhGBFtKIEePXzKPdZfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvZocDFZmILhm2whNZtrVbD65Khl+NAHxUkkXy3mLqSJwvyba/
	X8K63rR2hfbTOgPzrJMikt0l5ryGklsAFtVz3TjvROaSKJuqaWLc1dSOhYG03ZK9urI=
X-Gm-Gg: ASbGncui9KKqUT7U+D+nGSXMxeYs0uuw9zs2tuyRN2hzdypY0Oq/WrTzQgJxRFwTcMn
	IhGHmL1RE7cjw90VIKFIGfzJuxhsIrBfDgiB0JZxygWQfGC38tH7lmTPuvGpjoofaY4xvAPEe0Y
	w61fKBSpynDh+ZgSsnGZotyOQXKXAbor3/F/yi1+bkRIBzFe+ypaBDLT9IcFCoCoMSE0iVj+QR2
	zubrNk/I0Um/6pfRLqLgZyfslBMiA7454i2atYlllaSIcyPqkMuILAn0vKkFc4wE1a2ndRexlXu
	l0lvBzRPksCqN0p5DoE+IETm0fwH/aVvVW1Vkk7fwsATvYKjHADZY/nYcxSaCds8BCCziTG1HB7
	4tO619ICQ2UbBZgBqAcaTP3XKf550MTQY9rM/L51hf1q6OHFtfG41DLtf3efw0MHk7K1KcyZdEL
	dBkQ==
X-Google-Smtp-Source: AGHT+IEGAIFSV01YojFxZG6ti+gZSOdnTisUwlACnGc8HPzYTSLd/Yrx6ey+bzDVw52KF6DYn9VA+A==
X-Received: by 2002:a05:6000:2485:b0:3aa:34f4:d437 with SMTP id ffacd0b85a97d-3c0ecc31e8fmr784959f8f.37.1755580039233;
        Mon, 18 Aug 2025 22:07:19 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:620a:8b00:4343:2ee6:dba1:7917? ([2a02:2f04:620a:8b00:4343:2ee6:dba1:7917])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c074879fe5sm2018512f8f.2.2025.08.18.22.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 22:07:18 -0700 (PDT)
Message-ID: <d00ce701-2ddd-485e-8bfd-12cddec62fef@tuxon.dev>
Date: Tue, 19 Aug 2025 08:07:16 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/6] soc: renesas: rz-sysc: Add syscon/regmap support
To: John Madieu <john.madieu.xa@bp.renesas.com>, geert+renesas@glider.be,
 magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
 rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
 lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, catalin.marinas@arm.com,
 will@kernel.org
Cc: john.madieu@gmail.com, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, biju.das.jz@bp.renesas.com,
 linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250818162859.9661-1-john.madieu.xa@bp.renesas.com>
 <20250818162859.9661-2-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20250818162859.9661-2-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/18/25 19:28, John Madieu wrote:
> The RZ/G3E system controller has various registers that control or report
> some properties specific to individual IPs. The regmap is registered as a
> syscon device to allow these IP drivers to access the registers through the
> regmap API.
> 
> As other RZ SoCs might have custom read/write callbacks or max-offsets,
> register a custom regmap configuration.
> 
> Signed-off-by: John Madieu<john.madieu.xa@bp.renesas.com>
> [claudiu.beznea:
>   - do not check the match->data validity in rz_sysc_probe() as it is
>     always valid
>   - dinamically allocate regmap_cfg]
> Signed-off-by: Claudiu Beznea<claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S


