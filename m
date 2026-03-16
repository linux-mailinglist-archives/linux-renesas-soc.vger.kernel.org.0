Return-Path: <linux-renesas-soc+bounces-29481-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kZtvDYf5t2kjXwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29481-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 13:37:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF04299917
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 13:37:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 49FCA30093B2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 12:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66EF13932FA;
	Mon, 16 Mar 2026 12:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="BESAIN72";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="CoHcL7KK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC99390200;
	Mon, 16 Mar 2026 12:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773664641; cv=none; b=Q8GIVEoL01X3s2w6I2p9zdllg4DsQs7f/X7HtSJeyOZ2D+t6tHu2KygthwrtTwax/gvepCbiYmr8cKaDTu1Wsy/k6xNM7HabxMLWGBU73jPyEsryLrxdrQMvrFcU+ymKyVY9XmRssM72hGpQzM8osz4jDCjQqp1x/ECbW1MI0EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773664641; c=relaxed/simple;
	bh=mKRTPX6DY4IqV/PuiUDo5PuCX/uhXH9mn2QEA5kOYNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UDq5xEBIx0rUfRbBOQPlgrBzquCoedurP35uOCofKdeYRDTtIC2Zn13km7WFpvHVPTZM2EPE9RAdr3jojY3YV4Xhu5ZvTb0bLKs2SjkfVg4gz45O5g4Hg6lBrSk8g2z+wryQWTazBMFVwC+blgYcu33oCGNJihe1u/1TzSlDSXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=BESAIN72; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=CoHcL7KK; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fZF3C2WhQz9tCL;
	Mon, 16 Mar 2026 13:37:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773664631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YtqjrvEqsLsMJSdmv0VvFrGwyA5l9tENmr1MiPP1vjI=;
	b=BESAIN72YvlVuHQqQMBGl/5KGTBRDRp4qJbZFj9RSgRZZVq79QmMCnsUIDbc9GWOia6nLT
	d44grwtQftsSUArzynxhtFaQtbUjS905YEeyKG1g3bw4Lx87v50KROPst6mdeJXN+V/42f
	otIgjtCZqLQ7xQ+HXrH9XkzDMBoWZ8+uDMoWg8J1BaY3myfg0imKFWj7TgKeIiyAsgNnem
	AXOi8ZxMR+5JO06fyU08enwGTUW4A/cDE7wSqDT3KeEsd0a55/OPfb7jXnDyw2+JQYX99n
	nQZVfSrwjIaoCyIwtMUDCnUKGzRy8pDkzuqU/OiT1GWJezSlH7zK6q5GJaxwog==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=CoHcL7KK;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <15b47af5-1249-4911-b9de-7ee177740314@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773664629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YtqjrvEqsLsMJSdmv0VvFrGwyA5l9tENmr1MiPP1vjI=;
	b=CoHcL7KKQK5+sb0oMFrbVgv21wID5IlBb7SfxxPS4viZFvNt2eJu0oVsFBPiKJSmMBOuvL
	Ozi/VCpdY8G8a++wvug1hvpKISvH4mcRsSdsCGJZxwdRQLZxIcnPc7Nqh4KM7rjZUPvdN0
	fB3G6+FpuBGsMzsA3nFfLOFRPKgLacM4geUytkfY5eQVQqtPg/az9hFgvThEeW/BF9lvGi
	OvKa6QAai0jacC2FmZZw8r/3oD5qvYRP8U6cu9eztzcD+xmT+d7ZNubDMdwNUzKwaqBI0F
	TQGaARni6qKSNSGEnzgZ5Ho+eQeXXXA5a6fXjH/Z6gnNP6H11/WJ7fjxsVNmNg==
Date: Mon, 16 Mar 2026 13:37:02 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] arm64: dts: renesas: Fix PHY C22 compatible strings
To: Biju Das <biju.das.jz@bp.renesas.com>, geert <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "magnus.damm" <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org>
 <TY3PR01MB11346A57519DD3EB5BB4456D38645A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdX5+smUnspgxnEy6ewL2-3htqeP-d0kX7muMVp9AAqO7A@mail.gmail.com>
 <TY3PR01MB11346A1E1E15BB94F5C692B408640A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <TY3PR01MB11346A1E1E15BB94F5C692B408640A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 94h6rw7cuogcfuapih3giamtep78stkh
X-MBO-RS-ID: 8d40d4d2f994c65228f
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29481-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[mailbox.org,lists.infradead.org,kernel.org,glider.be,bp.renesas.com,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:dkim,mailbox.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2BF04299917
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/26 10:11 AM, Biju Das wrote:

Hello everyone,

>> There is also Marek's older series ([1][2], as Marek doesn't do cover letters ;-).

You seem to be commenting on a 0/4 cover letter here ...

>> [1] "[PATCH 1/2] ARM: dts: renesas: Drop ethernet-phy-ieee802.3-c22 from PHY compatible string on all
>> RZ boards"
>>      https://lore.kernel.org/20240630034649.173229-1-marex@denx.de/
>> [2] "[PATCH 2/2] arm64: dts: renesas: Drop ethernet-phy-ieee802.3-c22 from PHY compatible string on
>> all RZ boards"
>>      https://lore.kernel.org/20240630034649.173229-2-marex@denx.de
> 
> I haven't seen these patches.

They are deprecated.

> It does not cover all the SoCs/boards. If Marek want to take over, He can send next version
> covering all Renesas boards + binding change.
Isn't this series effectively exactly that ?

