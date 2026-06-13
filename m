Return-Path: <linux-renesas-soc+bounces-33969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z6+lMc0RLWrhagQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Jun 2026 10:16:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B7767E1A3
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Jun 2026 10:16:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=T2+02RrX;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACD3530413A5
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Jun 2026 08:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 458D129AAEA;
	Sat, 13 Jun 2026 08:16:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1C414AD20
	for <linux-renesas-soc@vger.kernel.org>; Sat, 13 Jun 2026 08:16:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781338571; cv=none; b=l2Eb9jKrBWyC3MEYmljRroTlLMbszk0f22JwAR4xt4YmXFeAUmfoR/0/gNtnKNTEH++p4Z0iCc5Z0j2SJnW6+Ok4gYD2Ze/GQRhUCy86p/5wXkkGDtTHJuxukn1+qE+mvEqKpvaMhVQ3ZxCQLDyQNvkGgGIUJYI1I+jpeh2XcZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781338571; c=relaxed/simple;
	bh=gxXIQs4fOYo7UxbFqDXGSyWElu5qYAeUnrJUD0vklmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hyvdqdz6ia9hIpZrjAx1Xy6/IEPQlbNh38bW3Qt7gO3IIefM5yxafFZsR0Simh54G4pbInsvGI1lEQy3LfojNoXP0QgkcABgqh3IEtf20FXBxDrmYj9Zy7FCpfscYn3DzdvDF4gXpFJgifsEW2ZrZidHV8u2IV6fh83nhqwwFPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T2+02RrX; arc=none smtp.client-ip=209.85.167.46
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aa68e66128so1736392e87.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 13 Jun 2026 01:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781338568; x=1781943368; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0iXLstte6ButgpYOzogymHuOexokA1uZth6v7/qqcCo=;
        b=T2+02RrXMtMJCfwDyutG9OtBlzhRtcAQ00UNE81YQm+J0vWjlCsAZ5fEmKaUrPHWpX
         w9Heg/Vl3x60KBWHMFhkMVareUkFw8OdZhhVsykUpbgjyz2WL0nxrKLziYhAiTHxLoUG
         wYaKf7p4+iOG6UXbjV8X+lpNkmFvNGEh+d9TiblbGWZ1cz7TMwZJCkAvXCNQbJja6g7x
         A+swLSGRoQPkPnf4TXaIO+Ajo4xCEI7KCgj3RHC660LeH3+WQjuLZ+UytDGOeITK6sHK
         0VPtn2dDCQ6/aGyyTw+9zBrCQ8UsAX68IoLHvSrJp3mdOC/hKPJ8yv4W7YBlCHiSU/WW
         P61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781338568; x=1781943368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0iXLstte6ButgpYOzogymHuOexokA1uZth6v7/qqcCo=;
        b=m1uVPmmg1kW66AvCZUYmlf7I06quTDtw5wUC2h98y4CtDSitzNzZBSI70SqIbG6mai
         lJFxcxpxBXJv47/Xgk+trNkaNfBQIbBuSxXoGDjEo8iLaC7+JwyT1hNeT5j8aLazbsXf
         SwdBcRbLTpwhDbL0wHfuFzHkPexhR2NeyV25+ejPk3iKQa5hs904O24YlXQX0aEh3eKT
         vTXbSas2ziS9wf7NDIYwMCb/vyPL1w+nfsPldVw/n7CJwTkDy8njusnGtRf2utFtqgkO
         qp++BGz2y1WmsHjGxRRPyYXNPbds5fkOA9I+hxyb6iE7rr2OxC+dJ9D0LvqYxLLvHvhP
         E20A==
X-Forwarded-Encrypted: i=1; AFNElJ+zW5oHr+7sjbs7/1d2pNARasaSQg5+XvGxUKWzq5B8H7k70kzxWoMMvMpswQkRwEwbiydN5L/0857MrMcJydkSGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUytnU/1f3wV1blZkro/ELKHxLhC31F6vcWEC0HkB+ul15H8wJ
	vNMqk5SpbSR491gu1ybD1097zJ5QA4oU97vgcEX5WWtJeWgU92qlngKF
X-Gm-Gg: Acq92OFMvIocDqFAYh+AuBX90gfVyWDqstvN1x7VSmVI46Wc51S8aRZgqjerhXydehy
	EQXOvDpLkrVxjPDOf8My8nu7LTngJUydCrsF39d2AynFQi5QeHMWOOfckGtrzSBgOtXhJ4y2AhK
	Ae9n8V/qt4zu5z+Q7HD2LWtjTed+5m+Kq2T551RK76aKLvKqFnRRW/iQ/o637RFX8gCoQhqN/9h
	A9G644LvWONgroZ5CnRIaAAvbDzysZ3oXz6hVAlkTQlfvrbCHjyGnA2gaJOos4hN19kNQ96VcIB
	rHFlKWvGPDku83VQYfczkeWZ2z9wZsm9LIm5baVTScM9LqPZNqibQiA3+Xflw7PzVTsXvwNqes0
	BgOvJms0X/7j0qzZ3jmeZJpEj0ZoEXNZkxyza61RsqlI+8o+q64/f1sUyO803pbWNXOrYvs16KZ
	lKqu0Tit/WWmBzJLqCByCFXQKgENazMJXffENsj8/ff4vzgN8BFOC6BZSEc+dyBivUHf4ezLe/y
	bgCTQ==
X-Received: by 2002:a05:6512:4608:b0:5aa:5a89:c80b with SMTP id 2adb3069b0e04-5ad30dc08a1mr583841e87.30.1781338567680;
        Sat, 13 Jun 2026 01:16:07 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:856:c6e8:742c:af09:78ba:8005? ([2a00:1fa0:856:c6e8:742c:af09:78ba:8005])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e16935esm1124202e87.25.2026.06.13.01.16.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2026 01:16:06 -0700 (PDT)
Message-ID: <39720384-28da-4157-8613-8f02ab890abf@gmail.com>
Date: Sat, 13 Jun 2026 11:16:04 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next 9/9] net: ethernet: ravb: Add gPTP support for Gen4
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
 <20260610102432.3538432-10-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260610102432.3538432-10-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33969-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 18B7767E1A3

On 6/10/26 1:24 PM, Niklas Söderlund wrote:

> While driver advertise gPTP support on Gen4 platforms it is in fact

   Advertises.

> completely broken. On R-Car Gen4 devices the RAVB module have no
> internal gPTP clock as generations before it. Instead it utilizes a
> system wide gPTP clock.
> 
> This change utilizes the refactoring of the RAVB gPTP code to add
> support for a system wide clock and stops the Gen4 devices trying to use

   System-wide?

> the non-existing internal gPTP clock.
> 
> To remain backward compatible the device tree property needed
> (renesas,gptp) to get hold of the system gPTP clock is optional. If the

   Can't parse this statement...

> property is not present, or not enabled, the RAVB driver will no longer
> advertise gPTP support to user-space.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Sergey Shtylyov <sergei.shtylyov@gmail.com>

[...]

> diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
> index caad95a9c3c5..acdfb56bb135 100644
> --- a/drivers/net/ethernet/renesas/ravb.h
> +++ b/drivers/net/ethernet/renesas/ravb.h
> @@ -249,6 +249,8 @@ enum APSR_BIT {
>  	APSR_RDM	= 0x00002000,
>  	APSR_TDM	= 0x00004000,
>  	APSR_MIISELECT	= 0x01000000,	/* R-Car V4M only */
> +	APSR_GPTPTIMER_SOURCE = BIT(25), /* Gen4 */
> +	APSR_GPTPCLOCK	= BIT(29),	/* Gen4 */

   Hum, the other *enum* entries don't use BIT()...

[...]

MBR, Sergey


