Return-Path: <linux-renesas-soc+bounces-20974-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D68B35A91
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Aug 2025 13:02:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECEB07B52AD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Aug 2025 11:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9632F284B5B;
	Tue, 26 Aug 2025 11:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="j9uWEU3v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905832206A7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Aug 2025 11:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756206125; cv=none; b=dUGkpVVii/gLih6GTXbsVuP8JRUbnwShZOfi+8gMj19+VoLX3kntyD5r56i1SxEawcGUAwWd5mdwWJGCFH3GPCnsVFx+0oBKkp9M5gHBoy0lFfDxLr8fKvV4YjTQVMrkaHf1DVLJyDdJPsTFDKP+sEf6gjq7vb5pPLmG37i7D+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756206125; c=relaxed/simple;
	bh=LH4NaFwMH564ZNn49848uCu1K3fc78EyKP3IwLdanJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MB5R7CnD1ps159fBfvV9jovVdzsDECHucn8myoT5T4E7qBeSEO7ybdIK7QrFU+c0Z8WZ6ZIAi2CTseq3it1bxti/MAT0xlOuPnkoc9mjNw8rP7Kxjsvo5qyhglM0IhhNpwF55HNVYk3oFptVG38kmypcqbt3PdRd27ZwtdPspWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=j9uWEU3v; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afcb7af30a5so934708166b.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Aug 2025 04:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1756206122; x=1756810922; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S9pMIy2ceXu0U+iaZPJ+CBfNzoY8Ci+2h3RmbLWXEeI=;
        b=j9uWEU3vipQAR6vjvIopP4JMg7TsCX9RdJaVvfCZD9plbft3Tg26ajPPTGA7jsD9Fy
         6f/QIv7ZrZw4I9JaolerLLb4/S3D5jHkAHoARoQbcv9JroOyrRB2pZDWIp+eY4C8ee2z
         KoH/V7wsgt/8sNpB7zvP2rwx77Cqps8K4VHS8rpNhIYHzYiHohcsSBx9MOQ8/d2zx5z1
         x5E2AnjNVbY6XVta949W/rZHPf+I35yIPvk49i5ipMSXew7TzPaH/X0JwkgT7xclQkfX
         MB3CpjxZIhAZNJwet/fr6rImqgEbp8npL4TUDghDCv/z8BWrSSTRJroWX9/80dHUit3d
         Z5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756206122; x=1756810922;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S9pMIy2ceXu0U+iaZPJ+CBfNzoY8Ci+2h3RmbLWXEeI=;
        b=JadwGMntC9Q1G87KDsAyNsd14DgEI7Ut3eREMQTzvgHBmS6wBco0zRIKLq1/0opIVT
         0SKIuxpoeubMf7YoiqVim1yAvM8YwFJg4PpBr4XH0k/2MByORmRnBjozS3E/wfVMCR4l
         g8If4iATj/VPs5Y0caMUnTsAO4B1eGb6wJL0yoA6VGTCJQeIeYl26gbDwulccwnqwfUe
         cPUwCZozOis1fWBi0mXKXmWz5ZkfMSEp1T0SsN++l6CXcoon5Z3WeqgvdHVIh6TLk1et
         IQ5GrqwCvvoMe5MUmyjJREDeA5mGKb7t4V5JmiprzpoRBob1TP/G6NdUJrNReZOnuWri
         pETQ==
X-Forwarded-Encrypted: i=1; AJvYcCWp3EQpPL8awsxSKvkXUF3fkf+jUiwIEg4J0yiDw7sUYhgSWjrOH/u4Gkybec34uaynFQeIVkJv4r51VuZUm7auiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqeqyPh5OAN0/uow5w63HVKnPqZuOXrk/qwA9tfnZAmjZvAc0J
	afX1/M/c0xMUTHFvB0yPKI6XxeRLmreVFcUugieFEjmwqlqZToKmdIcrvBjH2Y+yxYo=
X-Gm-Gg: ASbGnct3hpaxeDNpPsu+IRhzpFWqihG2ClBUJNnHCdC95nPLwxGpaHOJcTlJ0a4UHgg
	YeW4LeJ+us5jd5jPmsz3pvgm+Bb4ZHM1uj2OEJkmyVGTqsIjszN9fwfOe26DPnKn9Rq8nYriAKJ
	aOqjaeve6iuOF2AhNVq8vT4ZnV23Ke/9fG8URDCDvAyzeXwoOlHjtmAyDHKc0Rub5QzpDMGe1aP
	S4T0I3JCWov4WV0qcbjhKuyMU3JF7cT3AvKwKfQ7micj4kD8tyzbVoQcWB/LjKh0G9q64g5mcgE
	rgYorcIAzKahd/tgEjDxjQP5aZZS0vMCcc71k2wWl/l+DCkMpJ+eX2QEpAP1rEiXFS0qIlhpPs1
	OgZ5jOPYuJJWh5pd3EpaPFaUKgK8VKB6uOXu8mciP5wJQau+Kf80S5f3gDSdCNkzCtEpGJ5CzrA
	7UUqoT7/EVtP3j
X-Google-Smtp-Source: AGHT+IFsEcWIMVxL9iC4gvBj9YbqBmSOY+YYxvhjHWiMWtUrH8NxDZ6rdnSthTAZuxEPdrp5IvpPaA==
X-Received: by 2002:a17:907:7249:b0:ae3:7058:7b48 with SMTP id a640c23a62f3a-afe28fdfcb1mr1617412266b.25.1756206121373;
        Tue, 26 Aug 2025 04:02:01 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:6103:4200:f276:8e0c:6e17:2570? ([2a02:2f04:6103:4200:f276:8e0c:6e17:2570])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe7aad5d61sm447908866b.105.2025.08.26.04.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 04:02:00 -0700 (PDT)
Message-ID: <0d71269f-1c78-4732-8235-5640bf340d00@tuxon.dev>
Date: Tue, 26 Aug 2025 14:01:56 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] clk: renesas: rzg2l: Disable unused clocks after
 resume
To: Brian Masney <bmasney@redhat.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, geert+renesas@glider.be,
 linux@armlinux.org.uk, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250821080333.27049-1-claudiu.beznea.uj@bp.renesas.com>
 <aKyX4YJswZLuqA6Y@x1>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <aKyX4YJswZLuqA6Y@x1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Brian,

On 8/25/25 20:05, Brian Masney wrote:
> Hi Claudiu,
> 
> On Thu, Aug 21, 2025 at 11:03:30AM +0300, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Hi,
>>
>> This series disables clocks that remain unused after resume.
>> This is necessary when the resume process is done with the help of the
>> bootloader, as the bootloader enables various clocks when returning from
>> resume.
>>
>> On the RZ/G3S SoC (where this series was tested), the bootloader enables
>> the SDHI clocks (for all SDHI modules, of which 2 are used by Linux and
>> 1 is unused) and the clocks for a serial IP (unused by Linux).
>>
>> Testing was done on the RZ/G3S SMARC Carrier II board.
> 
> Do you think that other boards would also benefit from this change? If
> so, what do you think about putting the call to register_pm_notifier()
> inside an __init block in clk.c so that this same change doesn't have to
> be implemented across various clk drivers?

Yes, that was my other approach I was thinking about. I wanted to see how other 
people consider this version.

> 
> Alternatively, if this is board specific, could this be fixed in the
> boot loader so that the clock that's not used by Linus is properly shut
> down on resume?

As a result of your request I did some more investigations on my side, I can say 
that, yes, in theory that could be also handled by bootloader.

I can drop this and try to do it in bootloader, if any. Please let me know if 
you still consider this (or the variant that implements it in a generic way) 
necessary.

Thank you for your review,
Claudiu

> 
> I'm not the subsystem maintainer, so I'm not asking you to make any of
> these changes.
> 
> Brian
> 


