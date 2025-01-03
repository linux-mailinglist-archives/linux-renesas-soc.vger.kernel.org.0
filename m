Return-Path: <linux-renesas-soc+bounces-11809-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E712A00A3D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 15:04:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E24D1884278
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 14:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF741FA8C3;
	Fri,  3 Jan 2025 14:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mHad7xRc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B681FA24A
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Jan 2025 14:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735913047; cv=none; b=Y1wTLPz6CAIt6tdYWRBP2hlgezdWV7cfZVBIS6uJE0s5ctIp1a6AnVgNnpeaHsSd3S7lHMuiMYuXg9NvVThbGgMaVUwKrfoexn1IVCuLQiRi+mUNgcAJ0Q7KEfCotxUTqdO9cGk7/SRITGpEmYunECFeVIpd0rErq7I01h7b2H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735913047; c=relaxed/simple;
	bh=IRJHciWqqdgGQOEUniGMHthK9iLB/AW7DgOoZrn/pVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Po1lpKnS1aE/vnRPuOOwbsqzfQSBv1zHvR/sItS7uPs+KQSEWufh1Ast74uiF9uf3Z6kTG154+QenWDb4NsFfbD5Jdu3jYrLSnWiOIEm2sxcvSKJ9fnLpHb3LYFRZiIuqUY/OTAQfcP8B1nghWKEyLcdj2Qj0kGgNAPAgfRYJ5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=mHad7xRc; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d41848901bso23607894a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Jan 2025 06:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1735913044; x=1736517844; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1nadMbH+ZbVOHrjS+G35Vf+1M5GTdHk8b7CxTha8a/M=;
        b=mHad7xRcUfXVSAcCXwhobjuFSqorBvZVnpA4ejp1GfNtxJCYtLeAl40tgdQ83JNNQC
         7PHTXTfR4a0Phd5vMzEHWVrU+5YjLEJZCnDVKakX7whQpnkIOJroPucNCYK5gksixgOO
         XwawSD0crp4L92hOMxdcGGAlmJwpRfYfjul7FJIaTUkeJjghv9wk+4PnDsCgcbmbpWAA
         USnWWuQCwVGgiCxyuK5HCVe8dShQWkfygFs1xn/giLVdhawP3pdMfxWD3jwfl8RfmjNz
         Ph3eJyyiuDhUppmwXvIPC1VfWiwXQkVbB6Iz1EVGxlKTAC+Ih6NS5Rt94jwnyif/1gtL
         kjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735913044; x=1736517844;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1nadMbH+ZbVOHrjS+G35Vf+1M5GTdHk8b7CxTha8a/M=;
        b=QQH26XmJTw79MKIT36VRXpQc3Yk2DgaVB+3q56vdsMx5bBI/OAn6nWLYjwdBqOkf7q
         Ht6hEgvJWOnvXO+S4X70Ndto6Gjh44yqHlEtuToGhjyVdajVUwAn62FgB2r15knA4FCa
         FwflGrwHdANQkGz4qNZXACZLHDPEtBbBYh8us/4xgBJPS0pANHQxhSfukBdbQhKlAvMW
         5vg66qivYELZXVgap3pjlmWkOcT79oWcMphA2yeCZonHx/jfrCogpWEjQLOrgSmsAhh4
         ZoESxmNVSHmuVNoosArQhZTLxlE/G/4cjPDVi4/c5omLFbRsI+xXtEBclbWLWqpVOPqb
         w1qQ==
X-Forwarded-Encrypted: i=1; AJvYcCW61qlV4HceaQx4Gi+CTwdJRDhartJgMAcuDT11U70ahCc6nj1jwg1+mpqC6gRnfVHlkOrdLGAuMGR4nQiwQjTAqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUcyYsctKiKrKClbER/YwWlUJbBZs5bVPev+P1B8aN1BLRvsgY
	H7J+FTRa/r606e+np8Wz4gas29AhrJDqh+cnb8nCG9YbliEq17Na/851cFu/HPHntrjeNdlCL9s
	1
X-Gm-Gg: ASbGncvMFV5uLJq7p5fFI2fZWNfeJ2x1HzlirGwfTKVrnAjiCj6kdUF9WI2p0MAx49T
	0Anq4DSmVObSlln/JereW1BFkFC+cwYk1fekESgYETrFgjVeXYs8JuqmdjczJLxdNBsaLDMzvY5
	Qorz/6SRN8dBIzWHFAc9qG89cSD7iNPFbquWbJq2nj8DNzRNb2N+P8eL7kZfUdLHeNNH1jHcbwn
	2/wM1tXo3mCFr48Fp7xHe5zsvcvpEBeACDm022eRNUoNknp98wCaN86h9mKwZ9/lg==
X-Google-Smtp-Source: AGHT+IHXizRGATHHIB9x/d9Ka0idAbL9vxxT/I6jeN6KVRqP+AQrKS6HS0dZiWSTzEdkl6gN+V82Og==
X-Received: by 2002:a05:6402:2691:b0:5d0:7282:6f22 with SMTP id 4fb4d7f45d1cf-5d80245b76fmr42721534a12.14.1735913044130;
        Fri, 03 Jan 2025 06:04:04 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80675a3ebsm19489852a12.7.2025.01.03.06.04.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 06:04:02 -0800 (PST)
Message-ID: <be7c786b-e786-480b-8ce9-917a0836b7ce@tuxon.dev>
Date: Fri, 3 Jan 2025 16:04:01 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] iio: rzg2l_adc: Cleanups for rzg2l_adc driver
To: prabhakar.mahadev-lad.rj@bp.renesas.com, jic23@kernel.org,
 lars@metafoo.de, ulf.hansson@linaro.org
Cc: linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250103140042.1619703-1-claudiu.beznea.uj@bp.renesas.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250103140042.1619703-1-claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 03.01.2025 16:00, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Hi,
> 
> Series adds some cleanups for the RZ/G2L ADC driver after the support
> for the RZ/G3S SoC.
> 
> Ulf, all,
> 
> Please, do you think there might be something wrong on the power domains
> implementation 

I was referring to the driver part (drivers/clk/renesas/rzg2l-cpg.c).

> that led to the conclusion from patch
> "iio: adc: rzg2l_adc: Drop devm_pm_runtime_enable()"?
> 
> Thank you,
> Claudiu Beznea
> 
> Claudiu Beznea (2):
>   iio: adc: rzg2l_adc: Drop devm_pm_runtime_enable()
>   iio: adc: rzg2l: Cleanup suspend/resume path
> 
>  drivers/iio/adc/rzg2l_adc.c | 62 +++++++++++++++++++------------------
>  1 file changed, 32 insertions(+), 30 deletions(-)
> 


