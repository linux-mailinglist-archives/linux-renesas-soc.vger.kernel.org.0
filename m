Return-Path: <linux-renesas-soc+bounces-28741-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Jo+ONOvp2nAjAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28741-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 05:06:43 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 871551FA9CC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 05:06:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E1E73303E68E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 04:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76AEE37EFE1;
	Wed,  4 Mar 2026 04:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Z3G1ig/R";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Fwd7Nv6U"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB2C37E30D;
	Wed,  4 Mar 2026 04:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772597201; cv=none; b=Kt8luikitGVDvJEonu5m6uX+HtekntOUAixo5gvO5GCV858/idbcTZRvGxErSv1qykMvgAxuTNu68rOvaG4oh9M9y6/bNUz2CrsH3qwmHqEifRv/AngdujHa9DkZ62V8IvZCMPQxQjHf1ZyAi25rXscgkTrw88L0cFVJ8xy9Tjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772597201; c=relaxed/simple;
	bh=2Xo6gAecTWyPkwwPJ0nKXG46qtFHziZbhvy+RULr8jA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tQHMYR9BjK98TwIRmQab1gTPVF1v4VnvI3wbK8DP9MRSj73YQ3NtOThE9Ymz+G8KjKiruvh2yEQz7t0Z4PDD2Ndrxf9FRHqRu1p33raLn6/OK+o0r8NzNuIJwrIINiKxFFr3n2ooalYo8UnOezHfRYN2DVbf7ra2nhsqBVBfPmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Z3G1ig/R; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Fwd7Nv6U; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fQfHT6mgGz9tX6;
	Wed,  4 Mar 2026 05:06:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1772597190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i8fdlXVX26MwcNio8HFgqq2WGnU2ojoh4wnFFfsJyso=;
	b=Z3G1ig/R9gq7km2xC87D/XsDXEFqPX8BH3O3a/2kOTAyYwZNsUcCrOK534XnrYmoPjy1TQ
	iYFQgtzY2TLc3NpmWqeVkHad6PNfkTj/JTrw5MGwc28VBqC2clRFBoXL7B4aYaTdSuqtUQ
	62GB1DSRvKD2oEJ7qn0f/akv9qAxNF07zxPyqssJRx/qJUP64qbkiGUYOvSWUgqxYgjTKA
	NZOhu2Gp5PU6lneDqi2twKfMBsKrfTMbC/J+Hf1U8sMnXNcKO3vGKUVi5NjeydGcW3eY0v
	wG4Vhsq5597lg3boqRWmlBWZe+eatjFpAeAN0FKRfmJJMN1WY4MI/bJNsB8fZg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=Fwd7Nv6U;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <e6c16dda-ef03-496d-aae9-1b872d362fb4@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1772597188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i8fdlXVX26MwcNio8HFgqq2WGnU2ojoh4wnFFfsJyso=;
	b=Fwd7Nv6UUoUecnJQ8i6xYfceIVnQ6HwlswWSd+7xg1F6aJI8bRl/KGZCgd1I7B72r2E9Z4
	zMIJOGdCVqTcP4VjdEGmzQ4l6CB1yTbxoFCf+kSTtkgJtx97BWe7HSxHncmKY8gcEcCYDi
	Lgpv0Bn0grwoAmA7PYghH0rIxv+jHN8jFkm0p0L75wsSpum4n0ELdGeQlNBoup535i5rG2
	1muVlhms+w7fjofkOLwfiTljjEnzkMPgXCcX6hfglY3uUL7VGH6DNWIe5Sj2oANGwAFdTx
	79TBVUiKIPve16qs7MV0e0lbmwBmFCwmUzgbcQABhpyXYqEcws902HSNdzujJg==
Date: Tue, 3 Mar 2026 21:57:38 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] drm: of: Fix drm_of_get_data_lanes_count_ep() return
 value documentation
To: Maxime Ripard <mripard@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260115024610.661624-1-marek.vasut+renesas@mailbox.org>
 <20260303-uppish-finicky-mustang-cd135f@houat>
 <CAMuHMdW4HwgwiBJFkA43MpYWOScG8n7p4p3_KBL+Cg3_P_a18w@mail.gmail.com>
 <20260303-delectable-just-clam-d25e08@houat>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260303-delectable-just-clam-d25e08@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: eiuqb5g46pfy8jydnkd4w1sqf1tzfnb4
X-MBO-RS-ID: 54b7360457c09a17b8c
X-Rspamd-Queue-Id: 871551FA9CC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[mailbox.org,lists.freedesktop.org,gmail.com,linux.intel.com,ffwll.ch,suse.de,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-28741-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,mailbox.org:dkim,mailbox.org:email,mailbox.org:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 3/3/26 9:39 AM, Maxime Ripard wrote:
> On Tue, Mar 03, 2026 at 09:14:53AM +0100, Geert Uytterhoeven wrote:
>> Hi Maxime,
>>
>> On Tue, 3 Mar 2026 at 09:07, Maxime Ripard <mripard@kernel.org> wrote:
>>> On Thu, Jan 15, 2026 at 03:45:53AM +0100, Marek Vasut wrote:
>>>> Update drm_of_get_data_lanes_count_ep() return value documentation
>>>> to match the drm_of_get_data_lanes_count() return value documentation.
>>>> The drm_of_get_data_lanes_count_ep() is only a wrapper around the
>>>> drm_of_get_data_lanes_count() and therefore returns the same error
>>>> codes.
>>>>
>>>> Fixes: fc801750b197 ("drm: of: Add drm_of_get_data_lanes_count and drm_of_get_data_lanes_ep")
>>>> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>
>>>> --- a/drivers/gpu/drm/drm_of.c
>>>> +++ b/drivers/gpu/drm/drm_of.c
>>>> @@ -539,8 +539,8 @@ EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_count);
>>>>    *
>>>>    * Return:
>>>>    * * min..max - positive integer count of "data-lanes" elements
>>>> - * * -EINVAL - the "data-mapping" property is unsupported
>>>> - * * -ENODEV - the "data-mapping" property is missing
>>>> + * * -ve - the "data-lanes" property is missing or invalid
>>>
>>> I have no idea what "ve" means in that context. We should rephrase or
>>> pick something more obvious.
>>
>> "-ve" = negative, "+ve" = positive.
> 
> Thanks!
> 
> My point still stands though.
What would you recommend ?

Note that the documentation for this function is aligned with 
documentation for drm_of_get_data_lanes_count() by this fix, and 
drm_of_get_data_lanes_count() also uses -ve to denote negative error value.

