Return-Path: <linux-renesas-soc+bounces-11620-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CA59F8EE3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 10:24:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB8CC1896F85
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 09:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB051B394F;
	Fri, 20 Dec 2024 09:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="k4tcOQI2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7561A83F3
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 09:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734686618; cv=none; b=Ohqz4fPkRLWENt9GpKedqAva9ODylzQVOyRRm1yXlCJrEKzxtPkS0IZY8a/pUNupTN3+gWdYDgldH8ubuWg+Ti5QGGxUXAAE89SBAD0aPhWpWNe4yKicTii69h4IXC3vsUuMTh1yH1wW5eN42UIdKdBTtkGm48qtqPKlaGX1aPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734686618; c=relaxed/simple;
	bh=KCDElS5z2fsldc+2ATrCN2JR/gBjmVszXfvWzsZAGcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YBMlL9RRMLss7MZ5Nk8D7lwMOC0Q53ICrpVLIATkk3M2VEhHJbL6s6z2I70zhDJygONnjrRDtkFOMI3fK7ZsKcVUQmto/8H9tjtqo/pwyy1aPN8UHZWP9lmS9DYcBdhOeBv/JKgYN7AH//dtJ8o8isYrmcRaG1dtvCdy1kHRHIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=k4tcOQI2; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ffa49f623cso20662951fa.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 01:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1734686614; x=1735291414; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/+TrNT5jtIAZL9awK5DM1/5/DLxJyjtDlozW1sMJY2Y=;
        b=k4tcOQI223Uo2PjJdOALHOE4qd/E5CIOLHru9d5Bm2BV8I7R07rH/8mLlureqvTrTk
         SzZjQisa12cEPn3Jdw7DEV3A0M3gIDGG2dsrHreCUNgAvLcU58SBW3eoJUlO7XGWurLk
         b20ut85yagajILvB55hoUGqCml9ZLU+sRBWbCvVUG3J9bm4cmrOF3ZYGQMNH5SZhDLUE
         n/pw17cI1jzd28673DqB1EOjZpD2AtQvmZiMt5xGv2DvzxLMfnacQeaZ4iYmlK9hhFpl
         udoA/8FCLR4qUoMXMFPJfemV0fUoVqU8TGlyTGpDlhBG/raF+SYbtGSIEEtnBCGOQrOi
         yDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734686614; x=1735291414;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/+TrNT5jtIAZL9awK5DM1/5/DLxJyjtDlozW1sMJY2Y=;
        b=k5l9h83o7vb4rpFYVSGZtVERus1mqExgSkgHSPFNc6DmgmF19jNMQZ5dIJXd+RLn61
         da3JSJivCgpFmvZ+8ZpL3DtexSGupa618gxHqHnI7lwFuHQMpjBBtzwol5AwPpR+qf8K
         IoE+e5Fzgc6cgUE1CllQ9oIRIhboGutef5T6KAWu5mxQ4oMT+9RJp8E5RrahZqq2DUy0
         BhhI+DyUCGybe6bqkroqfRYPM8OOh4JATeYVBEyNpIYrdXpHCddxQNDTcbq1VXi5rSrz
         EkboD/SNDUa2hs+6TJwRrwzXqEQ7GgjCGEWr3SN4saycRz25LErv+/WEFgbtkSf/ZPaP
         RSuw==
X-Forwarded-Encrypted: i=1; AJvYcCUQcUBUkzSUnDg0G+KyLM1VMo0HJy+Pn2D9uzkc+DYgg+PGT1kStDE5pKJg/Vg8asAledmxmxhEB2e/bBR4QCYBKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbTJbpr1KRFXPMr+GFnaaqB7SMJclTZRPwnFAsrDuEmGrDav73
	skiaHWeT12WTZec5MYrPQ9joMg4DhKCXI1l9JCuDTLzL7MvXU/L/rfv0fscq3aMO+pw/7dfkbr1
	F
X-Gm-Gg: ASbGncuQ3ujC1oPbgzDmWovDw0NnvFnXIhS/6Q+wad8kid7eOnQ4MQQvMzOQExLDk6v
	WGU3JoHkJ+ASLgY/q4HNXFxgTtzg+LlkHZiKyU23IGUuaCnhNWLm8/o8SiT3j5pmyLajXe/DLt8
	Z7vYU20YxyHoCezKsH82qAcXr5fgIx2N4YhC+5SYVnfYjVr0GZ2NdKwzodOY5zJnEePlQCJvIB+
	eQDcYSblWXiLJ15i7LEJoMQJPqFGQTVr5kA1VRS1DWNNKHDjb1nxdoAhAxPMC5WIOw7ERKdHuYc
X-Google-Smtp-Source: AGHT+IGfz2PHNF/FWn/hpRtN9wfgXh99+gz7PviQ4rLuDyLIigC69aw87cFOnBjDw/N8prGJPeb5aw==
X-Received: by 2002:a2e:bc23:0:b0:300:31db:a770 with SMTP id 38308e7fff4ca-3046860d416mr7731831fa.26.1734686614551;
        Fri, 20 Dec 2024 01:23:34 -0800 (PST)
Received: from [192.168.0.104] ([91.198.101.25])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6cfe8sm4729851fa.6.2024.12.20.01.23.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 01:23:34 -0800 (PST)
Message-ID: <01c3755a-d57c-4da8-9505-551663a694c7@cogentembedded.com>
Date: Fri, 20 Dec 2024 14:23:31 +0500
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/2] net: renesas: rswitch: use per-port irq
 handlers
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Michael Dege <michael.dege@renesas.com>,
 Christian Mardmoeller <christian.mardmoeller@renesas.com>,
 Dennis Ostermann <dennis.ostermann@renesas.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
References: <20241220041659.2985492-1-nikita.yoush@cogentembedded.com>
 <20241220041659.2985492-2-nikita.yoush@cogentembedded.com>
 <CAMuHMdXV-2bdU9Cmk_VHTJ=M3Afg5aTfY=_k=p6v1igzpV5kBA@mail.gmail.com>
 <7b009b7f-0406-4dc1-80b3-79927d6143f0@cogentembedded.com>
 <TYCPR01MB1104022CD76BDE941D1C22536D8072@TYCPR01MB11040.jpnprd01.prod.outlook.com>
Content-Language: en-US, ru-RU
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <TYCPR01MB1104022CD76BDE941D1C22536D8072@TYCPR01MB11040.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>> Sorry, but I can't find where this property is documented?
>>
>> I will add this.
> 
> Device tree properties should be a hardware description. However,
> about the "irq-index", it seems a software configuration. So, even if we would
> like to submit such a patch to add the property, it will be rejected.

Hmm...

Indeed it is a software configuration.

I was not aware of such a rule.

I believe there shall be plenty of situations when a per-hardware-node software configuration is 
desired. What method do other use, if not device tree?

> Also, even if we can add a new device tree property, we should keep backward compatible.
> However, this patch seems to break a backward compatibility.

It does not.
If this new property is not defined, then it will default to 0, which will result exactly into previous 
behavior.

> Unfortunately, I don't have alternative solutions how to configurate per-port irq though...
> # Maybe configfs??

Looks like overengineering...

Perhaps can just hardcode irq-index N for port N for now. But then, flexibility will be lost.

In more complex situations that I target in future, some of 8 GWCA interrupts will be given to virtual 
machines (and/or Xen domains) to serve virtual port frontends, and some will be needed for virtual port 
backends.  So 8 will be not enough to have a per-consumer interrupt, and some configuration method is 
needed.

Nikita

