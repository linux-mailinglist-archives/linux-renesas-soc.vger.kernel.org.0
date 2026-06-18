Return-Path: <linux-renesas-soc+bounces-34184-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bbOmKUdkM2poAAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34184-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 05:21:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C20969D4D2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 05:21:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=VlxnlGk5;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=A0eftJRE;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34184-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34184-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22BCD303ADC2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 03:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5AB4347503;
	Thu, 18 Jun 2026 03:21:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3912FDC5E;
	Thu, 18 Jun 2026 03:21:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781752896; cv=none; b=lg1WsU8VdBcbYugJaqy4VKDL4xjfn5rLjxmjMEsm6dYGMV86dANRpgLmw0hLJcVTDy8ba12hVgybF8tHYKkzuod9sDuCcToXlPbooYZUk6K7KU6OPAd+8es2ZtBDKWxuseQtv5RFPB/Kedkt4D2XfiSUQp0vrEnKlonix4zzvSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781752896; c=relaxed/simple;
	bh=SUBSCbGJkuZg2PsaHnBhjtOcFX+j8191A7fjrLfseiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BWF2sE3ns6FYekiv8Q1/pWE/1Alk50GUc7rQOvQuzx1rTiyNi8qwOPaiHVDgA6HA2PHD5J0Xi1iKrBXLKDNzbfBzuDti8FTt1ayjb+l29Nmw5gSFAAtxLvYOiy3fhB2pynRClvE0twg2jf3wYSXosv2IOUUDOa/1Gn+LczMNpZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=VlxnlGk5; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=A0eftJRE; arc=none smtp.client-ip=80.241.56.152
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ggmGg0dq8z9vDJ;
	Thu, 18 Jun 2026 05:21:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781752891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yaummfnzPtyabIhQrawAEZGn0WmOzI9XiKr6uYhqAdM=;
	b=VlxnlGk5x98IFPAPb+Uxk7JXYgFvupUY7xvz5F5ucOm5LM0Dvp5fQxiM/lYTOk0QWbeP3u
	Vx3rrQwQBCOM2+81sLTZx5yQRLyz+X6q2PdqxZoOsW3fy6PlaDHzdQpATyevYz8xAKfpgA
	M2JUj+f52aORUcJ7j6P2JiGNFXTOYlBq+YF+eLpDR0CfXJh9FgyfyfPv1xJssw4wdK4Zwj
	ltiTzPf3hHvfU9aaEU13HJnBhOUHwFuvd9waUkyAiIP/8XoUgUBN9JCxfSVVd9BW/kp/Sp
	rL4iGZn3jqne16CobF1XNqm8mDRphLLCrSVPjxoi1ledW/RE0pSD+EYNRDa33Q==
Message-ID: <eef933e9-7e14-4885-9179-4bfa500a22e4@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781752889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yaummfnzPtyabIhQrawAEZGn0WmOzI9XiKr6uYhqAdM=;
	b=A0eftJREloi7497i69ik2WjlGnYuWTpsYSeRMoAGCA6+ljZbaefGEOW8V53t3mQX0wotvG
	FevspN8s8r51fogSI9tMALw2cCD5TMHxBAliegQHFiMc5Fx7rU3RmFrvXfwmesTDwVU7dj
	sP7QulEJE4e2HNAc/2rklIs5NBlI/fiYYATo3kPcY/a7887cDHQFmun4YRpvpsu2bwwaOH
	rap45L7gIWe0UlOfN+A5pcs+6dsVJ4HV4eQ03wt7lnxIPamsZRRh2ckAWKN/JoYeGMzb9y
	Er0B4Todz74yEKqoSYzL4E5sBWEBUjBpltpwmXBVlOa8owNesmMOeOLQSo7c1A==
Date: Thu, 18 Jun 2026 05:21:25 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not used
To: Manivannan Sadhasivam <mani@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260617030008.154449-1-marek.vasut+renesas@mailbox.org>
 <lstafqaogzunb2azyqwvtt3swrk42nu3n5zyct2la5fqxomaqg@wyrz3qolhist>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <lstafqaogzunb2azyqwvtt3swrk42nu3n5zyct2la5fqxomaqg@wyrz3qolhist>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 4sd38nnow6od9mw6adg44nq3ip514b31
X-MBO-RS-ID: b17926727949ac9f6e5
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
	TAGGED_FROM(0.00)[bounces-34184-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:marek.vasut+renesas@mailbox.org,m:linux-pci@vger.kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:maz@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
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
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:dkim,mailbox.org:mid,mailbox.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C20969D4D2

On 6/17/26 12:33 PM, Manivannan Sadhasivam wrote:

Hello Manivannan,

[...]

>> +/* INTC address */
>> +#define AXIINTCADDR		0x0a00
>> +/* GITS GIC ITS translation register */
>> +#define AXIINTCADDR_VAL		0xf1050000
> 
> As Marc pointed out, this address should be fetched from DT, not hardcoded in
> the driver.

I will reply to Marc when I have this ready for V2.

>> +
>> +/* INTC control & mask */
>> +#define AXIINTCCONT		0x0a04
>> +#define INTC_EN			BIT(31)
>> +#define INTC_MASK		GENMASK(11, 2)
>> +
>>   /* PCIe Power Management Control */
>>   #define PCIEPWRMNGCTRL		0x0070
>>   #define APP_CLK_REQ_N		BIT(11)
>> @@ -305,6 +319,39 @@ static struct rcar_gen4_pcie *rcar_gen4_pcie_alloc(struct platform_device *pdev)
>>   	return rcar;
>>   }
>>   
>> +static void rcar_gen4_pcie_host_msi_init(struct dw_pcie_rp *pp)
>> +{
>> +	struct dw_pcie *dw = to_dw_pcie_from_pp(pp);
>> +	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
>> +	u32 val;
>> +
>> +	/* Make sure MSICAP0 MSIE is configured. */
>> +	val = dw_pcie_readl_dbi(dw, MSICAP0);
>> +	if (pci_msi_enabled())
>> +		val |= MSICAP0_MSIE;
>> +	else
>> +		val &= ~MSICAP0_MSIE;
>> +	dw_pcie_writel_dbi(dw, MSICAP0, val);
>> +
>> +	if (!pci_msi_enabled() || pp->use_imsi_rx) {
> 
> If MSI is not enabled, then what's the point in clearing these registers (also
> above)? I see it as a redundant code. Is there a necessity to clear them?
AXIINTCCONT INTC_EN should not be set if MSI is disabled, this code 
makes sure it is not set, even if it might have been left set e.g. by 
prior stage. So no, this is not redundant code, this makes sure the 
controller is correctly configured.

