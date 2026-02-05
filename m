Return-Path: <linux-renesas-soc+bounces-27950-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKDYHcuhhGmI3wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27950-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 14:57:31 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 11925F3A01
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 14:57:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3CB02300C278
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Feb 2026 13:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB253E9F8A;
	Thu,  5 Feb 2026 13:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="W94ksg2a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CDB3E9F87
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Feb 2026 13:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770299841; cv=none; b=GZXvNnMsYjm4BstpY3NMC+wCh4nRpzDP0x/+FemSCYv4Nn9vF4c/XEmqCFzNQQLBaQ1Nx7IjDnIzJqMzoZnX6yNECEVkHMMVX1jnMrl/qJSU+K3n1Y8EbYmCg5DQnF0VyWR/0iZOuv+EjFqU9a72zoJN99B/SZjMvKFkdUSqIKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770299841; c=relaxed/simple;
	bh=zXTe+BYDJ+Z/ekQAgc+SG6itGOz1xj6zpkfaFjywm7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ch35G5SQ0RUVidu2A6kS4V1p70J52RRbiyIRoQ4v3UCcc+J6aZA85sz8QgqHCdj8GA2TolBiVXnbDJcZ/x6N1FPmOjk4lNyxbV87ZZH0Sfq6/1pM+A+eBSCUkV/CsF6nF0TeL4te+Dped1oXMN0fpouCda/kXNk/UTkOfK1RP1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=W94ksg2a; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso10988055e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Feb 2026 05:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1770299840; x=1770904640; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=//Oz6Yho5HmPa1EIIL5aLcfVNr7sW1OS3X7pkoStOfY=;
        b=W94ksg2aMQVp/wHtRbkRa6pSHVwT7qOfk/wtu8OoawW1AE9Ms2S56tB1EqIliS/V7X
         bKBznGzd7v7ej4JqHiY4VvsjSP71+3SWFo/whvx1SIF29QFfm0bZ/w3A6DWaMar42o/j
         rP9Stgo2AMoAn6PfPAqfG46yPO557ImnVblgzoWiAdcpTEJ7+eA683CIqAcmPNe2t8wz
         kxgEApDYaJBvSrvf3FnvY58CBxq/JFr/WHI9uluSMIa250TYA8zrKubCQ3FFIVktUZed
         v45PW6LS5Hi+TOEzr7+cAYl1hY/NtpXQPRbpsINC+KOLuSvhgburFeYl3SD1PufEOTDQ
         lZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770299840; x=1770904640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//Oz6Yho5HmPa1EIIL5aLcfVNr7sW1OS3X7pkoStOfY=;
        b=w17q4o0f/o2dn+l+iHMK2CFFyGFCEfv9AEw6WU3nrvfn243hnWDNgbrs4Eej/6guYq
         lezAigEzlvUtqKJ0rJ8ufyStigiA3CjFRHkGhTbtVqd9Gup3AlWNfHiOYaCoUBcgL76P
         YcVvDZfwr/kdoBAqEyO4/avuwTuk7MeLUkgPeiWpzCA1PH+aPpr9ROGCm1UQ990vWH3R
         kK4hQh7hEWXWESAxshfYis0Etffqjs5Wo6meAgyO8v4YU5eVMWzesKzfXFvNXzjPUnte
         WeUpTZvfuw31icufirqEK/6B/+v+39NFirdsr3S6bh7sah+zXtUedqhS7GjxLEsPFd2K
         OjAw==
X-Forwarded-Encrypted: i=1; AJvYcCW7UH6ig3ZUw5XRGcgynSZml4DBo4K4IwGljkDUvenTA7vczGLWycOZbs2qBzBJNYM4NGi3HyT3hOHAgpp4gN9AJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTVIY8FlsxaM9r4lu9E9bLqzeXTn6C6XrYOsqtaEcMbufUuOD+
	dVlG/fxa76i7Ay4IExseUep4ZkUqZafVHDv55HtmM2Q6LJ2OGGjJre74O9M59GDGWYk=
X-Gm-Gg: AZuq6aIGER25nC0FtIoWXHNXwHYJGiCjrSYMODAPaZ59lvZDpfywyGF8AJa4DuIxkqP
	o/V/jKvl1epXWL5luYehvAf9yrNCYDF770dN8sPKFhXQipYIeu1snoQ+bDhRPG6+Y5bmIwCDwVi
	zKMAhMt7IejWZ2wfX6uJ4YSi5A3LqXyqp3HXK7o5jxg9yurTNLE8UwHfCVkglfBALDM0VrrYgd2
	Nm0FGLSJCXaNgB+emDjW5zzGUClaEODFsRR3qPClpBWfCM0Gj00P9/qBd0riLOLkSz4Mwz2wVQE
	dtU+xyRJxuIDF8WuQxUKO7ckmVRSRGQyTUUhY1F/mzIw5JrBT0oQ5NchGzScf8nB+5AysVIvrDK
	BVjMv2t4tN4mTf74AGAoJWBzFzBqXDcwSHAolD1WaO1wrdZIfrIYTw0t/zg/h30hWrdl5NF1EpR
	juHetGuV/UVZj+Yr9jrPAqJB1F5xwWzz4lhUSOHugKj84rkHmRSfe+PBzWa/T2SOMrAT9Ocg==
X-Received: by 2002:a05:600c:3e0d:b0:46e:59bd:f7d3 with SMTP id 5b1f17b1804b1-4830e96fb0cmr74468735e9.20.1770299840013;
        Thu, 05 Feb 2026 05:57:20 -0800 (PST)
Received: from [192.168.1.2] (ip2504fb9f.dynamic.kabel-deutschland.de. [37.4.251.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d2085asm63423095e9.1.2026.02.05.05.57.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 05:57:19 -0800 (PST)
Message-ID: <237bee8b-a7cf-4c14-9946-8bf72dbddde5@cogentembedded.com>
Date: Thu, 5 Feb 2026 14:57:16 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: renesas: rswitch: fix forwarding offload
 statemachine
To: Michael Dege <michael.dege@renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260205-fix-offloading-statemachine-v1-1-640224a531d0@renesas.com>
 <3b1405cd-6c7f-4883-95fb-151cab223a68@cogentembedded.com>
 <d6a9356d-6fd4-459b-9c5a-2f3e20368bbd@cogentembedded.com>
 <TY4PR01MB142829D9748A483ECAF19FD3D8299A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
 <25ff0841-545b-433a-8e88-6e463ea718e7@cogentembedded.com>
 <TYRPR01MB14284CB75C7DCD35381BD17EE8299A@TYRPR01MB14284.jpnprd01.prod.outlook.com>
Content-Language: en-US, ru-RU
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <TYRPR01MB14284CB75C7DCD35381BD17EE8299A@TYRPR01MB14284.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[cogentembedded-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27950-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[cogentembedded.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[cogentembedded-com.20230601.gappssmtp.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nikita.yoush@cogentembedded.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cogentembedded-com.20230601.gappssmtp.com:dkim,cogentembedded.com:mid]
X-Rspamd-Queue-Id: 11925F3A01
X-Rspamd-Action: no action

>> Quite strange, is anything else logged?  E.g. some messages from linux bridge layer?
>>
>> Nikita
> 
> Here is the log from the version without "if else"
> 
> [   83.107759] renesas_eth_sw e6880000.ethernet tsn0: Link is Down
> [   83.108734] br0: port 1(tsn0) entered disabled state
> [   83.109669] renesas_eth_sw e6880000.ethernet tsn0: stopping hw learning
> [   83.110519] renesas_eth_sw e6880000.ethernet tsn0: stopping hw forwarding
> [   83.111405] renesas_eth_sw e6880000.ethernet tsn1: stopping hw forwarding

The driver was originally designed to enable hardware forwarding when not less than two ports are in 
forwarding state. When only one port has hw forwarding, there is no destination to forward.

Nikita



