Return-Path: <linux-renesas-soc+bounces-1968-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA862841CF8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 08:51:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B3C61C23468
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 07:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44BDD54FB1;
	Tue, 30 Jan 2024 07:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="lTO7k4HK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487345477C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jan 2024 07:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706601107; cv=none; b=AEkn0nkjijoLjagLs707ZdG20ob9JeoRn09PlnEgi7s9y4D7zGaMRjdWgNNfoIn3jDJ+tJ/30cuCIpz06W++bT7hmQcUcM0DlNv1HCXIbkkPNhtq0ZfUA7SVMHx83DdBN4O+KWHokygyBepyfTGCADlQT7nXjTj0M5SVPX2hx4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706601107; c=relaxed/simple;
	bh=N1ix6n0OUSNUPPVa8QYErwWyocB1DYBMbthnSeb6xVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CryDTUbcMlcOKUUUxlQpaOAgh3cChLIya0O6bchcgjKf32lFDyvYnZYIbTswEmnNdIFpfh/G5/07VypIjuPngjB+qV5i3DoEZWjc2kliEXO7yflyjqvaFKjxxa+whEYocsbd2pOCdisFtZK635srz1yGJQqsI29Oypjc6JD5pxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=lTO7k4HK; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a2d7e2e7fe0so674478466b.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jan 2024 23:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706601103; x=1707205903; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iEqlR+fJyGnaEM9aDQpCcAkAZfZ+490su0Pu8FiSISU=;
        b=lTO7k4HKo9grtbliGalco5W98VXWPk5WZY5h6xAx3IsclcIwiGR8GYXlfHggLONHcn
         pytj0reyeZIQ0E1B0ECry2aX2TxAW7CaWWoQxhYuNEjqfg3L2ZJVW06XD8FzQEMmYKp0
         jYMO4QhfVOv+Bzw1knDLKsKfKPYxK9T9d9cUadBSLFR0fS3xsUquFs9obqvKohIFXttP
         DInibpYrctXJM+po+ux/ObmANur9Q8owZmjLcYs3XujYffpns0d47mHM6/aZFt+jxCJU
         +gFCY1Cqw6OsC2WkyaIa7mthUxHudIvKk8f8gKLdkULLovxRZk2m8bW6vIn6hFGTXMyh
         PPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706601103; x=1707205903;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iEqlR+fJyGnaEM9aDQpCcAkAZfZ+490su0Pu8FiSISU=;
        b=dnsXTIs6mgVec4QS9lWECu40X8idZK/WR4u3w++j0QoxMJ84ip4lptdqUed3jijuvb
         9T0dBne2c8ocCR62ub7dJQR5f7auzA21S5dGctlrkum7jRar/EEowzIYPr1dHBr+5ZWJ
         VsdQ3KxZhnugkZf4297LVcZ73kufOyfBKrXXjGxd8GyREdBffjZ1UfiRNkB5kz2UoPEy
         Gu6Z8nJpD9aHqGVF0RbqRAzTVigQHkU6LUc7TEYg1lT6CzH+fIoIFlvsNgPOw1Nq23rN
         2iEkMinhCMhsjoqMn34I4sg/25Lr4OYTXl7Ya1iurOjS5vjvSf3klA+Pq/m2KtGpqDy2
         Of6w==
X-Gm-Message-State: AOJu0YzGPWK4/cH7gHA1NISU4P+LvlWpMylswK6NxfijjgBWx5AKelwq
	ExBdmy/ljIKzzjI6xD9MQVgYQ0Zo4t525pn/knRWUKKEFYOycNyMq/Pv1AXlxOkqzjJtPs6I4lT
	R
X-Google-Smtp-Source: AGHT+IFStFSvAOXDX8wZSjE3jCOcKoDxqY9rT1us8tNNWM70GTRaDfAHBOARadsjTAnDlPQXoBZliA==
X-Received: by 2002:a17:906:1296:b0:a31:6534:1da with SMTP id k22-20020a170906129600b00a31653401damr627464ejb.36.1706601103511;
        Mon, 29 Jan 2024 23:51:43 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id vb1-20020a170907d04100b00a34c07816e3sm4785771ejc.73.2024.01.29.23.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 23:51:43 -0800 (PST)
Message-ID: <7c4f6031-ac7b-407c-a223-e7b65ef8baa7@tuxon.dev>
Date: Tue, 30 Jan 2024 09:51:41 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mmc: renesas_sdhi: Fix change point of data handling
Content-Language: en-US
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, ulf.hansson@linaro.org,
 takeshi.saito.xv@renesas.com, masaharu.hayakawa.ry@renesas.com,
 yoshihiro.shimoda.uh@renesas.com, linux-mmc@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240117110646.1317843-1-claudiu.beznea.uj@bp.renesas.com>
 <ZbeEPg1jc5qWJa5m@ninjato> <345bc392-cf28-479a-9453-5bc89f635759@tuxon.dev>
 <ZbikovLbujyGS1ub@ninjato>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <ZbikovLbujyGS1ub@ninjato>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 30.01.2024 09:26, Wolfram Sang wrote:
> Hi Claudiu,
> 
>> My understanding was the other way around from this statement found in
>> RZ/G3S hw manual:
>>
>> "If all of the TAP [i] is OK, the sampling clock position is selected by
>> identifying the change point of data.
> 
> Yes, it is easy to misunderstand. It should add "and avoid it" or
> something. I got an internal diagram which makes it more clear. I just
> asked if I can share it with you.
> 
>>> I also have a chapter named like this. If you check the diagram, change
>>> point is between TAP2 and 3, so the suggested TAP to use is 6 or 7. As
>>> far away as possible from the change point.
>>
>> My understanding was different here as of the following hw manual statement:
>>
>> "As the width of the input data is 1 (UI), select TAP6 or TAP7 which is
>>
>> *the median* of next TAP3 from TAP3"
>>
>> I understand from this that the median value should be considered here.
> 
> Sorry, can't follow you here. "Select TAP6 or TAP7" is clear to me. But
> it doesn't really matter why it was misleading...
> 
>>> However, with some SD cards, I also see the EIO error you see. So, there
>>> might be room to improve TAP selection when all TAPs are good. I need to
>>> check if this is really is the same case for the SD cards in question.
>>
>> Maybe better would be to change this condition:
>>
>> 			if (cmpngu_data != cmpngd_data)
>> 				set_bit(i, priv->smpcmp);
>>
>> like this:
>> 			if (cmpngu_data == cmpngd_data)
>> 				set_bit(i, priv->smpcmp);
>>
>> ?
>>
>> I need to check it, though.
> 
> But isn't it equal to the current code then? (Except for one thing: the

From my debugging session I remember the SMPCMP was not zero and this lead
to my failure.

I'm not sure (and I don't remember from my debugging session) if CMPNGU and
CMPNGD are identical after the change point of the input data (CMPNGU  !=
CMPNGD) has been signaled by the controller. I need to check it.

> smpcmp bit is only set when there is no cmd error. I need to double
> check but I think I like that.)
> 
> Happy hacking,
> 
>    Wolfram
> 

