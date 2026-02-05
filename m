Return-Path: <linux-renesas-soc+bounces-27935-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFsAKPBOhGkE2gMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27935-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 09:04:00 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 10918EFB2C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 09:04:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDA963020D5A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Feb 2026 07:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC8C36072B;
	Thu,  5 Feb 2026 07:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="OTLFZ8JU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343AF35FF79
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Feb 2026 07:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770278335; cv=none; b=G3PMQ8a59cMLpDU7jHVUQZSb7pGXAoyZH5XkVXfnk4w30dP4wrw90uVKOlPcMwq6W8iGhBg8I8SCQyUT7hQU+M/adcIgmjaynogoH7n9glxmQDV6Niz7EiADf0xBs+uHkxITIXBxU0aNX2/kvCs9sfRqFJTmhscoXtV2ROY65xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770278335; c=relaxed/simple;
	bh=sZQ3YwewM9Ai+7WG00Ix8G/HdOMYfSXLaxEv1z7nGr4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=qYjyJY9lC/Zkq4GCiESedlPERSHUYcelquJJdwrjDyBSMNSpR1yWd5ajz0MR4N9qtvL6uzb1HLymZKqjUTsbE7LHSkLELyNW+zYBwYrmIAtJPJKCteJFL0q2tDOPwNVNXwiM9uaS8Z+pMvXeHemZaUPJcWZwhVMlkn0vlx5xmAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=OTLFZ8JU; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4807068eacbso5089995e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Feb 2026 23:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1770278334; x=1770883134; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kv4UVvtp9oTgfg4NwZs5j17xsQoACWxzr3TeGIM+1uc=;
        b=OTLFZ8JUwzyHB61KICJ/1PQ18g5HGVT7ZgNC/swVn9PjHsytoKdwI8g96lVNb5wEpY
         Rh/ReKrNM+AdxTCtbpBooPNiVMo9O9GvfkXGDySmI3ibQBvq0hnKrjs+KgTDfCFwtGAD
         XebrjxO6fDNe0SZoHk4gqbRbzIB8w0B9j0Kncsmj7v5wmNpEuqZjS/h8yq2XyxUwvPaI
         4NpGrJ0NgOK/rGUS2WdSdYZdabvkMuLHzHqPEnweLu35CUf9KhEGieoRDalJqSjHC0ps
         /6xXDmeGOv8ym7AjtApliErqaZM+qhS6lUErnPC7cbLSf5nmvxuv3fmZF9PS0WBP9+s6
         2/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770278334; x=1770883134;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kv4UVvtp9oTgfg4NwZs5j17xsQoACWxzr3TeGIM+1uc=;
        b=ni0lF9H867/R45teRO+uS3NPElPHN+9FWbBaySN7qB2+REStPLk5WxFK4M/FmCzK95
         crlwWZShS2oE3uk03lFlm05x9jNm+RdRU7A61JFG0ZUGWMYXcFk0d9fH9QEhjgltPGiv
         s5IMusHTIvzSbkJU5gfHN5KZfSgfUDbhd/ScVYOLQeCN4wspSg0dlAMvVEEBEtRfjdxl
         ksW03qDJ0NtiI9NHLxxUJA7euqurkSN7hLugvtgDc0xusY37OsUv0akqqt4qdwL/6Pbv
         Oxqt4lwR0v1w3qFQVpSGql/k4fZfBFCz3i6L3hzpkEJNluV0PifrYokFc7kW95TCI70k
         aFXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUvat6Uevnz3ub7O/A9wtXVhuha5zLGvGEihImdWDZnVLfI6WXMS5Yyo9BFSTQC7tJjlFQkUPIvh86EOxYKqC7kg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcNdbU3eWP5ZWig2D+mhC/eryre2e1wq8BxomUmCpx/Q+rA2Mo
	0zoVQMwkayV87GDW42ga5Aqh0kXVmEmp2ZbtjJgFrwydh7F+94PgOhk0s0uRmZXCZ8I=
X-Gm-Gg: AZuq6aLUjyNcjKhZX0gnJNj0ckvqWq852VTVJVzh7ck12/OGaWN1b7MaT9U/n7wId6m
	Q8+nd/oCAKdl1ulQGHfH4XQaPjMciH6dzow9dbtSx1bESyS0QIsagH2UBD8uTypJ/AmUfkjCB8j
	5G4VGuhS4f9Szm7U+hyjHqIYcACCFD3Hruh+WCfy8ixNflhW5uv3FehYq76RWM1CD/Qoo9qZY6n
	liKYWbmmvo4A7l6uvcCS5QktFRzVVZjhJeKhmbYz2zIJxo9gdtS+38GpNILIJNxvYS3yQxMZHfC
	X36fnHYcd+9VCRSCGRnsvgdRqPEsCHmp9bPsegrum2Zt+hbkXMLChsynh2NG+lYCo2c03KI0c8C
	o/tFkaNG7mk7f2KTOXO89rFIKslylTu23qsUdR1vSVhDaKijnY97f1Y7CN9dV1gXZ4RdGuGk0/a
	CJfQ6zgW1eLKJ23Q/ncWeRGIbl7dToYN0wdFaSB4QUypOYS38=
X-Received: by 2002:a05:600c:154c:b0:477:abea:9028 with SMTP id 5b1f17b1804b1-4830e92a7c4mr78949725e9.6.1770278333677;
        Wed, 04 Feb 2026 23:58:53 -0800 (PST)
Received: from ?IPV6:2a02:810a:b98:a000::b3d5? ([2a02:810a:b98:a000::b3d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830fe69e9fsm51569315e9.6.2026.02.04.23.58.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 23:58:53 -0800 (PST)
Message-ID: <d6a9356d-6fd4-459b-9c5a-2f3e20368bbd@cogentembedded.com>
Date: Thu, 5 Feb 2026 08:58:52 +0100
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
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260205-fix-offloading-statemachine-v1-1-640224a531d0@renesas.com>
 <3b1405cd-6c7f-4883-95fb-151cab223a68@cogentembedded.com>
Content-Language: en-US, ru-RU
In-Reply-To: <3b1405cd-6c7f-4883-95fb-151cab223a68@cogentembedded.com>
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
	TAGGED_FROM(0.00)[bounces-27935-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[cogentembedded.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[cogentembedded-com.20230601.gappssmtp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,cogentembedded.com:mid]
X-Rspamd-Queue-Id: 10918EFB2C
X-Rspamd-Action: no action



WBR,
Nikita Yushchenko,
System Software Engineer @ Cogent Embedded

05.02.2026 08:47, Nikita Yushchenko wrote:
> Hello Michael
> 
>> -        } else if (rdev->forwarding_offloaded) {
>> +        } else if (rdev->forwarding_offloaded &&
>> +               !rdev->forwarding_requested) {
>>               rswitch_change_l2_hw_offloading(rdev, false, false);
>>           }
> 
> Although indeed the condition in the current code is not correct, I'm not sure comfortable with this fix.
> 
> Full condition for a port to be a valid candidate for hardware forwarding is
> 
>    rdev_for_l2_offload() && rdev->forwarding_requested
> 
> It is not obvious if at this point rdev_for_l2_offload() could get changed from the last call to 
> rswitch_change_l2_hw_offloading(), so using only the partial condition at this point does not look good 
> for me.
> 
> I'd suggest to either change to something like
> 
> if (rdev_for_l2_offload() && rdev->forwarding_requested && !rdev->forwarding_offloaded)
>      rswitch_change_l2_hw_offloading(rdev, true, false);
> if (!(rdev_for_l2_offload() && rdev->forwarding_requested) && rdev->forwarding_offloaded)
>      rswitch_change_l2_hw_offloading(rdev, false, false);
> 
> Or maybe just
> 
> if (rdev_for_l2_offload() && rdev->forwarding_requested)
>      rswitch_change_l2_hw_offloading(rdev, true, false);
> else
>      rswitch_change_l2_hw_offloading(rdev, false, false);
> 
> since rswitch_change_l2_hw_offloading() has internal check for the current state and returns early if 
> the requested change is already applied.

May be even better to add

   bool new_forwarding_offloaded = rdev_for_l2_offload(rdev) && rdev->forwarding_requested;

at the beginning of the loop body, and use this flag over the loop - it will make the code shorter and 
cleaner.

