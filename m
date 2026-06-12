Return-Path: <linux-renesas-soc+bounces-33947-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4qr0KwFPLGqnPAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33947-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 20:25:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F3A67BA85
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 20:25:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=gThJk19K;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33947-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33947-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2739A344EAC9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 18:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D99139F168;
	Fri, 12 Jun 2026 18:12:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C6C37D113
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:12:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781287926; cv=none; b=J1fkk16wHQlqzZgl45EGgl52yquwzQRgNuQhAuj1yFDhRNJKnd6rtmanTVi3SXHgYWq2PQC3U5TjfjLiay4s+2OSwqszkJibRNI8KIX4kgJyfcPQcaG+UYakk0dqbgmMTfu+ibuPQo91lo8ay9zJ//AcM3T4ZadIIJJTxWoIpHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781287926; c=relaxed/simple;
	bh=7IIqb4D3Ufxwv9dIMnqYQZgG1a69XUSwUpjnCG9zdHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Gg5iqqiQw3AJreImr8PLGHHkB8MBRwkxi7Gz8AibwROcekEW3smxD/RV8KxDEeDkWrslr9FVdo+5Y232qUSOo8BXFaafUCIvbs9mnN0TN+Ii7cDgKES7VeznjD+85ujWxcgyw+UCUARs7LggEJDd/xANIq3jT1ItcItAprBcNg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gThJk19K; arc=none smtp.client-ip=209.85.167.46
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aa5f11deb2so1359739e87.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 11:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781287923; x=1781892723; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PURibjNrq6Q8aIzpLwTE6eJkvCDifdjL2ifGZ3jMX0w=;
        b=gThJk19Kb17EGhGR9pFRNpS/vr2tWnpNEAGYhrTMphG1H9Ayh51PwjRK8daI5M6dVF
         zVYovUmNZX8a7S+oH3zdBXsJ/420srsnL22LBxx3Xx5ZSVJP1gO4xfZV1HUyksqN0SUm
         Li5M0+ODd8yWRf1MwTtDXCrST/l3ClSvJ1LmOs7muuGUr0K+kFr/5VyxV0BwgVSOMG3o
         PWt5HRRJf/nYyHnUqiboiybyaqVRtTkQjk2aHSAoOJ48pdM9FjY1anz1OHrI0l8esoDt
         t6HEyqejb2AJ2ERW67QU0j0Yv/ZN8T1vb035vtBEv4oJATWc7QB8FP9cPeGNDvZIxsjx
         QRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781287923; x=1781892723;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PURibjNrq6Q8aIzpLwTE6eJkvCDifdjL2ifGZ3jMX0w=;
        b=luGS0IU8Gak33nvZAh8JxNApohgYQrX4ekUM2+t8xBzh0AEmUqGDTcpi5j5EaZF67b
         n4xDVNkhAy85R9eR4UCvfa7SfoUVGOb8VFV+zvpv6GWH6fZW2VNCtIBzfBzaEWFwm8oq
         cI+c1LVgw4SbCTN05oJbnBjw6Hr3z6wjC81u9lgJkxo0VeOLx4Z4FFCcB+VCfEqZbSup
         8oETJ0VeAlfQ5hlsNM6VJomglZbHBRPq7/bIO3mgvPUkmyFOImKbMU2uFTFiXfHUaAP9
         ezyoGgDweoXKJUrmAQzgokkguqIkgS9vitpG1Wqgmasqdp9occViPA9WOhf03omQpq2c
         pHEg==
X-Forwarded-Encrypted: i=1; AFNElJ8tZXDhGx46zi88iuQOBGsZeBABgT+cakLfKCJkT/GJZfQqk7RYcTRMPD3ArZEotTf8rBraSzD0y4CZY2dt2RiqZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2LwMeNPSstVV0PXu2NCTVO0xTP2AqxE5fZbcUveK0FF0O/02w
	4skEZBkAY74ENLVlfT7r4EWr7vRsilnGFMbIUHb2lPRvtSLj2HW48WW4
X-Gm-Gg: Acq92OHEltkZHGFtlgFt7EJ2Y0NhkFWGRy7VqtZZdr5fjJzfPFm+BTDTgp8rQFBsy1Z
	7g4RhIxzqw8kY46Pm5+cjF6dFePKu3nQwKXSPQ7UjXSuZN3td6oQDDwtFVtEINe59G9bASRStze
	YNc85Zm8R7vv8olYwWfWLs3nVSwUZhd10YaYrXZsTKgu130KUXc72YMnnotuRmCa1Ja+BQkhCxN
	8A4ySJ4mx7Sx3S0O/FJFQSRibqVM5FAaXQc1s3Y3u2xyKW/nh3dLcAFScA0fevvyNEVpFyfdPTu
	oMrKP0rJ3xX4oJ5vJ5Sz0wQ00UYCVH6dEmorH4g+26kAm9E7xHRD8TtnWq6jrsee6AekfZNp/mR
	2wwabqQ7pBD2oOTxJRZv3++orWLymgzXXfpMzsb++JfmGZdHh6QLUt5ySuHA93oy7hZh6dSSdWZ
	uvZTd3dyl6oyAI4XxI/lshNwr9uyW1tHXZs4fBL/8+ztJC7AyFjTASSw5io2LH4dtv+P61mcU2B
	9o=
X-Received: by 2002:ac2:5199:0:b0:5aa:7880:5246 with SMTP id 2adb3069b0e04-5ad2db5be8bmr870757e87.31.1781287922714;
        Fri, 12 Jun 2026 11:12:02 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:742:25a:e03e:6c9c:49d8:2fee? ([2a00:1fa0:742:25a:e03e:6c9c:49d8:2fee])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e16a0fasm730873e87.20.2026.06.12.11.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 11:12:02 -0700 (PDT)
Message-ID: <2027adf1-6b09-49e3-84d0-ac89cbcd8b24@gmail.com>
Date: Fri, 12 Jun 2026 21:12:00 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next 1/9] net: ethernet: ravb: Remove gPTP control from WoL
 setup and restore
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
 <20260610102432.3538432-2-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260610102432.3538432-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33947-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund+renesas@ragnatech.se,m:paul@pbarker.dev,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:netdev@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund@ragnatech.se,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sergeishtylyov@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[ragnatech.se,pbarker.dev,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,glider.be,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sergeishtylyov@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,netdev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ragnatech.se:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 55F3A67BA85

On 6/10/26 1:24 PM, Niklas Söderlund wrote:

> Since commit a6a85ba36fd0 ("net: ravb: Move PTP initialization in the
> driver's ndo_open API for ccc_gac platorms") the gPTP clock (if
> supported) is stopped and started by opening and closing the ndev.
> 
> This makes the special case to stop and start it when resuming from WoL
> redundant. As the ndev will always be closed and re-opened when
> suspending and resuming the system.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Sergey Shtylyov <sergei.shtylyov@gmail.com>

[...]

MBR, Sergey


