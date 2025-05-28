Return-Path: <linux-renesas-soc+bounces-17613-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8773AAC691B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 14:19:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB3101BC6F9C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 12:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89AB5284B5D;
	Wed, 28 May 2025 12:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kLTei5vg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EAD284B3E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 May 2025 12:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748434773; cv=none; b=hJNDHgZiirHhdgQHDUtZZcrY5q7pkmFksB8nnHQsBKWYlpyj+vkeCCJqE+NMA6UuJCpaBoaNRnboPUDdIaDLRxsA9zQ/GkoulMly8FxuHspilOoLENX7l9+rUvxzHLe4YUMxw5a5cRkCxUZb4X6JHMTvl47UHNu8YCcucuYOQRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748434773; c=relaxed/simple;
	bh=UTy+PEU7tr0mOQr1WcfZgDzuuEmIiCfQAFSll5QPB9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vw0XrxgSyIu5v/mMJHbmmrxDiC7Cl74aLcPRuiga50shjBcWTDLHt4cuX5hZVHJWpf9baYumUTPnsH7GHNd1BOPpWd0qOrmGVzIUcHu066mlpqcRk+SZWtF84/ZkUNZcZAGGmsSnz1Oeqc02DV3A9OtdwiqL2L7DqtV9/MAtYYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kLTei5vg; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6045b95d1feso7544588a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 May 2025 05:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748434770; x=1749039570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gUs1WGbpbtSdkN7Nj6CphSlTzl8HeW1Wjos25VNHfcc=;
        b=kLTei5vgu21+KKSJf3ODIz96GYG117NrrT6qfl9k2/mzeS9baqjonSD53BfyJ/8ENl
         oyN1ajvts6hopw7+BxxOXmV4KriXwyGJTyIUCePFDSkiC+8Jds3OGWKcpodX4TtG8ib+
         tX4qEdqbKD3ljMD6zmGAlhVb7sWBX0GCN5bwHzeVYVbF7mKn2CJ18hg14pPIFayaAz4c
         X1JbZ2AGhZUDXtYFxRtLwC6aXrJWw1WCuXH8jgWWdYdRj+xVujQ9d0PcdWkAJCuclCk1
         kndcUMQudzKC1hiPkesJR5wTy9Tfz8fniYn2zn17YKbMGjEo0kdn1dMCwiRSYjnnZf9m
         Chew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748434770; x=1749039570;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gUs1WGbpbtSdkN7Nj6CphSlTzl8HeW1Wjos25VNHfcc=;
        b=sTnVHufT0lJEkPwXxb6EaPQpVLuaa9Do0c65K6wC7b51UcZl0UFSrdqcJQisBxmf7X
         d7xRrVEbcKghI9CRlAg56XagbXcm7oFe+fURkbdcSdVBhYh9k/fixoxIxQ7oHP5BvuxJ
         Rx4VHZXNp1Av22s+wmaSuUo5zP+Lo3HAerxegDqU+seZcSG504FFzLcMhLMzovCnuKGT
         hOurzgot/7kRvzxBGmycP9ag7EV9NEvP/Tezc3gyR9B1EowW5JozSgBpGrVUt5ptj2r9
         7LhTNn2QuMmEU1P3uU5L+88xfenj5Iq7CeSdeuN3Ml4767ESk0ovJpC4AJQDtsftj0pZ
         9R0A==
X-Forwarded-Encrypted: i=1; AJvYcCUUxnKhhekUelwVWUjldW5OFcbVoh0mxFGUMtqjqbwcRGni+m5sHxfZ8KdfkjekhYuFeI1F7Fbp+HrNXod3Hm/bgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDI+Nq3Csrtx1P6dmLkWrQ8vQG7E4wyS6GVYSF8hC5+pZwhsDg
	Jj0ZFOGMYDKVdrU5GAzROs0iKUDHfOTkyXVByEXEDZFfLB366Juck5AYzubuOp47YIE=
X-Gm-Gg: ASbGncubcjWh0yN7qmT5OuqS2yty+kLW6O57HxghHFBrCABFnW5a1q8gHsM5ZzSg/00
	ZKYDVTmAoaNwo6nLHBncC1h+nZi9VhIfsKobjII0JPNkUNk7hCubXxBfvQphWoVmHEarLdkBeu0
	EBnffJAeezBWbSuUPGlDhd/XLHvYS3hffx0TEH7eDXqGE4Wis6HJUwDwkCtQJObbyfQwrFaZCrP
	OqKDUE17kxTTiek2omAn/EEjvEOvXUrSIu348qzC+Cbrr863UwigETJgKMlLPooeTHcjuJ7NBcv
	p8DfTVfTvIqDiuExzdHTG98GX948B0Dpr7nUICO88F1kOp37pjlXnLdjC86b
X-Google-Smtp-Source: AGHT+IGGhc5A2T3ca464ACVEsiUUFLDwI1rD81PEkeAvBkW4x1BJfuPs5Bg5vFJS51y64CfcmLZiFQ==
X-Received: by 2002:a05:6402:5113:b0:605:878:3560 with SMTP id 4fb4d7f45d1cf-605087843demr4023398a12.26.1748434769848;
        Wed, 28 May 2025 05:19:29 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6051d5d9936sm706164a12.7.2025.05.28.05.19.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 05:19:29 -0700 (PDT)
Message-ID: <8bcbf37b-b70d-48e3-b435-a097d351f786@tuxon.dev>
Date: Wed, 28 May 2025 15:19:27 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] PM: domains: Add devres variant for
 dev_pm_domain_attach()
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
 len.brown@intel.com, pavel@kernel.org, jic23@kernel.org,
 daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, bhelgaas@google.com,
 geert@linux-m68k.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250526122054.65532-1-claudiu.beznea.uj@bp.renesas.com>
 <20250526122054.65532-2-claudiu.beznea.uj@bp.renesas.com>
 <hojdkntm3q5a5ywya7n5i4zy24auko4u6zdqm25infhd44nyfx@x2evb6sc2d45>
 <CAPDyKFptNg5t6RehRNNfnnuCqpfiaQLaHBEdh4aRXfn7X6rYQQ@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAPDyKFptNg5t6RehRNNfnnuCqpfiaQLaHBEdh4aRXfn7X6rYQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ulf,

On 28.05.2025 12:31, Ulf Hansson wrote:
>>> +
>>> +/**
>>> + * devm_pm_domain_attach - devres-enabled version of dev_pm_domain_attach()
>>> + * @dev: Device to attach.
>>> + * @attach_power_on: Use to indicate whether we should power on the device
>>> + *                   when attaching (true indicates the device is powered on
>>> + *                   when attaching).
>>> + * @detach_power_off: Used to indicate whether we should power off the device
>>> + *                    when detaching (true indicates the device is powered off
>>> + *                    when detaching).
>>> + *
>>> + * NOTE: this will also handle calling dev_pm_domain_detach() for
>>> + * you during remove phase.
>>> + *
>>> + * Returns 0 on successfully attached PM domain, or a negative error code in
>>> + * case of a failure.
>>> + */
>>> +int devm_pm_domain_attach(struct device *dev, bool attach_power_on,
>>> +                       bool detach_power_off)
>> Do we have examples where we power on a device and leave it powered on
>> (or do not power on device on attach but power off it on detach)? I
>> believe devm release should strictly mirror the acquisition, so separate
>> flag is not needed.
> This sounds reasonable for me too.

Then I'll drop the detach_power_off in the next version.

Thank you for your review,
Claudiu

> 
> Note that, in most of the *special* cases for where
> dev_pm_domain_attach|detach() is used today, the corresponding PM
> domain is managed by genpd through a DT based configuration. And genpd
> via genpd_dev_pm_attach|detach() doesn't even take this as an
> in-parameter.
> 
> So this is solely for the behaviour for the acpi PM domain, just to
> make sure that's clear.
> 
> [...]
> 
> Kind regards
> Uffe


