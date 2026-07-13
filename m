Return-Path: <linux-renesas-soc+bounces-35169-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Orf1LJB0VWqNogAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35169-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 01:28:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E92A74FB5F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 01:28:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=vPYDZZPm;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35169-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35169-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2057F30B236F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 23:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCBA43D6479;
	Mon, 13 Jul 2026 23:27:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80713B8111;
	Mon, 13 Jul 2026 23:27:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783985242; cv=none; b=rixVQZDlz5F9xs8adXHpzoca7tZtVAjUDdk1uasLQRHyvudynAC6apAAEvmGw2qTrHC+IJn/ev3n8FWUhU2kXNJRgeVTbsimi86V+akOWV4q61RyZI0sOAMZdShv+Hayy0uC8HjBK6QGQIIcXNhQkNnb+JDYGEFal8YQar53sUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783985242; c=relaxed/simple;
	bh=cUBIquBOEoGi3tb6mT6fwEKQy+VY2dI1DlOzD1iD7G8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OLPWMK4RUWShtEf7KJ0L4lFqujINiwA5axQY8fiSH7vd4Z8emaPiWMfpSz9sfLsHWqA3R7KUDneKcMll0aDrKw9sEu+O29K4yZ47AqdSeUz4lXLIJPAq5WONwW3RmcUd3NdENmfI/paH/951QIFuJyReTUgUoCIwIEuCtS1O9yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=vPYDZZPm; arc=none smtp.client-ip=80.241.56.172
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gzdrH2v6qzMlQr;
	Tue, 14 Jul 2026 01:27:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783985231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XA2dLptzhu0nUEfqFTnwynbh4jwI52oxA+77WXPT/Rk=;
	b=vPYDZZPmJmDS9iIJcsWwKna8dAANTT51a58D8WjMr3kqcnWVjk+s4RjYjYvXrYeAbPMZup
	PHI6FHWZzDXCVqIkddK6tQIMeam9f4UBy/5xvSOsoP87MAaW4+Ia/suy865xgWQ5a2yYks
	seW5S9Dc6upEIkp9fdhvnT0d9awgaG8KLs4EWTJdyisKSn6oSxK15DlVA7fSbvVEFdH1Lu
	FoPs6NPDjvO9ih8wzeo3y7diICtCAqPx7VcxW+8y9Igu+a1oPsdp8muN0uPaJR4p22gq0a
	RaNl9wWVSIh1SusamdDaP//0Rt89C01HVQn9OOAESBnyPIY5VepWZZvCSXs75A==
Message-ID: <1d0d4074-90ca-4b33-9bd3-ff27aa0fd4d4@mailbox.org>
Date: Mon, 13 Jul 2026 12:43:18 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] arm64: dts: renesas: ironhide: Describe inline ECC
 carveouts
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260710160450.64967-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUQJ8mzUi0birB5f1KnCMX_QufHTgYB7AW=d3ZoFer+Yg@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdUQJ8mzUi0birB5f1KnCMX_QufHTgYB7AW=d3ZoFer+Yg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: jkiushhrxt7zs11gobawxupzowtdgffm
X-MBO-RS-ID: f81c410024f901d45b4
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35169-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[lists.infradead.org,vger.kernel.org,kernel.org,glider.be,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:linux-arm-kernel@lists.infradead.org,m:stable@vger.kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:magnus.damm@gmail.com,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4E92A74FB5F

On 7/13/26 11:11 AM, Geert Uytterhoeven wrote:

Hello Geert,

>> +               ecc@1e66660000 {
>> +                       reg = <0x1e 0x66660000 0x0 0x999a0000>;
>> +                       no-map;
>> +               };
> 
> Given all DB[0-7]FSDRAMECCAREA00 registers on Ironhide contain
> 0x0000cccc (md.l e98[0-3][7f]450 1), I think the last 3 regions should
> start at offset 0xcccc0000 instead of 0x66660000, too.
> As a bonus, we get 4.8 GiB back ;-)
I asked about that part internally already, and yes, it does take away a 
lot of DRAM. I think it is safer to reserve more DRAM and have a stable 
system than reserve less DRAM and deal with potential stability issues. 
I also think we can always update the reserved memory nodes in the 
future and shrink them to make more DRAM available, once we know that it 
is safe to do so.

