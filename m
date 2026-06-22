Return-Path: <linux-renesas-soc+bounces-34309-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bDfQMgo/OWrCpAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34309-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 15:56:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED5E6B00E4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 15:56:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=xcccWhVR;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34309-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34309-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C9B7E301093B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 13:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0D213B47C4;
	Mon, 22 Jun 2026 13:56:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBA4357D0E;
	Mon, 22 Jun 2026 13:56:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782136583; cv=none; b=NXDIaGfVfDV2ShgRmCN8SawrEmhD98prIEz/6ZvmdN22iq0oTn7yy99Z+Zqxk9oCEDynepRVTzbyLy4eaaiSL4YCpHbcAWUUJ0qzsNxDztB8yVrVrHwy6aXmEBiELqKo2ey+Z/T/88Gl0dmgS2Rp+R2QCX8a84bvNJgsZyybwks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782136583; c=relaxed/simple;
	bh=VLGNUOJWgetLw2CTOTASzxRBJpVRnxen9R190hFjPas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NGT38AsmvWG48tBA2xO4AFfcmXX2igHidiEf2nyna5n/Psg7JiN+4cLiyQpAsdoqkkq5K8TsE3abxQnHdu06UoZ8ghrIXlGDFB4kr0CpvSfwTyjzBmtb5SDQLzLH5pNcnY9K8aEy8an6NhZzYn+rbtiD2CKhDLn8K/0nvUDha90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xcccWhVR; arc=none smtp.client-ip=80.241.56.172
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gkV9G3Dn8z9tsN;
	Mon, 22 Jun 2026 15:56:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782136578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V10NUk/gmPuBAXU0YzRkHmie0gZ9BDAPSeyjEgvzMHg=;
	b=xcccWhVRSqDJHc/6NDRssnzaOOnGncLgvpUTUmdX2/FF2bKqUFl5lyKlsqIoZOeBYGlh5o
	OVwPiUc/yIjaMqkESFLCFicMXXxgb0S8PmqfchDuCkp9UJS8I33pmRnTqGVNe93MfeFp4W
	maVbfu0iR049vBzocLiZcujqbZ7XXoZ3Vu8LW0FbGfPODawn2FgAyIYMJ0iXnOm+AAB5GR
	aRickCq0EjdcikS9ABqqfDm1xVBn8Tspn6/SUiryd9LxztdC0PJDohwXd3VspxDwEBM4XV
	xalM/P3L6KNuvy9HPQh3cEeSiljnhM38QSVfBf7x5knmYsoJwDiAbu67VIUvSw==
Message-ID: <8cb1c3cb-3d8f-4e76-99e9-ad78ee149556@mailbox.org>
Date: Mon, 22 Jun 2026 15:04:45 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/9] arm64: dts: renesas: r8a774a1: Add soc: label to soc
 node
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUEPR0xWXRwLjBt5sF7i4HxcDLHCQGmc=gGvFmHRDv-Jw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdUEPR0xWXRwLjBt5sF7i4HxcDLHCQGmc=gGvFmHRDv-Jw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: dacb6e1149af34e4ecb
X-MBO-RS-META: t553dx187nxeb4i3g8oa88rprwqknbpr
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34309-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:linux-arm-kernel@lists.infradead.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mailbox.org:dkim,mailbox.org:email,mailbox.org:mid,mailbox.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5ED5E6B00E4

On 6/22/26 12:35 PM, Geert Uytterhoeven wrote:

Hello Geert,

> On Sun, 21 Jun 2026 at 04:51, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
>> Add soc: label to the /soc {} node to align the DT with r8a77951.dtsi
>> which already has that soc: label. The soc: label is useful in U-Boot
>> where it is used in U-Boot extras DT fragments.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> For the whole series:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v7.3, squashed into a single
> commit. Unfortunately there is no cover letter, so I will have to add
> all nine Link-tags.

Is that why cover letter helps you ?

If so, I will start generating ones ?

Thank you for your help !

-- 
Best regards,
Marek Vasut

