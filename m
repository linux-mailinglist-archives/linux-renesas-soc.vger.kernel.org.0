Return-Path: <linux-renesas-soc+bounces-24421-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1ABC47947
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 16:37:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EAF51883BBD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 15:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB1C2236E5;
	Mon, 10 Nov 2025 15:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="dDzrr5WB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18221487F6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 15:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762789001; cv=none; b=uybFyp6yw4sOo9h4xe6eGl3yq+miXKZKahDaLYHt/mdTUctGvx1BKa6qE2HMJS/liC84mPqRss5TYlH8MvGeO9o0dN95x8g2iX51XwUT60SQRdPd0lgQ8/Zp0RYwU5msONBxaMBP8b0xIpFjj6UBlWYnPp9BiVhT8ZCGD1orm/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762789001; c=relaxed/simple;
	bh=uNaQu/Q9ekThqQDmD6zJz09GyNvN/wxUvc2BUIZOTaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qxa/jfEskUwFWXcNXK2z9aZn8W9FheVB0sYexveXA6AcFqQ4fqODPjogTit5z/5GsqqeChPQCVJmELOHhyYKnmOYYmiFr+SQUyZh28ckAAwZxN6R2hxNFhkz4ojp89MNmkv4bd9GgRBA95kRxTXblOAGfLNivCvUUlU8ViFsx3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=dDzrr5WB; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so21946505e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 07:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762788998; x=1763393798; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D5Bd/tXItEBXiIJloafWDp26fh+vqPiEInUwjV8UvKA=;
        b=dDzrr5WBufjrCoJ90m04t2gdudcMhJxYfk/ZbjMGcMDt00JdTS+9NlR+obpva0uuy1
         yfw4GWYQt3mLOdx76sfQQTHH7G+HjCdw/q6dvEhO4+QnY7sJtpohMjNWld/dn8l9DCbu
         l3j9Xdd373yjn9xjNPFLla4FcBXSpzt94XBqIVPlpNRhliw0Lel+m+3m8w0Q+X4YSHts
         Bbn9ZNxeuqTu9599cFEnvpujFLwgtT+NF4DdpufvPF6xWfj06ydpF0rZwCNie+2QZZY2
         FQB+tj9ku/T6enwxJvmwa4r0PUCe+9k7is9vv5jbDE5V5OgO7nWjCbLH72PExrAyoWkq
         VM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762788998; x=1763393798;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D5Bd/tXItEBXiIJloafWDp26fh+vqPiEInUwjV8UvKA=;
        b=siVWav63MSrGzMrMxcjq9SRFl9JE1Id8Nn1T8TDs2mkjt0K9jdS69SCPdtzQfZ42gh
         g2AO4Z7x0CepGVXlOxgh0O70+tO0VVdCX1sUkI7vpWGSkvljPXblF+beZmGv94o/dNBc
         Iqqr+6d1lrwo1qGGz7+8lfjIzc51kuH9o84pT5eWvkaNRD0eE9aguUqFl/81P7Q0jBCb
         mJhAGcM4ycF1/KgECbNi+h3bRcrKSnbw4V5w7S3xqHAOSgR1dHoc9ZGynzzu9mLz1SDD
         Hz4c4vslqo7lTVs8BZ+3Tlj79kvIrIOZNz+XqDxR3TSzoJM1oIT9S99YXz5OOz6FhH9H
         tXow==
X-Forwarded-Encrypted: i=1; AJvYcCXokgtG7a/uZEx6OllarzO9UWd5/2kAaTDpp1zAPzAT8hTZBwAWXd9JVLEVdSIC66WGc6GMf4a7nos5Xcz4DK0wig==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPewnM+bEKsldn9pW97pxOtol6sLlh6BxubgNvwUm6wVKO6ZDD
	G/EOJ5xux+nao4L9QbUyUfEuD3+T9n0NXF90LdD1ErgJ539SGZp+2gfJnq5sUaWA9Ts=
X-Gm-Gg: ASbGncu4g7hbMO9+ALghMq56EA+CfA/AHzyhUG21mwkAwylJGcRDJgcb9ZCWTY2sd1F
	mTsb0J2/JIrDYqaSc8gvTLsE1hOacrEoTfHKFjGmpA/iT6qsPLNBKrZbxuR3meYgGxFmwyjExK3
	4CfhdlPFuL7+qwCuKxo2zIbW7QB46i0q5TeZOWNhZyltmbbb0pFej9au+gJ+ao2/Gn67k8U8psD
	z94Oaige5AdPKuapfNK/N1w9IqOrNKSPc1naeRGqIINGTl+mPrBPi7Hr8Rdc6qI+iheFNW4J57C
	GR4zg8I0tIjhfP2Tlj4f0VxF9KXKxy5oDKS/MHl47zsHwM9/CYd0JDvs3Q401ZJQgWGWcqYmEsW
	WcWZ6BW+w6xp7YaiOJ2tQDsmsY2x26GTdBhvKs5gVVD3xg01t3iTtGSDnyObzz2FCerKJ1sdzoz
	Os/qJ8brdnN2TFwiS0w8I=
X-Google-Smtp-Source: AGHT+IE9qv7R/OTtTxm4cyE+W6NnDq81Hw117g+4APUr7JY/9kd4Ue3rk8z43sXSS7BU9Q+6UaWtaw==
X-Received: by 2002:a05:600c:4453:b0:475:da13:257c with SMTP id 5b1f17b1804b1-4777327cf62mr77057595e9.27.1762788998113;
        Mon, 10 Nov 2025 07:36:38 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47763db453csm122413775e9.1.2025.11.10.07.36.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 07:36:37 -0800 (PST)
Message-ID: <8c654a1f-2513-4afb-b33b-fabbafbbe845@tuxon.dev>
Date: Mon, 10 Nov 2025 17:36:36 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] mmc: renesas_sdhi: Handle resets
To: wsa+renesas@sang-engineering.com, ulf.hansson@linaro.org,
 p.zabel@pengutronix.de
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20251008042526.3312597-1-claudiu.beznea.uj@bp.renesas.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251008042526.3312597-1-claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10/8/25 07:25, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Hi,
> 
> Series adds suspend/resume hooks for the Renesas SDHI driver. These
> are necessary on RZ/G3{E, S}, that supports a power saving mode where
> power to most of the SoC components (including SDHI) is turned off.
> Resume from this suspend mode is done with the help of bootloader
> and it may choose to disable the SDHI clocks, resets after it is
> done with the SDHIs.
> 
> Reset signal was deasserted/asserted on probe/remove as well to
> avoid relying on previous bootloaders. This is also useful for
> unbind/bind operations.
> 
> Along with it, driver was converted to use
> SYSTEM_SLEEP_PM_OPS()/RUNTIME_PM_OPS() helpers.
> 
> Thank you,
> Claudiu
> 
> Claudiu Beznea (3):
>   mmc: renesas_sdhi: Deassert the reset signal on probe
>   mmc: renesas_sdhi: Switch to SYSTEM_SLEEP_PM_OPS()/RUNTIME_PM_OPS()
>     and pm_ptr()
>   mmc: renesas_sdhi: Add suspend/resume hooks
Gentle ping on this series.

Thank you,
Claudiu

