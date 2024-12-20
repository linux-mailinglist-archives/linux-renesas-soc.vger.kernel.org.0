Return-Path: <linux-renesas-soc+bounces-11622-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8941D9F8F0C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 10:33:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4309F7A1E25
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 09:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F17A31A840F;
	Fri, 20 Dec 2024 09:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="QHeX8rbD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BEFF4FA
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 09:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734687225; cv=none; b=M6B6hrFCpjrkh9pDVstDX60IHiaZGL5KcWpyAMf7Fw002fdnPjk7AO4jWrVSydt6aYHD+D2upKmhjmquU7ORpQ5OulURjZF+SlHMbQli7/WGnP0fyh1WWRzYBO7ZffY8ueQ9fkX3YyewhP8/SWncQZ6Vc9T1sAuJIqa7r3EcavE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734687225; c=relaxed/simple;
	bh=ql2cvojNhDoLyvf6JrsgSjwAgndqbWMG7FrdjDf+I+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lxxPeygh7pHlh+t3pq5OVNaUNaY3KOPSXEbaYJk//5QfhWAJ9rzPGQUZ3xZYtqDsXDFAFm4RCMZksjAKQE8I5yD5TsOQox5kubp6FTHFA52A0CaQ27yWz6O5OjeZ6k7293J7gh+9w/KpD1CGPJ+5G/FrnGGQ6Xv+snrABA2vvGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=QHeX8rbD; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-303489e8775so18027481fa.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 01:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1734687222; x=1735292022; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jo8fLuZk//T+YU0KgoC3pp0THGZOK8etrF75WPNYpLU=;
        b=QHeX8rbDomFRsno+nFUj2Hz39d6BAH8JdJI756pCZoMfTU2LofTPvrlXw4ltHfnnsC
         zSfABc+8cBLxE/MuuAs+uBDrOg7YjHDz7IKyfCecOWC2gcfm7OysqMkPhbPu/RTfAD5N
         eESyahyQwR8l7QXMGDNNt8EWyfHHiOVIR7ZGnGkXZDlFNR+km8LQO+9aWBQFFTvLSq1C
         DGlgDp+lnyz6xyzx7wF0K8+zlwOVpbWYJOuLvLNnFGH4rFdMr3LBErhX4TUBlRr7MvYk
         c/LNdjGabePLAfNECfWGHo3Bu+hP/cbvBTCVBTRz9/dCA/0oHh+ACJSy78lhHnz5VJBp
         9JHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734687222; x=1735292022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jo8fLuZk//T+YU0KgoC3pp0THGZOK8etrF75WPNYpLU=;
        b=Rk2ZNeVDNAvlu6tX0dEfDiVTS033Dn81aWyEkKuzofJX3LRomdrsCMq4o68+mK2c2K
         glotOX0+J8mUG0MPvZSp8kwjtHM4yvGtmfUMNi3wUikne7HN57T3iN79FSd22YlAuDSH
         iMqYE9Quyt9OtCdueGbnkeBwAnxp78rguwFp/Ijlvjx/h1XnnNxxtaBIw+KwzUqcnWk3
         gfcCl0EAEu6ZJv5pMeWttoZOoFOB42bfqErRnh8MqQhMzilmkfRbub3/gd7EOS30Ayey
         xBync3naDmCWDvUmtIfLy811CkC4F/NhToypo2tYjhfzLFz/BDj9aMBvFpHR+bCOi57y
         t4rQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxowdUgc0mb4xhemyj6dmFgVSWx045w3rGWNIcPKi01si68A5qCybhL38sQ1GgCYxJguXwWGIpfmfwu5CZdrmdBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzameXrCAWtlOsMyJ6ws4tgCTQxZDOqUVy1ZvePC2l3vWWnNYk3
	dOtBPL06hHEQIFIYpg753MkkNvU7AQ4m4jjpbvBrbIwgRYVLeCGv/ezOGZs4GCs=
X-Gm-Gg: ASbGnct2fn+dA5fwwAlfvgWICmscUjoZlamyocEzvhWmpsN/o73XsKjZqAtdmB6hQnz
	oF+Cgq0f03rZQ85wIuiWsii8MH+hxvQcp8/1nqKqHpm7PGNMXQRluCMtfkgrLNiQV/HOwzI97l8
	bkO3N4poWylaQgGc9KPuVqxkoZrWkzL0M9IozAK6BZp/irK1e4QQuvmjVLo9pJlfNMVL+dsdJ20
	1qNMTUKkKy2GF6xOBPIWtCRiQ3k2vI9tQjw92192iwLxvFnqNd8iatoVG2dL+waAmTxsrSkToUy
X-Google-Smtp-Source: AGHT+IFH9+g2ADiqcDjxY+wSn3OVVD0jTbeD93+8HhtUP/uu4l9Lapa834iXKgUP2D0TTAaABdYTIQ==
X-Received: by 2002:a05:651c:1544:b0:302:3003:97e with SMTP id 38308e7fff4ca-304686087c4mr7366591fa.30.1734687222506;
        Fri, 20 Dec 2024 01:33:42 -0800 (PST)
Received: from [192.168.0.104] ([91.198.101.25])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad9c093sm4687421fa.49.2024.12.20.01.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 01:33:42 -0800 (PST)
Message-ID: <21f0aa0e-9df3-4b5a-957a-dcf68399cdce@cogentembedded.com>
Date: Fri, 20 Dec 2024 14:33:39 +0500
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/2] net: renesas: rswitch: use per-port irq
 handlers
To: Andrew Lunn <andrew@lunn.ch>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Michael Dege <michael.dege@renesas.com>,
 Christian Mardmoeller <christian.mardmoeller@renesas.com>,
 Dennis Ostermann <dennis.ostermann@renesas.com>
References: <20241220041659.2985492-1-nikita.yoush@cogentembedded.com>
 <20241220041659.2985492-2-nikita.yoush@cogentembedded.com>
 <1f4b60ec-544c-49c5-b939-89882e1311ed@lunn.ch>
Content-Language: en-US, ru-RU
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <1f4b60ec-544c-49c5-b939-89882e1311ed@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



20.12.2024 14:19, Andrew Lunn wrote:
> On Fri, Dec 20, 2024 at 09:16:58AM +0500, Nikita Yushchenko wrote:
>> Instead of handling all possible data interrupts in the same handler,
>> switch to per-port handlers.
>>
>> This significantly simplifies handling: when the same interrupt is used
>> for several ports, system calls all handlers, and each handler only has
>> to check interrupts for one port's tx and rx queues.
>>
>> But it is not required to use the same interrupt for all ports - GWCA
>> provides 8 data interrupts and allows arbitrary per-queue assignment
>> of those. Support that by reading interrupt index for each port from
>> optional 'irq-index' device tree property.
> 
> It has been pointed out that adding this property breaks backwards
> compatibility with older DT blobs. 

It does not break backwards compatibility.

Current behavior is that everything is serviced by interrupt 0.
And in case of irq-index not defined, the fallback is exactly that.

(physically there is code that assigns interrupts per chain index, but in the current driver chains that 
get non-zero interrupts assigned are never used; anso currently multiple interrupts are just multiple 
entries to the exactly same handler that always services everything)

> I don't know this hardware...
> 
> How many ports are there? Less than 9? Can you just do a static
> allocation, port 0 gets interrupt 0, port 1 interrupt 1...

There are only 3 physical ports, however the use case I'm targeting is - virtual ports serving virtual 
machines (with offloading features making hardware directly L2-forward or L3-route most traffic between 
outside world and VM-owned virtual port frontends). In this setup, some of 8 GWCA irqs will be given to 
VMs and thus there are definitely not enough to per-consumer allocation.

Nikita

