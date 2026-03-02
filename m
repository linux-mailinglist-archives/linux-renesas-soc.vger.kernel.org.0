Return-Path: <linux-renesas-soc+bounces-28646-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHunKVq8pWnNFQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28646-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 17:35:38 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D47C1DCF76
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 17:35:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 56B7D3058EE8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2026 16:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D345C41C2FF;
	Mon,  2 Mar 2026 16:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kNr4l72T"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A48441C0CA
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Mar 2026 16:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772468947; cv=none; b=dTLPKFG2Qs/NRChrdPhfpVLJp80dzfCBH+OZRLxM1XGFthK7we0+6j5+Ti/bHv8TbMUgFi0U8tdIyglTNVOQkD/YooJQ+KiT2ufn+YyxfCbYWQbJWrJrlffR1GT7EB+TpmwE8iWK03W/prQvoI+Bomf/C5h3xB8Oe/N4wC6cR60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772468947; c=relaxed/simple;
	bh=6zebDHH0MXAjRuBUob2liKRQwdfSBVsejIj+VytuWVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QtXySyMg3H3twMNUko5Ncej2rZfd1728gbPtWnZT5SQYkH7vXihIJApc4SffbNuyqSiHQ/S8aP7kASswRQvXw0Im3jvhHzO+A6xvFtrHzqJixQ7Z9ghLH/Ol+acXkey6+dq8Dm7xfcqwC25fJeN52be44xxKdcbTuIQ/Zz6cTVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kNr4l72T; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4834826e5a0so53667895e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Mar 2026 08:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772468944; x=1773073744; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZzuO+V2q2Kb9c67E3GUSaMIdKWjmbJeyWojduVxXxN8=;
        b=kNr4l72TlIzHpDTnHn2g5qcBw2isibg03krsRvb5hCGWMeGiPPr7JAEPqR+UGwuKqX
         5X+MXLkO62iX+qWmLYu7IDNTH/EcwaoEABIltKNNAYntkURcpel1f8paqb7Gpu1+hmN8
         X5X80c9yN8urvS0V2Ms2Ptkl6JfJIiJTtD41mR3z2dYw3eExlJ+Wtwm1IfI4Jw71ll3D
         poPU2z6LAfFTqWa6zYQcyBqVci/9qrO5sCKORYcoAgIPEgt5aCrqKXAeyZj8OVFzkPPZ
         hgJQe+C4ZVJTGequltszX7+MFU2+ZFUpM9gJRQ+RyBNFbMhuE5VwMyOAGR70SNZOFrHY
         1p1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772468944; x=1773073744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZzuO+V2q2Kb9c67E3GUSaMIdKWjmbJeyWojduVxXxN8=;
        b=dbRKi1Cqa6+HAsT11YnsIBw4SA11i5ytjGLtjd3yC/QonF2kgD0RCT/8YDP6s/zKHl
         li/FP+lEYjJ3Po50LKxkbkuXAWprr1olBM28OEHOf+vMecHmMi0kFMzp58lZapruLi+G
         Dc0PYT1crk/5BiCIO3029/xTUmxGWusj7s0BEkvDZM0W+Rp0OQV+cM+eOb0IxNVRDilb
         L34+XXwv+YcNS/x+osNdEOerULX7na9ZoPf6XmLqenpz8dSiPnHmzp41Zi8d3CT2B/0k
         odv/p7wxkyVkGCrq8l1JMFJl0Hjx++mRw/Meq7+LsqIMKE0zBFJGFdBpHGwd4KVW8Glz
         Tnkg==
X-Forwarded-Encrypted: i=1; AJvYcCVhagzAKbZ5OpSXDcq9wbn+rzFb6OrQfLPtJ+bJrGWOZSK4e1vegI1JBLFNTIIJxJeAaBP9SqcQB67ngX10y4a4QQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzdYnVRV1E/FoVsKzpo5gQ1TNdbNjxIA2Cjr7Ycfuk2nDIkAyM
	bKLuj60k7wYcHylpxhTQek9W9PPkj7ZSxzVUbbnbEeohp0YSP4Aj0XCXyNwrtG1ZQxI=
X-Gm-Gg: ATEYQzzr6VoTGapjfkbCzZgbAn4i6X4FI1hUspE5Tw/DscDfMV7mA0wCEgd6olZs1PQ
	DcDc+LG7e75+Wc3ys6WJL7ys1nZFRZeelaa4LnmmYwAdkRQXW73zgRchw1FjfY10EF0dgq22Pjl
	E0h0vtSZ+37o80KeJMVZocjKrFUUNvtvaZhMM1vCEfkS5Ac+boq7hvKViiJBZc1FPPhJIG3FH/c
	Owv4O7wef0zwEqQu1Uw3MrjhwMtTZ68OGzmGZ1SlyferKM8xTjCf0CDiDvEw0LsR2IeUUZUqETM
	XzRC+KXG+H7YS0CleJngQCv3Y1XdsfhafjHyNM/kAbI4XJ2YY7mc9WQ295X0IU0YPx92jQ+76dw
	hzA+dOYtsa6f1zO6PVpJ5fpuV1+BqaQVyatdGuN+sZmUaGwNdU8yrVmeWo+NscRygmVGkcy3aOW
	41hh0Kp83Szczs/dzEZlVwBqRoB6A92Ij3PImo
X-Received: by 2002:a05:600c:1d06:b0:476:4efc:8ed4 with SMTP id 5b1f17b1804b1-483c9bb1e14mr220375005e9.11.1772468944495;
        Mon, 02 Mar 2026 08:29:04 -0800 (PST)
Received: from [172.19.170.194] ([213.233.104.147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c35910f1sm248099125e9.2.2026.03.02.08.29.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 08:29:03 -0800 (PST)
Message-ID: <fccb529c-28c9-4393-bd35-921384f4307a@tuxon.dev>
Date: Mon, 2 Mar 2026 18:29:01 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/15] PCI: rzg3s-host: Make SYSC register offsets
 SoC-specific
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260227153236.55988-1-john.madieu.xa@bp.renesas.com>
 <20260227153236.55988-8-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260227153236.55988-8-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 2D47C1DCF76
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28646-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action



On 2/27/26 17:32, John Madieu wrote:
> In preparation for adding RZ/G3E support, move the RST_RSM_B register
> offset and mask into a SoC-specific data structure. Compared with RZ/G3S,
> the RZ/G3E SYSC controls different functionalities for the PCIe controller.
> 
> Make SYSC operations conditional on the presence of register offset
> information, allowing the driver to handle SoCs that don't use the
> RST_RSM_B signal.
> 
> Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

As I didn't give my Rb on v6, but only mentioned LGTM, I'll give it here, for 
the record:

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thank you,
Claudiu

