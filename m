Return-Path: <linux-renesas-soc+bounces-29503-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPKxE20duGlYZAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29503-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 16:10:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB58A29C0C2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 16:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75587300331B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 15:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0917939E198;
	Mon, 16 Mar 2026 15:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="WctOtWCo";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="E00EszFA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AD7303C97;
	Mon, 16 Mar 2026 15:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773673578; cv=none; b=eyMAKI+YIyBf7qsabvbLN1T2a+C0mNjXsdBzP8WszV77Uh3Wpqejg7LQcSGxEIjPFn4VHxHSkbrQbwIUNKT9NcLydaWoYq/1skw4bYp/YuqN9wPsXPz3UNcI3s6giaH2kXXgqUPKpL9PFp1f1dho59ZEA6KrRVt7NeNOjttwBlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773673578; c=relaxed/simple;
	bh=QwogSVYJxVi73zASSiK2Z/YIAJ2sdfoiEUcLhmf1FuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T5EhosMPtMpDoA4u3lxPQmXiZDimRUSp3uKT6Z/zlw01Dw7U8uTZGUEdRxbnRc3XNGaxiP1hFDDMKDWtozaJDL+MEtQx8eg4JaD1pR5+l+4R4J9XbpsY83xtQd1ayN4ahMhIcM/FK9qjNnb6NjVsBPsp7ZxZdcdiAonryan2pww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=WctOtWCo; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=E00EszFA; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fZJMB2Whdz9twS;
	Mon, 16 Mar 2026 16:06:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773673574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oIfQSp2vyfi8CDTYPXYdAA1ZbtTpeHm/bbxBHJ+0vyw=;
	b=WctOtWCoTE54i6E8J+FSA8AWkOY8MtUBvvu8OHsnxN4QkreTobzIxvPooFHHq1Pi7cye5N
	S1HqNYInFfG/dmD3nDirTJf1wr/ByvBC4E2bKkv/Pi0XhlZILCY016oLEXbmOiHMKEbZ3C
	RS6c0u4XCLAN0/hEJ8RaT8KLahWRlnvSeBxBGJYoDooLiqggqIlr6BzI+IihcrydDPWSj2
	XjOZbt4FX+gtv6DVpIfoTH62ufA74tK8jcYX1+k5m+EphZHR77SADDZMIlO8cY+8yHfKf0
	ICOb5htQmjMm8DA+1JAJfzkgHMCVO8RF8FS6lNlBsIQO6VfcdIn7k3Smi+qkTQ==
Message-ID: <96978561-3733-43db-8698-8988dd0975b7@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773673573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oIfQSp2vyfi8CDTYPXYdAA1ZbtTpeHm/bbxBHJ+0vyw=;
	b=E00EszFAGtOQD6lgFo4ZLrxTeZq7diFwJA5VnnKirHS6Sxul/ttCmnXQawyiHlBi/av9Na
	/eyG+yguxwvLNq1pxToUJGD8a4qKxmtqI1FgZ8Xp80WuiSn51nvIEfDCJsrQ9nYfkkj/4W
	SSU2drF61/4f9snEHwVbgvF3c/blDT5ei1ihLBXlXQ4Rk3l5tVxdwGNr1ke30EO/7tm4iH
	Zckq0Lf+cGLnV4yARnbYIXSgY3AarHimsc0QoBPfkpdr6MyC8kFv9ExlKL99jDmy4s2oW4
	UVy9j1F6NjUHcYq+YOjrZAmKBvVJ9peef1dpczqsJkCqbdQAfvYQsYPH1kaXvQ==
Date: Mon, 16 Mar 2026 16:06:08 +0100
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
 <15b47af5-1249-4911-b9de-7ee177740314@mailbox.org>
 <TY3PR01MB11346B2FDD4E9CD1DC1A1BED18640A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <TY3PR01MB11346B2FDD4E9CD1DC1A1BED18640A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 1a803db8a2cf16cc424
X-MBO-RS-META: o7p4hmcsxhbs85i43afzamc3ttxhcqss
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29503-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:dkim,mailbox.org:mid]
X-Rspamd-Queue-Id: CB58A29C0C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/26 1:58 PM, Biju Das wrote:

Hello Biju,

>>> It does not cover all the SoCs/boards. If Marek want to take over, He
>>> can send next version covering all Renesas boards + binding change.
>> Isn't this series effectively exactly that ?
> 
> You have covered only 9 SoCs [1] Whereas the patch series I posted covers
> 43 SoCs[2].
I also did not modify any of the YAML schemas, I only fixed the errors 
that were detected in next by the existing schemas. Maybe fixing of 
errors should happen first, and adjustment of schemas and further follow 
up clean ups can happen second ?

