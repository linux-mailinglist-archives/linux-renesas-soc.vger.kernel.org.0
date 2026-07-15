Return-Path: <linux-renesas-soc+bounces-35254-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UUUEExNkV2rFKwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35254-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 12:42:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A5E75D12B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 12:42:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=FrOWi2cp;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35254-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35254-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6598130063B9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 10:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D797443A80;
	Wed, 15 Jul 2026 10:39:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99762443311
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 10:39:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784111966; cv=none; b=ptOGyzvdq/9k4hnjER7p8tv18zsvspH9oOqk8zhlA52IPOx1QekGOs6Z067/S45hzehW3mDPqJdyuDWZ+7ucPoCianmntDHQebHBofGJBWSbJpQB+WnqytbrihYgaNvPl13xkdQy5UdX2rnK99UAMK8ZX6NIw2HZ3jJW4feFH9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784111966; c=relaxed/simple;
	bh=pyy8Wvft0PtHEMdBZYasTvd6yuUn0vslzW1iGDS5zQQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cVQRaDm5dUDjI2rHcXtDE+h2xmgbVUWbl7gTN/FzvJp2eI17n1c02BaFHMSlLphcd3TeOCCyFvGpNSwbU/cYpMOJIIP80U56GgC/twt3zkomSZqyXpQeYFQDsJuSb+6Tpiyx9JIXzgObVGg9Ukv5DEWlXrct2jraxVSbMGLW1I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FrOWi2cp; arc=none smtp.client-ip=209.85.128.54
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493c733f15aso47458045e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 03:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784111963; x=1784716763; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GWEo/wm9mgv9xJNzAlLuz4CqrYAt+ypm6bm4tma5o7g=;
        b=FrOWi2cpV5C2Qp3E1lpvuo++2r93UIIuaFvvARTuObnnJR20RnUoC2FGciMmRCDMpb
         4meukRuT/nL3bxaXD/XwoHXraWU2xscqrb0/CIUTxcfmtCzvpY+3lXhbUcuQGOTTvR4K
         aoNR1it+/bfFJGebw2npGUTrh7s+hzemvc4P+MVjBEe6GbZgFZAelMMp/iBTtQDvn/IF
         aRrxjKx/C9411+muYLwtrK+JoJU8IGaGCNGwly85jJYE1zauWyKq5qo2wqeqfWllp1oH
         eJNSdqJrdWIvqm5SspIMz6fHpmCeKz0929IalVhqUs4UoBzhUJXIHEDBA0jtAd5FAjWO
         EvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784111963; x=1784716763;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GWEo/wm9mgv9xJNzAlLuz4CqrYAt+ypm6bm4tma5o7g=;
        b=Gxjzp98oabuzqO30x2ubrz3VkLqIX4cDU2c/C/12/CvH2tBHbrbNIxESMifx/lPpCH
         UdwaXK8bQtcbUXiVGYBTGXrGmHW3Zpqol219Xr3f5BvU0tJ82Ra2he94jo5NxN9OFur/
         dkVEJLEjsO51W/odN3zwz6+H6pJg06Q6s7PwzCZ9kpzXce8L4ytoqdWrOUXCc91xlg/D
         cebw45KQgoqzyH3U/f9MyxgTToe2fuSJQE4bF4J02sSgHf4CX6c+JYdd3KexyjwuayFG
         Jm7kUzPU984mq8Yfvg5MkpLgvRK+UWZ9TfaRNCERYhDTOGY0yVdUS17axoElMJAr5Bxu
         eySQ==
X-Gm-Message-State: AOJu0Yx1ad5NFYDStAe43EDQR6PNejiL+xc3xh3rk9vTEt12aAlwmIMi
	HiWvbOZPeDq56sW7eu38qxj7YortirJIyQnOlfaw0TjhvctVFepmsLc9
X-Gm-Gg: AfdE7clfZh0FAbdfisSftb7ZsHOOH1yPR5kmUhvn4E5PxpWWZy+VXoaYUd4dWvOYvv4
	PwJNX7VFjZfJRBpgdtZsr3VPLHB4jHrwn2cRsSuZdkPUkwLh8RPMklX1oIcop2+j8jYTqPUNTEC
	/rvYNbSFxmlYFqiZGZBCCKDsZk9EeX3V31F3DxAK5qT8zbnGZR+KF27ETsQx7H3pNyLkPNGqM99
	mbAvb0X+ue/Gr8MAYVs4NwIos07E5Thk2ifUMopthO41d2MvNpe5FSj/3CFYC0r8u/mhhOcuJ88
	ce817F9o5WJMoHj/fj9+Xd2C8vlGsWpLh3SPZExW2iAN4HyxwYR+qDMXnRDruHq02iM7t/ovCbd
	5Zoq1ltM2tlerDy3f7axtBM5NBCT49xVcKKZqwJw5SHqn2qNXtydy5f2m6q2rY3U0jHtiP3SRfh
	P1lKz0Wn7dt8RTBX2gM36RToOFpQ==
X-Received: by 2002:a05:600c:a00b:b0:493:f261:d295 with SMTP id 5b1f17b1804b1-4953f1552bfmr8301795e9.4.1784111962582;
        Wed, 15 Jul 2026 03:39:22 -0700 (PDT)
Received: from [192.168.0.7] ([86.124.200.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32a2casm208295205e9.12.2026.07.15.03.39.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:39:22 -0700 (PDT)
Message-ID: <262424cd-a5b9-49f2-84af-f9449d49f732@gmail.com>
Date: Wed, 15 Jul 2026 13:39:20 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: Re: [PATCH v4 0/7] Add versaclock3 support for RZ/V2H
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, geert+renesas@glider.be,
 magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260302165441.4457-1-ovidiu.panait.rb@renesas.com>
Content-Language: en-US
In-Reply-To: <20260302165441.4457-1-ovidiu.panait.rb@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35254-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ovidiu.panait.rb@renesas.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ovidiupanaitoss@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[renesas.com,glider.be,gmail.com,kernel.org,baylibre.com,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ovidiupanaitoss@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A4A5E75D12B

Hi,

On 3/2/26 6:54 PM, Ovidiu Panait wrote:
> 
> Ovidiu Panait (7):
>   clk: versaclock3: Fix NULL pointer dereference in error path
>   clk: versaclock3: Remove unused SE2 clock select macro
>   clk: versaclock3: Reference parent clocks by type and index
>   clk: versaclock3: Add per-device clock data structure
>   clk: versaclock3: Prefix clock names with device name
>   clk: versaclock3: Add freerunning 32.768kHz clock support
>   arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add versa3 clock
>     generator node
> 

I wanted to follow up on this series from a few months ago. The dts
patch has been applied through the Renesas tree, but the driver patches
are still pending.

Please let me know if there is anything further I need to address for
the clock patches.

Thanks!
Ovidiu

>  .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  25 +
>  drivers/clk/clk-versaclock3.c                 | 618 +++++++++++++-----
>  2 files changed, 481 insertions(+), 162 deletions(-)
> 


