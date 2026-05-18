Return-Path: <linux-renesas-soc+bounces-32764-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHzfETIJC2r4/QQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32764-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 14:42:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D76A56CE47
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 14:42:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EE4F303C4EF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 12:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4CF413D94;
	Mon, 18 May 2026 12:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="aV9XU4nU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575EA413D7F;
	Mon, 18 May 2026 12:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779107962; cv=none; b=pj6Jw6M5FuYrXyiuEC28UNtBPC8rd8QGK0QPrkHdy+B8ZWU8BkxkiF14RHFeAWDpIqn6vY8bY7kpPafc4EGJkmg8eOmrLn+a6vNV8vtCFhXqYLubeV4dfVh0cOJo1f31cBYADuU+Py0KrwktVvRcq8LvxdHaIIcU716tHMPDTYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779107962; c=relaxed/simple;
	bh=9DFPUWo/xhbO7nadFRnr3uICPmucT9jBoHg+R2lnUrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gjt+RZ5mTJqtUMxAKd0XFl0o9Gjo6Ya2VCAW4JiVXdJUIPMuM8+u5BbF4HtSTFXoad+mN/lwCoDQSrgsKvPVTQvGBxvKnUVQSQgiN1Az88yvdE+88goGiAvqd8R6fiIZ67QfzQSHZk1NSdud4JFak4r9JE4jHQLjb1jqF3JL+vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=aV9XU4nU; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gJy6X06rNz9tf2;
	Mon, 18 May 2026 14:39:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779107956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SwQtsH68VPF+LHaAUjoh8HC7NSHn396Czn49ocrEmyU=;
	b=aV9XU4nUc96xqgi0almy3cDyvR3Gdl+jOg2q3Ylv/diL2QZMFKn/LL7q3BmdnPTuLO8H3r
	1ncLzWuRFhj5z6zyRdlt18fAVP1DYIvoaZLFrCUVkrAphbwlFID/F5tuHbZGRGkO4ahcZS
	gsUTG+9oWxjCqWBJAAMX6iBBCAqPKaogfICciC+2cWFR1GmMiVbdxCuMt6KzeM3qdGUH/u
	O3KMJy9l10i3k0y3+eIvmSJuRLuR2Fh0nCCLs29s6BGc7ubvvbtGCwVdg+IytdQRAv3SJY
	cqudrXoD/5B7m7HCjcc7A76QfPkh27zI8mlwKHzNq15Rp01X9SNDkF8shpbyow==
Message-ID: <0404752d-ad50-4d10-bce3-85fcc249b754@mailbox.org>
Date: Mon, 18 May 2026 14:39:12 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: renesas: r8a78000: Describe all reserved
 memory
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260517163212.18016-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVcpR96smOd4sdEXHoRp=WTLLzWNN9hO0P0=ZBTe4fKog@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdVcpR96smOd4sdEXHoRp=WTLLzWNN9hO0P0=ZBTe4fKog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: d6fqep6pemmjf7zkmfn5k7xc3hapw1w9
X-MBO-RS-ID: 1b7f9417d81e0cad594
X-Rspamd-Queue-Id: 9D76A56CE47
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-32764-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Action: no action

On 5/18/26 9:18 AM, Geert Uytterhoeven wrote:

Hello Geert,

>> +               /* TEE TZ DRAM. */
>> +               tee@8c400000 {
>> +                       reg = <0x0 0x8c400000 0x0 0x02000000>;
>> +                       no-map;
>> +               };
>> +        };
> 
> Shouldn't these reservations be added by the bootloader stack, when
> passing the DTB to Linux?

They should be added by the bootloader stack components, TFA and TEE, 
but they do not generate those reservation nodes thus far. TFA I can fix 
up for 2.16 (2.15 is in code freeze now), optee-os will need upstreaming 
of all the outstanding patches first, and then this can be fixed too. 
This is all long term plan though. Short term plan, which also prevents 
issues with SDK TFA/TEE, is this reserved memory node.

-- 
Best regards,
Marek Vasut

