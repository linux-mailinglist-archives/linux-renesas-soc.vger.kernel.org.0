Return-Path: <linux-renesas-soc+bounces-28481-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPyHLpQtoGm0fwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28481-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 12:25:08 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2694B1A5026
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 12:25:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C75430745C2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 11:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43FCF33A038;
	Thu, 26 Feb 2026 11:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="n/p1+SYd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17C736657E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Feb 2026 11:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772105104; cv=none; b=BeFd2LwCrtTZLFAMKVTJv/ijEeEr/iV4sJF6vGkk0zZz1Lg8QbcYBNg14KFQYV8rNyDYOPL3/tLI+LH33ANyzmIJB6c+4EH9LC34HxkPtGDpAJCCbMlUVvOND6N8gdCOunzBwVOt+6nzBmGzTOlhaeqHJH4Cpv/pdJiLeCvF4Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772105104; c=relaxed/simple;
	bh=qoAG85cQLkPyPVkb7i8S/gUbpDBrputYuNRJ4SQGpNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CR+SoE6a23jq9vvhPjtYFj7wtE7r9NrqpNPQKe893n7WW3ysjdJjKNpvFBq1iKk8WdNU1eQ6o6jnBhF8bwkhfvETuaeo10Fmol5AtfOkm8Zfwoyj+lo3drN/pB9Cr0Kl1onOIDxY9xonqkn21uCCQ77x0MSN/pNRBgreYe4D3SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=n/p1+SYd; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48371bb515eso10084725e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Feb 2026 03:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772105101; x=1772709901; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qoAG85cQLkPyPVkb7i8S/gUbpDBrputYuNRJ4SQGpNg=;
        b=n/p1+SYdFrt6YgNGhj3aaQx5Cq3pxOpub5ZM3RDpqsV7UsGO0y1u2UWb+Vv4MK4Rs0
         q+f1Do0MU0XkZYJWYL5R4b1l3Sw7d2X1yF1Oi8CVjQl0Tvs1jk/kVZ3+TiIUAQgYO429
         Sadbb+U0Pt40ORsmyJMsVzwH2Vfp++5qrqk7MHSml2TLkw2vLcc6OyBLrFVtlBUKNSc9
         KpFMqlqcXGNpGDdfAVAPe1lcCn51Rdu4doc6zVFyEIh2Ctbp+hMhUXL+cdDUX1A4PeJr
         Ye/uMlA3F/P7n1VKXKgbNG3CWfOns1M30BMnmhmYC+MdDkPlRz7PGVLxCs56eT3Naxei
         ODgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772105101; x=1772709901;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoAG85cQLkPyPVkb7i8S/gUbpDBrputYuNRJ4SQGpNg=;
        b=e8HBYZ1OzvjLMiAxGUKgY/HTVZpaPOIrpAwH5A1BhhOpTLUtugEv3PJGkpI4+QUQof
         y5bOqDHdBvtah7ZU97+nUpY5/j/ou475aqd52shGTCcWu7InPvwldKT/sEH6VWnJp5DN
         VeFEOdH8v/AT4Ns9IwxhXIf1oSC3p8284Wud/ZRnoJ+Bto/4zhbbw2m6150XLddC5Gqf
         UzBb7DzXuFyfHl85//ZSh5iN9RXgLewoncWPQzwu8E+sICMjEgEiBXI9C1H3SDYbkZhV
         JXBk145dKO6x/5b/e4AXXyFCmd+mWPRKVmfz62ENWtVuhj9I+WEaNzigYzjWZLYjnWMZ
         nrgg==
X-Forwarded-Encrypted: i=1; AJvYcCW3XvHhaNrXiG98eohTo+2fbhMlzfNAzvSNRJGjAFkp685ptBDPkV/cQSEdPemuUWVmcB5+3p/FdJ+2j6Tl3tW8Vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwELVeKCc3dYkyHPh+x0TCkqtfKII9BKcTIFqio1znsIm1XqvnE
	A0lydTqNO7/z53QU2QQEgNU2kp2+6TZwMFt4+Azci309HfqBM8kArgNVoFDS44hqbIw=
X-Gm-Gg: ATEYQzz+XduuLaggFatdyZRzNuYU0KCtxtylkmAC34y1SryNvfZlNK/CVC4+EdZ6GB+
	cGF0i9FXz64OsWOIfUo20mxleacKMBLdRpDKHPzM3Dl0cKZK7rtEWtOOoxnnYUrft2Bug9eIphJ
	SOEOHCJ5sW8FNoL55nGMCWn/WUsSLEEWE2P2e/8BI5Fk+laJVAPQNTgk8+2bvKr+kCE7yeVedsm
	i925oDEJxyMmWpekd3ZPWLdrbKlAl4SHqibN6Yg48rF1GssSRIsnVaecTaMCgL8yyhHb+PCO3YT
	ojh54DwoTbXPLVetowTJt1+cH8082ppKiA91GU5ObSGfYXWtA7VFyXPTjD3JbJkZeZLj2V6kPjI
	mTJGszIZ36ciZk8/24cVIG0s+ty2bh1ppLDw7uXgRn3O9+/gqCUynZAGIwFR82ZEUGxalL/+ftX
	9t8HUxda2oPPaWIapmZJ+V70FLKSN27Q==
X-Received: by 2002:a05:600c:5020:b0:483:b01c:9508 with SMTP id 5b1f17b1804b1-483c3da0abdmr31292235e9.2.1772105101244;
        Thu, 26 Feb 2026 03:25:01 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfbb465bsm82044185e9.3.2026.02.26.03.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 03:25:00 -0800 (PST)
Message-ID: <a30132d9-6966-4ac2-82af-b1a20a2b1a12@tuxon.dev>
Date: Thu, 26 Feb 2026 13:24:59 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/16] PCI: rzg3s-host: Make configuration reset lines
 optional
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260219223542.6364-1-john.madieu.xa@bp.renesas.com>
 <20260219223542.6364-10-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260219223542.6364-10-john.madieu.xa@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-28481-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 2694B1A5026
X-Rspamd-Action: no action

Hi, John,

On 2/20/26 00:35, John Madieu wrote:
> Some SoC variants such as RZ/G3E handle configuration reset control
> through PCIe AXI registers instead of dedicated reset lines. Make cfg_resets

There is checkpatch warning on this line as follows:

WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7:
through PCIe AXI registers instead of dedicated reset lines. Make cfg_resets

Could you please check?

Thank you,
Claudiu

