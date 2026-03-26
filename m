Return-Path: <linux-renesas-soc+bounces-30340-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALlsFvctxWnb7gQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30340-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 14:00:39 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3AE335A21
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 14:00:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 238D8312C85D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 12:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B73E269CE6;
	Thu, 26 Mar 2026 12:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="YTUZUxBJ";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="MEKXNnKQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB43D2367CF;
	Thu, 26 Mar 2026 12:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774529543; cv=none; b=MkhAGk07Fxku9mCbm8tHX70X4JXo3hKptMJBUDiC7C3KGJEPquhyKpJmM6vZTI0iLK2AznrNSxqM4aZfeEW5DoblghcDEm1WYOI0HzsuuAyB4Ftaue1HJ4wTEKdfrCSWjAr7Wm7rXV89VbOkJP4VU1SHMq5cJy8yPADKHxxGxfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774529543; c=relaxed/simple;
	bh=6VTGxkyW4cvcq2uXEpakbEWpEtG2wAQ9UNwAI15+iYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=inSCGgCG8TsO6YTNLW1ZY8fMuYufyHGS0F09Clf9HqbrjlBxSBrL+lKXGYrmqRrGDqJ6oc//LIa4Hs9LT4kTxUGYjVlfFc6H5m5Xi1jFdM9eoV9jHc8oDrRU4Ys9mPZ2DowmQcf94mnFod8SetVHOYx5GEfbnmu7SqH7Y3qlxTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=YTUZUxBJ; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=MEKXNnKQ; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fhNvv6ZCHz9ttG;
	Thu, 26 Mar 2026 13:52:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774529532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I9Chy8AgzevwPYn3/hEg4YkH331ROLRWKE0sUs35RwM=;
	b=YTUZUxBJ3RzbZuMkbGTZyU2cHqO5J0MT0pTPXjOb2ufwyEWX68TABeLbIdZ6TTFW8NEUOE
	P1+/i2GWHb1Cib/0vLXXR6g7XQUeUX/hO1Whwl2tcp5uNzbJmRznafMAjZHjyY/2km/S1M
	gT3etrZkBCwElSlOKKu9a0W3DI9iX0q1yEzOZEkaQAEPf+h2IEm7Cn5Rvz6Qvsdrcgghpz
	R7hlL4mrxyK/VBB9KpDJj5pi944csDVKuECCPMet9ZczEuGcLXK589E4Temv0hz1gXWtKz
	rGnJoiAQzqFUrVMlFYApYJ/TBW8FlNf8+WTmMz2SHWYqhcKuGBredCBIkiJqcw==
Message-ID: <d6696825-f739-4427-bb60-abf8afd82b66@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774529530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I9Chy8AgzevwPYn3/hEg4YkH331ROLRWKE0sUs35RwM=;
	b=MEKXNnKQsTujq/wMDVDbuIdq5AnzVzA2L09JW/JbiGZfyOu3FYlqpvMBmY2GUCMUEuAMBV
	nQtejxsfaEMlF2MMKxv6dyrLQTs+myKV94u8hCtg2A2Eu+LrHZhpW687mcYMXUKiMYXJ7K
	QMaSwH6OMgxcDkR29L1ddHEY/vT0UOFwpJHCVTDD6geM9dwIViDOAESqUZd4qEzlO7wXgK
	4t2gEG/OItcvI0DW9GXe5R3shX0MJEHiHJecdGyUHTMd8vWXUSmpb1TtOIvgA0mHKaYiSg
	BqVyXddH4uXWUbwNcdgCkBDuxgA6xghOJy4MoCDY4ervnisz3eDucMI2mZnNRg==
Date: Thu, 26 Mar 2026 13:52:07 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] ARM: dts: renesas: rza2mevb: Drop RTL8211F PHY C22
 compatible string
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260326045416.223556-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVwa47N2VsvH8pBkAD215dr3M-qkA0SXed0vhLS2-aoKA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdVwa47N2VsvH8pBkAD215dr3M-qkA0SXed0vhLS2-aoKA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 0aa1a6b254c98a861e0
X-MBO-RS-META: 89mianiegazzsg9eorrsbp6xffnu78nw
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-30340-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:dkim,mailbox.org:email,mailbox.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4A3AE335A21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/26 10:45 AM, Geert Uytterhoeven wrote:

Hello Geert,

> On Thu, 26 Mar 2026 at 05:54, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
>> Realtek RTL8211F PHY schema indicates that compatible string
>> "ethernet-phy-id001c.c916" must not be followed by any other
> 
> This is actually RTL8201F / c816; I will fix this while applying.
Ouf ... thank you.

