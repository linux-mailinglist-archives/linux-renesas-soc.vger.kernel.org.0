Return-Path: <linux-renesas-soc+bounces-35171-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /Z8eB850VWqkogAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35171-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 01:29:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A3A74FB9A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 01:29:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=FW+MatIV;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35171-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35171-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F5F630ED37F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 23:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954583D79FE;
	Mon, 13 Jul 2026 23:27:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2153396D2E;
	Mon, 13 Jul 2026 23:27:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783985249; cv=none; b=l2JQeLboAFaxUR4GLumftDykwsTcBA1mrz4il9d/f0Es1/mk/NyDjRoRu82MoDYsoQDlRP+cFHn3s9qj9KC31PU9v7LMqlMX6xRMenbONUJ7I2TFc+wJQ35v98+yuJlZwIDrCfp+po3XEExcFN8z9Ecf4dgA8b5nsyNVcCzeh3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783985249; c=relaxed/simple;
	bh=WTOeZFVwbydTbITC916RTMXGirGA83RvQs9WHFn8m1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e4F/4MNQP/kNmfpSfi/+xkaL5i5mmcgUjQ67+4DkBS+ueNPACwlMd4nC1vpWr9V3GDJW2xuaNBPt/XpyfFDdrdZxwmAyvgrEHA3+tMGCMikV/UBXsB+gdG8eKN9k+h9dlkpJ/646OWR6+QFDEXIL3r5VSnZfLaPbP6mCXuZ2TSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=FW+MatIV; arc=none smtp.client-ip=80.241.56.171
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gzdrX0VmWzMlPJ;
	Tue, 14 Jul 2026 01:27:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783985244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/XH/u9f3n9ze575dKtp+OBjodUyjg/aa/V3GePJcips=;
	b=FW+MatIV82GZ7usqlRMim9OBbQM4Rsy6V89NrvztMMtbJlCy7LJo6DlZaFeYeEe9iNyH33
	ROXKS03mQBvs/OPq4LtSk0ePcJoxNOcaRaAiKfuf/l6NnuLdDWvbSAR3IwKHoHTfVDJYHz
	7Ahgd0WoS8rcSBoLkY5nd0r2Nks/kpOklFHK/2/X2OGQMqQyBz4C7thHddYhJo/1zI+bSi
	DkD1HZB6bVZIkUMdePX8swPJqYiFIttMpLf/iqhJ2xjSjjE/TZJoK/cbqYVJ9XlXMs0SPR
	5NOphRYmYyyKUhNQRDT0wmHu6DtcsTJV+EHCI+bDotLuFHaCihK6TNtCP5TFug==
Message-ID: <2013cac8-d887-4a09-b1c5-6dc9606f16f0@mailbox.org>
Date: Mon, 13 Jul 2026 20:05:38 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] PCI: rcar-gen4: Inline GIC_TRANSLATER offset macro
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-pci@vger.kernel.org,
 kernel test robot <lkp@intel.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260713175400.GA1258926@bhelgaas>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260713175400.GA1258926@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 937e62b771432b11064
X-MBO-RS-META: 1467nai4bxnyrqy9i1zw7971mbwut18b
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35171-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:helgaas@kernel.org,m:maz@kernel.org,m:linux-pci@vger.kernel.org,m:lkp@intel.com,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:from_mime,mailbox.org:mid,mailbox.org:email,mailbox.org:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B4A3A74FB9A

On 7/13/26 7:54 PM, Bjorn Helgaas wrote:
> On Fri, Jul 10, 2026 at 03:35:10PM +0200, Marek Vasut wrote:
>> On 7/10/26 10:30 AM, Marc Zyngier wrote:
>>> On Thu, 09 Jul 2026 21:10:03 +0100,
>>> Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:
>>>>
>>>> Instead of pulling in the whole linux/irqchip/arm-gic-v3.h ,
>>>> copy the one GITS_TRANSLATER register offset macro directly into
>>>> the driver.  This repairs the ability to build the driver on
>>>> non-ARM non-GIC targets the way it was possible until now, which
>>>> retains good build test coverage.
>> ...
> 
>> So in the end, it is either this patch or limit the build to
>> arm/arm64 . At least this patch still allows building this driver
>> with more compilers on the various build bots, so I would opt for
>> this patch here.
> 
> I like the build coverage, but duplicating the #define doesn't really
> seem good to me.  It makes readability worse because cscope/tags now
> sees two definitions without an obvious reason.

I can rename the macro, or ... sigh ... I can reduce the driver to build 
only on ARM/ARM64. Which one do you prefer ?

