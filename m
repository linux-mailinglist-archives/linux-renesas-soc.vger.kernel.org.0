Return-Path: <linux-renesas-soc+bounces-27954-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFLrCUushGk14QMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27954-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 15:42:19 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74560F42D2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 15:42:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B337E3033A82
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Feb 2026 14:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 904CC3ACA79;
	Thu,  5 Feb 2026 14:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="sOpKi6ra"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C2040B6D8
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Feb 2026 14:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770302481; cv=none; b=Yo4IjM6osuhySXjZm8W9Jsa9XrIOjKxpmdZPByDIeb2gV9VPxkDrUiLTWELfr7/c6pUSUxF76DinFhe1w8ilkyqGqaECBGtR8JHfJOlUuN8Mff0+l6bO+p08iiZW2wjSZ1wmK17+zXvWBjSyTiDAfywnXk5foiIzTksQgejBhCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770302481; c=relaxed/simple;
	bh=xv9XqrB6fIUzpEEF7J/468aqjuYRLhV5nJlZyDo7wJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nzwlT4wSVAU7lU7i8dJM6W64ZfJOAIyNHCz3cc/96HjNQYdjoAKLLzY0UiWBeY5SOw7GFufA0N/zyA5dxxEXqtQTmJVzLgNmw2SZEYHGBVBMz9lj2zCyeBCZ5jvIifYHoxk45OXg/AdmAOR8iTnvLfPSW0YRJCkB9XB+ilawIkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=sOpKi6ra; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b884a84e655so150589366b.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Feb 2026 06:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1770302479; x=1770907279; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XqXFNoUbhOdwZYum4sJeZUw29ERhNLD4od5OT229l8I=;
        b=sOpKi6raGLdA8t9HJ85r1Qfq+jT3+DJxHOY6hntDkl6on2LyUZ4NbSoILDrgDrABGm
         XtbF///ZNnecujxhqnc+8+qAkatKFmM+AzyGqUnuC7gNUzOFb6uIhEaOhS7C/cjRo1UP
         iQcxK2Lowr/OaRW817jtycpVT5wP1tHgfg6VHOuDm4ifC7jHmgoglp/sh9aJPJlDKcUP
         JESPFuw9xn7BydAwJwHVZYm0MNZ2iLADXvGoFm+pi9watEBiDzkLV75e5Z1R4v0Q64YT
         eijcQxDLa0BWfqloNx8mGYfB0EaDWshbQEwcgSTDY7V/5toQA1CcQZ1EQxfwYZu6K4oO
         6oXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770302479; x=1770907279;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XqXFNoUbhOdwZYum4sJeZUw29ERhNLD4od5OT229l8I=;
        b=snpEIKFSAidSywRkvPW2iaj0vESjkBUqVf98r9RHRuCpL2VWOU+6vesVR+yt6Fee/R
         0J/Y7XHHQQCrWRN5ZJ4/gcqRn7h6zEsnVgigWAYpDDntzRYbtdRc/uKkMTM94wf5U86r
         w9A2dFSAkuRyLFI3vI66obUdaYKNFjrmbwL8EawVu/wQKfH8I1fLWuBv3rZ5+OV/L0jt
         TVIINqArpLX1KctmfD+GvuU4nxfAuj2F9qX0SqWjm8gQrbSZ05+TAlot1VSp9+c/FYF2
         2807Lzg1xO/Cgnw+aJ+NNHXZU2FALiCtkrcPpihXiUlYLm3PX1nPZpLFThhQeOLkyDDB
         Nzbw==
X-Forwarded-Encrypted: i=1; AJvYcCX5KrbUCP+nF95jIHqnXhMXAj0q2V/Qx37IQnI0NeW0EUuYYJKAAEN/e8oCr+NkxY1v69+4IJ4+eb1KMRLwTBikNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfI2La8UFzdpTItVoeoJtfbNcdkIOANPSCHuBW4oEV0vflklbP
	Gey4I/HGXf0POMFzNzM+iXGrEsqh3B4xem6LkDZqawnjGmwcdwvL3RwoMwAfYtAiwAY=
X-Gm-Gg: AZuq6aIMDc/m2qt7tIYmJ83OtDSiq3uHYaKY4bFHhusVz3stJnMli1OlMZqZcAIJ3G7
	NI+fNKaidO4VOBf85e93KaHQZ/+TmZGnQRiSGB0LWNd2atFACgR3sVK7i5B3PfRmBe93nz4ti7B
	R5Ioi7DqB5O/nl1wJbnArxbmqUBZOJz6dlkev+T7IfBWxuN54ntMyPy+usSF+e9vYJqW3WbVmap
	99V8JnkTCP38hzJY2BzV2AGhWS0AgiE8CyWBc1Jz5QIsJZg7wVs3s5wfF6f9id+F34B/YwIzzqG
	gMz8xEfDxDtjWLhw0at2hyCga9RPeYWdnqs4Xm67ecJJYzMIrrWZAzHL1ZkHsiPmZ0V5l3gDRYV
	ktUSwLvy1fcYmj9yHeFJpOeOG08AKtBOtJO+tEyd/jiVqEb9lUlndBBr7e3679kdlrL87M0HeKd
	Fbe31jlubnnwY0ghful6c0uquTKdBQqfhMgS/Q
X-Received: by 2002:a17:907:3f8f:b0:b86:e937:d097 with SMTP id a640c23a62f3a-b8e9f3e26aemr502115666b.38.1770302478983;
        Thu, 05 Feb 2026 06:41:18 -0800 (PST)
Received: from ?IPV6:2a02:810a:b98:a000::159a? ([2a02:810a:b98:a000::159a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9feefedasm232471866b.43.2026.02.05.06.41.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 06:41:18 -0800 (PST)
Message-ID: <a4cfeba2-23da-4fdd-870b-6533b5ce267c@cogentembedded.com>
Date: Thu, 5 Feb 2026 15:41:17 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: renesas: rswitch: fix forwarding offload
 statemachine
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
Content-Language: en-US, ru-RU
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <TY4PR01MB142829EB0EDDE13B588F949298299A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[cogentembedded-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27954-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[cogentembedded.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[cogentembedded-com.20230601.gappssmtp.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nikita.yoush@cogentembedded.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cogentembedded.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 74560F42D2
X-Rspamd-Action: no action

>> The driver was originally designed to enable hardware forwarding when not less than two ports are in
>> forwarding state. When only one port has hw forwarding, there is no destination to forward.
>>
>> Nikita
>>
> 
> The current driver allows Linux to use the bridge port as local port to the bridge. The offloading
> Also supports switching traffic to Linux through the bridge port. Therefore, the offloading shouldn't
> Be dropped if only one external port is up on the bridge.

"Offloading" means - forward a frame from one hw port to other hw port without inserting it into CPU 
queue. Offloaded frame is never visible to software bridge.

There is code that allows offload only if the linux bridge device used to connect rswitch ports does not 
have anything else.  If it has something else, offloading is disabled (because there is no way to know 
when a frame can be processed within rswitch hw without sending it to cpu).

Nikita

