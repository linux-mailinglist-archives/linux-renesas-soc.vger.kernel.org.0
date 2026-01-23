Return-Path: <linux-renesas-soc+bounces-27359-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMw7HNKQc2l0xAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27359-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 16:16:34 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EC877A60
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 16:16:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D9DD30761E6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 15:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24CE5342177;
	Fri, 23 Jan 2026 15:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="gbd2/qmM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E3933A713;
	Fri, 23 Jan 2026 15:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769180569; cv=none; b=Ib5LhbEB2ltmDXsrYqyYuczk93Rg5Pmwh27UMW6SYFaDXxW9fEvD4upjVWgEFyfi6oxeR/oYjN3Z051oue5tERWhnDf8I0MmqUtF2ffktbKpJD5PcbgL9J4/6GesTrqfBwItiNl/Lzl+yQBT/xxKBzwTeWeWO95CuyRd7S3cNfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769180569; c=relaxed/simple;
	bh=x1J5bAmwp72BJ86X6FItDUzd7sGwMsJ3pp+wSrN9ejU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jvp39IRckjQ+vMb2bHL0xM/BkzZhe019BXT1jpc7DY3B9wVbXnNYr+n/NYaMCIaDMelVNY+vGnnRCVBfQvA4xk4KKjQrQWGQ5xtxUppF+BjU2+tovhSuZ684n12CfOEHYJJWi3MQdzXUW8WdKzfPMvLVx9uLZwQnWwsjz3cREqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=gbd2/qmM; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dyLl14WMjz9tVF;
	Fri, 23 Jan 2026 16:02:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769180557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ppwFZXgcvjPvaDl3An5foL2pHBaMM0peRix6xgcemok=;
	b=gbd2/qmMSN37+mcpyEQnOijscfiBq76dBaqQRZJF96Zptuz48HQJzaS79bSH15aEbfN4lz
	kIeAy12nCESlq2xTg94Mr9rnumQ/Fw8IOYvZ+v7Fca9q4hQLt1ram4YsF+FezVOJpPc9YM
	uMcBeZQ4oQnKITRsPqks+R9m6rYO+o/T1kxGZB+zLcery8mVxlsiCLbtZcIlgRptvNRHnt
	EDHzSZK9Vw8rWthU5mYQD6sgUSWj3S47h061fohYlGtKOlLLu0RZ/EkJHrYAgq/v6qn39S
	IzDtC2jVtK+wNZnm9LCs+iBkXKzM+Dv7utuhv62Zgs7S9GEr9iWkUNkA28POqA==
Message-ID: <43bf0bd6-0aea-4323-a64b-26e61a561881@mailbox.org>
Date: Fri, 23 Jan 2026 16:02:33 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 8/9] arm64: dts: renesas: ulcb: ulcb-kf: Describe
 PCIe/USB3.0 clock generator
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
 <20260118135038.8033-9-marek.vasut+renesas@mailbox.org>
 <CAMuHMdV7UPWCqj4A6097KKT+Es2Zz_mPeJoyJd5qDMudrNx_5A@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdV7UPWCqj4A6097KKT+Es2Zz_mPeJoyJd5qDMudrNx_5A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: z5716wskbhzhgn31famzwdrhkjh9xnxg
X-MBO-RS-ID: 41e6431bbdf3d0e5844
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27359-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,linaro.org,renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.969];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:email,mailbox.org:dkim,mailbox.org:mid,glider.be:email]
X-Rspamd-Queue-Id: C2EC877A60
X-Rspamd-Action: no action

On 1/23/26 2:37 PM, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> Thanks for your patch!
> 
> On Sun, 18 Jan 2026 at 14:51, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
>> Describe the 9FGV0841 PCIe and USB3.0 clock generator present on ULCB
>> board. The clock generator supplies 100 MHz differential clock for both
>> PCIe ports, the USB 3.0 PHY and SATA.
>>
>> SATA is not yet described in the ULCB DT, therefore the connection to
>> this clock generator is not described here either.
>>
>> The H3 ULCB schematic does describe connection from output DIF7 to
>> USB3S1_CLK_*, but these signals do not exist on the SoC, therefore
>> this connection is also not described.
> 
> That is the case because the first ULCB came with R-Car H3 ES1.0,
> which did have two USB3 channels. R-Car H3 ES2.0, M3-W, M3-W+,
> and M3-N have only a single USB3 channel.
> 
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.21.
Thank you

