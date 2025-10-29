Return-Path: <linux-renesas-soc+bounces-23879-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EA5C1BCD9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 16:52:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 675A15A4297
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 15:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2789232A3F9;
	Wed, 29 Oct 2025 15:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Qgvfddvi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5190723D2A1
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 15:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761751761; cv=none; b=RoYLPpLQqzeTUljFREtAzIPZr0v0RtdDbaXcA5zyLbRSlWTgbD46ps8BJCViyAoLShrlswzJ5HUXQsbCPlMnXDdixchR4UK4HDL1XWauUQhoz72mJTYag5RBlNkczchSp3RX17mVq8Zr2pSJZikvx49gq+5jVoDytilxw8JjzSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761751761; c=relaxed/simple;
	bh=TmGjDwl2biFKFoDG5SxYDx3zPkhg2VZY+lBriMDwGx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rTerltXzj7ghn3OCEDhnfupsX6tsKMwBR9gXWNcGuq4bVeKyStVC9VTrKVdU/Eg0VljBT/ZBe3eYPgvGxIveR6xUYK8hm1vkI1HAa9aMHVyZDZcpki3Ch4KzFYMrRfEVou48ss9MeqG7XaIbyDmkTngoFnPg6tsButnSmnZdLtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Qgvfddvi; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4298b865f84so4015489f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 08:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1761751758; x=1762356558; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ctrvyyDmJlg0kkSAOlpyChaeCX1qtmxwTU/oEiWOUXQ=;
        b=QgvfddviuL4U1MV5cXmGqID6ZQRTMgk/pKJAyTedB4yKgt/5I7fYI3uX2K28xRIB1f
         niJcAZwrL8bGENW0ANzIaHDk6lt7dEYnHlidgcroyHA5fvQPekk7AUVysieHtMK29Mfy
         nbwyR790XFJp3ZQK1xKKIY1IpWQq2TsTgtJUNbtY9+JdEoUwPUz2IDOFLVP/Kvu1rNOh
         /Xr/XrD3Q3QHDgHwF0MVAFuVK9oiiZWAcI9t/oM9LAOfGhiBNE4ock+UeXE4t0Sr/ZHL
         MQsOzXr3W/C7B9HqiV1HKo6+ItlZlJSkLZzgClPUyqfGkUpXBBMeOeaUsvEfzzS57SIG
         9/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761751758; x=1762356558;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ctrvyyDmJlg0kkSAOlpyChaeCX1qtmxwTU/oEiWOUXQ=;
        b=O13B3gtwoMTXN7hwMsY50hloqG0VhV71yY5jvQN1+oNraqfbBpDN4srY8qBSD4KKSz
         4phjV5JgvM+7nKSUgm1n6Hq4U3drAV3j2pHUlo67nV5JleQai7+Qfeo1T/e/A2ATwheV
         z+tgcXuuJjhB6cR3KiCwPxVpHFVvBYTsFmNkXpiOL8dBK82s1D3WBW+8qc0IpLqGs47m
         eWdQYly3WbtSv99jSFdQCLst4tslxOebvB4plxVYraZkqQUuDzu8adhGjHZP9cqICtE6
         JFvVBofl+tL83yP1nfH/q7H7vtktj2XLeOeYp2YWK6UScYtvhOuEcDoJ1kf91BH6wzp+
         cMsA==
X-Forwarded-Encrypted: i=1; AJvYcCWJp2UjNRCsVcW+K+39Bogr2KLEO+kJAvq6voMXo/reuqH0GoKLOodwyfxJPnAsMu7xjcFqTPsyDCJ3qD+Til0U2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyB3oTmJwTLNKlO8Y5wLr+I6/m4pxuMH81Gk79qg89zwOlAiO10
	3a3LIBmKAZBWqUkaf/g8zmkN7JzDwKUWe4ULANSLOOwUPO1HvK3yhxhKLMonEKHYSFk=
X-Gm-Gg: ASbGncuHQCtZMqiPCG3rBzSg+G5EaxImQ2nMNH2wkdARPqBVpLoSyJEKH60CoWl0brG
	9KUeFwzNagwirGaZzf2XAbMPIGTCLOpFt8mSsNJZDR51VzELhIKuVV6+eXzTrnsaSJR6xPsU9XE
	xMYV7bbN0xPRRRpNnJdaW3nKIZ7RBdDY/MhcTzN5Sa4frSXSza4QFMXitMpgfUFXXlnwtLg2HSY
	LtMXm+HJ91XNtbMJx5Ji32YaJh32pbsOKws0CE9yoTyB5rlH43o16gtVLchU/xbsGdjYNAOudyx
	UJt0hr5VHaCuzZvo4kX6WWeP/vrb48UYf8vi0RAZL9NnP0im4yemMNH43Jyim6B2TA8PGjkUuV9
	o4nWSg399vwh94GLGE4ZKfEZN7Y0IEmO9R89OFBccR2wiTPi6BQBd+SrHfX1y1Oaxnmk0uzJWFH
	2xpzomGZQLDVZJ9FHf8QpLytTb21g+GAfzmGJderWXkxQw3cQFFX9v86gal3i61rGzYA==
X-Google-Smtp-Source: AGHT+IGzKqIEUwGf7yC1EsnKLvYTprAHG5oxW1NDlfiVKv2vlfeP0rhWW9WukDhz1d/BkHuM2+I88A==
X-Received: by 2002:a05:6000:1787:b0:40f:5eb7:f24a with SMTP id ffacd0b85a97d-429aef77707mr2833160f8f.12.1761751757674;
        Wed, 29 Oct 2025 08:29:17 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:6302:7900:aafe:5712:6974:4a42? ([2a02:2f04:6302:7900:aafe:5712:6974:4a42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952cb55asm26959094f8f.17.2025.10.29.08.29.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 08:29:17 -0700 (PDT)
Message-ID: <9d254e18-2e2f-49ce-b785-ef0f16117550@tuxon.dev>
Date: Wed, 29 Oct 2025 17:29:15 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: codecs: Use component driver suspend/resume
To: Mark Brown <broonie@kernel.org>
Cc: support.opensource@diasemi.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, biju.das.jz@bp.renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
References: <20251029141134.2556926-1-claudiu.beznea.uj@bp.renesas.com>
 <20251029141134.2556926-2-claudiu.beznea.uj@bp.renesas.com>
 <84aabf5e-c782-4e40-8e34-c8e7101188fb@sirena.org.uk>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <84aabf5e-c782-4e40-8e34-c8e7101188fb@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/29/25 16:37, Mark Brown wrote:
> On Wed, Oct 29, 2025 at 04:11:33PM +0200, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Since snd_soc_suspend() is invoked through snd_soc_pm_ops->suspend(),
>> and snd_soc_pm_ops is associated with the soc_driver (defined in
>> sound/soc/soc-core.c), and there is no parent-child relationship between
>> the soc_driver and the DA7213 codec driver, the power management subsystem
>> does not enforce a specific suspend/resume order between the DA7213 driver
>> and the soc_driver.
> 
> Oh, also:
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

I messed this up. I'll be more careful next time.

Thank you,
Claudiu

