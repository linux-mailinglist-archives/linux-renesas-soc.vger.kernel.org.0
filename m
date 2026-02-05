Return-Path: <linux-renesas-soc+bounces-27955-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HZrAb6thGk14QMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27955-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 15:48:30 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A809F43A3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 15:48:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50DDF3078F7E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Feb 2026 14:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3083D410D18;
	Thu,  5 Feb 2026 14:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="2vEPCYcK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA83B3EFD38
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Feb 2026 14:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770302694; cv=none; b=aCwSNn5fcZs4GtiAAKN5oU2sk4ODkzc3SNmacfMD55DhLGDRnDG8SHLmpyljOyK4ZBo2TkQuG+qhYWh7vVFFJyTGLPC3FKREHQsBOzEalc0yx50PYRjMZAT331Xn9IoAVMxQZPU5jwJdVf4hKfMi+RCaMSjigfcQkIlGq2vmCqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770302694; c=relaxed/simple;
	bh=Ip8egWymmNIZRQpL/yLSLzyJGyXIDWQvB7EnInDwlQw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=nJRRLXaa+hqraxf9Ah6jnlD1qAT/pcX0yUA8CvUjKJjEc7dTNJ7Q23m5VyFop9+j6SD0unXiRH0h0DrL0xAr4VNFXmE7ebjPNO3XrLSw2ZMGnirEKbPT9FZY7v4sK2kMZ0L442qCq+DaHkCgA5L61Y1yXkBtRACED5O9gMk1ooY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=2vEPCYcK; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6581af9c94aso1876933a12.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Feb 2026 06:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1770302692; x=1770907492; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yGuGV1Rjxy0b39caRNbzTsFTwfMEJia85m6jesueSeQ=;
        b=2vEPCYcK1Py+VhyJltVRdjpNoH0RgQmPypEbfBTnBITFsspwaG5RCzqwoUR1gCLGF5
         I+jqr7fcYUQP8KC74QnbKGD5d6FTHwyzYq29a1QZzVwHamlaW93gwxbwDnzXQmMhsE4c
         LUcp9HauZjUz9C/uvoBxIOVVh3L7MNIqNjLchouV5+7N1VxYiOB56GfMRXZpXlQSarDh
         FbGfzjx5ROLLd1smPaxH1eBontPSHsOLhOVNfe/IKnGdfUpfqp9OO9UQhBj3G3CDjxfU
         OC/D8q2sNS6Hbfbshydj+0w/jeWJZx3sT21qiyh1g1GphK+KCFww6lkdMPTbR/YlGvr6
         Y/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770302692; x=1770907492;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yGuGV1Rjxy0b39caRNbzTsFTwfMEJia85m6jesueSeQ=;
        b=vh3jU3rc3w/i2ZfH0W8DZUozbZJuESk3B6tKdhiZ6hoPox2Od6q7X+MNUVcT9IiNKe
         iHKIQFCGbqee4qIWqgsrhRK/v9WKFkou9JeTMCKcK1mE+W8PDyGBGHodEFk1A1l2ozBD
         hS0U4b/z+x0i7MBHv/EBQbRrKQqvO64SUuYuP3coTWb5o1aUJxDw95rFBwcxyVhzeja5
         Hglqv4hvKl6zys+SQoV1Mgf5ICeXRYeMD3OVbHm+D+2zQENrYkXkpxYVWUrz2gAaDUDN
         03Jr0HiZeuRv61mNHRzRUdXqGBiuQlMGOyes/29sJhE2GF6aYo1XXh2/sXrGd1L+7xDa
         KWfg==
X-Forwarded-Encrypted: i=1; AJvYcCVoWz32XIs31ppz0aydiPeFneTO+SMpqMHl/UJ/ZTfyKa/pq76GctS77vUtLCQLTfZlh8xZy06qwFuBPKW+Y6l7Uw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGefAwRk4TcFf7ZKqsG2zwGJywbU+LvtwAt5jSEJi+rO3kcBtp
	ql6O9lV0Hav/ysae8QdBWa2HYyZInmupYDEQDYqU8jLI3EYA0JMMKw6s3X/o/RuCyYY=
X-Gm-Gg: AZuq6aKx5vLSKh9SEb4btnBajooCi13Hs2GkUyl+9rP7/4d+K+6W4eP86LEPiewLIhr
	X7AFo5NZ3w6uEWT1JZaKz4Z1xCNRpIYw9CkgLiF0aKyGMRYRo7ssXY1P6Cb8S17Df0P3PMJR+Ha
	TSxaNVLTMoKMNTcYkIyyBh+QzAWBaIo9pXY3iMuT5vjpsK6ut3hPr7rmJVPo/Q8hdF++7rHoRXg
	rBKl6lZ+qtTqEYXL1wN6m5RAdabH/dQHMVbRJYM3ehtT26IJYGZZtyKxZ6Ha0yz7muO2U9YFOHb
	XTqWBU3RelXb7SeN7bkTKExuxZLrbtdCLQfcerF7wq+/vcPyA7X3I+IKQnRNMTD7DjO3Z5a39xC
	7UKTBxrt/f6i13P8mOqBdqTiqKIX4vlk56jF+g0j187+tpWjLpbHRL41GQH4K16fP3shC9nKpmd
	JvanMrg5n4gINndpWPETc2BG/1cE7tyGCsTJEF
X-Received: by 2002:a17:907:928e:b0:b86:f194:9eec with SMTP id a640c23a62f3a-b8e9f063ademr467878766b.18.1770302691747;
        Thu, 05 Feb 2026 06:44:51 -0800 (PST)
Received: from ?IPV6:2a02:810a:b98:a000::159a? ([2a02:810a:b98:a000::159a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ea00455adsm236432166b.60.2026.02.05.06.44.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 06:44:51 -0800 (PST)
Message-ID: <5b8bcf37-5cd0-4c32-b0ba-3386142b7795@cogentembedded.com>
Date: Thu, 5 Feb 2026 15:44:50 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: renesas: rswitch: fix forwarding offload
 statemachine
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Michael Dege <michael.dege@renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260205-fix-offloading-statemachine-v1-1-640224a531d0@renesas.com>
 <3b1405cd-6c7f-4883-95fb-151cab223a68@cogentembedded.com>
 <d6a9356d-6fd4-459b-9c5a-2f3e20368bbd@cogentembedded.com>
 <TY4PR01MB142829D9748A483ECAF19FD3D8299A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
 <25ff0841-545b-433a-8e88-6e463ea718e7@cogentembedded.com>
 <TYRPR01MB14284CB75C7DCD35381BD17EE8299A@TYRPR01MB14284.jpnprd01.prod.outlook.com>
 <237bee8b-a7cf-4c14-9946-8bf72dbddde5@cogentembedded.com>
 <TY4PR01MB142829EB0EDDE13B588F949298299A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
 <a4cfeba2-23da-4fdd-870b-6533b5ce267c@cogentembedded.com>
Content-Language: en-US, ru-RU
In-Reply-To: <a4cfeba2-23da-4fdd-870b-6533b5ce267c@cogentembedded.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[cogentembedded-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[cogentembedded-com.20230601.gappssmtp.com:+];
	TAGGED_FROM(0.00)[bounces-27955-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[cogentembedded.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nikita.yoush@cogentembedded.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 4A809F43A3
X-Rspamd-Action: no action



WBR,
Nikita Yushchenko,
System Software Engineer @ Cogent Embedded

05.02.2026 15:41, Nikita Yushchenko wrote:
>>> The driver was originally designed to enable hardware forwarding when not less than two ports are in
>>> forwarding state. When only one port has hw forwarding, there is no destination to forward.
>>>
>>> Nikita
>>>
>>
>> The current driver allows Linux to use the bridge port as local port to the bridge. The offloading
>> Also supports switching traffic to Linux through the bridge port. Therefore, the offloading shouldn't
>> Be dropped if only one external port is up on the bridge.
> 
> "Offloading" means - forward a frame from one hw port to other hw port without inserting it into CPU 
> queue. Offloaded frame is never visible to software bridge.
> 
> There is code that allows offload only if the linux bridge device used to connect rswitch ports does not 
> have anything else.  If it has something else, offloading is disabled (because there is no way to know 
> when a frame can be processed within rswitch hw without sending it to cpu).

A frame being received by bridge device itself is not a subject for offload, ever.

