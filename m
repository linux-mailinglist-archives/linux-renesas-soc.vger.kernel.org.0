Return-Path: <linux-renesas-soc+bounces-20475-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D880DB2562C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 00:00:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F5927AE751
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 21:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D5542D7383;
	Wed, 13 Aug 2025 22:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EWKqfwS6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EDF2EE29B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Aug 2025 22:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755122422; cv=none; b=H/icDH/xOcCJ7r6PmqfmoY25NCFv/kRMwXeRWGnLIPOno7SnZJSHho5ffhb57+iUJqyLOdKaIkq0GURrc3zfmCMOyWoTBfVKuBdX6VX5bEASXZhmQRqpugB0fvQS5smbrJsPu9GgaNP45NSPLIAO159wL6VzcGkF0lzxN21U15Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755122422; c=relaxed/simple;
	bh=8vDml3sm19tCud9DP2FIyK5L6JNeKNtaH2cdIxByAUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r2a71kua5r+ervjiAkvZdOwVwCfAg9Az8YPkmEd7c/X/+y2nB/UPqQnTYir8DSWf5BO83RMcj2creEDSm0l/YONjZk3hLyDfRC02vjQ6QqQuGqMdgqQB+0fID6zG7Bm/dkdl2B3jt5NNtHvzM91Vbsg8dTZh3AeGV7TDF16p6YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EWKqfwS6; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b9e411c820so144139f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Aug 2025 15:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755122418; x=1755727218; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rSErH38GJLhhhn6LqWdJPstddGMa0f2KvMQKCmhEM7c=;
        b=EWKqfwS6n0+pi00/14gPZtww0wsKDsU/bnL2RV6DVShw0GfzXLJyVn/Cc6MnjrssZp
         X1836amMcspSQw5nYXA00Ml9O3UbX+gjlmchzXl95TdTs11f16NIC4aQxgH78UVe2H9L
         P0Fg3ru4kSJfhNvata/V3cuiq5PJwcVTrAAzZl5zqK88A7uYapKOVnu41VLYqOH7KCaJ
         R5TGyhnUDAsgEo4FWfzss+EgnJbtgs7Igh3KSAWjzJ/+Dmtf0J7UZzSdebJhMrCwWPBU
         O5Fpyqn0/2JIynOKU+3Bi8r/siHEFAUUOvwen3EeKSjQ0T3jgzH3QTib9ovz6LB/H51n
         NCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755122418; x=1755727218;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rSErH38GJLhhhn6LqWdJPstddGMa0f2KvMQKCmhEM7c=;
        b=Zm8ecebsQ5wb4zJN42vpQh4CGeN3Z2IOzuDT/ls29fUgZTF4zgXYs8rgr12KtEXWA3
         ePdJHlsc29tJOdrihH6zJhTfWHqKqmlrHoFPezxGn/otEYk4wTRHbA/mLEsIumxMwpwY
         DhO5tJInsILWsdS06PxypIYRNacTPt5k84Y/zVZ9iFEIgQMBjWA41Dai+Kl9ORZoNUDa
         uzTQLlkYhq8qUWnUVboBb/od2wy7W5PCo867OPrp/TzrF4RVxqTS4AFyq34YZpH0ygr9
         CVcYgqo3suagzp5Mht5pt/ylh9B1RNou/bded0e1qjXC//VSv2alxH7rRFSa0tJcrIjC
         so7w==
X-Forwarded-Encrypted: i=1; AJvYcCWzV/2NnU8j21hje9gvFy3Y4GfifpEgQWlsKvwO/h6NvUwq7/n3wK1yqUawaZlY7YBH/pN9CkUhvYdx1EU8Lw+e0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiBCtmq4yhgeFv8FVxNfHlTg7qVyQTA1c2CyGPYm3DaUHOpx1w
	dsjlg3hBwdR+tPCaVv+ZlVL/zuX1/lA0XGcfJaFUnxEFrCOW9hNH2j0y89LhhymzbfI=
X-Gm-Gg: ASbGncuuxUOuX0fRdWn0QeXC+4hxBZTs7sDh7hHdDoKRNqoAavNqXbGa5PEfqIzMdhC
	fDIAL9eWkjp97OWkaTC3NinSTqYC8geEBkdBz8FO/As0g91A86ZA896haBTa6gdXx80M29yR0e4
	/vmLiuFIsIh3YtWDyZpyZP5X+G2fv3odCI9boB+rtfyHXM22JpPzcSrEl/zOsZOJFj+YnpmL2lV
	Yhkw59rnyu9ZhGt26/lDmScw11UIdnQPXioOSu2dF1xvrlVz/3BsP+DefkLAiNUppFqxtH0F109
	Ut2x6DRZc/tDsa3NlueoJuQ/BuW6OOuBaAdOwvQ2NrCegMwlqbOYfF0z7v16yJaeJIPocvwPDaX
	SQJM1L+9Rtk5S6aofkOTp24Oc4E5o+V+ZRJtiiXzsmr/zPsx6I9CQupZ4mSpxng==
X-Google-Smtp-Source: AGHT+IG0p9l2T2LkiySIWZNQMyABUdzq08C6+UvfHOcIuzynYb0qaNHHfhjbPlxnMtD+LCH7f48i5A==
X-Received: by 2002:a05:6000:4014:b0:3b9:132a:a554 with SMTP id ffacd0b85a97d-3ba50d84fa8mr154588f8f.51.1755122418500;
        Wed, 13 Aug 2025 15:00:18 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b79c3bf970sm48674093f8f.25.2025.08.13.15.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 15:00:18 -0700 (PDT)
Message-ID: <5ffb67b8-cded-412b-881c-14179c2ba3b8@linaro.org>
Date: Thu, 14 Aug 2025 00:00:17 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] thermal: rcar_gen3: Add support for per-SoC
 default trim values
To: Marek Vasut <marek.vasut@mailbox.org>, linux-pm@vger.kernel.org
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Lukasz Luba <lukasz.luba@arm.com>, Magnus Damm <magnus.damm@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>, linux-renesas-soc@vger.kernel.org
References: <20250625181739.28391-1-marek.vasut+renesas@mailbox.org>
 <86f5260f-6625-4e2d-88a8-013143922fb9@linaro.org>
 <a65ae3e9-8970-46b4-a80f-3654daa7a0c2@mailbox.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <a65ae3e9-8970-46b4-a80f-3654daa7a0c2@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/08/2025 22:37, Marek Vasut wrote:
> On 8/1/25 11:59 AM, Daniel Lezcano wrote:
>> On 25/06/2025 20:16, Marek Vasut wrote:
>>> The Working Sample R-Car SoCs may not yet have thermal sensor trimming
>>> values programmed into fuses, those fuses are blank instead. For such
>>> SoCs, the driver includes fallback trimming values. Those values are
>>> currently applied to all SoCs which use this driver.
>>>
>>> Introduce support for per-SoC fallback trimming values in preparation
>>> for SoCs which do not use these current trimming values. No functional
>>> change is intended here.
>>>
>>> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>> ---
>>> Cc: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
>>
>> Applied, thanks
> Is this series supposed to be in linux-next by now ?
> 
> I don't see it either on git.kernel.org thermal group tree or your tree, 
> where was the series applied to ?


Sorry I did push the branch.

It is in the thermal bleeding-edge branch now and will go to linux-next 
in a couple of days


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

