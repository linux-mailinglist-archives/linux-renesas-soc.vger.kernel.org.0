Return-Path: <linux-renesas-soc+bounces-17247-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62ACAABD32A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 11:20:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D49AF3ADD38
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 09:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487F8264602;
	Tue, 20 May 2025 09:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d2O6BPZg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE6725DAF0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 May 2025 09:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747732796; cv=none; b=tPJB2QTeC+yvnYn7FWbJ3e5HbDQUNYvxnEBkXKLJe/2menc0FCoVLuORkJYV44Nd1DJznxzY2M0K5vJ1moNU0UgIXA35uUDp0kVtaUL4RUSLGC4kCCmZyB5uGmESgAeT9UNFxzPTeeW1DoMR7fpLLqDDNCxyj6gSGOGRMv4XGdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747732796; c=relaxed/simple;
	bh=yT/QtvKLeUa8jeXrh71nPfnSeQ3XefPZ6BT+ePGHDck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Au+UOxqOjWAD+mq3xIuJc14nKeOvBzyIA5CmsEGa3mHf/6pSZOct+EVv4tW0QAb4jXtEiC6DsD0Wtm0+EDs8krbzANc2lIJnn/D/sk3Jd4M2BTs8KJ8KqTMDbHrR+JxtvMcfO/0V1jXXKt5aAbuhO9rCRSD8zB7wLpK3B/JGxyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d2O6BPZg; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a368259589so434789f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 May 2025 02:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747732793; x=1748337593; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yT/QtvKLeUa8jeXrh71nPfnSeQ3XefPZ6BT+ePGHDck=;
        b=d2O6BPZgF5AclLlGZszNVqyYKijTzwMaStBnrx5icdTKrORd6Dp4bgcWR4aeG7E0lQ
         +uD9NbJAUc6gUnCpcm2OsbcY1EzIDOBiAV05/kbnWFlwXyUe67pk5MPeIMm+eRpH2o8V
         3kAUGELIkGlZrhhA01l3GlODotAFBT4gAqRla6Oz64TJt3ZD1HUPshjlnOPLyxY0nZle
         e06EtRg9Eo+48UUY1glDhv9Ry90RUzt7IH7ck6Au9sZc3YKSXO5nVpsmZQxNPMGvw4jW
         3O1fjKQsGj+Bu7/g+SNK8l+rYW3H2OhQp0j6LHHyBUTY/jJLqHGCMO5H0CiSZMBYLEGM
         XKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747732793; x=1748337593;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yT/QtvKLeUa8jeXrh71nPfnSeQ3XefPZ6BT+ePGHDck=;
        b=Fe2Nbi2OkzhogErsL039HFpxHlwtAGbNe/IPlduU39hCA1Ond2K/g3UM3V0JPRtNH3
         5sIxhXSin0sGicQWWWjflW8a8basnCixUCOoKZ6SNCOkbmIHBkV9+SLGS0r2n0T0hlbl
         iNT/jetTLQP8MOjq0gp5PkpI2TsR+odEc0QeK5Vi2pdZmofJMLMHccRFUwPFZErjdNnR
         vtpu0N9tkd72NyQ8QfvOBxSNSRK9V90h+CuU/f72IHeKEQbV71uZnyF/GEwua9X5isyp
         Eutxg/bgBUVCgu9/w63vv9kWAZy+ogLplCH9kwNLHjsJjn2APknhW01ADmLn7boMvL91
         WDBw==
X-Forwarded-Encrypted: i=1; AJvYcCUSXkb6m7F2o+FQhxkvCUXg+jSwMj1k7/VwOPKfOiG5YhLJ2fEOo1O1m6leHJzGdpQRWF+isOsLzKMKvBYCGrhiRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5G0huLz6vURdcDNxVbQqZbagEtF8webK7YtGLVZd8iDdhvVlj
	L8Fjlon/PXmjjRV55i6kvgRdcmKkghhzHup5GvoZWvwp40ePVmpGh5a7cLAM+rbBpQ4=
X-Gm-Gg: ASbGncuV3JlNFoiZLauonob+vVxs6Gz03VDPKfPTWO27x5ac1g5uHeBBlXwXJ6xAgqr
	wCUYvhqi7fmjxfPCG/ae0u9NlR5acs7hY3919BfTYWX5X7nzwSD3zPrtz0DyFhK13tuxPR5RTBi
	IWUcliLcUCTBPZG/AtmUn2lxTpeOQ1qILefIQRhEVILE0IBeZkJZPQ0gYRrbUcS9qpIaLVNDbpY
	oPHwLHuvg/fGXiochCix2gg3/0VGf4lUW/lN1iWDi+H0FriQ0HYT+4qbAalzdLh3EXOI82fz3fa
	ooupt52Jf6GFEmzY0gszyK1og1Vd9losCttWiXsfDk/B0H2j8twCbc0JoLJOhf5SwReRmy8=
X-Google-Smtp-Source: AGHT+IE0KhG7Byol3rqL9+TUiiilzPQtBPzROXY2nFHPpqSTCakEs3GIZmD5PTaPMzpGGdP9tjEfcw==
X-Received: by 2002:a05:600c:468f:b0:43b:c844:a4ba with SMTP id 5b1f17b1804b1-442fd62fd3amr48271505e9.3.1747732792584;
        Tue, 20 May 2025 02:19:52 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1825457sm24395635e9.1.2025.05.20.02.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 02:19:51 -0700 (PDT)
Message-ID: <eca8721c-305f-4053-8df0-0347cc869325@linaro.org>
Date: Tue, 20 May 2025 11:19:50 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] ASoC: qcom: Use helper function
 for_each_child_of_node_scoped()
To: Ai Chao <aichao@kylinos.cn>, johannes@sipsolutions.net, perex@perex.cz,
 tiwai@suse.com, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, jbrunet@baylibre.com, neil.armstrong@linaro.org,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 srinivas.kandagatla@linaro.org, kuninori.morimoto.gx@renesas.com,
 zhangzekun11@huawei.com, ckeepax@opensource.cirrus.com,
 drhodes@opensource.cirrus.com, alexey.klimov@linaro.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250520091131.4150248-1-aichao@kylinos.cn>
 <20250520091131.4150248-7-aichao@kylinos.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250520091131.4150248-7-aichao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/05/2025 11:11, Ai Chao wrote:
> The for_each_child_of_node_scoped() helper provides a scope-based
> clean-up functionality to put the device_node automatically, and
> as such, there is no need to call of_node_put() directly.


I do not see any of_node_put() there, so I don't understand what is the
benefit of this and how this commit msg explains reason behind the change.

Best regards,
Krzysztof

