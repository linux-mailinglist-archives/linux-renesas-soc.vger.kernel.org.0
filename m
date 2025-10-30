Return-Path: <linux-renesas-soc+bounces-23892-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89036C1DF5B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 01:54:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30FAB1886BF2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 00:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A0421B918;
	Thu, 30 Oct 2025 00:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="kEI1bBYy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E021F956;
	Thu, 30 Oct 2025 00:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761785577; cv=none; b=UqPQ70mayZd3RrklwxrLvMW46ouduUBu5nbzC9mffrsQSrrX/q4zKeCxh75NXwFHdsKtujnwRzmuKrKu/O1l931rCq1UAFDDUpf+0/cOC2CbBxge4wBmtn6j1Tc6L6qDODvGp2oC/bk/fRBiqgGWcFVdYEPk5rRy13B9IVkPlQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761785577; c=relaxed/simple;
	bh=LIztsZWCnsp19S5Dn+/450IkiPd7MZ+AWYnflbZ3Ht0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=up66MaY9YE02xUsBdIowaFQxtrHUHuqV91i/CyybLgYX1kFwac2n8aozh4Nd/gGWbnVQ9hYejBSijs3QZkfJIIA4zhRwvOu5Y2VjPtZ5bm5a06Hk6sj56V8NMtkbY9woIsSw8fWaBsLoqxUE8gXnVTcsvIF3qVzVtNtbGimvzI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=kEI1bBYy; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cxlvd0Hprz9scQ;
	Thu, 30 Oct 2025 01:52:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761785565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IniilaBss4ARvgvSKGFl6OJKKn5eXDeB1rP41HTysu0=;
	b=kEI1bBYyyLEhaTuVznkOU9OUJQPU6XXU4pjIJhf1QXSwTb0uh2uh2IwGh28dDJeCZjZzTK
	DtWIbPfSDMmnGNqf1+YWJqqZeWEcZiw6GJak0wTW7SOilU4bBoAODKKLw4OuH2siLnewHc
	vVKjAh5Yx0CmtFQjNUloAi/e1ZGGDf8ndvO4weaCG2vTllk3hP7GMeX8wHj5znHHbqpz8C
	ZvJ0fw3lOsDOjphHR3xXI3ejXu1sPH/4j3yAZxtBW6XALi4JYUa8KISnK1VxFIss5DJq9f
	ywYnWWdRIP28CQnxUsDhpthZSRUxygTaR+Oc06o1xnwkitIQX/kBy0va5NcnUA==
Message-ID: <5ae0a793-d3e7-45d1-bf5c-3c46593d1824@mailbox.org>
Date: Thu, 30 Oct 2025 01:52:42 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
From: Marek Vasut <marek.vasut@mailbox.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
 <aPoxfH_TLrsMxMVQ@pluto> <70554674-7020-4582-a4e7-dbee34907096@mailbox.org>
Content-Language: en-US
In-Reply-To: <70554674-7020-4582-a4e7-dbee34907096@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: meqz3wrctz4xpsm9cpmk745gwhfgm5x4
X-MBO-RS-ID: 1b87ccad0ed6c2ee2ee

On 10/23/25 4:00 PM, Marek Vasut wrote:

Hello again,

>> On Thu, Oct 23, 2025 at 02:35:57PM +0200, Marek Vasut wrote:
>>> Document new property arm,poll-transport, which sets all SCMI 
>>> operation into
>>> poll mode. This is meant to work around uncooperative SCP 
>>> implementations,
>>> which do not generate completion interrupts. This applies primarily 
>>> on mbox
>>> based implementations, but does also cover SMC and VirtIO ones.
>>
>> Hi,
>>
>> ..indeed I was thinking a while ago about exposing the existing force- 
>> polling
>> switch but in my case it was purely a testing-scenario configuration, 
>> so a
>> no-no for the DT, things are different if you have to describe an HW 
>> that has
>> no completion IRQ also on the a2p channel...
> 
> Correct, at least until the SCP on this hardware is updated.
> 
>> ...having said that, though, usually polling-mode is reserved to a few
>> selected commands in a few chosen scenarios (as you may have seen),
>> 'carpet-polling' non-for-testing for all the commands on A2P seems a lot
>> inefficient and heavy...is it really a viable solution ? or these
>> systems use such a low rate of SCMI messages that polling after each and
>> every message is negligible ?
>>
>> ..just to understand the context...
> 
> These systems are early in development and it is likely that the SCP 
> will be updated to generate interrupts properly. Currently, this is not 
> the case, hence the carpet-polling, until this is resolved.

While I was going through the SCMI spec, DEN0056F , page 209 , section 
"4.1 Shared memory based transport" , bullet • Completion interrupts, I 
found it explicitly states:

"
This transport supports polling or interrupt driven modes of 
communication. In interrupt mode, when the callee completes processing a 
message, it raises an interrupt to the caller. Hardware support for 
completion interrupts is optional.
"

-- 
Best regards,
Marek Vasut

