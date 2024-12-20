Return-Path: <linux-renesas-soc+bounces-11601-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB09C9F8DBC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 09:09:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 335ED166979
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 08:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6E51A0BF3;
	Fri, 20 Dec 2024 08:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="rxDamQGY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824D01A0731
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 08:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734682179; cv=none; b=pWZgYC44BFunIzIRtbMGfFg0Hl5g+kYHSZbh7uwIqXkRPIgwbaJ/8NqCAxHEsFDROQHkf7Mk7gTBzVlPKID/WUVTE9xzR8lhajruAk6VJmJCC/vkXTBURLlIkAoQD/2OVQO/NjoIskBer/tyQ9hbleysEiTCR5cAi8yV4ucmd7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734682179; c=relaxed/simple;
	bh=RZGLnoL48vAfpOS6MUjRxghvSaxCzIP33faA7KSTB48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ok74lhpTE81Jls99S2stIWotkAxYKDUEuVyZ17JPt3z3INkucgABlWFu5Em1vxB0b0R2sfL8orUW6dKbtclcYuy9yaLOdQWzpPatDrCBsYXx2f0GY2X54j0mTBiGmfAttXv+1Y2NfhFFCv2ny3NlglwesCMm1fgyDjzR5dr/cpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=rxDamQGY; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30227c56b11so17135741fa.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 00:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1734682176; x=1735286976; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QF6UIXiEkHZmXmCHoNP/5n9jgMJUTxHNacJ4sboJOKQ=;
        b=rxDamQGYKGbdHhDUbXzBaxDcQWqBp3kKy1zSvmUtYoKfbVxEOp32S3EuaYpKnu2Qji
         tWzg7YxZui37wLjz+nQp0o+AimwT8cqLNAoIgN9JGewGLfrEco0H9QSvjKmyt8UgHtD7
         uMtDGm+1HLoSJWYzekl+Vrx1H26Xie05uI1bfcUaKyAB67zRomlIw+VPOSQBaImi0qFq
         L/BIo/Cy4wQMxHWo3S0DXrxqs5KM7q0b9zP0qSfHDiWXkVGEQsk7Vq1OEf9ONY6ClR1R
         s6HerZ4tZ59+KX8BGsr4zbON4Bzn/TdbNOPm6MmK4EioJ2iagCaDznksKBglLGMtmgMw
         F8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734682176; x=1735286976;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QF6UIXiEkHZmXmCHoNP/5n9jgMJUTxHNacJ4sboJOKQ=;
        b=O8taGnOqZp4eDIJeW85HMuY+OI7XxG3cfcVRPFl6PRRWp5BBFEoVUWN6DxRWebDQFE
         6JBgIqK7ieFwdxQKIdiuPSp+16+FG2/q95FFcVJFgH8EoaBJmjGqnX1+/FDx8REXg0oe
         T4Sjdgmg+cbftddKhBNzHIwMS8iZmMq5L2flIea31XPM+qo7sLk5gu799LO2Awye95a+
         odOYestXrq2/MR4ja9yXBoF7f18hqItqN9vz5MWKd1B+H2HHZTQ6zASS6XLbiQm45R99
         d/9BSb4TI2SayOdkm1PzAh9GV3WSrLL9iCVai73ryu87GtMQ4sDO1Fwn4MOzdwpm7szZ
         TXow==
X-Forwarded-Encrypted: i=1; AJvYcCUQ22mbFnegTFBsilEx/QF7C8a/bMcYCQhRFMkU7HiTqvb4W/VyPI4MVV8kNz1RdFcuCcS0C5filPFpTcl1xG8kbg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpn//cEZdiZ1afql/RUVoPmRHxLRV+lmqzIxXg9ohBcnkpiWBE
	Bx8DrSka9u7RBmA2xp/qvl/hGVCPZimgsIgPg9bYkC01Nij6tY1D5DQ0FHHQHlk=
X-Gm-Gg: ASbGncvO3W8TNFbjhE3osFyFLlStc8fuHB3UNOfrg3NibDGkX4eE3gGtbFfGQMsDLT5
	dIEwzfDKtDwvEQ4nQH4zWtEDYFisGS+Dn6TaH9eg4NyB7pZW/0eHmqPiuP+ntUqPiQnHWSveCG9
	6aO/jHYrJ1sBhN54/scS8I3cobdVwxGytRxV9pScsFktG38XR2Mvjxa7UIB/9x4+abQGzvubhpo
	TD/uFqkIvAN1xZyqSyAQHWsOAZaVp/FljXEbEmMpxDjqe1zGarvowGYAQmQyK0NUulzj3OPv8PI
X-Google-Smtp-Source: AGHT+IFwM9giffUHrEP/MTz0pVObL+nMy8Xk6RiX3KQ+DCpfdFx5uhdfpy/4qHCmQMHFdCluSPPBOQ==
X-Received: by 2002:a05:6512:1387:b0:53e:3804:57ae with SMTP id 2adb3069b0e04-5422957ac55mr661172e87.51.1734682175720;
        Fri, 20 Dec 2024 00:09:35 -0800 (PST)
Received: from [192.168.0.104] ([91.198.101.25])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235fee84sm419634e87.69.2024.12.20.00.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 00:09:35 -0800 (PST)
Message-ID: <7b009b7f-0406-4dc1-80b3-79927d6143f0@cogentembedded.com>
Date: Fri, 20 Dec 2024 13:09:27 +0500
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/2] net: renesas: rswitch: use per-port irq
 handlers
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Michael Dege <michael.dege@renesas.com>,
 Christian Mardmoeller <christian.mardmoeller@renesas.com>,
 Dennis Ostermann <dennis.ostermann@renesas.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
References: <20241220041659.2985492-1-nikita.yoush@cogentembedded.com>
 <20241220041659.2985492-2-nikita.yoush@cogentembedded.com>
 <CAMuHMdXV-2bdU9Cmk_VHTJ=M3Afg5aTfY=_k=p6v1igzpV5kBA@mail.gmail.com>
Content-Language: en-US, ru-RU
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <CAMuHMdXV-2bdU9Cmk_VHTJ=M3Afg5aTfY=_k=p6v1igzpV5kBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> But it is not required to use the same interrupt for all ports - GWCA
>> provides 8 data interrupts and allows arbitrary per-queue assignment
>> of those. Support that by reading interrupt index for each port from
>> optional 'irq-index' device tree property.
> 
> Sorry, but I can't find where this property is documented?

I will add this.

Nikita

