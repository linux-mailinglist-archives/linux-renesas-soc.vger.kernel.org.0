Return-Path: <linux-renesas-soc+bounces-20470-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3C2B254AE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 22:47:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9267D1C24763
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 20:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E9481F3B9E;
	Wed, 13 Aug 2025 20:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="R8Sfv67j";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xb/2IQWa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D720D2E7BD4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Aug 2025 20:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755118052; cv=none; b=di5e+shIt33pqba7ISq7mC/NJZ2jK4GAzAnbkQjurXHwi+FRps1UDxGKRKNTAryTov3cfSqIAVGC2O0k8LrPrQqb7WdQuGrRuAnjt54JoDlEUFBGrFJuNRSBjJWV40gF8XWuvlvMb9Z7G+Dwr/Wtvd/KneqcL7bdlDDcntyE7EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755118052; c=relaxed/simple;
	bh=1Vw0r2gq8baFCIO0hMyXyyQhs2niJHrkFRxLFBE7lPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Seyj6N2CYSvMe0ZCVFyr9huVvYYQUMugyGsA2LUcgT9Ukkc7Htjo4waR12bGzHRn/ujym+Z8CrdXkWxuqJbCtHVmRDHwfTgshaljDgVPkPPmIdGMaUJcBKco+SUaAqFYojiztEnXxR18FLBtLyOCaxAWHANRnUxy7qXsboRN2jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=R8Sfv67j; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xb/2IQWa; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4c2L686ZDtz9tRC;
	Wed, 13 Aug 2025 22:47:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755118049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VN9+BGPmCHjfhk0B+8aUNVaC320YFcLZHluWvv4S2W4=;
	b=R8Sfv67jWWLwVuncQIGJDZKwJ1g6sqDZR9nWfCFcawKFLiOJa3+YXKDRczLnh/XRIla/Dr
	prz1BtDNy9fVk5joq1lIYnUul4WO4ZCNZ2mi9wtr97xXHDGYc/lTCXg4Ab9TjV2wfiU2T2
	q1lii5NwpgN41tviP1Jnqa00iOuIDwm7M+OBQBnmHCYVIeqA0Ywnz8MHS/MRCI7qklphzH
	R0w9g1y6MIVFJPTQpIgXjMjQIv5pXC0U07Pah1hToyrf7l1RQWzmdhPxWbS5IcLjsAE1JX
	efk8iXTz9V7YzO8czsXfg0qb/EBMqcZWu57R9QqI8odFZcHyjnECql3upvmAiA==
Message-ID: <b8e7a563-52c5-49c1-9117-2d91c6aa7ade@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755118047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VN9+BGPmCHjfhk0B+8aUNVaC320YFcLZHluWvv4S2W4=;
	b=xb/2IQWagm5yZ1E82I6e9kaH6RdM+STHnX8vyUFgB+RLDXqYAkVGrnMNCbEAfW/e88Ww6M
	o52yJNockuJTJk+YNLF4fVPY4LPKfcTmSEgJPunuCsKeEMLrlfecPHa/y9C1B/kioWMAms
	qHt6MNGaq0vn6d/03hjeMV8/LmbHhUKkzo61eD+Xn5Q2EoUHxjdMPhDxCOVFoyneYY07vL
	O9/xe0+JM4oiiQGdhlEemJnbxqz8BPKby97MGwRgRcSrilZtS9cLZrQq7trMNKz3DW/lgU
	4i0czj2Elmu1UH9Kv0X9py4UU95/ETxUlmi7yv+tWur31qF/B8nU6dRyYSC7TQ==
Date: Wed, 13 Aug 2025 22:47:23 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] drm/rcar-du: dsi: Convert register bits to BIT()
 macro
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org
References: <20250608142636.54033-1-marek.vasut+renesas@mailbox.org>
 <20250608142636.54033-2-marek.vasut+renesas@mailbox.org>
 <bc31d938-847d-46a5-af1e-29de3ac21504@ideasonboard.com>
 <7dc2c17d-9879-41c8-b90d-19f92a2d9c1e@mailbox.org>
 <20250812200526.GA12797@pendragon.ideasonboard.com>
 <CAMuHMdVQxEpxgpedHHZguncCjaapLo9t9+OQN0o8CVe774PQnw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdVQxEpxgpedHHZguncCjaapLo9t9+OQN0o8CVe774PQnw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 8911e1q5fi4taopfb5p4c5qycp4en6w8
X-MBO-RS-ID: 400cebdfd8656f0f227

On 8/13/25 8:59 AM, Geert Uytterhoeven wrote:
> On Tue, 12 Aug 2025 at 22:05, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>> On Tue, Aug 12, 2025 at 09:32:36PM +0200, Marek Vasut wrote:
>>> On 8/12/25 3:26 PM, Tomi Valkeinen wrote:
>>>>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>>>>> index a6b276f1d6ee..b3e57217ae63 100644
>>>>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>>>>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>>>
>>> [...]
>>>
>>>>> @@ -51,11 +51,11 @@
>>>>>
>>>>>    #define TXVMVPRMSET0R                    0x1d0
>>>>>    #define TXVMVPRMSET0R_HSPOL_HIG          (0 << 17)
>>>>> -#define TXVMVPRMSET0R_HSPOL_LOW           (1 << 17)
>>>>> +#define TXVMVPRMSET0R_HSPOL_LOW           BIT(17)
>>>>
>>>> I'm not sure about this (and below). We have two defines for the HSPOL,
>>>> high and low. If one of them is (x << y), shouldn't the other one be of
>>>> that style too?
>>>
>>> It is inconsistent, but one macro describes bit set to 0 and the other
>>> bit set to 1 (i.e. the actual bit) which is converted to BIT(n) macro. I
>>> would be tempted to remove the bits set to 0, that's probably the real
>>> discussion that should happen here. But that would also be a much bigger
>>> patch. What do you think ?
>>
>> For what it's worth, for single-bit register fields, I usually define a
>> single macro. I understand it's usually a coding style preference.
> 
> An alternative would be to define 3 macros:
> 
>      #define TXVMVPRMSET0R_HSPOL        BIT(17)
>      #define TXVMVPRMSET0R_HSPOL_HIG    0
>      #define TXVMVPRMSET0R_HSPOL_LOW    1
> 
> and use FIELD_PREP(TXVMVPRMSET0R_HSPOL, TXVMVPRMSET0R_HSPOL_{HIG,LOW}).
> But I agree a single definition is fine for a single-bit register field.

I think single bit macro for single register bit is just about the right 
amount of complexity .

