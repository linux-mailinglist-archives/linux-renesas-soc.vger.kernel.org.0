Return-Path: <linux-renesas-soc+bounces-4766-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0A48ACB24
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Apr 2024 12:46:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14E1C1F20F9B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Apr 2024 10:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C703146A63;
	Mon, 22 Apr 2024 10:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m9CpuyAd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E23E1465BD
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Apr 2024 10:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713782691; cv=none; b=imV2YvwbArSkWv8soG35HeIXpUvEf39n3AEbMFpsjyAiSV2E6jjDUQcjBPMzRN//dpw3Ik5Zimv497Y3tyPWhHRbKyzWrohw8aOy+lW4YLlU5DqaVyOilsvacPqYT9d4pmVU6hn6omytaRneFrgzbzIGw3M5Ui6FxWLn7QLWfvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713782691; c=relaxed/simple;
	bh=bzcewTEZp8Wbd6KSaSgbrbH+qvbZxzp23uj9WiUjdUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jrNUhTdeQD2d8HdvrPjKXVkOM7RQtCb9+p2QhYDXLWTlTUCxouC5gX2W41xIO6BKxyqA6B9cs/1iuzkdbsISXAI8TscYSQbKUP8C5PrMJcYjoy7enHGUNr80teaeqb8x5MMnsU+isoybc/XwSsFpp9t2r/qhuqL3Iek04mDFto8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m9CpuyAd; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-344047ac7e4so3062581f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Apr 2024 03:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713782688; x=1714387488; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wR97KP7K22vcCUiLNn0X4KfDnNwelS8JUEnq9UX2UNk=;
        b=m9CpuyAdmtDXEQV035cywFXV5WJmesQilOXrkjzBZmTJHssq+aOYgtu19zy8X+uVfJ
         f1Wi6YKaP+aSgMSmeORYODqY08dcXSaRf3TNxBzDYQQsyLQMzdRJIuhNKccNmIVaEgrY
         EVD++Co14+VZzs+9yQdsvwiIg5qgBADxvhbklx6DtKP3fqEcG56HyWZ6a2mw3S6BU2oi
         Rjd2WU6IyGe5OxWS9UrqQ3Su0QtuCAllP4gkXM2DZAT5BnOksBJ0v2pENzySrVeKMsFX
         +xod4kFoLOFOPIxiUn1hQp0n4GSuF01N1hTjqsfVFJ4KCqSXNjPOAjlOe7B1TvGkwpw+
         4wow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713782688; x=1714387488;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wR97KP7K22vcCUiLNn0X4KfDnNwelS8JUEnq9UX2UNk=;
        b=vKsEJGiW6ORfuAcD9jYXZBV+Uo1cGkO2/LBdyNk93szqwb8e/+7DsoetbvOorK/B6n
         eQZKbfWKhkUrD5bvg8CH5gSnsZ9I+scC9VmatoBsAhxtiIzqRHu6Zfe5w/gbnerZpJ9l
         kvEQAI17kYp2KNuIsFYD2EJbjcO5fPGZttZPHwn6xTmni+2TxUC4KEiQnoYGs3cDO50m
         DFK4ARfuCmWoYk3TudlACcV6r6rffsygaX6SHUXZwWrlsVtcTG9AVIe51NkxW3LeCrT7
         FzUW9o9NgfqhqT+mP0OkKJLgNVY4TVTkXg2diq5+NLZehuwjobz0N7LOpO9aZc4aZF2P
         p3Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWBYkhTAbSjx/1Pk8y0eyoAnx4LAfr4UHYAkmxJt9IXQzUSu0YgUjnoWtbXlDwhBMSl8mAWxd+8UL82fusyk/qqs3LGoUhgTHoNkhtHF5/0+gY=
X-Gm-Message-State: AOJu0Yx9H0pplcS8g4a+sHZWP5qTIWmjbE+7btrX/32ZahAWc7kcgU3n
	X+ttNgLBh4FLWSHRF8LCtRVd3IfHP51lo8s46xKmp/K+M1jIxArQPCGpv6nm67w=
X-Google-Smtp-Source: AGHT+IHEVYgt9vgZzUvOGj9DvGZzF9NFHN00yyy4hZi+7IPr9wmffeRfEUo3Gjiacp8SiOwFg51jtg==
X-Received: by 2002:adf:ec0a:0:b0:34a:eb4e:2633 with SMTP id x10-20020adfec0a000000b0034aeb4e2633mr2464786wrn.10.1713782687876;
        Mon, 22 Apr 2024 03:44:47 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id g30-20020adfa49e000000b00343f662327bsm11845256wrb.77.2024.04.22.03.44.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 03:44:47 -0700 (PDT)
Message-ID: <5020e895-2810-4895-9f1f-9e15f7cec357@linaro.org>
Date: Mon, 22 Apr 2024 12:44:46 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] thermal: rcar_gen3: Use temperature approximation
 from datasheet
Content-Language: en-US
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-renesas-soc@vger.kernel.org
References: <20240327133013.3982199-1-niklas.soderlund+renesas@ragnatech.se>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240327133013.3982199-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27/03/2024 14:30, Niklas Söderlund wrote:
> Hello,
> 
> When the driver was first added the temperature approximation was
> reversed engineered from an out-of-tree driver as the datasheets of the
> time did not contain this information. Recent datasheets, both Gen3 and
> Gen4, now contains this information.
> 
> This series changes the temperature approximation formula to match
> what's described in the datasheets. It has been tested on both Gen3 and
> Gen4 with minimal changes in temperatures reported.
> 
> Patch 1 is a cleanup making the scope of a constant more clear. Patch
> 2 is the real work changing the approximation formula.
> 
> Compared to v1 patch 3/3 have been squashed intro v2 patch 2/2. This is
> due to a suggestion from Geert where the precision in approximation
> could be increased while removing the need for the changed done in v1
> 3/3, thanks Geert!
> 
> See individual patches for detailed changelog.

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


