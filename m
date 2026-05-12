Return-Path: <linux-renesas-soc+bounces-32443-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFgdJBh4AmpotQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32443-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 02:45:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B49517EF8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 02:45:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 712F3301C3D1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 00:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC94122D4C3;
	Tue, 12 May 2026 00:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="EvZQJOfL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204412248A0;
	Tue, 12 May 2026 00:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778546704; cv=none; b=GwpFw002BC6nR3txoSr13UPr9fjGGUaBFNViWu3I0cUao5pX2giRtR9ceUEBh/IjoX1SbbEESJyh//6xo7VtDQu5J1XesztMI9V3qn1Hx3CslMUbiVQxZLNrfY4DYiRy9onrJsV61fAVZifX0pfAhstYUs+mewBXhC91yGSB+qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778546704; c=relaxed/simple;
	bh=egVlnENSjE1EiKQJL7+FPZSb9mHITMVnPukdSuzhfyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iKmlgqU1rxyUldxJ2QQ9cZlCk9m8kCZtfzUBk88OfCmAwCzhh6sDB5G/V63rsnKof6wUkyh2CQgkDLn0KjupGVxzAOy14Ym8kUm1LN3/osdFRtM3N6hvuQCSHRZkhFOLtmXNI+JA6JZXfs10BXUva3wqwqyf1kTHb9a25br5OsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=EvZQJOfL; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=gO3h51HYtv45xRJLIzc56DgmssLAn+8K3ewRnk2t304=;
	b=EvZQJOfLau2GLCePkzSv5c0l+dA27qxpzkxxL5lydx66r3WLqhxpI3fKMj1KiS
	ZRdD1T3DnPc55HvlgsmcvMs0Dh+SPbQrrf66mVJOEmMs+JbGFu1jqbAGCaYUL9m3
	6zTeWutdfZPmgzL3ffeXvEBEjWbdwcmOTqCyqMOupook0=
Received: from [192.168.50.71] (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wBXb4PPdwJq8dJuAw--.7483S2;
	Tue, 12 May 2026 08:44:00 +0800 (CST)
Message-ID: <e600d0a4-b93e-425f-a5f1-c76802c65622@163.com>
Date: Tue, 12 May 2026 08:43:58 +0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] PCI: dwc: Use common
 pci_host_common_link_train_delay() helper
To: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, mani@kernel.org,
 vigneshr@ti.com, jingoohan1@gmail.com, thomas.petazzoni@bootlin.com,
 pali@kernel.org, ryder.lee@mediatek.com, claudiu.beznea.uj@bp.renesas.com,
 mpillai@cadence.com, robh@kernel.org, s-vadapalli@ti.com,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 claudiu.beznea@tuxon.dev, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260511055923.37117-1-18255117159@163.com>
 <20260511055923.37117-5-18255117159@163.com>
 <20260511070139.GA1096586@rocinante>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20260511070139.GA1096586@rocinante>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBXb4PPdwJq8dJuAw--.7483S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4REfOzUUUUU
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxBAt0GoCd9AlOQAA36
X-Rspamd-Queue-Id: 04B49517EF8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_FROM(0.00)[163.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-32443-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[163.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[google.com,kernel.org,ti.com,gmail.com,bootlin.com,mediatek.com,bp.renesas.com,cadence.com,vger.kernel.org,lists.infradead.org,tuxon.dev];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action



On 5/11/26 15:02, Krzysztof Wilczyński wrote:
> Hello,
> 
>> -	/*
>> -	 * As per PCIe r6.0, sec 6.6.1, a Downstream Port that supports Link
>> -	 * speeds greater than 5.0 GT/s, software must wait a minimum of 100 ms
>> -	 * after Link training completes before sending a Configuration Request.
>> -	 */
>> -	if (pci->max_link_speed > 2)
>> -		msleep(PCIE_RESET_CONFIG_WAIT_MS);
>> +	pci_host_common_link_train_delay(pci->max_link_speed);
> 
> This comment could move to the helper you added.

Hi Krzysztof,

Will add.

Best regards,
Hans


> 
> Thank you!
> 
> 	Krzysztof


