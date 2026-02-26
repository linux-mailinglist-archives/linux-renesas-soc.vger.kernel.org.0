Return-Path: <linux-renesas-soc+bounces-28480-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4O4hCn8toGm+fwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28480-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 12:24:47 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B97101A5009
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 12:24:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67DBB3071A54
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 11:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9282F3644D1;
	Thu, 26 Feb 2026 11:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="CzE5ERLT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6871234DCD6
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Feb 2026 11:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772105084; cv=none; b=W/F9COkXBTwLPVzYttfzwDDZOW2gHfIa12b69EmC054vvPRVtNarAOC5kakOIOXMOOKebmCNb4ZWxd6yGDR5EPvY8nYtQzxdcABMKw+cgNTCWlCvciAc7xJ50FnSDxnHyCQDxxkMAqbC9KjnEP4UXeETRhd+JVabWFYTUA3uVHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772105084; c=relaxed/simple;
	bh=RKgPd/GBwQeJeiT3QoM+S4hvtbVzz7BLxXaDu5sy87Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t5GBsO4HCnTRW1SU1F7t3ZHzhkqz6Lvguuxyi+ZU55UHgPOA25HIZSMhEm8pbwmZ6vfPD8cTOFyd8iO/ntXSjqXHJdwmuNeO0RkZ5wxQqPuFELl1NIGrGlF1aHE7iaEq9SgD4FHGumtMvPdzRi8HlGnYpou2AuKIljRPghGNpVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=CzE5ERLT; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4837907f535so6959975e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Feb 2026 03:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772105082; x=1772709882; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4ODkeaFlJZUdLMuXw3JdwZWoJ6IvTuZ9KgizpGtwPzs=;
        b=CzE5ERLTMmEc6DftoP6LbcsblldbUt6uAQfCSOyEY+CfE6QBFkkXjMJnfdREc75ejv
         a8q+v+qPqXEEmkL/EP9pQyn551e5UPaFeswNW9Z3hGa7L7iJuHYjJrkxoPFcxuyJOSEI
         PEs8lBQqc8p7390JmWBNh9djNhyMFLn7N2w+QyO1B69x8uVby1e5Ez0H54rsnA+Bw4hU
         H12On//9q6aav4OmsP5YH3d9GwCzfc2B3fEFQnrPx/slUqeRHFMaDGB4y2jGBeHF4dyi
         TSoPHevGPtdDm0pRp7D7y+lZs7lc4jmYJlhu3HQ6yC+gfsHqQaobvmRlQQkfOZVQLnS8
         iltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772105082; x=1772709882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ODkeaFlJZUdLMuXw3JdwZWoJ6IvTuZ9KgizpGtwPzs=;
        b=rpluCB7O7k/YMJe2rKLpx19ko6/i6GX2oWWjpWlL2hrWbE/sv0DUaIhH+wCbwQm6OV
         qvMiZfoL5Lxrxi5F6Rr1wQqW1mKQPNGGOmKhMuauAceSk4wpZTX4v0iw08Nz4GJceJZP
         HW4qBv40dPyKU3jIIODnras1xCWdJ6Exa64syAS8MBrZw8wwRmE9cp7Tp2QbyCpW9t/O
         bGKLdjoLb3iKu/F55YBrhyaTaS4eFL6fZVy5cj2oHUMCPxrklMy+vlEYmESlCIJrxYs3
         W8g1yzN2P5x7sz42MEm4WrK6l8tfnI4KQ7/WbQ0T+3edYPxXfZdXf/lCwDEDiZ3mGB65
         PRLg==
X-Forwarded-Encrypted: i=1; AJvYcCXOXDF3FkaLeH61X20rWd1nDHn+s6MQ2ljcXi1tl4tWl7VSea4824hyl5sMndTgE9xSpCwqqmR9ZwRblTI0OkK+EA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoeVtHAc9jQrj6B5TpC8WKvSV3l3T6S1cJsEKIHLzVyNoZw4I3
	LRp2oollUUtoyzJLkiZCVA6kI90dm/OCmFg3iMZHzJd/+LIQh7kkpSGPyYPPxOAVWYE=
X-Gm-Gg: ATEYQzyBJaM1Ez4dTg4PzIsQ1ELVy9FU+KXIf0T3mceFmyzDQ/upGK3YFecZ79GS8XA
	VXscvXInec7vnBEMfwLBjtY1+iRiQjh1NGtwe59A/GfnN/0TRBCBWEzhwApdA919ogV4rZrZCqV
	QRZzgUk0EsD0FYuriIPvGEHIu04RcjteqjQ9ExY0JECunGfhv8YGqi5AudZn/7heYwcCh+Cl4zm
	p1Lgx7GbxcOdSHiCd6vYqW6xnt+OH7e70M0CCmHnZR+m64yDwK2jC87J46QhVoPVvRqQqnmg2Vs
	dfp53UWrzKkk//6xNBER6zvk80MyuVT40mAH+uFZahUUpMk7J1iBINzqkWfeUEk0qEDXWQ+tn5R
	8c3TeAmpct5WbSvxEAfd5fbN1CkwhAnrf4MNkZVWHNk+EUn5TDRT4zcGXkJT8LsCSzIpBvjDv5S
	Z+wxSCLCVWJ69N8mITG7YBlBblO5tiSQ==
X-Received: by 2002:a05:600c:34c3:b0:47a:814c:eea1 with SMTP id 5b1f17b1804b1-483c21bd28emr68934685e9.35.1772105081629;
        Thu, 26 Feb 2026 03:24:41 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb29715sm87738265e9.0.2026.02.26.03.24.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 03:24:41 -0800 (PST)
Message-ID: <c6230f66-3d0e-4cdd-b870-cbcdb93037fa@tuxon.dev>
Date: Thu, 26 Feb 2026 13:24:39 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/16] PCI: rzg3s-host: Add PCIe Gen3 (8.0 GT/s) link
 speed support
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260219223542.6364-1-john.madieu.xa@bp.renesas.com>
 <20260219223542.6364-13-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260219223542.6364-13-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-28480-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B97101A5009
X-Rspamd-Action: no action

Hi, John,

On 2/20/26 00:35, John Madieu wrote:
> Extend the link speed configuration to support Gen3 (8.0 GT/s) in addition
> to Gen2 (5.0 GT/s). This is required for RZ/G3E PCIe host support, which is
> Gen3 capable.
> 
> Instead of relying on DT max-link-speed for configuration, read the hardware

checkpatch warning on this line:

WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10:
Instead of relying on DT max-link-speed for configuration, read the hardware

Could you please adjust it?

Thank you,
Claudiu

