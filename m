Return-Path: <linux-renesas-soc+bounces-33018-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLOSCDloEGpJXAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33018-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 16:29:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED255B628A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 16:29:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 998FB315F453
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3750A4028D3;
	Fri, 22 May 2026 14:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="lRS5zKXm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBEE3FFAC7;
	Fri, 22 May 2026 14:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779459364; cv=none; b=A6FXMnv4EEc0LS3qJ141gAdftum/7ykx7PjJ+riHPTdmZy/FMlkwTFD+AuknNlYbgCKjmSej+hxkQ2qq+E7vAXRDW432rWwOHwYU6qh8UDnXT/zhPbaI9Rny/x7LxFy0cYfLm4dxl9bkoEAtfGzM9VAGrf5WW+1YQmPh42wprvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779459364; c=relaxed/simple;
	bh=pPhbxXWlsRIIZyVPg8jrY005QCZ5AWJQ9v6+n4qMiYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SLU+pny/dZzIcqjHhl9TVTYZz5JbJc1NHnxNIKf3umRtuVwWvY4AwrCj9LH8U59LT8HrjYj/KdG/otMQNZgZzFMGQtZ3inBik+NxkQnDDH1y1/PdkFyhltYYJgaohXCMXz+5zo72W09sOBjY3HkLYGvGqe9LIVn5D/2mZrHZRMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=lRS5zKXm; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gMS404YYtz9tpl;
	Fri, 22 May 2026 16:15:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779459344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iEbqrWvVDYxx+B7e/TxBC9n41trsCgfBY57Po1nlULE=;
	b=lRS5zKXmUGypCwJWAGu0+/cuqA8o4QWQQ1OXi1JXmwGkknuqRY9rna0t3wmr+TxfQJ0MEe
	bQivhky3lynv3S8lGRVxunSMHRnYdZqSy7wLFGLg6rVZtLr5XGNz0VfTVAcU3iAyJP4ipj
	zcffbJnDnccuNsS3+kFCMN0+/JEuqhb3vtFVIVvTC5EGd60HdiHCjxHfPcGnf+0K6UuXor
	m7GutVFr28U2eV516JlX+F9BH5rP6SPPBcZE1CJ+oswOH6iYoM0siWIK/iGQERaoQ1/Pnd
	lolwFkGeVgE+Mq88K4JBPkVjyaT3DntJNHcxlNpe6B73gNtNwWD3HCE40/HWig==
Message-ID: <61f25f94-afc3-4ce1-912e-684026c2ceb9@mailbox.org>
Date: Fri, 22 May 2026 16:15:41 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 00/11] arm64: dts: renesas: Specify ethernet PHY reset
 timings
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdXoRBA-A8e=R8A4QOwdhVf2Xvca+PCD=UaKEjgFZU7RdA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdXoRBA-A8e=R8A4QOwdhVf2Xvca+PCD=UaKEjgFZU7RdA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 2058f61fb9214cbf956
X-MBO-RS-META: cq59w5wg9tz38dpopxqru4rqtc3c3zun
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-33018-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6ED255B628A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/22/26 3:18 PM, Geert Uytterhoeven wrote:

Hello Geert,

> On Tue, 5 May 2026 at 05:43, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
>> This is the same patch for various boards, details are below.
>> The discussion that prompted this patchset is at [0].
> 
> Thanks for your series!
> 
>> The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:
> 
> DS00002117K page 62 FIGURE 7-5
> 
> (and page 74 on the older document I had ;-)
> 
>> POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
>> de-assertion of reset, wait a minimum of 100 us before starting
>> programming on the MIIM (MDC/MDIO) interface. Set DT property
>> reset-deassert-us to three times that, 300 us, to provide ample
>> time between reset deassertion and MDIO access.
>>
>> The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
>> POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply
> 
> page 62 TABLE 7-4
> 
>> voltages to de-assertion of reset is at minimum 10 ms. Set DT
>> property reset-assert-us to 10ms because the KSZ9031RNX RM does
>> not explicitly spell out how long the reset has to be asserted,
>> but this at least covers the worst case scenario.
>>
>> The Gray Hawk patch in this series depends on [2].
>>
>> [0] https://lore.kernel.org/all/CAMuHMdXJvrsXitGagqZJ_STdTTh_s1cBAKf6+esihaVWjfn40g@mail.gmail.com/
>> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf
> 
> This link leads to the KSZ9031MNX part. Correct link is:
> 
> https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031RNX-Data-Sheet-DS00002117.pdf
> 
>> [2] https://lore.kernel.org/all/20260504225428.114959-1-marek.vasut+renesas@mailbox.org/
> 
> Shall I do the big search-and-replace while applying?
Yes please. Thank you for spotting this.

