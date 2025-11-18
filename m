Return-Path: <linux-renesas-soc+bounces-24751-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 911D9C6BA17
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 21:34:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 09A133564F2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 20:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AE942C11D9;
	Tue, 18 Nov 2025 20:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SQdfL2Pi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBB9285C8D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 20:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763497816; cv=none; b=j4qTL3eg/Usqu0/8izvC1o+wdtOB7b6zOYRjEI54TUsdbot2APguRelmzSKfxS+miU8srjdLKvHPZ0e2QMEUYHXdXoBj3b/fPXq85tQdCi9+Nb252ghtedJ0a/w689PcpRH+w82iaNxMguFiN8dkSiNFhzGDGoJOVIklViBXNVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763497816; c=relaxed/simple;
	bh=Ux8glwhHoJiEI7wBfDU+5Q0qSphxOyV3KVMfRzcUsNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NSq2AA+9RjO1Y/wORo06Jt29HL742x5rX/3/GgHVNUm4U1Q0ZThoUZ+ROrS2HtSnXbi5KxUZt0NDQZXoyerP8/MerC6b/WG9uO8TcFYIazxLEyGlEcnjVkO1sHrZ+CQJcWkAdmIQZqajMN9EygGNFwI+x+USgwn0Ew/BgvhC/A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SQdfL2Pi; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47118259fd8so44701995e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 12:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763497812; x=1764102612; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hsEC0ebz0YcZDcRUxs39zLLL5+Glf58IWLeJROUeqL4=;
        b=SQdfL2PiYwHrDALuhcuivJfv3f0pJl0wl8+qtBPuAW4QEZd7JQHEhVIM2ZwZdXU2Cg
         gwi+CDW7YurwO6aEgYD3Irras6+OrOySzQGYQioEIu45PN4Xn8JuQKFMEx2ZVXMLlsaS
         DM+JiOKMeQxf5YjomCRmBBUhZM88gVjNygF/MiXC7UyaTwIknp4tzZa9S8LDYZgUjXlo
         WgNZUYRslCFStbouCgPVQrzA8cjUJth53O3c0swBm/lv9wdX/JnfQ+sCe/w9uApNi7AD
         /5UnZLUQTQApu3mi7EKooFy0fAXKBxS2G/MLmsm5V+ZTSL3eX7MR8TvERdNpB4R18ivD
         4h3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763497812; x=1764102612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hsEC0ebz0YcZDcRUxs39zLLL5+Glf58IWLeJROUeqL4=;
        b=fQc6xy1S7ZzMK8pLS5W11NZjd8//QNNyD/sSJEdExt0Xtfo38Em+BkotrIawdGjFWR
         Nvf+qLOGqustOnE0MW4muUOnqigNL6dLk2mGlcj1HlHr8sC4uqQ1wJYPWjFgA8C2zFe/
         ayr8MZTd9ogWygxJ4CKgv+8P/u5u+bSeUCh/i5Jh0Ttg3hYCOySkQD0JqEPgKGEJE8/x
         kDJv5P7AiM7cDEewOwVqsx4MZmYnBqDRipWVZT8DHPV3R46pZ3N2kbtrHbdmD+7RInMF
         r1YEw97vSJ76egtNl7J7ClUMPeb2xKAEw0gPK2Ri78nEJQ5u/D76D7BqRbm91BbLyceG
         PH/A==
X-Forwarded-Encrypted: i=1; AJvYcCUpJ3FfYG1YnFIvSbtBmLMUTG4L5/nM3iPyYLtDylaaG6fHnpFbyi3Ecqw2lii+Eb/s78qXOnHChtrFRmdiL9yAwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwX8/Tz9eTbOaq/lbcHg2Ogw3gW5DVGhk4jGabmQ1NknBs7soaY
	Dfq4IqyrwWWUAq0aVp3Frc9zGMnGzO760OuAkfcW4ntfAjqZenTMErUUQBw++Qy1/qg=
X-Gm-Gg: ASbGnctPBp2XZws63SI1W6xmV2gJC5Y6PeCvXCHLYU5reH7H92L3D0z2ai9aSOvrStm
	le6ajOwNZXUvS43Uf4DAMHN5BQMJrlOOYRyvtetVeewreY27tbxkW8jwfF5t+w1LGJrG8kQDjyq
	A0hGlCLYvpHO1BwfD9un6zhmhTk8h0HZRfcYR/GN6N0g9mxazpqLNchfJuhHtCrBDu+I7JKmc1l
	IMoOIykDENbgH8sNR+iezMN6OJngB6037SN84LDJ+cIBBB9A8VBD4FRbTkWxSfvQr02Q6m86E9M
	4nqrFnvjW6wEa9eQeZb9xWyNpKDvpO/XpLYeZq7PFmMMVAZGfSZBw92EhL7x1oPO4prx2Dv3LAj
	VMeBcN3aRc/bHnQhP/ufWv66VrZusO6xDkEoK7+zSvUrtYTdqtmsSwFNqG8dazjlmyA2tMjdmCt
	x71XLC0IkwwREWGWerE00cNSzLc5R+9EfONbj+PrvlTROgW9srsNaxo6Qph7fYKgv4AOmermO3/
	aeC
X-Google-Smtp-Source: AGHT+IGcVwLmreSXlMRLyeQl0pvX8MkK1Hfz5ml0bpoGcR+XXWVPhcFQ2CI7b6errbH7Ip0v8sjUcA==
X-Received: by 2002:a05:600c:4594:b0:477:73e9:dc17 with SMTP id 5b1f17b1804b1-4778feba6c6mr166939305e9.35.1763497812554;
        Tue, 18 Nov 2025 12:30:12 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:3006:e9fd:4de4:66f6? ([2a05:6e02:1041:c10:3006:e9fd:4de4:66f6])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-477b103d312sm10372505e9.13.2025.11.18.12.30.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 12:30:12 -0800 (PST)
Message-ID: <550c14ab-35b4-4ee6-999a-bf192c578df2@linaro.org>
Date: Tue, 18 Nov 2025 21:30:11 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clocksource/drivers/sh_cmt: Always leave device
 running after probe
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <20251016182022.1837417-1-niklas.soderlund+renesas@ragnatech.se>
 <c07ae384-4042-43f4-b876-7207b72260f7@linaro.org>
 <20251105160627.GA3684509@ragnatech.se>
 <ae167c7f-c32f-422b-9eb2-72889cbafef0@linaro.org>
 <20251105183242.GB3684509@ragnatech.se>
 <c4377971-173a-4af9-8566-24e5860787ae@linaro.org>
 <20251109143708.GD4126953@ragnatech.se> <20251118201832.GD505486@fsdn.se>
 <b80861d1-023d-4b07-9af0-a42e32e6d9ee@linaro.org>
 <20251118202932.GE505486@fsdn.se>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20251118202932.GE505486@fsdn.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/18/25 21:29, Niklas Söderlund wrote:
> On 2025-11-18 21:26:32 +0100, Daniel Lezcano wrote:
>> On 11/18/25 21:18, Niklas Söderlund wrote:
>>
>> [ ... ]
>>
>>> Just wanted to check if you plan to take this patch in this cycle, no
>>> rush. But I don't want to start trying similar fixes for TMU before we
>>> have agreed on this one.
>>
>>
>> Yes, I picked it up. It should be in linux-next
> 
> Yes, I see it now. Thanks and sorry for the noise.

No problem


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

