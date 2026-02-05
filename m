Return-Path: <linux-renesas-soc+bounces-27946-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHf7IPCdhGmI3wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27946-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 14:41:04 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D521DF36B7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 14:41:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD0E3301AF46
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Feb 2026 13:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3CFE233722;
	Thu,  5 Feb 2026 13:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="xs+IQunU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A68F22DA1C
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Feb 2026 13:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770298718; cv=none; b=DID3WA5WbJGr7KhBdd37gyy2q5OelYRyu2IP8zCsV6TByVvuFzcQmmTJgeaGzog+yhXUJqV/N5Gg8pjdujrOpd0CmUujeTL85xxYSBu6Ep3+/8x4xLKHoGt5gyR23c0EU3hl3tgE3bLW7nMfp3PnVV//LVTR9e/0Hitp9haHFaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770298718; c=relaxed/simple;
	bh=Z6L3fl09q9kSrubjFQ88R/6yrh72aTeNMdVC+nRTLfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rpSm00NP66If3mldHI36XR24R4K/lzcpjG27IL2DqytQev3PSy/8schD15DmKS5YeQZiN82OMZkhedwCUl3FsEzQFkVo6nbO48X4Mwp5Bk5pJiuBEePJ+0bG3L/O/DL1fmUbECADnWwdkx6PRXyx1Yk4mlJUrFTVa6HdgGB89K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=xs+IQunU; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4359249bbacso1324841f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Feb 2026 05:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1770298716; x=1770903516; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=02iWfztf973elI54X0voRTm4GyeDYKJI/pJtF0EYb1U=;
        b=xs+IQunUW0ewWnaS/QzrLa7nEmdLnPA75CewTe7vq5eNs6GBj1hpb+KlPPuE3kKcA4
         TO8Kl0YJrMcPS34PymPDjU7QieDqRlaOCLb9uEpSSxLGegVfd6HQOgtAW4TOM76P9eih
         bZRbjdKe1Cd6VGwRkEvPpIr1apgRP0ytNeJxBZVeRdB5pq2yzJKW7W84fZ1VRIj0cQ36
         vm7nYTaKgRli6iVpUx66ZZtQ9tm2tLICW2HXTtE1wVL2uuyvvt3lXwORDQnaIAHKT4y7
         oUE6pHxIEqdWZS5hRXJJgDgA5joyFvfoohFPOl1l9xPv6Ml62s7c5/r8rYBjLBN7Evwp
         wN7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770298716; x=1770903516;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=02iWfztf973elI54X0voRTm4GyeDYKJI/pJtF0EYb1U=;
        b=UGB/EDopxoJoqR04m5TJzqZcXASdUSVNAUD/cUR4Ae04n5zuypdJwcWkpIszeYLohC
         eLmZAy1mDb6B2w121P1Obn5Q69MJGpB5VjvSnm8dn7Rwpvh8Pzc0Pw4JQ+RzYDQT+6vi
         1nnrb6yGqdfAEyhIKJBAoeRiD+/LOrETh8hYKNZMKGahO8aXhHi//mk/nnBbA71QLJy5
         3lCaieUeZBOILp/8V2/9e5Nrt7TfYdSY28xb85AA2gAlBDvjhU5frqCLnqaZopS2hqIS
         RiFZQBz982P8ytwz4rIszIjeYp1PHKicpwpFHBCCOu4sbhRnBpqO56X6SVFC9ojeUEqZ
         whiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzsG5YOaM6Wyho6lx1c6MzuiZWXbAiZioA9rYS0biPIQgNw+e0aVEa2cdYDn/d9JeJMonaFgbqcxc4ItHzVgBOMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn1laSF2uY7EGUFelvRP+4dKc9j5UFjqMB/jQ8OgMcR61WD9P+
	cA69Wwr3bEcZyYJTQVELclStypP1pED6qZj4n+4ZS7Tzz6htehx8nNpHmEBWberZxks=
X-Gm-Gg: AZuq6aKMDYpqcA0IfLG6ZrAo/7gj8si8F1SMhjnRqtsq0s+zqGUwuR0lM79XfCcan4S
	KpUqTXVWrfemsgKfqCxvKN/PXQ7hCJaLnW/XGDfFiwuFIGuY5hPbqzqNckK5q9X8HlF/qFB0QW5
	laWSrdLINRYxksMIM9/gjLd69/GM/SXoLauH2WXEhx9NUHjQuqKeJHGYzUdFCcqak5iG4017Edk
	qTPIpAJmnleLJ9Qmmo/SPd28f0p43oBxDDrXkiYgMA+InUnHgo6Tx7HXU7EkH7xepaAuTkGiIvA
	EcCx7AiQzFzp4syA/Mmm2F2zYMiOR/z0yrRO1jm0k7Y4vzLPt22nXnfbozEajesg/SabDqEmzF0
	dAqUykuqR1X6ybR/zrfd0nRovu+wkGhcLTCpS0joYfmy3Bw3en9+UFxc+w0cuLnwwprtW7any96
	P35J5XlRjtd/raaDs/gE+wjyGUccXLCPF8HCi6+JvUCmcUkcY=
X-Received: by 2002:a05:6000:2887:b0:425:86da:325f with SMTP id ffacd0b85a97d-436213eb7d6mr4362010f8f.27.1770298716349;
        Thu, 05 Feb 2026 05:38:36 -0800 (PST)
Received: from ?IPV6:2a02:810a:b98:a000::b3d5? ([2a02:810a:b98:a000::b3d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43617e38fbbsm14752532f8f.13.2026.02.05.05.38.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 05:38:35 -0800 (PST)
Message-ID: <25ff0841-545b-433a-8e88-6e463ea718e7@cogentembedded.com>
Date: Thu, 5 Feb 2026 14:38:34 +0100
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
Content-Language: en-US, ru-RU
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <TY4PR01MB142829D9748A483ECAF19FD3D8299A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[cogentembedded-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27946-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,cogentembedded-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: D521DF36B7
X-Rspamd-Action: no action

>>> if (rdev_for_l2_offload() && rdev->forwarding_requested)
>>>       rswitch_change_l2_hw_offloading(rdev, true, false); else
>>>       rswitch_change_l2_hw_offloading(rdev, false, false);
>>>
>>> since rswitch_change_l2_hw_offloading() has internal check for the
>>> current state and returns early if the requested change is already applied.
> 
> Unfortunately, this has a side effect, e.g., if you pull the cable on tsn0 and the link
> goes down, you will see that the offloading is disabled on all ports connected to the
> bridge and not just on tsn0.

Quite strange, is anything else logged?  E.g. some messages from linux bridge layer?

Nikita

