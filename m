Return-Path: <linux-renesas-soc+bounces-28147-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFu0E+w3jGkRjgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28147-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Feb 2026 09:03:56 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C25D122003
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Feb 2026 09:03:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B3ABA3005161
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Feb 2026 08:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B19301002;
	Wed, 11 Feb 2026 08:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SY/SlWFO";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hU8Bt7za"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95FE190664
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Feb 2026 08:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770797029; cv=none; b=glHx2VOcOz+ynhJDBBE6DihwOuGtxPeuy9O3UMaQ8GBRqF5J03gfPr7su4xADxTM1aSH9+fKwmlARChnuLStnmdP8Yo0fNccOOnGrBRBfWPGUam/nh5QM22F/WGfKiXpLQDATnoZS1a86p0n9A10TiK0CVvWpUdgwfhzXhmFNDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770797029; c=relaxed/simple;
	bh=XhmUQvKrnFLzFv58aladTBg92zWRwn29QmYQLVQQdKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JGck9c9SI8Zt84RZJTVUP9zwka90uamv9+jMR1Kq8uC7I5IrwVfCQWYLUPMHP/cseo5ylQd5rTx0LUTMj4w+cj3FQ1mQGec0e8pAfAjCD9UZdrW+qwMgK9+b1NLxkiyWFr8D+S1XS0mFisiuExRBbsevBcXKVPfnNma6xqJnFHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SY/SlWFO; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hU8Bt7za; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770797026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JXSzHCNlggSpaEU4Cd9wo0z0BNEV6ELigy6booHOajs=;
	b=SY/SlWFOCbL2ldg62CYHG78nx+WsQyvSTcg5QGMd5nz6tZlSkNMVodzEI9KEsePdkIEdxW
	3aP7q4ZaCC1qLvbzbAfFGdlED1BXxSOVkPUi/ZSG5osuxwYA3NSr75/oif5ds6jiGcig8w
	d/amKwMAnlT+ZM+zJkx5r8gsNE1HtJA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-dp41Cbg8MQS1oZH_QbLNzg-1; Wed, 11 Feb 2026 03:03:45 -0500
X-MC-Unique: dp41Cbg8MQS1oZH_QbLNzg-1
X-Mimecast-MFC-AGG-ID: dp41Cbg8MQS1oZH_QbLNzg_1770797024
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-47ee33324e8so17271965e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Feb 2026 00:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770797024; x=1771401824; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JXSzHCNlggSpaEU4Cd9wo0z0BNEV6ELigy6booHOajs=;
        b=hU8Bt7zaHxAvWQGg4I4KXq0b2h5IHuWTghosuc7Ncmf+6ZHuxoMnniHgFNARXVQlOM
         0/rA2PBTwBjbvJYbvg8S6g9O2eX/FHUoQ4xmPZ/VuXHitvsJTGshgb5Ns/FAkv+asKFj
         AeTO+EtKtIU96f20UuxDcuRb2mez1U9AxAz5y47lwjobtiXjFYEC8bWVeV4YPLQRBnl/
         2e30vkghnyAh2z+wWuELq40F0SJxw559S8hpqR5c7rVovdI4lX6mhKhHZU+ZRf30soqd
         f6YWd7pWHGSwc+6GVj00+m+adZ2Cw2ZmUULZPpUVzfCYJxphBXsoDpN1bAHls09Bj4Gz
         uGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770797024; x=1771401824;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JXSzHCNlggSpaEU4Cd9wo0z0BNEV6ELigy6booHOajs=;
        b=WCGRj0UKw0JudRQbR+6CxsBshO3Fc+tmLFuhrbgPR47BBeIwFs9Nncfk2yDKIxACrX
         25i8b6X3HXJYftWZkFDY5thkIeyMhx93WWIJ0fr9/7+KooUv+AGA/sk5U6uO/RMlhDnZ
         0IQceGuN0aiQTysDCJ+ozAWNtWIoIcKa+AZh5PQ1ngwfgCvzojyjpG79Yykc5KqTY0Y8
         KRANMXY+3ZKgSQ2/yZaVUaCinz1MMQk9IpPm50Hee0Zovz56gUzwHQRZgwvVKjEKveCv
         eKV8CMm+WKXNX+IEA6MTpaRKBkEJGsKW9kMI69qOUM407RGWnSoQK8sk2gfpqYJ6xACi
         BUrw==
X-Forwarded-Encrypted: i=1; AJvYcCUR+PAc4b7hEHqLxx0JlhXJVF+6hGEy6bjVgbshaTZnKCfkPH8XN4UKbhjqvQSRL/Onpbd+ZDDAfoFwpz7ap3tC8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqLyFWwl4DosgLy8B4+Ojt8JKn6uukAHk8jH0JQZKSsalUbcYR
	JHdW1MizDCrc2x57PF/woUM9SWLqAELhBCk1jnTmRw/YLbENtAxTWC6iOERSP1t9rG6drv5vBGl
	F25OisTYVuN4oxav53bjk85cZUtlxkoC9NydPgxF2Q5MasZOr3RxwmvIl3QBQtp4UfSprAdBQ
X-Gm-Gg: AZuq6aJtdFZrkZGZtEMT/8CIVVBYe9eXsf90dP/NeqrM1n3iVS7p8ZXuhaoERo0bnPC
	6s7KWQ9O39tkQoTldLpwuv+ejNBTJf5jOSUGWzZGQ4Bx40AkV+kjUAzygjc8g0FX8McSBSigPwV
	qiTfbO4tsQ0pMWSeaIFi9KBbrC97M7DeEyhPW14xbnDtt190txX/MjSAaoboo3TRAiu5wcW5+26
	zHnlDigJsMN+21OygJHCZRGqVsdL1WSnDKylaFuvVTXeYesCE1TMYwiCtKR359Johsd7ETbQNuD
	q2zA5A3aXBPcfMdTheRli7qgFo/HdnOLWOU7IySaLmRQB4hTEZO1E9ETr3ZDCwhDhEFQb7bilmx
	sfpnukLC3hiB949a8pybUjKAaZg==
X-Received: by 2002:a05:600c:45cb:b0:477:8985:4036 with SMTP id 5b1f17b1804b1-483201dd216mr236652435e9.1.1770797024329;
        Wed, 11 Feb 2026 00:03:44 -0800 (PST)
X-Received: by 2002:a05:600c:45cb:b0:477:8985:4036 with SMTP id 5b1f17b1804b1-483201dd216mr236651935e9.1.1770797023873;
        Wed, 11 Feb 2026 00:03:43 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835ba7926dsm11919045e9.12.2026.02.11.00.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 00:03:43 -0800 (PST)
Message-ID: <ec02262e-0215-4edb-8352-ee052f3e974a@redhat.com>
Date: Wed, 11 Feb 2026 09:03:40 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] net: renesas: rswitch: fix forwarding offload
 statemachine
To: Michael Dege <michael.dege@renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260206-fix-offloading-statemachine-v3-1-07bfba07d03e@renesas.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260206-fix-offloading-statemachine-v3-1-07bfba07d03e@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28147-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6C25D122003
X-Rspamd-Action: no action

On 2/6/26 2:41 PM, Michael Dege wrote:
> A change of the port state of one port, caused the state of another
> port to change. This behvior was unintended.
> 
> Fixes: b7502b1043de ("net: renesas: rswitch: add offloading for L2 switching")
> 

You should not have inserted an empty line above. I'll fix it while
applying the patch, but please have a better look at the process
documentation.

/P


