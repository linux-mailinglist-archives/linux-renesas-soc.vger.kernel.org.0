Return-Path: <linux-renesas-soc+bounces-30248-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJhuOAntw2kAvAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30248-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 15:11:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D49F32683A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 15:11:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3EA3302F275
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 13:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A03D3A5E75;
	Wed, 25 Mar 2026 13:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="eB3A+maQ";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="FDrVHXBT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92643343D7B;
	Wed, 25 Mar 2026 13:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774446779; cv=none; b=oRfiQnJQ7ZAqs8fTmg3fWSEtbaATq0FhVbbsQeX66hECqoQwz4BhM9TKXLrlm8K+l5p5VoK78DyiXyhZODn59XQ60mfJ+5Ezl3Kx6FRiPRFCk0KPf0rlw9dzpDdcHGiqrfRlkCvIUWmF6u/EAHCbu8pLbraiEIKj8sVZ+T1NZwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774446779; c=relaxed/simple;
	bh=PoHaelxQv/9bmMklbE9sHiu+w9EXzNQx2bTt7RlUuVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WDc1Twt9R0QguDL2TrECaijxn6kRf2uglZzSIo7yezd+Zg7GgrS50TUlnKvTIXE7XYzrhJOs6g3tPRAW/W7il2NA3VhzaIfC0K6Gql35dxlzOU2x97B3J1xPmgLQEEuMFaUYoBgWCj2RDaCHI0ySeopdZpH1IJxsCsqEYXIoETg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=eB3A+maQ; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=FDrVHXBT; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fgpJL2kK1z9tyY;
	Wed, 25 Mar 2026 14:52:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774446770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o9OZ4u4cVhWMS+y1LRMtoJYOo8sApnqooCJL/ZNuRAo=;
	b=eB3A+maQj5Rht1YHFdjVOxmefIvxYol6GfZcgQTFvQwqJ8YE0Wkx9Lcgvruc6XyJw0H32W
	01eOwFQbbPQfIa3OQOJSZ6oR1hHUGDTzgFXVdLU3/38p2kJUFL+EliLawzCn+xtxyfK1Km
	LaLaX/IWdQ7MhpoajT7zWhAVJdnTVzqCel8mo5OCk0SklDJvcFuipszaKokEUGH9agU97a
	b9BJN5Nyr+i9Akpa3hZlt/77jh0XXGym3M29byuNWWY5Xwjz3AcK+lOAoYMsK9pJ52pln7
	2hyrLYc/fiwRrMdN1CRzer2oXxEnDBKiiPRILCrrPn+7rTdd1JXCqTT/H1/ZxA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=FDrVHXBT;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <78a1dcbf-64b6-4f3e-8d62-2bb9d26e9e20@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774446769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o9OZ4u4cVhWMS+y1LRMtoJYOo8sApnqooCJL/ZNuRAo=;
	b=FDrVHXBTcltC4Iufktx2VI/LiOCR2aN+YJi+meo2hqbGAFhFds/fqsuL8s70u0ByrB+hMF
	pydDyOXNF36CkKdnr/dymUphQ+pNMX50s8rhySooXkafbpoE3ry7YlLH5N7DEdx7tCPneX
	IeknfI+dzrXwZQy/fGHZjXniwlj7SnDgJSPdR2Z7q5L8gl8rvV7RFkYVHQQzGzIV2lQnzw
	U7805F1o/bl1/wnuNIBDymEPO4N9/IlnwF9a5aAEohiJGQ1b0MLN4X/oScMHCQ5fQhozDP
	rN94bxfAZPy0e7sv/yt6S4SbEha22PutMnZ7lFjPJJCdoRdBRBDl+TKwHRXCYA==
Date: Wed, 25 Mar 2026 14:52:45 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Reserve first 128 MiB
 of DRAM
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260324143342.17872-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVv5KUma8=2T+ibnXyH+45xvqVrQaPho0CSzP1_r+j_hQ@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdVv5KUma8=2T+ibnXyH+45xvqVrQaPho0CSzP1_r+j_hQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 8bf10851b491f6f89bc
X-MBO-RS-META: j75d8ic77jhjuhdeawngtk8aegjzebjn
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30248-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,vger.kernel.org,kernel.org,glider.be,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[35.195.70.0:email,2.98.90.0:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:dkim,mailbox.org:mid,glider.be:email]
X-Rspamd-Queue-Id: 3D49F32683A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 2:08 PM, Geert Uytterhoeven wrote:

Hello Geert,

>> --- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
>> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
>> @@ -118,6 +118,17 @@ memory@600000000 {
>>                  reg = <0x6 0x00000000 0x1 0x00000000>;
>>          };
>>
>> +       reserved-memory {
>> +               #address-cells = <2>;
>> +               #size-cells = <2>;
>> +               ranges;
>> +
>> +               tfa@40000000 {
>> +                       reg = <0x0 0x40000000 0x0 0x8000000>;
>> +                       no-map;
>> +               };
>> +       };
> 
> Obviously I don't like this very much, but I agree there is not much
> else we can do at this point.  Shall I add a
> 
>      /* Temporary workaround for broken TFA BL31 */
> 
> comment while applying?

For maximum backward compatibility even with old TFA BL31 versions, 
which the users may run for whatever reason, I believe this reserved 
memory area is here to stay and won't be "Temporary".

But I will be looking into TFA to fill in this reserved-memory node 
properly for this and future SoCs.

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-fixes for v7.0.
Thank you

