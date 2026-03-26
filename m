Return-Path: <linux-renesas-soc+bounces-30395-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHl6I92ZxWnP/wQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30395-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 21:41:01 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E881D33B7DE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 21:41:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED627300B9D4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 20:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B4603A16A2;
	Thu, 26 Mar 2026 20:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="inGwPJKw";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="XQZqfJv0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF3630B53A;
	Thu, 26 Mar 2026 20:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774557629; cv=none; b=o+IT4i7own0lavTkZMmqX3ICAv+9GSffTTVJ1uzK3Qi37aoiF6qnWGgH9QQ/z6WbbTXEiw/aCzw5Kdx3iyoQLB+pPujKXF4e9vis9tz7nV2/l7d161G/ToBKzus3vy0oSPUbHcvgu7USWFhZRyxhsYg9FsRua2kwPbPFmTx4BNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774557629; c=relaxed/simple;
	bh=8a+/CieD0GhHGFs0zJNBuFHCEbl0c6fVpxAh2+MpsLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nEvZGnDT0BWSMdzG+Jvj9l0UzhOTgjrFErM0HW+pK90JRypD24e+yiRJ1J/XFg4ZRTrwNBFeO+XSgNojtU+bx3NikIaCN03IEmKJuBrh5qxXf92fWQbY6VjBZjorvUE/RPYfNgHFsm2RLXktKt+Pfvx3XKFaXPuLYDKPoS6Kzrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=inGwPJKw; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=XQZqfJv0; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fhbJ328wGz9thj;
	Thu, 26 Mar 2026 21:40:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774557619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uwxYm6b4gzNXkghMb09qSf9ltTkLFWhWb7e84RMEH2o=;
	b=inGwPJKw2ZKqtUghNNDNo6RahTUjv/uTihaDUEYunKvzDJDN8WOwg70KoHFie69cErA0Pp
	YFkNhzhhjKLU+9itkgtq5XtATM0LmIBuowW8Q4GU2ajZdtEuptVxe9K4bOQ/hNGj6eyq76
	F6A3z3C2HBYlfBzVW80BVJsf2j1xzPxJy0PUKYHmt+vwTchy6FKt5ThfkxGgVnOTM/HN2R
	tOOirLoTgGbWtYmyEaKagH7ly4/zhbczFOu5FEHBywS6r6t3CP75nKDhgdyT7uBO72cP9u
	NrpXXSqtauvlNh83MmeACzUGEdhKF4tVFfulLwMrUSXPCs0P+4+Q6lFGEMoNaA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=XQZqfJv0;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <2ad69ee6-9170-46dc-a963-71f327192bad@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774557617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uwxYm6b4gzNXkghMb09qSf9ltTkLFWhWb7e84RMEH2o=;
	b=XQZqfJv0+w8bL27DFlE4QIYWHH7et3lrMK9NYA9rLMj5SDvU44KwxfTVX3P5peYsLneBZD
	l3jIXSuIguZVXhGfdVHGIt3Zm9QEOMPWgAopx9IzOEmC2ZoWnhJRcaG4g77ly1T13DNnSN
	woa/UXmguaYmbzkJEx313N3toGxk0PGk92AdLf6BqH7goiyTeekfBt72XzdZxOgeexbHeN
	hm0sKruiiUhec58jvjAdfB9K5RD0odIKAL4JEoO+0vUm3tGzCJOBPYvqMmgSvSh/oMkozi
	q4pyvNnwFDw9YdSAhbgC3v5tASUoCAtl6/tnpdLR8hB6BTD/0ncsKScQ+9HDzA==
Date: Thu, 26 Mar 2026 13:49:34 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] arm64: dts: renesas: Fix missing cells and reg
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVtea9q1Yoaq1sEquxEAnQ-armLRdO1cMtJnp2K2mYtOg@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdVtea9q1Yoaq1sEquxEAnQ-armLRdO1cMtJnp2K2mYtOg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: s3nhmh9fqayeirbex9kzm9hxj798zp68
X-MBO-RS-ID: b89e9bfb6c652140b90
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-30395-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email,mailbox.org:dkim,mailbox.org:email,mailbox.org:mid]
X-Rspamd-Queue-Id: E881D33B7DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/26 11:07 AM, Geert Uytterhoeven wrote:

Hello Geert,

> Thanks for your series!
> 
> On Thu, 26 Mar 2026 at 05:24, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
>> Add missing cells and reg DT property into DTOs to fix warnings like this:
>>
>> "
>> arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso:30.10-34.5: Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@1: node has a unit name, but no reg or ranges property
>> "
> 
> All of these are dtc W=1 warnings, right?

Yes, I slowly started linting and validating the various DTs we have to 
remove leftover warnings.

-- 
Best regards,
Marek Vasut

