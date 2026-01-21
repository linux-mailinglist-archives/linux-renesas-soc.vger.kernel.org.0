Return-Path: <linux-renesas-soc+bounces-27187-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OL/7B36pcGnwYwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27187-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 11:25:02 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B816A55294
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 11:25:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BAE9564042E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 10:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15377480343;
	Wed, 21 Jan 2026 10:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="SZA7PsmK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3EE43C066;
	Wed, 21 Jan 2026 10:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768990008; cv=none; b=dCstsvg79Xh7FDx4cwYz7vNgMgrFG6Wl6YMtaHOI+GIooFThbZAAun8qY30WK4U1g8B2Ocg/d1YotZiMZgea9yFeTAQMXRiA6gnRiMAId9F4lS6sCDWDGu/xiMVZEj3PxlDbffjm/dpZWFegzMX8Is4ZyMOP9HJt8iuV5nV07mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768990008; c=relaxed/simple;
	bh=EIr0H3QzcxeQI+iM14EZQvj7pqlo4qG/bQ5j6kH556Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sEbQBABhK1uegDWO/bjGilt6qaF9S+pS8wauUTnJAhgmwAjs+vWjK5tHoeejgnQ33mZPBdVjZwhEU0wbY3KUjS4L6rw6u32NOApa0vx+gDzQdhRqRMdHf7bexfW+a7B4JRSI21S4kXpz1Exh2fEiiE0eu0x/1pKBnNOXQgZ9HrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=SZA7PsmK; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dx0GS2hCdz9tnv;
	Wed, 21 Jan 2026 11:06:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768990000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0y6EFZTNf6M4KpxTP2xOAcMrDMy6ctYywtbB88AC34U=;
	b=SZA7PsmKv+cs/d40OPKibpXpT5IVBVhPm2A+Xo0z7Gh6yHQKlx07XzAcvzj1vpKGZ6/HGp
	yLASP7+HvBoWlqevaHK9nDiv9D+zJR/MK4NcfzvmA11/qSkB/26atzZVdHCkj4GX9xwauD
	BcpZyBiUh0PZBzNWNS4ArYUSzIghnh9LBejEB+2/9rHlmtbuyQMSPgHOly1aUQVtSLD8Re
	YBAxLfG4ry7meVxiA8GAogHm8fndLtOAMCXZwlbJVuTVU9LLlMdYFXBybugpvaWelDwrH/
	Qw5VVQFFBuSG0DeAPZwTu7G5GJ5OlKRli8gyrxNw6464T+scnWDY3KxRWq8Qpw==
Message-ID: <c0a83ab3-c9b7-48d9-9eb7-916e97c92ed5@mailbox.org>
Date: Wed, 21 Jan 2026 11:06:38 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] clk: rs9: Add clock index range check to
 rs9_of_clk_get()
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <4cb63bd8b1e49407831431fbc88b218f720a74fd.1768899891.git.geert+renesas@glider.be>
 <10de432d-b38a-4fe2-959b-d9fa4e08e6c1@mailbox.org>
 <CAMuHMdVqRh5B3o5DA=5GU=HBcz-ZeQkCvRVtqOY4tE9H-FHN=Q@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdVqRh5B3o5DA=5GU=HBcz-ZeQkCvRVtqOY4tE9H-FHN=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: q9iuus158ciorc1uxtegmriz1sxjcn8m
X-MBO-RS-ID: c42b6f00ac8d7ace3ae
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27187-lists,linux-renesas-soc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[mailbox.org,reject];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Queue-Id: B816A55294
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/21/26 10:34 AM, Geert Uytterhoeven wrote:

Hello Geert,

>>> diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
>>> index aa108df12e44fb9f..1adc5365ba1a3d59 100644
>>> --- a/drivers/clk/clk-renesas-pcie.c
>>> +++ b/drivers/clk/clk-renesas-pcie.c
>>> @@ -277,6 +277,9 @@ rs9_of_clk_get(struct of_phandle_args *clkspec, void *data)
>>>        struct rs9_driver_data *rs9 = data;
>>>        unsigned int idx = clkspec->args[0];
>>>
>>> +     if (idx >= rs9->chip_info->num_clks)
>>
>> of_clk_src_onecell_get() does a pr_err("%s: invalid clock index %u\n",
>> __func__, idx); on error, should this function do the same ?
> 
> I can add it if you want. But this function will (hopefully) be
> short-lived anyway.
This will be backported to stable, the rewrite to onecell won't, so this 
will be long lived in stable backports. Please add it. Thank you !

