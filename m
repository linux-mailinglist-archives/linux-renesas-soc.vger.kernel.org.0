Return-Path: <linux-renesas-soc+bounces-27879-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKM6BaU8g2ngjwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27879-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 13:33:41 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A0EE5D82
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 13:33:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 22AF330055E6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 12:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88FD13F0773;
	Wed,  4 Feb 2026 12:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="iIftq1uv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FEB3F076C
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Feb 2026 12:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770208403; cv=none; b=BZu8Etyi9MGryWCorxp1Pc5wsKQW2cLwE19DA/7Z03jp944PXYsrNCYnmQctdJSuml2xa7BGC7akxlIpRkovg/49SDEGF7kGYAhvW9EbrpjqzU4gartf81bt0I/RUcmxlrlZMfKb1mp6NrE/NExOdPuXitCi0NgH3Ft7cnEi3Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770208403; c=relaxed/simple;
	bh=3aWb2+Gb2KAFgpNX6m9YjkRl5sjzP1BcDCEHLkg+3Fw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J4+8JZRSh7XpC1/TR0FxOqGtKUZggzLTd+/YCOekkRlJ/MX7CaHz2ijgrbUwIqFD7n5nwUhxYOWtbbobNibNAKtyW5LSkhtUv/ekXLl/Ey44H5BijMSw+oUQdPoTH++OCdNzwxTNiakBjNdury4f9M4rRy6/Q++OlpwC0x0gTjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=iIftq1uv; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-480142406b3so50900545e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Feb 2026 04:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1770208401; x=1770813201; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZB5JaRsNpoCnZepyi0nCuJMBvHsl1mEmdY05cCIU6OM=;
        b=iIftq1uvpAdXK73jmzxj3HRsP2q7UOqb6UEdccllGlI1IdH9UFt6nwhk1XDm9NRJi5
         B9jw+gi21qzZMArOv+vabvbtt6zXqD46JWpLIWXPx414Unabhaq/cKsG9kSmcXQPP5d8
         Pb4QvDVJ6/lnc+uUhXqx/7lECcZsR4LsmboRyj8kPMh/3Z0dpwPxFyhCD6MSXoj5R2wD
         PWV28/PPR9wq2B8g8PYQFfw3yByuHspGe8M6t0GMqKn3RB54K1gcEKr2Ku7l/iyLpHg9
         thEPpl3pDb0XMNxi5Cq9pauS8ddEKBo8icCtrx1ckVTB5GfWj2lgWwG9DaK/lXvWvrTd
         rmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770208401; x=1770813201;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZB5JaRsNpoCnZepyi0nCuJMBvHsl1mEmdY05cCIU6OM=;
        b=tnVEyZNMoR+95sbBEdVlZxMQs1v/BphcyHlalV5K3vLAYnNcd2o1Vk4Z4nhgPmQigo
         r9D0uQ4UsrEYtodHEpGWUdKN/YugiECSE7JRZyw/GRx8xEnqt5PmF5BQiOLaAs+/jyFm
         lSb6PV+1ukkDhE9kPHrxHOLO9kxywip3K3gYuN3x+mxkc/cOjBOGpczyZUvKgysdadAs
         2Drsbs3P84Ns7ARN/ixDpDOD9GX28Of/PfkldxbALpbhrJbJo4O+ee3aorgxsRYnl6vV
         yMEx/52RzAfeMT7xFryIsEP+MhUGqmAtbYxWycNOIWQ6ghMB9EUFGWGCsp75gMol6B0a
         mMvA==
X-Forwarded-Encrypted: i=1; AJvYcCUMbR670sG7SNuwcQQHNDd/yrTTvGdL0ovq2tFNAkWIo6vqDBmKorIAXiOYpQGuAdGcL6pETCMJRTPIYO9qhmVpSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQu4vygZykGIe3ZGbZ+juQUYab2OidFB6MuUZEhIW7U3uhD5W6
	wJQy6R1pjbiAI1fl8xmlobbpdHuqVyDJnrNgARy2rfFkL46sqlr37zRXr6msJZbDZJw=
X-Gm-Gg: AZuq6aIlyEHglJECxmNc/5XxZ8P6Q/uK+pQIn7JhQZKiZ0ClhdonoXZdKxRbgqzkHuF
	/JZ9u2P0IfgQ/va0bUbltZpXxC2XjwZexrTGlHL0I0uoSD91jHlmE5V4cQNfqCIKm+eJbMQRQJq
	Dlp8X5hgwVQLm9MX5JxFgyLV9g6mY53HdbBxXt7fbtEjeoT8+kDa5MAYU1vImfLRY0XrrqlVzB3
	qsPKO52Hd3TBR4GEpcnvH305Jt/lDSeEA6jXuLDEAaFzVbe4v7KdDcmr3DYgfZDMQbJTqnmtQMO
	iIIc8qFVnTw4lvsWVVN709DYe0HI8Ug5BqjJrvdXBej/PdGxb5zw/imJHze+qNFS+8l6ALOhhqO
	LODvLUXEkA+4ktcoqWQrTjJi15IdJzYMll/FdH39v5CxO4if9Il1uzsTS61bbtBTNZSFz6HdLDo
	WwtF48QtrBMQdCMU2YvAs=
X-Received: by 2002:a05:600c:3496:b0:47e:e2b0:15b8 with SMTP id 5b1f17b1804b1-4830e93ebe2mr36434415e9.4.1770208400957;
        Wed, 04 Feb 2026 04:33:20 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830ec4a76esm30285155e9.1.2026.02.04.04.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 04:33:20 -0800 (PST)
Message-ID: <c1f4ad90-bcdf-4dc3-9eae-2a74df86bd3d@tuxon.dev>
Date: Wed, 4 Feb 2026 14:33:17 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: rzg3s-host: Fix device node reference leak in
 rzg3s_pcie_host_parse_port()
To: Felix Gu <ustc.gu@gmail.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260204-rzg3s-v1-1-142bc81c3312@gmail.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260204-rzg3s-v1-1-142bc81c3312@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27879-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	FREEMAIL_TO(0.00)[gmail.com,bp.renesas.com,kernel.org,google.com];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tuxon.dev:mid,tuxon.dev:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 33A0EE5D82
X-Rspamd-Action: no action



On 2/3/26 18:46, Felix Gu wrote:
> In rzg3s_pcie_host_parse_port(), of_get_next_child() returns a device
> node with an incremented reference count that must be released with
> of_node_put(). The current code fails to call of_node_put() which
> causes a reference leak.
> 
> Use the __free(device_node) attribute to ensure automatic cleanup when
> the variable goes out of scope.
> 
> Fixes: 7ef502fb35b2 ("PCI: Add Renesas RZ/G3S host controller driver")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>


Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

