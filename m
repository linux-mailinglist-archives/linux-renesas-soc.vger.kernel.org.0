Return-Path: <linux-renesas-soc+bounces-24082-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D47AC315B6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 04 Nov 2025 15:01:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id ADA2B34DBF8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Nov 2025 14:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9310A32D435;
	Tue,  4 Nov 2025 13:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="VKZjUXmd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A7232277B;
	Tue,  4 Nov 2025 13:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762264761; cv=none; b=crKbr1l7SomKuKMBLgaxWMJ23rAiEXQ/pMosWVcmDNSnYy+K39VXnmBJ2mLRMfcS9zuBNgSFu+YdiYZjN+aaHqRbDGZ403ZipQYbaGcS4h56CapZqc2lJGIjkdGRaF2dgjGJw53Cy1lsgfrJ7zX50UJtmKXRRgsddlXyZON1QQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762264761; c=relaxed/simple;
	bh=nWLMb/s8KVjYL6XioH4v1M2npNhdQV2D1W/qUA5aF+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IZjATyd3Sa+dQnpALCGsT7eDIRF0OQo9DunRQi2Bz8GaYvi7gwpJ5ZmWoVnAVSelowSXFXWYLBJxugjFfsNlSm9iLYOFB9Tw/EuHY8gPWivUE6VhFN6yMX/RVhJpxxSG/dKzoKWa3QOeYP97nb5GDxTrWOnF7bWohJweNZEPCec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=VKZjUXmd; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4d196q2BCMz9v6w;
	Tue,  4 Nov 2025 14:59:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762264755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yynEbxXKLUAVQAnHfu3RWqNgiNiS9M9W37sLEp4Bu9o=;
	b=VKZjUXmdJh+KxN3MM9Ebsvt+7cDhjh0+IOrwOtdxrP6cNYxysBBux1bDw+/pHnA3aZtA4r
	gMRQPjaSiI3vm08y/q34UmIW1oVhcl5hFtSbWYI0i/6OmulEnKPsHGC2LZdGYZ55pWWzWT
	CXkI7T9gBzX1wv54B/T4yh3XoIFrxwjnYDfSbID9vaYpsU7RkGQJ+ObeIWvQRzTdeg14lj
	Ff+dTgKgyw1N/W+MfZDgR2OrTGNDi0ygwwyJcQoyzjKHqEf2r3aETUzcLUWxEswbHqNBBS
	FzdrW+pZEuAQs+aubnKaDzrMd0/ZiS5zIz+iYhOA2WVlq9jj5ce9wX6uKxYPGg==
Message-ID: <773b410d-26ad-4581-9de5-a2559891a3f7@mailbox.org>
Date: Tue, 4 Nov 2025 14:59:10 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img,powervr-rogue: Document GE7800
 GPU in Renesas R-Car M3-N
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>
 <10e39887-02b2-41bd-9ed1-f54481a3578c@imgtec.com>
 <1353f904-aa15-4e24-9e43-7b91185bba17@mailbox.org>
 <32d2db33-8477-45ea-ba41-5150ed750a59@imgtec.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <32d2db33-8477-45ea-ba41-5150ed750a59@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: th9rrbeotgywfqmkigguauhk4jiu4488
X-MBO-RS-ID: 43d16fc3659e66fc9c0

On 11/4/25 1:36 PM, Matt Coster wrote:

Hello Matt,

>>>> @@ -105,6 +109,7 @@ allOf:
>>>>            compatible:
>>>>              contains:
>>>>                enum:
>>>> +              - img,img-ge7800
>>>>                  - img,img-gx6250
>>>
>>> Can you put these in the same order they're declared above? The way I
>>> read it, the order is img,xxx in generational order followed by
>>> soc-specific entries in alphabetical order (which is why we have
>>> img,img-gx6250 before img,img-bxs-4-64 below).
>>
>> In this enum, the entries are (should be) sorted alphabetically .
>>
>> Do you want to sort them generationally instead ?
> 
> If we have it wrong and the correct way is that these should always be
> alphabetical, can you please fix up the existing enum below (with gx6250
> before bxs-4-64) to match the constraint too?
Fixed in V2, thanks !

