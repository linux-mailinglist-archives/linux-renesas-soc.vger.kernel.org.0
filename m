Return-Path: <linux-renesas-soc+bounces-27098-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A307D3C49E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 11:08:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 95D956C6C44
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 09:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC22A350A2E;
	Tue, 20 Jan 2026 09:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="vyE0oalM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B603BC4E4;
	Tue, 20 Jan 2026 09:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768903162; cv=none; b=LFGXp0e50utqbDRlxfPuafZSlxkkTrj40ZfsN9Tg+6bw0RuS5xQGHz8YAvXg7D8z9M4r/+OfrAo9i2uMXF9xPTCQuXX+hZA2tb9689wZu0Ecq78r6WebBpLqJyr3bNwWbMklNBIyYWRGxauSpfbKtP2QENH0ZHa75T4pXZrq354=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768903162; c=relaxed/simple;
	bh=KsXTxhw/FCt6iktKIcL9L2KBZh5XM5570tm4QHU4ZG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IqEb5oeChH1RCsSnozfpy3a7IeWWBAat0dVKq4NOkUc9myvi6ORXAdhGI7rgrg3x8chotwcORziDNzSpb1HFzfFC2bTPfpEAeMrKcisXIwp74ijZVn8MPfQciUSkly6D3Y1LGS4OWNgPjJEedEYXHNSYWAJ1unUYcrs2KH3errM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=vyE0oalM; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dwN8P1djBz9v4c;
	Tue, 20 Jan 2026 10:59:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768903157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HqQ5oQ5ZE0vnjaJiWS061etez0QGOyLm2rhNRT0GO9M=;
	b=vyE0oalMmMdTVQxyAErA66P/Te+6OdQJd11rm39F4k8g5/K0aTtu8+f4TAtL5MDiT5Od0f
	dCnHGx1x8maN+7z6WKc9s0yo7SAAhEAnvCZvCQeN1/6rdhRMajrk7aMzCgrns+npytKfK+
	LzQditNawinAcRWjYoPUnVXfkLozzy5tbLXOf4qN1sFk4n4tj0e1sz9QUcldix5RzFMc3u
	4RHeOkhladesK8BZRRoUSiOvKPGV+6V91lIvK3xgLzBUmK1EVFGmEQOJXO8wLJ0H0mpqM+
	Hw7igxlbWfnYrqZC63jl2NSl/FFPvKDEGPgnapnSE/mA00BKgme6dd0IOX/8qg==
Message-ID: <6d7b4e5f-fb33-47f7-8600-4127d2eef069@mailbox.org>
Date: Tue, 20 Jan 2026 10:59:15 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] clk: rs9: Convert to clk_hw_onecell_data and
 of_clk_hw_onecell_get()
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <a6dce17b15d29a257d09fe0edc199a14c297f1a8.1768836042.git.geert+renesas@glider.be>
 <d921ff48-caa3-4d79-80e8-35c4848258da@mailbox.org>
 <CAMuHMdWfEHcNwPCVPXeAO3Sk8U=p0nMVUksiwmMnnkf0LYmnjg@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdWfEHcNwPCVPXeAO3Sk8U=p0nMVUksiwmMnnkf0LYmnjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: pxxdzz4bjz6mgso4nq4yuu46ngpb81bz
X-MBO-RS-ID: 5b57db8c2ba6a9c9a90

On 1/20/26 10:12 AM, Geert Uytterhoeven wrote:

Hello Geert,

> On Mon, 19 Jan 2026 at 20:36, Marek Vasut <marek.vasut@mailbox.org> wrote:
>> On 1/19/26 4:23 PM, Geert Uytterhoeven wrote:
>>> rs9_of_clk_get() does not validate the clock index in the passed
>>> DT clock specifier.  If DT specifies an incorrect and out-of-range
>>> index, this may access memory beyond the end of the fixed-size clk_dif[]
>>> array.
>>>
>>> Instead of fixing this by adding a range check to rs9_of_clk_get(),
>>> convert the driver to use the of_clk_hw_onecell_get() helper, which
>>> already contains such a check.  Embedding a clk_hw_onecell_data
>>> structure in the rs9_driver_data structure has the added benefit that
>>> the clock array always has the correct size, and thus can no longer
>>> become out of sync when adding support for new rs9 variants.
>>>
>>> Fixes: 892e0ddea1aa6f70 ("clk: rs9: Add Renesas 9-series PCIe clock generator driver")
>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> ---
>>> While this patch applies on top of "[PATCH v2] clk: rs9: Reserve 8
>>> struct clk_hw slots for for 9FGV0841", it can be applied or backported
>>> without, by ignoring the change from "clk_dif[4]" to "clk_dif[8]".
>>
>> Since the 9FGV0841 is the biggest part in the 9FGV series, the one-liner
>> fix I posted is better suited as a stable backport. This rework
>> shouldn't have the Fixes tag, since it is only that, a rework.
> 
> This is not just a rework, as it also fixes a second issue.
> But since you prefer simpler fixes, I have submitted a v2 that just
> adds the missing range check[2].  We can revisit the conversion to
> of_clk_hw_onecell_get() later, after all fixes have landed.
This is nice, thank you !

