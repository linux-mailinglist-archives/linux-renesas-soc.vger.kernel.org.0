Return-Path: <linux-renesas-soc+bounces-33967-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zqVsO3gPLWoKaQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33967-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Jun 2026 10:06:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 531FC67E0E6
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Jun 2026 10:06:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=QMIJik0U;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33967-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33967-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DE4D30C921F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Jun 2026 08:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7C473C3451;
	Sat, 13 Jun 2026 08:05:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3912C21D8
	for <linux-renesas-soc@vger.kernel.org>; Sat, 13 Jun 2026 08:05:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781337956; cv=none; b=MLHJFxxlNGd9Jo7soHtZ5TdHKpV4/+nRpICMZM6QuSdqJHH5dm3uvARzhpTyJsksXaXdsnXTlQtUCYe6pG+6QBADy8XAhapVSKgXntrLkXE38fOGfvw5gARLPf2v/znxZzLk0cgJyVNBny8lhKcePR4Wm/i9SVcejTQGFBSMyy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781337956; c=relaxed/simple;
	bh=nXrtTRt260BnE89e2cFGxqUmeocGv80w4LWjv8LNFtU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=m1G1tWHEaVXL1uTHrncb9L4Y9Fhi4ehs5zNmScnBEdawZl64/Xla1tQGl8Q0V1MqcNQ7f4o9vptHNfT0Ewl/TyzGBbL9QeHOPtl/YGsBGQUYhLW/0YkoYzEswefMQqUJJTHEGmN+RdktYFP1mvSIT0wVPG4/X6wAWjobBj/E3Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QMIJik0U; arc=none smtp.client-ip=209.85.208.171
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-396aacc5bcfso16417531fa.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 13 Jun 2026 01:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781337953; x=1781942753; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cDPjAstWjnCraB70Ptsrj5XTr8SWltOcyco4hBFXzRE=;
        b=QMIJik0UNSyPMVfBk49wHeG3oQejlzJHcz8FQxOAYHRobUHmSLzHU1U9MG56jxqj+W
         x+7Alql8U9/rRK9XRyPnW6CACoFckdYUVzrS8oGgWkRet5W3DQf52T3jtBf6Sh8GSvWE
         PyPnB6HqHGs9vQh4a9nMcyv2ueIUf3GSilqJJ3PS6u1cO4USVy21Xva49FuUSliUFOGp
         2s0CQh6hEBUd4UUXbUbZMKGY8/8oTu/nQFeDN9TSNSzoUX8oY802JeokYHXVlZ4JtjyO
         l0JdJneW7hkfc97RqMB00DZpNuFviDjpzLPfmL4Fmn3m+t7SoOnfVbOQxEadXPKffhZJ
         1isw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781337953; x=1781942753;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cDPjAstWjnCraB70Ptsrj5XTr8SWltOcyco4hBFXzRE=;
        b=kv/oQ/dkOZNtOSv2zUcsyUfQINHcnPiw4d06QzP7xDoYmET1kpe8FL+WBOQJwogJiX
         1ainndR6gk9x8DdRB+H4bktq096H7chsWaiW6TOQ60rCx5MwEQSDVuLQKgtUMEJX2fjL
         hg8HMa8zJHXIUe3/LEqA/pxqIc5B38SfOo3D3wWicxavj1GaKIRz1awYuf4dD4frbAeG
         JYwLqdoOhagISQVLGY4vkk3D15kx2P7jAdrx8bbNPXBWanyuoWUD6J4jva4TrVjTzkwj
         9pq80UucNf2oUZ9hO83WKzrB+FnsMOYtSglYJ/1GtmJfJwxAAxftN2RFfc73zHGCcs4D
         j5Dw==
X-Forwarded-Encrypted: i=1; AFNElJ/+qwqN60Uv+6p+Od+LQu4pxV+wpAaY5Vt/WE5irfnDLgt6FL5f1q0Dwe+ejsb4A+/9ESlfKOkOSMK+S0awZY6tLA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz83w1vPg9ixL/guhlg07K2ATuWzkrYuh4VJvMKFo/gyxU/0OOp
	YEdghXru8K2BeXCVjj/cP25HwOQ2gOfas16bkpX8SmFOk4DcTTnFBjMi
X-Gm-Gg: Acq92OFG6h7L05UlvnQ/sYbLZAomcJMEoGaZTUKu9wcLPRRAEL9tcoA4JPqYjWmAXSV
	Ks3aWhvW/qWvWez8IbdVNxdqBxFZcuZXKktf3zHnRbAmuXRA6QFb32wQpOhpeawg/WnzLyqoISg
	tm2g8vOoE+xnGa83y+qPY8/GvfUb32pZnHuMFRxo1J2RuK8ZuOBnExy41yruqGlcsaxDPtFwH/b
	KDR4PcnCo4iD4+LNo0CnjRGIk/QgON0byhcClX0VAQf261jVvkpW1RpJ2+Oys5wv5HlzisWItqO
	LIdd5PKwd2DLLeFoaBon0eW23rJscpv0x4TXszrwy/AYOUj3nSrcBYtgtAoVg+oxooD8t88lqVd
	qaJit38W6pJNxcB1OnFMc353SgEpe4uXZ13TKOgVVgVhr/VlTILdexSTC6XkhHQpPXhd2BYhg01
	YRLKbr2bVpG4xAG0mq8IHmvd2xvG16631PwYBuvlH1WN069SEplLlWWF8wyQU3M4wRBr+Kx4EM6
	plbTw==
X-Received: by 2002:a05:651c:150f:b0:396:8b66:8aa2 with SMTP id 38308e7fff4ca-3992af676f7mr18989251fa.3.1781337952472;
        Sat, 13 Jun 2026 01:05:52 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:856:c6e8:742c:af09:78ba:8005? ([2a00:1fa0:856:c6e8:742c:af09:78ba:8005])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f5643esm11961331fa.32.2026.06.13.01.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2026 01:05:51 -0700 (PDT)
Message-ID: <1a31fc77-c681-4635-adf7-3a6d97c0b416@gmail.com>
Date: Sat, 13 Jun 2026 11:05:47 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next 7/9] net: ethernet: ravb: Add callback for gPTP clock
 index
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Paul Barker <paul@pbarker.dev>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260610102432.3538432-1-niklas.soderlund+renesas@ragnatech.se>
 <20260610102432.3538432-8-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260610102432.3538432-8-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33967-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[ragnatech.se,pbarker.dev,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,glider.be,vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund+renesas@ragnatech.se,m:paul@pbarker.dev,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:netdev@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund@ragnatech.se,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sergeishtylyov@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sergeishtylyov@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,netdev,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 531FC67E0E6

On 6/10/26 1:24 PM, Niklas Söderlund wrote:

> Prepare for adding Gen4 support which have an optional external gPTP



> clock. Add a callback to get the clock index and use it to determine if
> the device shall report gPTP support.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Sergey Shtylyov <sergei.shtylyov@gmail.com>

[...]

MBR, Sergey


