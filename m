Return-Path: <linux-renesas-soc+bounces-27975-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEGMHdPDhWltGAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27975-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 11:34:59 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8716BFCB08
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 11:34:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E33E2300EEA4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 10:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E519A360732;
	Fri,  6 Feb 2026 10:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="ZxYieJ6t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAE636F439
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Feb 2026 10:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770374067; cv=none; b=QPCaC2TLS126CGMD3qzqWsB5mWZEF2ogbbx+du9c29uvJseOS0ymecdH1FIgBPGA0xCqib+1GH9CN0Iok1boPPQH+y4KZZSxNSJABQpz58jzT1k1KJKgbWg4Rz95FzMbIGrghp9VbLDqc3eFAgmPv+R3698NqQdO4jOsDlbP/OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770374067; c=relaxed/simple;
	bh=6OnxLe8EyUUzTBtYYOFz/C0thedtH48VjMALAeoKO+Q=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sNcJATWy68thlDFwuRe1SYMlZTmhXFiSEDs09dGtgLpnf0/OL6ypxw2irXM1yFGohbBy9av1lvVi+IEKzaSdhmtkJaA4Jm7+T372juDdyrG06fvKUMAnSExIAfgPnov3q9ooiR8PTaoWyPt39tlmwi9mKSh+n+RnTPd0Tl0tJG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=ZxYieJ6t; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4362aadaf09so463506f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Feb 2026 02:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1770374066; x=1770978866; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LHMkTXnKnNt0ryQWtQStRCNfgK5XQzWzGDoLk6H5Ljo=;
        b=ZxYieJ6t9/kKFV9cSCpsBnpD/AjNohF2pqdWq8gNE+6SAftrNeRe1wgkU57a6caobi
         7ei0MucCaK6rGA4SBne2eAwJAB6/hUcO1nYrCtEzusI3YUsOE17kE7cLG2HhyEIx/bcU
         AUjyKwp0Ja1+he387ixfQHzLZwUnKLXAPsL7o8fnRL3ejORObukWtQtI2CFyhm46G+RO
         /qrZxlTifatGzg2Q5C2hLRVHIQK/EZ+jdYAIcMLRJuREovcPu+/c6cBo8dls7S3T1TsG
         n06hpngRDy8FAvSbYEt/fUHAWg851d6fCFqursDW1e/E7GpRN2KxPVlHaGdiOw1I/KrG
         VO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770374066; x=1770978866;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LHMkTXnKnNt0ryQWtQStRCNfgK5XQzWzGDoLk6H5Ljo=;
        b=Ol2ttdr/QD+T+ufFUIn3XL3o3ms+9lLMDfhRtOxczWfzusWq7Ima4xfSjjZ6Gdc42H
         lalDAF5EMxH6TXwloiZmB7dBMzIVoC4NsF3HkVlqwbWI3puZkhlsUFAnNJfWdxAyI5JJ
         5i981lTonG8e87qNEEZdzdUXanzfKdQTyvGQe1aWIDOFjQtuDhYHOWSYNyK8JyQOOh72
         /eYQyI5thZ982YKXZ5RDfKRm3Vg8hN55icF5DJtXs7QYUlyQgd8s/norA5ltsoe4m9jp
         4OBfueQ4fsmyJoYupqwrG6MU76XG+wbS1Aq3vRsGbWRORRb6TNqv1fMh6aVGVHMBPYA+
         JpKg==
X-Forwarded-Encrypted: i=1; AJvYcCVt8SEt2ySgkKGmzB3g1ssCAh3HiYnNFxH4Pnjp/GQO+1Kg2zFno/gpnlZoHBVrLwdsEIe0saQC04zpU9b2sDbJJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwu6vJQS1VSqvy8jG94FnpeKYjh591nyOy9Pd5lNxWKAGxXlFW
	wNDpMBSgtYtObf3xT9wtdKCqSF/ko9l2TqIuexEcPhET5xtn5IjJBA1x+OzPshaCJxg=
X-Gm-Gg: AZuq6aJ8Qj8Z87BRS9iCRTN8mGzwa7T1QGVznizVvTlh1mgw+npM/MMeiao67IkWPOz
	E48mJ/30XNop5YbsOvXJL+cDYKHvE7Bb9e0hmohQn+fglz4H8O78fa670/f/+7f2bszqseMkE35
	7usfk5X6Xk6X3yYBSqT9AsN+v79l7dVCdr3xrv5fgQt9vfbY4bmFD+GN4i9l/489Ti8phjR2chN
	fUDfGmWpT8as7OyHDD08hrghYwXsO5LBvELQIlvAaW+G4RfnUa019RpsnvN6+sYbxnoLBRg6cwH
	0JL0Pf4WTOHZ3WUHcXqMzzbfb+4QAfpDECWBLNSB4YmXLi11tBXHVLFLp6c3YGtSCd5aTzPYn/m
	/dD+CnwAKrGSxB/1MJRX7gT+pXGHaJQnxlQQfvrNPE9V9182B67PvOw2RCRJtiexIXu4O5cXkKb
	ZRGBfNqNukgUcuR0mSCekumK3BdCvJoZ72F4UU
X-Received: by 2002:a05:600c:348c:b0:480:462e:d640 with SMTP id 5b1f17b1804b1-4832022f781mr35081625e9.36.1770374065755;
        Fri, 06 Feb 2026 02:34:25 -0800 (PST)
Received: from ?IPV6:2a02:810a:b98:a000::159a? ([2a02:810a:b98:a000::159a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd1c9sm4602013f8f.15.2026.02.06.02.34.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 02:34:25 -0800 (PST)
Message-ID: <1aa615e2-1297-40a9-b7c4-beb943996721@cogentembedded.com>
Date: Fri, 6 Feb 2026 11:34:24 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: Re: [PATCH net] net: renesas: rswitch: fix forwarding offload
 statemachine
To: Michael Dege <michael.dege@renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christian Mardmoeller <christian.mardmoeller@renesas.com>,
 Dennis Ostermann <dennis.ostermann@renesas.com>
References: <20260205-fix-offloading-statemachine-v1-1-640224a531d0@renesas.com>
 <3b1405cd-6c7f-4883-95fb-151cab223a68@cogentembedded.com>
 <d6a9356d-6fd4-459b-9c5a-2f3e20368bbd@cogentembedded.com>
 <TY4PR01MB142829D9748A483ECAF19FD3D8299A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
 <25ff0841-545b-433a-8e88-6e463ea718e7@cogentembedded.com>
 <TYRPR01MB14284CB75C7DCD35381BD17EE8299A@TYRPR01MB14284.jpnprd01.prod.outlook.com>
 <237bee8b-a7cf-4c14-9946-8bf72dbddde5@cogentembedded.com>
 <TY4PR01MB142829EB0EDDE13B588F949298299A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
 <a4cfeba2-23da-4fdd-870b-6533b5ce267c@cogentembedded.com>
 <5b8bcf37-5cd0-4c32-b0ba-3386142b7795@cogentembedded.com>
 <TY4PR01MB142820FC29E751D8C7F0B7C348266A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
Content-Language: en-US, ru-RU
In-Reply-To: <TY4PR01MB142820FC29E751D8C7F0B7C348266A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[cogentembedded-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-27975-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_NA(0.00)[cogentembedded.com];
	DKIM_TRACE(0.00)[cogentembedded-com.20230601.gappssmtp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nikita.yoush@cogentembedded.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,cogentembedded-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 8716BFCB08
X-Rspamd-Action: no action

> Unfortunately, your argumentation is very _academic_. There is _no_practical_reason_, not to
> forward the traffic to the SW bridge via the HW bridge, even if only one link is currently up.

The very practical reason not to forward packet to SW when it can be handled in HW is - reduce SW load. 
SW cores have no chance to handle the load if you forward everything to SW at the channel speed.

The very thing I was trying to achieve when working on this offload support was - detect the case when a 
frame can be processed correctly in HW, and let it process it in HW, without notifying SW. And send 
frame to SW if and only if it is not possible to provide correct processing without that.

But this does not directly affect the case being discussed.

When there is only one port with enabled HW forwarding, there is no effect of keeping HW forwarding 
enabled, because the allowed destination mask computed nearby does not contain any destinations. 
Forwarding to CPU port was never handled via L2 forwarding (*), because L2 forwarding on rswitch 
requires explicit adding any possible destination MAC to the L2 table - which is problematic for CPU 
port, in generic case your software bridge device can be a part of a higher level construct, and you 
will have hard times to dynamically catch and process any changes in the list of possible destination 
MACs for the CPU port. For exact this reason, I implemented forwarding to SW port using "port based" 
thing, that is actually a fallback that rswitch uses when L3/L2 forwarding fails due to no table match.

(*) when virtual ports come into scope, a case for L2 forwarding to CPU port appears.  But still, 
"default" forwarding to SW is never handled as L2 forwarding.

Nikita

