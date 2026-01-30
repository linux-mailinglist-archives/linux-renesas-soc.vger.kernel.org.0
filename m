Return-Path: <linux-renesas-soc+bounces-27681-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DkwNe23fGm7OQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27681-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 14:53:49 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F10ABB5FD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 14:53:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 087D83011117
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 13:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8FCF30F957;
	Fri, 30 Jan 2026 13:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ebWxdQAx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3631630BBB7
	for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 13:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769781208; cv=none; b=ZxMd7at0VCj7a5hOiJNg8HJTlAiJHSLZewy//dErxjP5V0O/3k/IV3uytiGDe7tYpm9YCgw3zzh5/hfM9Q2VHMae2+AfDOGdoIrhaPOReoY9maTo0sunAxGFXcorjlC+WLhtBGvoX4s3R8X1ooSamzpSlO4bOC/+9cLHTsbToB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769781208; c=relaxed/simple;
	bh=zXXCIiWd1aTcZ02PDg2t9frtKz0qB1Gapb4nnXth2zQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T4IEHe58fBPT4sbh+Te8VC8wKKNx+5uyxi1tWlkg3qvhTz3ikzVdi8Rm0RWyFpExBS7p5TJcUvTU1rpLTIhD6TLCym954xJRkXNwdp7XVKG25wd0HHDjGoXIHQIFlJdFGCWGd+XnrG9Nv+xE9P+AL6L7QEi4fUDURUEz4WRwmhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ebWxdQAx; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4806bf03573so11772715e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 05:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769781205; x=1770386005; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4o04psgLUgXFpASZX7kNJzQcWYqB5cygy+rbJIoQuwI=;
        b=ebWxdQAxmXB1uKGQ+VwDCzICNWBdd2wVb+i7lLKS5ozbaz9SW4TzE9B37zhS9yrpsj
         YzJ9UsQGtwWOYP1oTc5+h+27gxpkvYxee/2o14kjpraR44v4PV3WMIG0U7hfNg833jcS
         w+h6BGb3Eo3d2uZj05tM9wIhFPQkmgGWu/0qACZiI4kgSqbyz+JJTqhefNiZH3fDNipx
         g6veTx+wH2w+hX+K+6tyDEooi1SbSPleCTAHCCMMDRdybXkwzm7ReT0MB//WN1knEqVt
         OWmLMIixxCD/YdnEpWloZ8MNSxJgNVVUgkEIIrR9KcExcZJwU8ugk4ZDddY/l6vc/Fm5
         hRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769781205; x=1770386005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4o04psgLUgXFpASZX7kNJzQcWYqB5cygy+rbJIoQuwI=;
        b=KfbXfR9MvX2hUBtnS1xITGSzTlnt62D7ur0Rr6B/E2l5UVnU1TX/qWjrzhV3QO2B6z
         pNQlwNVklPKcIJ8vM+No7987KUvqBSprILbw1eriPGvLVJ2cFC52IaIoQROTmtfok8h3
         EfC1cgA3Dziy7uHGOsdFIHzCxPMoojWGkd1J70bWGUQJHmSeRw9OOCaVAvMvnnl+DQmw
         QoJ4cxjdUwx4S99+WWPAJI71hFEZhz3W/P9GoImAos4LncSSZ65X8kDmoxK8HW6L1HiO
         1HJN0JISj15nL4CQ5oehwuZp55MrajGOqqDyfFeZ87UEtfDhipkL4jwmCqTaKIO/0NZD
         NpuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiQ6N9Hrp3aW9b4KC+FdsaecxGV2wqQ2RvvorhgJoOy1XopXCslDpEUKed5HbuOOBVbyiNJa4CGHF9XHVSqsMAQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyljRCW9FUuDRwMJhkf6ZE4ah20rmhU12pqfIc6IGe1OSv66yqG
	agK28Pi5sXzFsRPzmOJQmJGrGepTpADVtAwPaVhG9m3Sr/sramOnZpXhQjWkkdZPQONH79DMOJq
	TDDRT
X-Gm-Gg: AZuq6aLYQ1ffeDg5waLJkPruZ+wpcVdNchrq9I+9vxIKTDech7emrU2MX0Q1MTkc3s2
	VPR21rDU58Evtaer6vIVz6+SXMMdIz8VxQVr0c3DUC8paztu2fZZVwmtDlWdfQJ+zgEFjcBoJt9
	k7ZbA4kW7Y90sxmLoWaLPiVdZIolY1HyUSNUE5HMECfsQQ5lNiX3yMbv4dSChSFJFSWvZlYbiCq
	kE3DyZWBy7axVUoN3lxeUeBlEahynCzAZ7ZF+0Xw5eTQwey6yj3B6dwZgRBbsjhHW+ZT4Ywy8i9
	axNuUEac+6W7UYt3dK698OMaF3Fx90uVmUEljHxf3PJhIoNkHm6zejgH5i58HS084TqdQcreYVo
	yi3Xwv/3bJKB1t2WVkUzPWnkEPpVFFGjvkoR3elBPDlU+0QCtXVxyL3EBPM7+6d96N7A4/B9fRd
	LSJNcYoo7D1VO2H6q6EQ==
X-Received: by 2002:a05:600c:3586:b0:477:582e:7a81 with SMTP id 5b1f17b1804b1-482db45237cmr39757035e9.4.1769781205391;
        Fri, 30 Jan 2026 05:53:25 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066beeaf9sm281652035e9.6.2026.01.30.05.53.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 05:53:24 -0800 (PST)
Message-ID: <377dfea9-83fd-4e76-b469-c2336118f964@tuxon.dev>
Date: Fri, 30 Jan 2026 15:53:22 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/15] PCI: rzg3s-host: Make SYSC register offsets
 SoC-specific
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260129214130.16067-1-john.madieu.xa@bp.renesas.com>
 <20260129214130.16067-8-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260129214130.16067-8-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-27681-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tuxon.dev:mid,tuxon.dev:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7F10ABB5FD
X-Rspamd-Action: no action



On 1/29/26 23:41, John Madieu wrote:
> In preparation for adding RZ/G3E support, move the RST_RSM_B register
> offset and mask into a SoC-specific data structure. Compared with RZ/G3S,
> the RZ/G3E SYSC controls different functionalities for the PCIe controller.
> 
> Make SYSC operations conditional on the presence of register offset
> information, allowing the driver to handle SoCs that don't use the
> RST_RSM_B signal.
> 
> Signed-off-by: John Madieu<john.madieu.xa@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>


