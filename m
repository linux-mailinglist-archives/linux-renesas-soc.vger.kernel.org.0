Return-Path: <linux-renesas-soc+bounces-31519-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDG9FwmM6Wn2cwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31519-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 05:03:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6328644C6F5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 05:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0B3933008697
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 03:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB5DD3C5526;
	Thu, 23 Apr 2026 03:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="o/+KqGLk";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="K4APtoV7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCDA33E367;
	Thu, 23 Apr 2026 03:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776913352; cv=none; b=JloFw2tKYB+UeXpA+9g9p38RSTqS+Dah/WNzFE9Fo4KTVVBK4NqWkKlnr/y9Vtrrjdov4Yrb/OXjtfirSM3d4O7yxErzQkkJV5IvRZjHkjeH7HQ8DvswIS8SeKmf7FFiQli6rqGPRwMVKSllnsz1pYwZWKwBxq7tEGC4AHqx6mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776913352; c=relaxed/simple;
	bh=TjW44CKsgpU5XOGF8TnHuK2ijXifvUYVv7owhV5Ss84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aaOT/0FIKZL9DcNiskBGBI4inb35XcQyZTHnlMMnGkcoV5Xm32iTSH7DNvRyK44pxJ2iqHRfjL7dRnbwpvfX6eewCKOMN4VDGNIci1+48+S2Qy+luTQ+Z7mk2gwr2qYGIRnHxxoE+5r1ZcUxw3J/WbTOz9CxEye/c9NSLs27+H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=o/+KqGLk; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=K4APtoV7; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g1LVY4SHFz9tn4;
	Thu, 23 Apr 2026 05:02:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776913349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wqg20wTmq8Z8TSjsvrM02yefrEnboDHI1it5JnY2M4w=;
	b=o/+KqGLkY3wr3P9i7PxWQ802rlboNPqclymRppllQdQBimXGnwJjPGoJx6gu6EsdGM3yM3
	5xWWd+WIUsTycp9e8DybnqYo1OoaROAxAYEKU/uq/U5TnFSNM7NkUYCQaPTbvPqyMmoYOU
	OHvGyjos2Bzs/oQi+Dzu1mtGcJEupfIUC65O0UT33qOmwMEqh8Um6X1RwrC8Xzm4xo2qLj
	1rCEtOEkmTqaZEgE6FyGig2iXwY28dsBceaNd6UNAvXBs8IKQoy5l8BvhPtZ97Or3fzEO2
	QENbdfdjuRWpB/xlloPibhwlCnb3BRP55RYiVUlld2/BqaMl2IA75o5To2Aa5w==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=K4APtoV7;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <0dd3a417-5da3-4667-92ea-207beaccb42d@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776913348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wqg20wTmq8Z8TSjsvrM02yefrEnboDHI1it5JnY2M4w=;
	b=K4APtoV7VLf6CPP/zTzYnWizNHlTR451lPKQ3iJUsnVhgZQKjuPxXhe2aSDFMqPQog18YK
	C2U7M1/3u0WlSoZPenp6OrPTH5e6JNuco5rqmed0zte49stHHub+VUdvFtl5xtfp2HufmM
	BvCLlp0H87a96J8p2yuXRGDJsnxqan9L6Y6fAXB9Gau6qR9V49lzA9C36OkrIWP7ppBd++
	azH8OAzIVp//8vTVD0ADo3oIy5xSen6NPBWEbqkKLia5m0wrxE39DXtTNLhd1Ay6m9VVvC
	2EnYuRgO3t8zmMvo+JGKabvu/qzqqwdHrpzyw4vzyo5fetZWvkX0QGOI0mtCtw==
Date: Thu, 23 Apr 2026 01:33:49 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: renesas,cpg-clocks: Document
 ZT/ZTR trace clock on R-Mobile A1
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
 <20260415233300.457892-2-marek.vasut+renesas@mailbox.org>
 <20260421-attentive-cockle-of-finesse-e5bfb1@quoll>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260421-attentive-cockle-of-finesse-e5bfb1@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: e573a09fcd5b5d099dc
X-MBO-RS-META: sccnpsjcz81hnkokqi7o699t6n5uzk7q
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31519-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,mailbox.org:dkim,mailbox.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6328644C6F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/21/26 10:01 AM, Krzysztof Kozlowski wrote:
> On Thu, Apr 16, 2026 at 01:31:38AM +0200, Marek Vasut wrote:
>> Document ZT trace bus and ZTR trace clock on the R-Mobile A1.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> ---
> 
> This might affect ABI, because you are basically requiring DTS to have
> additional two clocks.  Probably it does not affect anyone, but
> technically is an ABI change, so should be explained in commit msg WHY
> you are doing it and what is the impact, instead of saying WHAT you did.
> 
> If there is going to be a new version, please fix it and please keep the
> feedback for future commits.
I hope this is addressed in V3.

