Return-Path: <linux-renesas-soc+bounces-25581-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BD8CA4F1D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Dec 2025 19:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E0633079A14
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Dec 2025 18:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5673627E040;
	Thu,  4 Dec 2025 18:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="WRfH4VKz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1AA16A956
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Dec 2025 18:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764872748; cv=none; b=PQZq1DS3FdcHAytSpauj0DBeyUtcQjZe6cQ2Kh7iaL43fSTiBZ1DL9dCxWl62/+YAr58N7yjODE65PJ/spLZXz9dkIfPke4SOuSffEW1Dc4XUKgOUpBVNVTKCNTt1I+9qhLk1KbQqhKJOK6mCm3jX8jL7BbQ12dGDbboUcCwFoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764872748; c=relaxed/simple;
	bh=1DK3+GCsO1rO0SeIR8bK/dQ/sVtIPdex1pc/8Yurr88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OYmtZB4eLPpQ6Cg9ca5Wx6MX5OY6NkyBMU5PEVrw2z7f6DSDQj+y5hOnICRxnoKqWaZ8jaAwRVA3rqudCHQ5AAt1NVBRFlObnFvGjFA8lp/s0rUYyK3cCrwPHLNFlFzx+dy6TDQ5Y2Wd1mLLs/MMAJd6ztE3LX6G08aAJq+MEmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=WRfH4VKz; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso6889965e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Dec 2025 10:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1764872744; x=1765477544; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ysTd+Om/mVD5YEV1Rfo6jK8jiWD+WsoriWlfYjxUi3Q=;
        b=WRfH4VKzIThcb29xs0BfyMucm7f8I7KPn0UhssBuKFVssu0CI0ouJk3cS3CiHABS6M
         oJ3extX3yZfHKYxmggZAR0xfNFXPnfxr4YAwnhifB0jlyJHLW68X8g3B9QN/apPbNAqj
         iwrGphqPiJkngP4IZElsO8wN+sX5bWPyRfB5lCZtfU5dVObZygwa3Me9XuKZLkLxQJom
         ZLtcpO4IRzjL+QDSJsyK5OsNq87a7oZXqA6XrdxuQt7AeIeEcaWHlbv0z5irCbZ8ppkw
         LiNOPQIruscCpowVQkjecGrfsN7WDxjLEZ7xvHwXiofL98Xub7vghTty4V77VCWAX/ph
         GqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764872744; x=1765477544;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ysTd+Om/mVD5YEV1Rfo6jK8jiWD+WsoriWlfYjxUi3Q=;
        b=wHEChtCdZ22qhpFPhIClK9ZhjgrOX+iZPcXDYJYi+eHyRrF7baLONFBKHtZBghyDzl
         JVbhIFMvlQqRzTY+73pP18MMR6y3sEG1au87gSCRltKTDwrn8iGoI5q8fQMTeilbu+QL
         nTG+msuUl1mf/FqAudycyqg6ycyn4S0iIPBuAsZyg0XDdzKgavVLZnPsPKDdDy1djaXG
         8uQJUylIn85B84FUw2rK3LIfRp52IFywC/PQWRqst39MVsigzFueAC7s1qyICojMjFwu
         vWjosQs3Hco95X2qlRF33BhUxC2AIv09zbwBF2c6dEpyDcwtFUhet8FquCIqMs1lccgL
         mGlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHj4Z5SOC6hBR6NKE0oa4w4xWmFph0nEwa0hRlMj3sdVP+w6kRMENCehZKemskh60i5gD7aLxkSBwD5YAQDQ5Gpw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx61GCmcmzUCl0SV2jZJZw+2+TzVwA5oe2mtIOYBqMVv6oGvLqI
	wqgAEJHCHfYpd6HX9pElUQPSEjiAosq3C2gzHVdGPDhb64cB7R55JNi9ejaN+CrXYhQ=
X-Gm-Gg: ASbGncsJ9PYC3HB+BPgebtovRh1OZe0W/SCWSBi8ftCmC5HRDRw9kkC5EJ7AsFXZR+P
	YBYCvggZdHmyAWD0TGVLfuFp/0uoCaAJ+xfc47cKAO1TqBLSlFXvXn5I821Eya+ji0+bjWoEVby
	bo95IQmvOajdEZdEuMZsk2ocjVrEZzqWsH+0JOF0pJk32AuOH/X4YNECND5hllmSOzGKA2Rjux8
	NP6NGt5ftQbbjnuoLynf+M2Jn0YKaPPWhklI3TzrNBJPTEqaTqK1QL1VU/t/HZeqaSfyeheXt7L
	I3N9Edc/WJI+8EFF/ppn1lQ13Rr1QrcIV6DnFHtnJnQDC2Lz63vthbkeB4cpNsV4oTNrUCobCSU
	88W3b4/b6Lhj9gEycG0tJkW2BsA42T2sHlWaRSRdaKtRQf6MU0ksQJv5Zrwf1DPmH4ry3CHUtOh
	kcpzPdC+KN0IT8Wvjzs20=
X-Google-Smtp-Source: AGHT+IGBJTokm3JvNBhCYPTgPHvkJ1iIrFragpuP725ZRh4z+gZ3N2Nj2hHBKv3e+Rr3uHUqb0EA9w==
X-Received: by 2002:a05:600c:3b05:b0:477:582e:7a81 with SMTP id 5b1f17b1804b1-4792aed9ab8mr74809015e9.4.1764872743815;
        Thu, 04 Dec 2025 10:25:43 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47930ca15adsm45758105e9.13.2025.12.04.10.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 10:25:43 -0800 (PST)
Message-ID: <19fda177-6c11-45d6-9dab-3f75edceda4e@tuxon.dev>
Date: Thu, 4 Dec 2025 20:25:42 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to RAM
 support
To: p.zabel@pengutronix.de
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20251110132715.724084-1-claudiu.beznea.uj@bp.renesas.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251110132715.724084-1-claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Philipp,

Could you please let me know if there's anything I should do for this series?

Thank you,
Claudiu

On 11/10/25 15:27, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Hi,
> 
> Series adds suspend to RAM support to the rzg2l-usbphy-ctrl driver.
> Patch 1/2 is a preparatory change to avoid suppressing any
> configuration errors.
> 
> Thank you,
> Claudiu
> 
> Changes in v2:
> - use pm_runtime_put_sync() in patch 2/2
> - collected tags
> 
> Claudiu Beznea (2):
>   reset: rzg2l-usbphy-ctrl: Propagate the return value of
>     regmap_field_update_bits()
>   reset: rzg2l-usbphy-ctrl: Add suspend/resume support
> 
>  drivers/reset/reset-rzg2l-usbphy-ctrl.c | 105 +++++++++++++++++++-----
>  1 file changed, 86 insertions(+), 19 deletions(-)
> 


