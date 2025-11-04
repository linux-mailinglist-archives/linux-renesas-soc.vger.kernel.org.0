Return-Path: <linux-renesas-soc+bounces-24063-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3FDC30D4B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 04 Nov 2025 12:53:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 398E1460249
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Nov 2025 11:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 223712EB87D;
	Tue,  4 Nov 2025 11:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="MlmPrg96"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1F92E3373
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Nov 2025 11:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762257231; cv=none; b=mguX5cGrU+vE2TZN5F+fw/QjZZDUYabC781uN7FOG6B/f8IvneF844VgMxjS5ymG88o4WUt8GbqusLATt+hqKBdml6Nasygo5dGTkyTnyQsOtdLXCpiqOD9wEeWDtu5IG/HTnEoaSP5OnrmLdunD3Ts69VO8e/5NTGBdHeyQp1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762257231; c=relaxed/simple;
	bh=I36LzGSl9wytAsBf1yTXZ1w2SrwG6l/dCnsmOh1gGrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AxOynPda3njFI/suucUP6i7saK7hxB/cB9aqnhoc6AYgunljtvQi8SHN+ty0jf/SWKIl3zsvaNiuKrqwzcArurOYoKp36WbYI2BOo7qgGjs60dZLOq5CYCCKaMMVVqMRKZuxsWI87sGyMcLsIvyxRxU1Bvhv97TVnm3SzcSUC54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=MlmPrg96; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47114a40161so6927675e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Nov 2025 03:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762257228; x=1762862028; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I36LzGSl9wytAsBf1yTXZ1w2SrwG6l/dCnsmOh1gGrc=;
        b=MlmPrg96LFRqxvhrbK0I99Y3mY8Rrq0VCaGf5E8xXGxVFFGMtvcCyrKanpVtWafb+f
         qFl6CvABdtYGYlYZZ0sE+g7Kh28FAW7IP/WCDWSKiHPRc2UCzKFftKPBVoH3/pMw/YIR
         Eo+9/OWQXIQMIagvNfsUlSWwz+PjtK8pjQbAMy0glqhcb6vPexE1S1Al2tZxWInnrvDp
         gluSziYScLerys1iQW6Ya0fxIaPwDLIb92G0hdur+SEirXERwgAA06yRJIAYhFUQZsof
         2pPMHD8UJ65YmgCbL6+Z+HofKBx4J2iuI/VCRYKxPhEMUw17bGHN6IGGraOd9upsvab9
         xLFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762257228; x=1762862028;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I36LzGSl9wytAsBf1yTXZ1w2SrwG6l/dCnsmOh1gGrc=;
        b=KUugAcrbDyudhA2Mrz7UjLoUp0TlR5nqIh8Z++Av3NWqVY/Peue9qiEEW2+RRZmUKk
         YLJ3KSpibe7Wh65JPe/PFEeV0n6aElhCmgDlZm1GpFRie9tgHOmZC2xbsydtTFJjdZMn
         ZDiir10P2OhHFktuf8GXBM2QGKw4FPtwk5qdo5FlQa51sSWKP4cYjshAQ0QUswto7bxG
         go4XIFEf/iJ7UP1ecWAs4xHB1LbyR+ONp9e+6hBKhu8F7w5+NFfKEp0VbBapxM15+w+z
         jrHDskWKMr/1TX+kDV5u/jqnznUhnhqfSeGUgEGxkvrpHYV/ERgfnt+9TTEpXsV7Ctlb
         t7UA==
X-Forwarded-Encrypted: i=1; AJvYcCWjJ5BNMqqDWiV1zTjLTihRRrMnh9+KuQeMxQTeZW3/fYSss8deU2k3kdKzyiAJHH6o05rIOARfYPIlw0DcyE7ZXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRN3P4ClPdZPq0r3ZxtO0jqKNpP6aaNrCt83T8RLDOv9LUOk+T
	hPXrHlG7EdLKzhEC0t2CQgP2cumJb5jqrHo0yTKHxwdkk8tKOmOyyOv2ij/TWEUbqWw=
X-Gm-Gg: ASbGncvqnnHkdaJcnhamYp0iNkIeyeQRsz8Wb+jZeXvOCoSw1yYH9tz19Pr1fXzGjtQ
	XGwTBr2mX+XQ85NXjVOVd+huytOtEwti8HvUx54OKGp7V+8r0sgzn+IKfGpJoI6i3jewknyHqcr
	vYX9SHv/dWOrnqns0QMrVIWvN2dBjj6RmIv0h1axhJMZS6KlAZVPZEFu5Gq+1uT21EnhiFD/N0M
	Qfn0rlK0intCRGvc053AISGWGP7mIIGz3NQxjlo5foXwJrV3n2y+LiPR2leAy4ruByg4aux0iZP
	p3XTlc3Yvtlhpe6z1GvluKj3pT6YsvzzVVEn6677BE/AOKxBzAlVatdcjCqyUC+Wf/SuwR/Fo0X
	vIW3fMM6bFlY95mq8E/ll3e10ACFiN4Hmg6gMAYZfPI/B1UKMey/PtfxcKw8ttkxNfVZtO23Ui6
	2hM8zbMPGK
X-Google-Smtp-Source: AGHT+IEvDHwONng4aJ6PO9esJ0vd+TzU9M+bzqzfCyIK9M1CiPuaL9xKsM8JexApKzS2Btn21bVVEQ==
X-Received: by 2002:a05:600c:1553:b0:46e:436c:2191 with SMTP id 5b1f17b1804b1-4773089c34dmr151966595e9.25.1762257227721;
        Tue, 04 Nov 2025 03:53:47 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47755938f45sm16302215e9.4.2025.11.04.03.53.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 03:53:47 -0800 (PST)
Message-ID: <6296a8fd-bc2b-470a-a367-61c2d80fe8e1@tuxon.dev>
Date: Tue, 4 Nov 2025 13:53:45 +0200
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
 <bdb14543-e611-42d0-a603-300c0ea17335@sirena.org.uk>
 <70362ac1-244b-43c5-97cb-ebe8f5b90c3f@tuxon.dev>
 <56911e0e-0f25-4134-92fd-f89cb47fd9b6@sirena.org.uk>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <56911e0e-0f25-4134-92fd-f89cb47fd9b6@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Mark,

On 10/29/25 18:14, Mark Brown wrote:
>> Would keeping the regcache_cache_only() + regcache_sync() here along with
>> populating the struct snd_soc_component_driver::{suspend, resume} be an
>> acceptable solution for you? I think that will work as well.
> I'm not sure what you're intending to populate the component with there.

Sorry for the late reply, I took the chance and prepared a new version
showing what I intended to say here. v2 posted here:

https://lore.kernel.org/all/20251104114914.2060603-1-claudiu.beznea.uj@bp.renesas.com/

Thank you,
Claudiu

