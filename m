Return-Path: <linux-renesas-soc+bounces-27064-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A98C2D3B583
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 19:22:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3184C307C500
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 18:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E37335CBBB;
	Mon, 19 Jan 2026 18:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BbbyfFus"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC25B2DE6FC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 18:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768846905; cv=none; b=MW6pD7KqL7rXM25NTNcP70g8D+Sa9CcUQCwV059HxoBzztUjM32vRiCu6QuBM1RCsCeN7vdKpHu846EuGxcz/dsKTTmrVDjnHyVoxhxmrbl9I8dILDdE1MSYL5dQuwG+PrFEN7tuCnamJmEiWTKy2DeoGv3/Qf+WhaegvzL+D/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768846905; c=relaxed/simple;
	bh=Zy5LJZMMrWAeJGybc1mYICZTcGYHy14YxJl9thaBNQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gSB2VNODW8plwzT46QiQDVWukHWhg5S6759K1Xs2R7+n0ct09D77++ZckiEiLF6Th3kKTasQixaHH6vErL49mU8F95hWW5YYgWewUqwUdcGbcG5sIB6awH/hDJ1AedSFu6beUNtSpfXpNAhPcUBXJ+lQdajh4uqleDl9gzH5K2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=BbbyfFus; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b87693c981fso776363166b.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 10:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768846902; x=1769451702; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xlgCNFRd3suuMwlXMh6w6WO6xW2ltmOI8HGseTLB318=;
        b=BbbyfFusEDX2xzmUkp2Qs3d2Llt2D9251ybL1uZsA3uN/K5jpQ9h/3DFqxlbzi9lA0
         zN4ZLTd0c5kwsOkDFNMlKpURLT8TTcgHPEWcrhkrZZqBfuTio5gLlHTWYSpiKBrZ6SQc
         GYmGwypMTHRxwIb8b3BSRWJdt3zrbPZSEU4w25EE9XBVp5WYLkVFp2MG2cqzpPDpGQlj
         n8RhZKFPhccLUjDbbN8qZZBIvhekFzJ8+NHd8hGmeYBaSQKacgVw5PzodPz5dkQQ6oZf
         n3EvKiq6WYd9bqY5np4BRnF0q1Zks1ezhUvfdtwxywo9Oet8tU8RjzovURpi1aeb6ZHp
         yNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768846902; x=1769451702;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xlgCNFRd3suuMwlXMh6w6WO6xW2ltmOI8HGseTLB318=;
        b=sD16GQObBshXueG4ZTDxu2fVo1vbk9Y54K1bTIIkx4ZkCqeoYU2Am97hrkZjDSbNau
         3If4yO4AnPmjL+TPaw0si1AUXsjZCOM6TDsj758Q+ZyOzrB8gzm4Dn9pCf5O0wMAcxmZ
         BN38U4Q8o191x6UG4ip5Q5AHIWmCCToUd1LAGumnf+HTNb+KSgj5b4TzzGhyBl/hn7Qf
         z77saSNsJRT96s3FMgbuzLni1BH2NQMZECHOIJai/LfPLROwHujPuvSrhcsayI8s5NYg
         YGY6ik6ihAU4fSrZmQ5AujIz0o8r4uzvOsgc4sANOpIdA9RjX9y2D+L6+rJo6O0Omzd0
         m7kw==
X-Forwarded-Encrypted: i=1; AJvYcCULibuBZP6HB5nYlPjUTiQk8eLVAD0f3aDlIwsFmPN82KtKyA4yscG4py7VY+Chu3piQvmex1766CeNXvVC7m0qwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwU1KcH0Lrc2wW6ERy18WEHPsTwum5+7uGzI0ZSqMzcchcOuztQ
	YeRJaiiHADN6hDEUDj6bKUWXHWzUQEyvANYx2vIKbTTIRGuthhOtRfTkPtqIBp2SqUg=
X-Gm-Gg: AY/fxX6HqxtNoqa6Q9JK0mvamBzFo1pMPyV1itE43PSrvCOGkjwiwSx8kzrRNsRrPQu
	XB31ujz8QtEmAlvlvC5DocSDzeCSD0h1QOXhyb02TWfkMf2LWxrW6wLzmZUhK7AyhOJ1At1KS4T
	/VDdQ4LeS9sQAN0ze8wD1puvKotffjUqqaM1GDKWkzhdGijg9h3AfsK7UgQR1FXBfs4u4J8wWIB
	Yd0xoQsKByAWzNjqz/KV0R5JrSQ3AfxxYJE4VB0Gj8Y372gcHS49FrgpzecJCqOv6nNoYcOeNJN
	ZhPAVm19LahEfSsXPX+1uuf2E5YGkAUaGLxmjaDK52j2JbDbmtQ5+6oWEsGCPaeZX1ii4CbwgN/
	6HXbsAfFP6GDc9XoLP/Hvd9lYe89kbJyY0OnL/lfv+XFMo/4tbwAB+jnYTZIbRxPJgYM4DsQgdP
	P3CKFAsB24ZqwJ5+iRFQ==
X-Received: by 2002:a17:906:2083:b0:b87:d09c:181a with SMTP id a640c23a62f3a-b87d09c1a2emr283479366b.46.1768846902169;
        Mon, 19 Jan 2026 10:21:42 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a350dbsm1175882966b.69.2026.01.19.10.21.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 10:21:41 -0800 (PST)
Message-ID: <2649d775-e33d-439b-af52-8bcddb9823c4@tuxon.dev>
Date: Mon, 19 Jan 2026 20:21:40 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/16] PCI: rzg3s-host: Add PCIe Gen3 (8.0 GT/s) link
 speed support
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260114153337.46765-1-john.madieu.xa@bp.renesas.com>
 <20260114153337.46765-12-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260114153337.46765-12-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/14/26 17:33, John Madieu wrote:
> Extend the link speed configuration to support Gen3 (8.0 GT/s) in addition
> to Gen2 (5.0 GT/s). This is required for RZ/G3E PCIe host support, which is
> Gen3 capable.
> 
> Instead of relying on DT max-link-speed for configuration, read the hardware
> capabilities from the PCI_EXP_LNKCAP register to determine the maximum
> supported speed. The DT max-link-speed property is now only used as an
> optional limit when explicitly specified, which aligns with PCIe subsystem
> expectations.
> 
> Signed-off-by: John Madieu<john.madieu.xa@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>


