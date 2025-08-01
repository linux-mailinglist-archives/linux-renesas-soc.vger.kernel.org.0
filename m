Return-Path: <linux-renesas-soc+bounces-19833-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D12B17FD3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 12:00:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68EF4585DEC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 10:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A801236453;
	Fri,  1 Aug 2025 09:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y/49zNGn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8352356C6
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Aug 2025 09:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754042353; cv=none; b=onA9MPr4havssXNyPlm2vS7qBKSm1NNpD4tfReuxhsCRI53Z4qPwkhTQMCydQz6+yp6dCmtpm8Bhkglr4TYHDrCCRUTQp5KSo4Kcfew4gbF3PWSz8lxRKyGvkJ9VQFs56Pz4cO+ed3VlaCxGaWQ1IHrJFcs7HRWi1viMN6TaHYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754042353; c=relaxed/simple;
	bh=6eCKSkwbpp+zEQC42TKus4PT6JVQvtzMaXWZQ1EfffM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mO7Nw+b2zH99K8zHfCdm57qltW8ADwmwtvSY67qp5oNR89d2oAkXxEnV7AOTdypzSS2074uWRWU6C3UDcVllTnEAVTosZrl8UbeWKz6iDocuU3UUn61O8oUAxEtt1zo3J+wUs4gCxm3Vv/nWslgWZwU0aG9CF7pdABoCDz8j23E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y/49zNGn; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b7862bd22bso1749301f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Aug 2025 02:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754042350; x=1754647150; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iAtNeeeBqfLUn+sT5Zk3U+6nRAWdfcW1/7E65kHu/Ac=;
        b=y/49zNGnEHlMIDKhiGfxqyFgeETBooiruqg9vstFK8Pt98RiitTuiNOBdhDiQ59q5n
         bxJ2xtd3hFdoAS9qRMyXV3ZU6yMIzDVI8UxrriseuNn52sP8Bq+KFMF5Bs9YxpwsMl8s
         c2ygALQjtvV4VLQTI/qm9SezyKj0xTWkVtDaYrFpGSMrcNCTaRqk6SrkSF7z5HjgrW74
         AwnAUbqgq/e7ISZrPdWeeIheHCbTFG4kEjHSzP42tBkVBpNvZ3D0Q3+MdFYV58+yfPIO
         5ga3TVbffqI6Ni6VPoJcf2PidUdJJe4aRg/AKNUAidJNDCMY2bNaRozFPtKI2537a50A
         gMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754042350; x=1754647150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iAtNeeeBqfLUn+sT5Zk3U+6nRAWdfcW1/7E65kHu/Ac=;
        b=noMuruBbSQdtXUQkCPsNLGTXsfdZdDkp64jseT7+0XV2AgAfcnsGeHP0o4Tr8Sr1/m
         rsfm75oayEvFvT9MBOxLwiGAPlwqikYUag9D0lkDYdEZkvOnQlKlZ0b3FMRqwfr8asXP
         k6TUCbmnNh85+qt9IS9+mBwBI1vCDJ88qyobZU7Zs40+jRCzRYnCBwxfSmdSzM8EmExK
         93SHfT1KeEWqkrWPAaLcdVtWGEhQtv2l12Rs8WPag8/yv9n47VP6zm+RB8Xe1xPA8GFP
         o8blCS1tTgofuhkABicZhW7tzc+pTHPn3rW+U8+c2THQ2MrKjn7WQ3xGUUKwBCRn5GV9
         VXLA==
X-Forwarded-Encrypted: i=1; AJvYcCVO26kYu8l0zOkbYTW5a9YUhA/Ripk8HSpAmAQX/LsP1BdcQom4L/zCMxZmrcfFxcqpnSXQ7GmbnqmB9frHT64usg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwX/Hd9ZhQybXjLdnXdAkfIbim2ZBLhEL+/MPo5XcXmqfG1WJ0F
	9ttBczVBePu03QVJ/sdD1itFkwfeMVeuJe06h+bXSwAMoQt/GvWTCRkq7/XV10E1BHM=
X-Gm-Gg: ASbGnctNIn/0SL8+NO2Oe4gXbbMNZZJNJ+rJ+CKzQBRGNkQR4VtHJVuqJzZxFBtEqd4
	/uegmYrKCE8/PzxYu+4Hl4Mo5gtMWyMCe4EweWMraWktD0WNO6LUNfz791yHZoQyiWNNIsanE2Q
	Kt+k6SbA1mmAC1sfpewCA31cKkKNEIhP7tLw2EbrL9TPzpNAUu6gZOU5ylQyLZEt6iRfw+R9Qh7
	ZiJJD7Iwnw94KoSpuZ1VTpPz0ZepPCLl9n9TFHbdlJdycHlqYGNg2ZhgvZIXoR5yUexrmbOZ9qU
	shSLeGzRef38Oe0OgGNs4ZQwsLe2IJW7tUp+8FabNF+4XYUAQ/YyeI+A9jjpMIECiogGgS0Ozip
	Q0AnLuOD9l7eDLTZzI3f3VYM8QaxkMjkCBb/Jv4MjyxSk+MYBpX5ig5vqPXy8zQ==
X-Google-Smtp-Source: AGHT+IGSIhoRFdnMjpT8FEPv6ZdYsjdDrc9HAxmDYufhad1DYvy2LtbioIaodCfl4mJzruqCYZ3X7g==
X-Received: by 2002:a05:6000:2c06:b0:3b7:7909:5b22 with SMTP id ffacd0b85a97d-3b79d43e4e4mr5658620f8f.8.1754042350328;
        Fri, 01 Aug 2025 02:59:10 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b79c453ca1sm5374537f8f.48.2025.08.01.02.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 02:59:09 -0700 (PDT)
Message-ID: <86f5260f-6625-4e2d-88a8-013143922fb9@linaro.org>
Date: Fri, 1 Aug 2025 11:59:08 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] thermal: rcar_gen3: Add support for per-SoC
 default trim values
To: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-pm@vger.kernel.org
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Lukasz Luba <lukasz.luba@arm.com>, Magnus Damm <magnus.damm@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>, linux-renesas-soc@vger.kernel.org
References: <20250625181739.28391-1-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250625181739.28391-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25/06/2025 20:16, Marek Vasut wrote:
> The Working Sample R-Car SoCs may not yet have thermal sensor trimming
> values programmed into fuses, those fuses are blank instead. For such
> SoCs, the driver includes fallback trimming values. Those values are
> currently applied to all SoCs which use this driver.
> 
> Introduce support for per-SoC fallback trimming values in preparation
> for SoCs which do not use these current trimming values. No functional
> change is intended here.
> 
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

