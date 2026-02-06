Return-Path: <linux-renesas-soc+bounces-28021-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHF5CpQShmk1JgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28021-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 17:11:00 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9417410011D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 17:10:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0DEB9302AF0B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 16:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B659630E0D6;
	Fri,  6 Feb 2026 16:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="JjCatdgx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CFE309F1B
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Feb 2026 16:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770394229; cv=none; b=uAhFflYVfw6rnjhLEW6b9ZXWD/TialAZt6v8zxh2MEfQOJHVgEauRm8LMcKYTNtefqxeo+0EZ0UmzeQLIN+vynbMJklKVQiaQa6nVUKWZbkJrBwasO/JY5u5zbzSQu88AVu9sWeI0duuUGL9+lMskLJBVjLprKdCbTz95cWXSkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770394229; c=relaxed/simple;
	bh=wTO4w0jGGKNWWyVRPeBBuZHYWyGfWSj0HikzN1o1OD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uDC16G1X+5BwvB2/LPg7Q2Gc5i9A9h+0JWTdO3a3t3h5VF24iEHz6BrBHEqEy3vM/VU987yQoTGm35oIjWn6gKbpNuJkk/ZdKTqamg8TL2CsaMqwHHYkJ0GAOBX9lI0+o9AOzYeEo/16SfhIlvir15feh5iCyNMR6OeX733MMV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=JjCatdgx; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so7957175e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Feb 2026 08:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1770394228; x=1770999028; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ctwbS8EWesRYrg5+xa1qLeZZuWqYJMD4QKuaVTduh68=;
        b=JjCatdgxWSXHY7iBex4yusKaYTlB83pDJzowjSrhludaQ+AH94JnpcRNRgRxtiPMPC
         69DaRDYAkyO3LycwxJNsGpGvId2zb6m+PkC0ROGx7sZH2GqF7Erb6TrnVUDtZfyVQH5s
         eAb/42+TEXmW8iPx09cO16IyY3GaBpLuswcTpwhEIkmjanWO9lOw3yCKrNz3Xf6mOKlV
         2TmRxNYZ9UvmkJnffcQH+fkpLLWQLMQOkv4xnV5Y5SzCbxjhQjd+/WRhgnF8/bwPNkTB
         JvSEthfYTz4Ac3+WfYNWeTaMwQDdoVQSn9vXkWktlWfg5kCY2+urcNrxFjEgQgEmj3Eo
         nTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770394228; x=1770999028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ctwbS8EWesRYrg5+xa1qLeZZuWqYJMD4QKuaVTduh68=;
        b=KqkRuZS75KFdFPc3XoyP5sjDxv5E8m1Nm96z2p/dMopeakEs/t9Ej1apZB+O/zeNWd
         vCkAIe+T7tDyk3EFGHDSf/S9iaNXTv+DTfv9y6P9sosuNe5Z7w8uwuRCyBXUWlBULXOO
         cSTqLDoJV2ZS4XzAv09630cuvSVNnUlkFIuTqL6YTXjD6bz4NAgogEqNlLj+WLIC7NC3
         pM89RBIZSijnKvp6fACKZSezBms868zppyVjyoQWU7mv+oGa0xuBSXRQWUE8u6SM9X/h
         rAM9lsonqKezDnDVoQh7ougAgZ1NuPEH2P26wKJ6V5iiNxFp/c8Tv8f5UbMOrmvkWXIr
         AYQA==
X-Forwarded-Encrypted: i=1; AJvYcCW18AOaYP5wK62csg1QcqTy4zl/P6tcypisPbGXL1O83Io9F4MUF3vDiQkVJ1oOwEa5K69TXCtVZQPjfY2j8gJHLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyusyAPyWg5LGOQAFvqsH3LZjoGokBBloI3fOO1cdd3CLGhGHX2
	5WS8gZzC76yinl5nNQWHq8plBZZz9GArDSs2JoGBZlD8V0KWT3x+sE/CWpDncoTz7eg=
X-Gm-Gg: AZuq6aLHaXRJM5cVttGrTmpR5M5pYj7nzIVeTMHTMMOvrbwIiFbzY/icOb8w6R2EHly
	XUZIEOUjgKPYZSZeUd/MRHEiR9dCfInlvlewD5/kK5L65SoSHlANc1eJGTIxHmlK1zQpyOLmyQv
	28kmn84kYqDSB96Nbqc4jN3DUGce8xSKwXHslxeOg062qiLwNfGPoT2LDCzY7oBVlZo64fQ9Md8
	9mPVrjK2pZvqP8BfrQdO6lGH92fL/SywSe0cBKMPSLDMlTa0nxEg7mMN8qdxK+O7mQWkAKFG2PN
	SfSCD1KDv03PeiqzSGoUEM5pH5FMMLpzumSCyCYeLAlP2UhtD8+nJwPswZ+4AB8uaXQddGr+hIp
	0mxgF/9rDkZcskM/CSKQmdRCUtJQeqv1LhmtPpEGf1ZF3APj6VwrB2rzw3NMNVfv7lJu9l0fq2O
	1z53yBr/lQGfNTJEQrRXW+iiUTNnYyfNJSm6uDDZrfl4uxDho=
X-Received: by 2002:a05:600c:19c7:b0:45d:dc85:c009 with SMTP id 5b1f17b1804b1-483201e160dmr43791245e9.10.1770394227499;
        Fri, 06 Feb 2026 08:10:27 -0800 (PST)
Received: from ?IPV6:2a02:810a:b98:a000::159a? ([2a02:810a:b98:a000::159a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629754c62sm6271284f8f.38.2026.02.06.08.10.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 08:10:27 -0800 (PST)
Message-ID: <da7edbbd-5a31-46a3-a091-b06ca4fee683@cogentembedded.com>
Date: Fri, 6 Feb 2026 17:10:26 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: renesas: rswitch: fix forwarding offload
 statemachine
To: Andrew Lunn <andrew@lunn.ch>
Cc: Michael Dege <michael.dege@renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christian Mardmoeller <christian.mardmoeller@renesas.com>,
 Dennis Ostermann <dennis.ostermann@renesas.com>
References: <d6a9356d-6fd4-459b-9c5a-2f3e20368bbd@cogentembedded.com>
 <TY4PR01MB142829D9748A483ECAF19FD3D8299A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
 <25ff0841-545b-433a-8e88-6e463ea718e7@cogentembedded.com>
 <TYRPR01MB14284CB75C7DCD35381BD17EE8299A@TYRPR01MB14284.jpnprd01.prod.outlook.com>
 <237bee8b-a7cf-4c14-9946-8bf72dbddde5@cogentembedded.com>
 <TY4PR01MB142829EB0EDDE13B588F949298299A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
 <a4cfeba2-23da-4fdd-870b-6533b5ce267c@cogentembedded.com>
 <5b8bcf37-5cd0-4c32-b0ba-3386142b7795@cogentembedded.com>
 <TY4PR01MB142820FC29E751D8C7F0B7C348266A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
 <1aa615e2-1297-40a9-b7c4-beb943996721@cogentembedded.com>
 <38e09d91-c514-4090-8e31-1709073b237a@lunn.ch>
Content-Language: en-US, ru-RU
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <38e09d91-c514-4090-8e31-1709073b237a@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[cogentembedded-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-28021-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,cogentembedded-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 9417410011D
X-Rspamd-Action: no action

> 
> DSA switches handle the CPU port in a few different ways:
> 
> * They do address learning, so learn what MAC addresses are in the
>    direction of the CPU from the traffic sent by the CPU.

rswitch does not support hardware learning on CPU port.

To make use of L2 forwarding to CPU port, one has to add destinations to MAC table manually.

> * All frames with a destination MAC address not in the address
>    translation unit get sent to the CPU. This is sometimes implicit,
>    the CPU is included in the flood for unknown MAC addresses, or there
>    is an explicit bit to enable this.  The software bridge will then
>    handle the frame. The reply, if there is one, should then trigger
>    address learning.

rswitch does not do anything implicitly, each frame is processed by trying in order:
- match it against "streams" in L3 table,
- match it against destination addresses in L2 table,
- match it against VLAN table (VLAN id only),
- try port-based forwarding (i.e. common rule for anything coming from particular ingress port)

At each of this level, it is possible to configure one or several destinations to forward frame to.
Flooding can be implemented e.g. by configuring "port based" for each port to forward to all other 
ports, so if a frame is matched at earlier stages then it is processed per what is defined there, and if 
not then it is flooded.

> * The switch driver taps into the events the software bridge issues as
>    it does address learning. This allows the switch to setup its
>    address translation tables to mirror the software switch.

For rswitch there is no easy way to sync hardware-learned L2 entries to software.
There are no notifications of hardware updates.

Options are:
- either periodically scan hardware table, or
- disable hardware learning at all and send any unknown frames to software bridge, so it learns, and 
then handle notifications about that and manually update hardware table.

The existing implementation does not try to sync sw and hw tables at all.

> The overall result is that having just one switch port in the bridge
> is no different to having multiple switch ports in the bridge.

In my original driver, I enabled L2 forwarding only when at least two ports have been participating.
I don't see rationale for doing differently on this hardware.
But Renesas can have a different view on this.

Nikita

