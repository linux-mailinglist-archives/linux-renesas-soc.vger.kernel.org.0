Return-Path: <linux-renesas-soc+bounces-28303-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HeyIG6KlWnqSAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28303-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Feb 2026 10:46:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 210E2154D93
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Feb 2026 10:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C06D5300F12C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Feb 2026 09:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5FEE33D6CB;
	Wed, 18 Feb 2026 09:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="PVoZgEg/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E03318B99
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Feb 2026 09:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771407979; cv=none; b=VezAcA6RfqrxcAj9xDIM8gfvXF2g8av5hc/vyu96IaJU2czdK5gG6+8sGWoxW5+nT/cn/434Xn4PmNF9EK+YTdHqTBhWS2pKamEdx1M+CEroqDx1k2P9JGI9AkEZg249ekTHoxLuunmDCenoVaeNVES5nfCldSljQviaZy18xaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771407979; c=relaxed/simple;
	bh=gWDZ43Rjlx+lGDh9laRgaHGRgYZo7wIwLr/e4VG29SU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y28tqHmgntlTh6ON+ogb0aVaPjtBkvBQRnbm9tg9c4T2vJYDtaS/NIDflWlL9hOEl2pQKCrq2M3lmjLpS93rrAHAMqjgzTkmLLHAVTMJ27afP8elAKfLiKxLNm+FHGZvHXxi4uwm0EaClEvumEBPCxF2eKHOKJ8wV9bSynjr7Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=PVoZgEg/; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4807068eacbso39415945e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Feb 2026 01:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1771407977; x=1772012777; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KgMFw9CbkCbyZeqBEbdpmF8quD3DTGf1fp/leo9IH/Q=;
        b=PVoZgEg/rUYblUsoHk6Aws/0yOOW9cbbwHia2dDFGWTXHiElUQt7RtaD7vU5cHKRfZ
         qmtP8qZJIVANEQ6VXhqyX08CXoe8XKbKX37S7L+rgc/6P/oFTe2nGHCvDFJRKgIyXlm5
         QoIk2rZSZEX3Iq/nkadh2NOQpe+dlu7S+xPL2hri2S0ZUgklzQUt6b0U6xTPrtGH7zyM
         kxgmPOBCRAnWxYCUCDxawuYlyPKgQgekOgnzl2Fr7bHovs1iINCXweVrzKArTaogrDiY
         2VrOFIwBNRyrEFGmqNpC23mOUFTEkTNxU7SbAriLi8c0Vxa1BHSfNiZ6rT241Je8qctm
         +Kkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771407977; x=1772012777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KgMFw9CbkCbyZeqBEbdpmF8quD3DTGf1fp/leo9IH/Q=;
        b=OQx9UzjDvJ9CiAtdAv1jVUN1DGaZzuCq/5mEPD1AstGUSEC7vq+xncha8Kkiuq1a2e
         sEwm+UnzTCh9Iuba6g1sDhFog25XrBWs/kjiXBsG+oNEVHxaSvrTCi3bGcuXWa7j4u+6
         mLcThxFtWZMRCmCflwP48bWVlGwLwuLycmhlxqtGJoOg14m+Pwk5gOg0yoQZ4Tf1xohI
         c0HZCrnu3ulB2/VH5de4DUEBaq1tA1sq6iiMXvNJyd+PoVjCDKzkfiDSF4NoTW3J9+fP
         +IplmRGWBgXOFpKAN9PQSfJQ4qGTl2iswBpetuK4nDj0LjO/f76t3Ap5fm+itonLpeiY
         Ut+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzQouwkF0pcIjm4JgZojeed79YLpRai0zRj2cVgRqO2w6TesdIFIREt6SgRxJnUY15chor1IcpWeCRJUsqLEyFTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFFO/V2fEClNNzvKzJjI/cCGBu0wg9gKrg2LDw6gtRoPjCFy4w
	LrBKXok8v8DYPCfI3sBFT/K5zPRZpppIyVoKcNN0B/ugWZ1T+izjfAMkdkXPQC0Q6QU=
X-Gm-Gg: AZuq6aJkbBpgY60XFkB2EdZIXkzebdSfKPcR2b5SVOeZkbGIsLB5UZEJBLJfvqRnjqm
	OIwNWnHuYe3O+U9ZyYNcWYEUaPDkW40+SYVjozQhy2UPhXl+zG9wLm7pUKRAbhpqUVYfCr6TpYU
	UR+pldqNSAmTRFJ7JbZVm6ArusyHA03wPy4hCt4EjTVTGeRwULM/KK2PW8GwCRp0lAVpZVGS6HP
	oxI97dFWq6/IFw2miT/0t77QdggHN+kLKBlhY8WQtWBvdDBUp7cS+VgtzPyimYGIY5HUU/PkIjQ
	YnAawBIi9NpaIwsoF4U9xszNTRsW6JPYMYs2kAOAQGdbfRtgVKixDjSYF3z7mC6Pp4gAQQ0YfoQ
	tOQG4ExgfuqPMteptYVDHV8izW+ZwE2oJjU+Uttc3AUKCPNCTgnSBp8H4UMu0ijyxo/qkeNaeZw
	rN1Zjks2vaRehyQftU/XbhX5ZBfIcIIw==
X-Received: by 2002:a05:600c:3f14:b0:483:78e1:784 with SMTP id 5b1f17b1804b1-48398a433abmr22897275e9.4.1771407976815;
        Wed, 18 Feb 2026 01:46:16 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48398244e83sm27919345e9.2.2026.02.18.01.46.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 01:46:16 -0800 (PST)
Message-ID: <79a8a0d9-ea8d-4c07-bc02-95d145b831a3@tuxon.dev>
Date: Wed, 18 Feb 2026 11:46:15 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/16] PCI: rzg3s-host: Reorder reset assertion during
 suspend
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260210113041.138430-1-john.madieu.xa@bp.renesas.com>
 <20260210113041.138430-10-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260210113041.138430-10-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28303-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tuxon.dev:mid,tuxon.dev:dkim]
X-Rspamd-Queue-Id: 210E2154D93
X-Rspamd-Action: no action

Hi, John,

On 2/10/26 13:30, John Madieu wrote:
> Reorder the reset assertion sequence during suspend from
> power_resets -> cfg_resets to cfg_resets -> power_resets.
> This change ensures the suspend sequence follows the reverse order
> of the probe/init sequence, where power_resets are deasserted first
> followed by cfg_resets.
> 
> Additionally, this ordering is required for RZ/G3E support where
> cfg resets are controlled through PCIe AXI registers (offset 0x310h).
> According to the RZ/G3E hardware manual (Rev.1.15, section 6.6.6.1.1
> "Changing the Initial Values of the Registers"), AXI register access
> requires ARESETn to be de-asserted and the clock to be supplied.
> Since ARESETn is part of power_resets, cfg_resets must be asserted
> before power_resets, otherwise the AXI registers become inaccessible.
> 
> For RZ/G3S, both reset types are CPG-controlled, so the order change
> has no functional impact.

Even though we currently see no functional issues with this I still think this 
deserves a fixes tag as we need to follow reverse order of operation in suspend 
compared with probe. And the patch would have to be moved before any feature, 
preparation patches, to be backportable.

The rest LGTM.

Thank you,
Claudiu

