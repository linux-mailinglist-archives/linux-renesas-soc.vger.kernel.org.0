Return-Path: <linux-renesas-soc+bounces-24685-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7389C6312F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 10:13:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A08643B1834
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 09:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D95D32826E;
	Mon, 17 Nov 2025 09:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FxZifYXW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93436328607
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 09:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763370676; cv=none; b=C4AK2wmsguMakRUl2NllAkGogE8hqUvw14+QzanBcx45Ph4ls+2GhDgE9nU3eFj3++EP5LyGw1SHtVMMVe7opn5+6GEA+yHDVkxaxUcsrHnir0K7RBbWvHI0P8Zv9PK+weMhmo61N4V+qg1NsP1kf4kjMIyFC3XbsUVehCeBz3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763370676; c=relaxed/simple;
	bh=GaZPBm6gUsQPfq9f2nOwKLI6bceBZ1vRdSsXombDMSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gk71oSteWbbafLRvGw6WV2Scobp5CSFWROvDN+T1RlPR8YHgOssnt0Y2Yn9r4IAMe/VomxilU1r7cdcw7jbkdckzVYH/TaMzj4bKme65kFTLspUquUd4Mfyyo8wsLdwzyuQyFemcSSoyX02GuXhAbCrMixi75XstMPoTqCekJKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FxZifYXW; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso8835745e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 01:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763370673; x=1763975473; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0kZPylB3j+lccR/0iWbMtZHa/Te1u7EA4yah7WekK5s=;
        b=FxZifYXWGyVlo5hkQ102z+Zhgx4gfJiPLLS0zzVVo3kLiDzWPnnKUHvK/Q4uEQ+tdq
         YLEy0w7In+JY67jETFrgrl1gA8p8psoOzXLEHSuwOvKES5ysFIMucv+e7PhR9dbXxxpq
         wHGqCKBQ+wmD6UlWmM6LpSr/HoJK0QpcLPeLUD6agAtGKClq6couk5bW0fJOtxdLq3NQ
         45QgSCSA5WIAhD5+hRkv2L4wFkEZPmun/wuPWQ8LvIJDaGcPy5bJgtcoKXaLplnl4mJh
         uMylctkD37rvm2cG21da2Lz0cp8kJLCtdMPE5OhRagWKshtujznaZ6oSmbSMbCnEQZBx
         nnXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763370673; x=1763975473;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0kZPylB3j+lccR/0iWbMtZHa/Te1u7EA4yah7WekK5s=;
        b=E5Q3I/Qd4rZSc0aOBcNdr60yRiGvuTb/KKLUmQ1lO69spEjIT/dvhrskYvo0g15cgx
         m8v/UmsXKPoQLl/je1CDYOmopQPDPDEnyW/Ci8rVFCbp8Y32J3v0N44ff4mRiOmeYtnT
         vuG4bFfH7iP4mlYomAlpV7nNK9bIG2b57u3fpqRm/i+g3/UVpHUCw+3GjGNKtWjOrXtu
         zHwkCs9n7RkHj1bSWq14HWc6RtYuulCio8XO8ZyihUFJ2MELdAfAUPwzaTJ+xuQ9GLpy
         accbZf7lCl2juccvbWxqHLh6+JI3x3kzuf8aU03qrBIPVhSEM3k6gzkrKQVKwGduCoql
         owXg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ4bZUCRKGV72g7zV6aNHHXvhkfDiySBO6qtVZSEhozgoHG4yhOLITAOjEO4sAplY4q3v42Z208EZnTmSh2VjZTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yygyr7V364TYu+fdqcn/y83qQzAXE+nCeAve1Ok/pXOPu8nqHvE
	89pS850gzxDE6+3OtG0uEz0DyvcjoteFGe+JMH1jxm5bOs4u/vrmqJ1pjUihZYUYR9JIWBvv1EX
	lVjfCEak=
X-Gm-Gg: ASbGnctdpCkvCZ4hJxNIGcIonBSW18HpRW6CujZnjQC7IDtVVQms6dhbryP3RpadjmV
	Wu7YOY+WJ9NjRqiIKbilwWpnrOLrpOgaNQmjL6BHttdHdDQKYZX2ECQkZchNP+k4ws9U/mO27Kg
	4yfNPMaLEo2jMX/vSEu+tNMOQHgDD5P/d4GwKs8er5daWHxRJt04RPdnUFMRrRE0Q9C6cK2Zl+s
	CyEOl+2KNd+lw6jdikMnDabHO+Gt2uyWVhaJDszBeCIxJHPylgYxYMVdrvrdRlf+EKXM/hvo8P4
	proR9hlSQu3h+K1Tqe1qUq8ducaXo/77eKX+CqkvP6whAgMiIQhGdPZvU1Vg1HV9NXP8pCHlEp1
	EOENzrYlXq0e9rhrdUiLLRFQ7ttGE56TPTKTkJDkOM6ySic1OIbvoNZNE7neXUoD1WgJWXl1+np
	mfbNsjgwuo
X-Google-Smtp-Source: AGHT+IEavaUnuxhrBwMIbZSqo7O99TmZuV7viJpnLLbAK5u+IVUMs5jpdhnUXP6mIc/HnTIfEm2Beg==
X-Received: by 2002:a05:600c:1547:b0:45d:5c71:769d with SMTP id 5b1f17b1804b1-4778fd89eafmr115944655e9.8.1763370672881;
        Mon, 17 Nov 2025 01:11:12 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779fb67e73sm72125925e9.0.2025.11.17.01.11.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 01:11:12 -0800 (PST)
Message-ID: <9ee458bf-34c4-4f98-b577-ffb3b23c89ce@tuxon.dev>
Date: Mon, 17 Nov 2025 11:11:11 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] mmc: renesas_sdhi: Handle resets
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: ulf.hansson@linaro.org, p.zabel@pengutronix.de,
 linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20251008042526.3312597-1-claudiu.beznea.uj@bp.renesas.com>
 <8c654a1f-2513-4afb-b33b-fabbafbbe845@tuxon.dev> <aRTRLW4bCoZMtCaB@shikoro>
 <55e9c0c8-4360-4d08-9269-27a3ff5ba38c@tuxon.dev> <aRZKDp2ZI81sSHzG@ninjato>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <aRZKDp2ZI81sSHzG@ninjato>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Wolfram,

On 11/13/25 23:13, Wolfram Sang wrote:
> 
>> On RZ/G3S the following were checked:
>> - run bonnie++ on all the SDHIs (with SD card and eMMC, where possible)
>> - unbind/bind on all the SDHIs and run bonnie++ (with SD card and eMMC,
>>   where possible) after re-bind
>> - 32 consecutive suspend/resume (s2idle and deep) and run bonnie++ (with SD
>>   card and eMMC where possible) after resume
>>
>> bonnie++ tests were executed after boot on RZ/G2{H, M, N, L, UL}, RZ/V2L.
> 
> Thanks, I did some lighter testing on R-Car D3 with bind/unbind and
> suspend-to-ram. Focussing on areas you modified. No regressions, all
> worked fine.

Thank you for checking it!

> 
> Can I get the I3C pinctrl patch for G3S now as a reward? :)
> 
I'll do my best :)

Thank you,
Claudiu


