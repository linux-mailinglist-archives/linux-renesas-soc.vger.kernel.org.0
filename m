Return-Path: <linux-renesas-soc+bounces-31573-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGuYLtAK6mnFsgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31573-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 14:04:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CAA451B69
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 14:04:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 630403005A94
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 12:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB2063E929E;
	Thu, 23 Apr 2026 12:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="vc22Ys8m";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="kAdSidQZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B0C3E0C7B;
	Thu, 23 Apr 2026 12:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776945852; cv=none; b=N7hipsMezAVeBLGFCpC2rH1VsZ8DjuvuqDnGduRTRy2LojWzUjJs5o1kdzDWYENmhbURt81Anvg8RjbshWT38toDpTl6KcEunz7Z4AAbJt1hvnmV6fQQdP9njJRpY1Coksh+fKuJ+k7+Kf1VIJa0iH5WiUrJRRf7QgKhT7HObjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776945852; c=relaxed/simple;
	bh=wF1sSE88mFTZYVL6I2iywx1vtTst2NH6hybuyhiSjAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rsp6BbWLQMvAaZCMTU5ABbV6bvQR+PsGDW1MzF502WYHBGifag1OQQ4pi5unPQ3xnHu+PBcpUnmQDXUmWUv3OMSoBfJXutheXjkDmibjFAJv19E2Vr0SjIi878CcbDhREAaGB1PZXISm04SboIS5fAjWFEjHIjVwHkZzZ8Ap+Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=vc22Ys8m; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=kAdSidQZ; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4g1ZWW6cZVz9tcZ;
	Thu, 23 Apr 2026 14:04:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776945848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LZ6eAskc0SjvK0cbtp0eTdGWooXU74WxP4QkBVjTPwI=;
	b=vc22Ys8mO4lCpBbBJzWUZaYex6UVwP0T6b38CxYAUBXBy1ycKBsVEUcLQfjzQoFjIlaSA4
	NVyUCDNyn1agESjGVb6DGnkKVYYuVNJLRAAgdDPx0LBMksqpwD2iRgBcZ4Xy8vZT9nbmDD
	hvipyUkdNLwoiN6iUAxVROSnekzwM0cYD9fnerQvePRv/EHJX1MBNraw5vek7o0GWT+vK+
	h89kAtrdLgNKwxCA93NYsx0K8p4fhCDeN/pFaXa4ZA1pyiZsUi1e1sD5WgiTzYyWim3g5G
	kIqQqPKy7Tv3VjqNyLXXa5reis0mRBdzt4pORY8ie/0Wle9J+eKZB+vOfmePXg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=kAdSidQZ;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <c9ef9d73-6f1b-42ea-b5f0-09fcf904c78e@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776945844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LZ6eAskc0SjvK0cbtp0eTdGWooXU74WxP4QkBVjTPwI=;
	b=kAdSidQZWvcnIbb1jopdE6erSur+0eBatbUmq3GW3hrZTPo6OjuZfWqX2XEHQqOb6usqUa
	/MD4TaQxDGGLZaJqRT5DP89hYeLTjiKNoUf+CbT8TxUuOtOhpnlw3/WscfsmZ7USxl5ZKm
	XJsEI/2+5de+AWkHF3GdgJzQ1JZLAbYjbYNQiQdQmVa0L8oMSxjNdAzMODbvXGIqnao+MF
	Wfwyun1ZJT4S9DI5I9J+oKFJO2KNGi4CNdjx0QyYa5+9e92xKBuGrU6rYJPgyc5ApXQ5gm
	r4OF47Ej08WhwOaZBreJ+wdXLqMETVJan2nDB+0xopi2Essr/kRH7jme47w80A==
Date: Thu, 23 Apr 2026 12:00:01 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/4] ARM: dts: renesas: r8a7740: Add ZT/ZTR trace clock
 on R-Mobile A1
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260415233300.457892-1-marek.vasut+renesas@mailbox.org>
 <20260415233300.457892-4-marek.vasut+renesas@mailbox.org>
 <20260421-cherubic-urban-beluga-49ee00@quoll>
 <0f933506-c196-4503-844f-2a375e2cf690@mailbox.org>
 <161eb29f-2d07-455a-bd74-4f22061b5dfb@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <161eb29f-2d07-455a-bd74-4f22061b5dfb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 4rurf9ku7rt7u9f8jrock8stus9woi4h
X-MBO-RS-ID: 74424914be6ca4b683f
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31573-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,glider.be,gmail.com,baylibre.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,mailbox.org:dkim,mailbox.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 10CAA451B69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/23/26 11:26 AM, Krzysztof Kozlowski wrote:
> On 23/04/2026 01:33, Marek Vasut wrote:
>> On 4/21/26 10:02 AM, Krzysztof Kozlowski wrote:
>>> On Thu, Apr 16, 2026 at 01:31:40AM +0200, Marek Vasut wrote:
>>>> Add ZT trace bus and ZTR trace clock on the R-Mobile A1.
>>>>
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>>> ---
>>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>>>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>>> Cc: Magnus Damm <magnus.damm@gmail.com>
>>>> Cc: Michael Turquette <mturquette@baylibre.com>
>>>> Cc: Rob Herring <robh@kernel.org>
>>>> Cc: Stephen Boyd <sboyd@kernel.org>
>>>> Cc: devicetree@vger.kernel.org
>>>> Cc: linux-clk@vger.kernel.org
>>>> Cc: linux-kernel@vger.kernel.org
>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>> ---
>>>> V2: Add ztr/zt clock at the end of the list to match bindings
>>>> ---
>>>>    arch/arm/boot/dts/renesas/r8a7740.dtsi    | 2 +-
>>>
>>>>    include/dt-bindings/clock/r8a7740-clock.h | 2 ++
>>>
>>> This goes to the binding patch.
>>>
>>> Didn't you have also a checkpatch warning?
>> I only got this warning, but the docs 1/4 and includes 3/4 are a
>> separate patch in this series:
>>
>> "
>> WARNING: DT binding docs and includes should be a separate patch. See:
>> Documentation/devicetree/bindings/submitting-patches.rst
> 
> So you did not implement it... Include goes with the binding. Always.
> Look at other commits.
The warning says the exact opposite thing , does it not ?

Maybe the warning text needs to be updated ?

