Return-Path: <linux-renesas-soc+bounces-27311-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPbeLsVzcmlpkwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27311-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 20:00:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8746CD30
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 20:00:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BB5030398A6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 18:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B26389E00;
	Thu, 22 Jan 2026 18:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejbrWJDo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8232438758B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jan 2026 18:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769108253; cv=none; b=T6rdf4g8Zkg1hNeNUnue28vHTIS+tb/+9UfoIvSr2lkyVDoUsz64zcFfO7xt8EBkgQIGA2lYUdT+aGc70lv7CwXdEPO8JGhFZYshuahjoC4pdQGNbHt/cVYwLas3zOUD07u6Qyf/INPtaYzk6E6XyYBkJYiPLgHoa0ID7CD+eu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769108253; c=relaxed/simple;
	bh=QUeVYo+ICZjJILbIW9iYwEWfD5eoanHqZ9Els6Bjq3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PYblKb3jrKeTbwTHBviG0XLa2wuBahhLP04+VioToebaKa/20YQtkvmFZvJgRX/scVLSWfAWTMtjjhl9rrW7VZt6pdBdqpnDVQf5K6Rc7OwqF5ZSGT3hmllqS339B8ARdk05dNjUUst/nZaD0KPaIjZgddfDVe+jEWN+UlIBoGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ejbrWJDo; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-385c6c727fcso9966941fa.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jan 2026 10:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769108240; x=1769713040; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+mScsg53i6ZoIWtfuaNxg8jLICt1p8GYZ/GGQUU3Wx0=;
        b=ejbrWJDojn6Mrn/TmzFdKWBuWBLOpD43KC7ip8P/nr2hrt/lid2atWFQJYKa2qsGMZ
         /rBkp4mtIJWy/5eaZwSHb7n8rre9QlSpcrwA98mfPpZGfTkbnM67RAaOsfsnh3oBW66R
         MrQYjUY1N2LMGc81/DBVuekKFqRzXVI9jENiCVn9jMfSRRmuaz0ZhfFVbmHmP4X7siiK
         RwoYdwghXgDZFh3/Sk4GJ/Xt0YCaayu8i71C6uigjYykFxnMr/SERJB5puQmpgsTpUko
         9b2zGxvd+2w9HRttRjq9vywvXn2ybp60xrxiBwi8WO5nDAbhPrmu4RCHR2o1968TjlVv
         +eTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769108240; x=1769713040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+mScsg53i6ZoIWtfuaNxg8jLICt1p8GYZ/GGQUU3Wx0=;
        b=JGza71haW00wSOreksTkz95K3BdK1OPAGNNnd24qSexX6G2jMgscuRr2hAyVjsojj3
         Ps1J1q3eUYv5RtaKttlIo8n4UJk4t7cWzEVO3E930/WW+0XTLJaD8BNH/nz8RY6kS5gK
         zj+tKAEX4eTghed+ZiS3ZiLOn9KaG2jJVojXoFKO9F7aWPixs3elNQFtXEIS92XuLbTJ
         /InjtXX9kdtXQYquhtDG6cBPb1de0YSazZ7K4gUM5irOKvn+scGiKijtmlUSZF3cMpKX
         Q+tiDNNTJmliFdDIDVX1VBSebZ4RPRAZ5yio17NcW8bmnKUFYuYFLEygoOEDyYd3MT+2
         hU9g==
X-Forwarded-Encrypted: i=1; AJvYcCXnXO8jGEX91wn2hvK/CD8T4Mj7hOU/NAPR3O6lrvuzobdZgifE8JW+YeBk8nPqTnf+Phpc5pLbqlrGZiJNAQG8rw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyD5stsWf+8qd3NDioLHr56joT0YOA4Vy4HK9Z3aRYY0L7CgwPu
	8TNgii8lYe8aDymltM9DS4NkP2Gfb+paUzIcPcGQ+H6B7tE21W5M9DTE
X-Gm-Gg: AZuq6aKbZohbhrUsr2/Jxp+excQXydsJOjH1Rj07PM6r8+xdU5m3mbVCYSREzuZsk7/
	SWeos10nWknb05X6Vg07fnS64SwptUHh+8fFZ/+nPl3tDg7Y1bdEB5/f3m9f9p+bVdokwixwVfJ
	Ncvxus72Hcy/Q+2ipcNYu+SoQgblDEz43qffElwnF1EAsUPAFalWc+OQqKHIM4N5RNd33wXw3Tr
	6EWSLVV6K+2hpxSP0Kqx92fXiKtH+CbdFuhM+x/kbXfltPky8HH1NfCg0+2VfTg19WMdtcCa0lo
	MBIFnww5EeW4AHlNr5rnrUJmdsA4k591tGB8yXKXBB/KOlXvvKLD2F9IhuaBwwtxHzMybea3IgC
	mSnin2Rx0L8we7ZD9hHjAPtUPfDfUCUtiJ+9HMqXBE7krlQ7YPqyaECaSdcgLTTwiUvN+NoOLr0
	3jxwf/xuRkMBNrMSYa9rN9qB+Kxu0PZgrBR5u5jc3kU5xkWaOlJMoWBaDq87aFHerFq0LPKQ==
X-Received: by 2002:a2e:a483:0:b0:37b:b8c0:b5e1 with SMTP id 38308e7fff4ca-385da007b4bmr684401fa.27.1769108239476;
        Thu, 22 Jan 2026 10:57:19 -0800 (PST)
Received: from ?IPV6:2a00:1fa0:4677:d84c:4a53:d9f9:de83:6237? ([2a00:1fa0:4677:d84c:4a53:d9f9:de83:6237])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9fec3c9sm645761fa.15.2026.01.22.10.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 10:57:19 -0800 (PST)
Message-ID: <d9096670-cd01-41c4-9186-847641c4368a@gmail.com>
Date: Thu, 22 Jan 2026 21:57:16 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] linux/interrupt.h: allow "guard" notation to disable
 and reenable IRQ with valid IRQ check
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 linux-input@vger.kernel.org, "Peter Zijlstra (Intel)"
 <peterz@infradead.org>, Cheng-Yang Chou <yphbchou0911@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jinjie Ruan <ruanjinjie@huawei.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260121232522.154771-1-marek.vasut+renesas@mailbox.org>
 <20260122162206.9wrHkrTZ@linutronix.de>
 <CAMuHMdVs_ODx3eByHkU03vopUuLuY7=uRnfTKuai65jNr+xMhA@mail.gmail.com>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <CAMuHMdVs_ODx3eByHkU03vopUuLuY7=uRnfTKuai65jNr+xMhA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27311-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mailbox.org,vger.kernel.org,infradead.org,gmail.com,nxp.com,glider.be,huawei.com,oss.qualcomm.com,kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sergeishtylyov@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0B8746CD30
X-Rspamd-Action: no action

On 1/22/26 7:31 PM, Geert Uytterhoeven wrote:
[...]

>>> @@ -242,6 +242,21 @@ extern void irq_wake_thread(unsigned int irq, void *dev_id);
>>>  DEFINE_LOCK_GUARD_1(disable_irq, int,
>>>                   disable_irq(*_T->lock), enable_irq(*_T->lock))
>>>
>>> +static inline void disable_valid_irq(unsigned int irq)
>>> +{
>>> +     if (irq > 0)
>>> +             disable_irq(irq);
>>> +}
>>
>> | $ grep " 0:" /proc/interrupts
>> |    0:         43          0          IO-APIC  2-edge      timer
>>
>> in other words, interrupt 0 is valid.
> 
> AFAIK, the x86 legacy timer interrupt is the sole remaining valid user
> of interrupt number zero.
> Nowadays lots of code assumes valid interrupt numbers are non-zero
> positive numbers.

   Makes me remember this commit:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ce753ad1549cbe9ccaea4c06a1f5fa47432c8289

> Gr{oetje,eeting}s,
> 
>                         Geert
MBR, Sergey


