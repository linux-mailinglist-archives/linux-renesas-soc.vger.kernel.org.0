Return-Path: <linux-renesas-soc+bounces-27549-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IVEBi4eemlS2QEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27549-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 15:33:18 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3115BA2D07
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 15:33:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ABD00300104C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 14:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC3B26D4F7;
	Wed, 28 Jan 2026 14:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="GLlowjzk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C867B258CE7;
	Wed, 28 Jan 2026 14:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769610792; cv=none; b=YOlv/4SVaNNNqKw9wYru3RFz1ARJ2SWa+84V8WKxo8OuZ1P71kWp4TBJzyHK/xM6X0fqCBv4nbQLj1bcqG/6s46iPdtl84k3pWroCHqBxi7skyU+WKFLM1Lid4E/8ZsBXRSQ0krFlHphAXWSvcdJCnj4nWR2tTxYggcI9BmkqGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769610792; c=relaxed/simple;
	bh=UrecRnUlvslYsUiljuUM/4pYScIjwbM9sj1Vmtaapko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LZlS9gxoec1KkF823ICYhduGXqVCia18t6DrhEuWPN3/TnEtsMyhIaGJiCkq2J/H1Z1c6q2w92CvuPHZeUucfmS+t6Z5R7soH7xS1G+R3hT5J/NpF/E3ueQy3W7ktjnyMB5Ngc93y5iJMFezoBsUe86b9ke1z3j5lATS+k/Vd6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=GLlowjzk; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4f1Prg08krz9vBm;
	Wed, 28 Jan 2026 15:33:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769610787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dLVMCXGogj7sIN9RCzxwOPnrNktUHm4xNbMkn6X1plU=;
	b=GLlowjzkJbOpYnIRBQh+vfw0dMKuCqBaHvb8vOrMtmFsz9N6kLGC524Kcqpop8W3MTGUE5
	/RmIFg78Cc+dFKYphidxQSZXwWjzbjygAOUkDs+VWPrUnHJZFGU3RlFmS/fw1akX0r15ba
	cfHT22VLc2YHiW8krfWjnyy2oCmtSumx+iJYm7YWydZByI7Gp+WeQ4jC9qsb0z4tGlWrd+
	qydyKxcwYfuN7CBpHFXwno/7aabXDySHPnOg4FGvVtM72d9LCe5E6jMyiUXfCBID4U5wt9
	cRLfJZu8CrOpM6r7eHuVPKDbIX/7KQo4uiG48mbvjciFO0ku6bblC8zZT38HjA==
Message-ID: <1a2db366-a611-4454-a86e-cf7df9cbc358@mailbox.org>
Date: Wed, 28 Jan 2026 15:33:03 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] linux/interrupt.h: allow "guard" notation to disable
 and reenable IRQ with valid IRQ check
To: Thomas Gleixner <tglx@kernel.org>, linux-input@vger.kernel.org
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Cheng-Yang Chou <yphbchou0911@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jinjie Ruan <ruanjinjie@huawei.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Marc Zyngier <maz@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260121232522.154771-1-marek.vasut+renesas@mailbox.org>
 <87sebrbenj.ffs@tglx> <701e739d-2e82-40e7-87b5-b4ec92903af6@mailbox.org>
 <871pj9alui.ffs@tglx>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <871pj9alui.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: c9dc477dc1515f58b5c
X-MBO-RS-META: hrj98ih6ra6amyj57zpw5xybpfgiw8k8
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-27549-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,gmail.com,nxp.com,glider.be,huawei.com,oss.qualcomm.com,kernel.org,linutronix.de,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:mid,mailbox.org:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3115BA2D07
X-Rspamd-Action: no action

On 1/28/26 2:49 PM, Thomas Gleixner wrote:
> On Wed, Jan 28 2026 at 13:23, Marek Vasut wrote:
>> On 1/27/26 10:14 AM, Thomas Gleixner wrote:
>>> disable_valid_irq is a pretty non-intuitive name if you look at it just
>>> by reading a usage site. It's not really improving the readability of
>>> the code, it's in fact obscuring it as the reader has to actually look
>>> up what the hell this means and then stumble upon a completely
>>> undocumented lock guard define.
>>>
>>> I'm all for using guards, but using guards just for the sake of using
>>> guards is not a really good approach.
>> I wouldn't even be opposed to converting the ili2xxx driver (the piece
>> of code in patch 2/2 of this series) back to simple enable/disable_irq()
>> . I am not particularly on board even with the disable_irq lock guard,
>> or more specifically, lock guard used for non-lock things like this.
> 
> I agree that guard() is a slight misnomer for such usage, but this is
> about scoped auto cleanups, so using it this way makes a lot of sense
> when the scope mechanism is sensible.
It is indeed a misnomer.

Would you prefer this patch be updated with some better function name, 
or dropped outright until there are surely more users of this 
functionality ?

Thank you for your help!

