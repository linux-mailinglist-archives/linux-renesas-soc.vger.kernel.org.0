Return-Path: <linux-renesas-soc+bounces-30048-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOmnCF5kvml3OQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30048-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Mar 2026 10:26:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FD82E462E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Mar 2026 10:26:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D127302DE07
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Mar 2026 09:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB5035A389;
	Sat, 21 Mar 2026 09:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WX8GM81p"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC5733A9DB
	for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Mar 2026 09:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774085209; cv=none; b=DjWpgp2RaAwkEqm+rnIed7t+rZ1Hb63oksnSygdKt29HHFp4k8m2ucy4XC97TTYmbqFR7QXw1LqssykQJFiR/rus8p3rNB/OOmjmdLRzyGgui0+DhdutQq60SYgW+K6jHCjTjEcw0/iP9Xn6b2g6so9SLEZpDfHU3LiDrQj2Xrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774085209; c=relaxed/simple;
	bh=IjV7qX4ccBsM3ChH43NfqmDcSs7MVK3lpBXhpayjVcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lKv2HgRCI38J4ti62mA8ZJeItVeSKV0gbNbdYS0npHuOqM3kI9f83p9zxHrvZvpvOR58uQ5/n3Y0wcxPDEnIORO0/YgOEtTEhF84c4xulCfrg7fJ7hoiiA/fyAZ/WSBxminMpT37v2tajXoyOtCknspYbE0TukANCc9CzM/pEyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WX8GM81p; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439bcec8613so873065f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Mar 2026 02:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774085206; x=1774690006; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X1TOoLUJxkp4sw93jZx3T1maGYjZf7Y/+WTbiMaYD0Y=;
        b=WX8GM81pqnm1/vOOhhVSRVnFCt1QXRQG90HrCwBVop0DAOnTO5Pis1bOsrx6leen6L
         2yQLb3S/38lhMs6BEvu/JzOIo2JFEUbT5/SWAy3GUyfPOnP7kBdXAv2mrYgeLrdGOR/s
         WFkpOCEKV/WPeiwRz79kCSZ83Uxs0dkK9uo6L1PDIBircMn5ZKgcrj5r8heePlxl+0oV
         pH+eYD855+2Fj+tKJd1ZKlb6+s+UjwFEVXO/iLqKgjhauIB9jwCMRSB/vPt/8hY2lWqC
         t164ew4YQFM2QgJC79Oxt7BwY/iDRQXkNzvpEI0KqU3eBxI+8OwtzzRTT7AYbWMyL1fp
         JRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774085206; x=1774690006;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1TOoLUJxkp4sw93jZx3T1maGYjZf7Y/+WTbiMaYD0Y=;
        b=FkChLbOL4q9MlgFWQVDFg89r/KxWkzuPfPBCn/q6hLRhM5RzGSZYSMZIReny9ftz94
         0EN5EVak9dmyGfynOBD0Dn1YhMRoPKQpOqlu7VlE9POpqooVsFhyht2XtQHpiQGl2BdQ
         Y0jHeiubferX3pqZIDlEIlkMkYG1KGW01JjqV5k3EJyh2kyT7r3Y7B8LbmMBjB6w/zkq
         SumTJCiuDeRGPtpvk7FRamGjj+ljVeY/WjiK7wzp2Ioo657KI2+AUPHE0Fz8K5VAQYNZ
         zgVQ/jVBfvkN2v86qBgf/zJ8/Qw27sA+ixSU7aHuZoChkarW/d/arZC1dhMoew+EjBT/
         s6Gg==
X-Forwarded-Encrypted: i=1; AJvYcCWAaxB9+blMSHL99/lBppHRggRMfcWxDmsHPqmy6k0ez10I9AcI+mM7tI3SOIkUoooUnRMv0l853ZyoM7Ysys2aGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWENzuk293wvM6JhnN8wC3mmWXG/D5rNfCXIIwYeawEl+7F4+l
	hKU+Abf6NpMIIAilCbWV1FH1Hwu1MG40hhfs+Syjgv9HTeY08/+jJoSoyoj5/KyfeVw=
X-Gm-Gg: ATEYQzzvysxlH1reJr5ROpuXZhEQ7q0Zik+evUXhwuP7+Txdc0qrRvvgNv6O71nID9o
	zjNyR6UIxllzpghQiE283fJvnAXgg1c0chwfTFAqNe9Y/oEHsasPNquOY8+ByFuUoYH/t1Fdvvi
	AiSQIWFKu9dtKJZL1Bt4Y8ozUfgrX1WwK1SisPMssY/gSAJM3CGxdAHGPUvqjr/rhcezKvlkojt
	8ce8rUGtYwXFfrexaJkFfO10Zp9X1wRmWrAlQgK0LVFIwRDFnzmepbkJydnwW5dLcNY1DPxDdEQ
	mAV0hrQiCpHdo+2aecVQBD74Pa5+TG7ZHNq4efbuau8mhJvvLJJ1puOPMc2d5rOtvjmkZjKwB9I
	Ft+0Nb1vRy2tIso2UEc863imlsBnrhkHWJJ0RfbofXc5XmdceUJHuIAXvnrAv0FRExOlI2Nq5jb
	Djfihzri7q6mUiY05NdDdbAsG3nxdNm1kImclG2OsX7azN3yx2kLqAv4xTkwOSEUg8eZzldhXIP
	CQnYubn0r9CBqEdyIf560aBjtwN
X-Received: by 2002:a05:6000:24c5:b0:439:cb10:dfcd with SMTP id ffacd0b85a97d-43b64286f98mr10247525f8f.39.1774085206053;
        Sat, 21 Mar 2026 02:26:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:81c2:60b3:ff00:9a5e? ([2a01:e0a:106d:1080:81c2:60b3:ff00:9a5e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470393fsm13896329f8f.17.2026.03.21.02.26.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 02:26:45 -0700 (PDT)
Message-ID: <6c3829c4-3e1e-41ee-b969-820948d10611@linaro.org>
Date: Sat, 21 Mar 2026 10:26:42 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: usb: document the Renesas
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
To: Marek Vasut <marek.vasut@mailbox.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
References: <20260319-topic-sm8650-ayaneo-pocket-s2-upd-bindings-v1-1-84e4ef564022@linaro.org>
 <CAMuHMdUACGC4rdXfvO-N-cgNAEzhczB0VYbMoxZMyazSAp6jWg@mail.gmail.com>
 <c8d878e2-8ce8-4526-9dbc-96e4f42be4cf@mailbox.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-GB
In-Reply-To: <c8d878e2-8ce8-4526-9dbc-96e4f42be4cf@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com,vger.kernel.org,mailbox.org];
	TAGGED_FROM(0.00)[bounces-30048-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:email]
X-Rspamd-Queue-Id: 85FD82E462E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Le 21/03/2026 à 02:36, Marek Vasut a écrit :
> On 3/19/26 10:22 AM, Geert Uytterhoeven wrote:
>> CC Marek (for Sparrow Hawk)
> 
> The upstream supplies to which the USB controller on SH would attach are not described in SH DT yet, and they are always on, so I don't think we need to describe the controller in SH DT yet, do we ?

Indeed, not necessarily, describing it would be required for power control and eventually to describe usb hubs as subnodes if they also need reset and power control.

Neil

> 
>> On Thu, 19 Mar 2026 at 09:49, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>> Document the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller,
>>> which connects over PCIe and requires specific power supplies to
>>> start up.
>>>
>>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>


