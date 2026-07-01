Return-Path: <linux-renesas-soc+bounces-34635-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JaDBDYd/RWrZBAsAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34635-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 22:58:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 923A06F1B4F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 22:58:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=ec1fwqbX;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=D5cTYaIh;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34635-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34635-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78FBB3127E63
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jul 2026 20:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3034A397E64;
	Wed,  1 Jul 2026 20:52:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861C0224AF2;
	Wed,  1 Jul 2026 20:52:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782939161; cv=none; b=mylvh85PSTq9TELcvR2KzQslQdp6NOxsR2rN52nlc5UdKn4a4S3Fvt1J7j5SR/7+xsd+CdrU6FDktXLt+eiL3PZT+67kziUlfgM1ONxf27/UK0080sEwcMpOdNQuljTwz5EvpKOxb/pTvZKJ6kTQ8vZ+7VbAtTWWQAOokK+xCi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782939161; c=relaxed/simple;
	bh=x18UYCOnTafTkUw1henYF1Zm3Dti3RwUnI6LNphuT+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n6uV6UCoFsVv3J8DbrMnFeBKQMIc2sM492+PjVshhfeMrsb9LhjrGqpF1cUpZuE5zBu9c87QKWCDkd3ujdXuLMITwBzacG3M/0BwiH5XFt1M0rLXQm2Y419XSVk4/5j92jG0nKYOOmBjeoWww9sCOoMxFyKYMeZGAjbh08GJF7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ec1fwqbX; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=D5cTYaIh; arc=none smtp.client-ip=80.241.56.171
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4grBzN2zPsz9v0M;
	Wed,  1 Jul 2026 22:52:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782939152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B0St7A+bM7xpXZZOVB/XPO0PsDqfIv4E00jty33/c8Y=;
	b=ec1fwqbXQwarcLEaXC8UsjFFr42kwtKI/ZS95BCs5NW7z3V9oPgeA2CdrRcFA0/5zA5xZx
	a/JerRdN9Mb2Y3WqxtVnqD5GYvfRAZKibc3pGmD8Q4EX/lNh9KFgwPA574ORw8xph6amrU
	opaWN17gl2DFROMjfQg1BW+R2cICggKF9dXRYBWmdRtapCXFpMeDu5msgd3N0bRucrB089
	NMZvqCWXqynapGcrdvcC5y+yyc4HodjQb6U25C7hhdxJNyYAbvTi/ZdH8ETOly/IxHsqDJ
	uAd/1yRX+V8DIzn8bqbTnx4pZFfAWDkhLIE6selrUn4XKb+JdL2vHMs3gpJ/WA==
Message-ID: <495cb1ae-f11b-4f92-85d4-59b2250db34e@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782939150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B0St7A+bM7xpXZZOVB/XPO0PsDqfIv4E00jty33/c8Y=;
	b=D5cTYaIh9L6fuPd7PYJvhu3auo30ngDcq+z9g7rp2mzq5wS8APc6fzEIv3EkKdcfRcpup2
	Xx3cSUaghqnvks8OwsYVpsv86178E6Tp949pL1VWkSGpQ+IbdkZk2PJWTEioYFMkDk7K2G
	7LTtjm4FCX2/Byb97P4aqHFZoapDaR8mrsjdbLSp3Tx0bBQsGms8NQmMpOPVE74d0K1+N9
	o7a94nkLEI7wT/mi+K7EGzNvrV/JXDFEANUuvm1YfDiPnVlGBPdwAIKl5mcQ29yDTrJqqm
	zbjkec22/4SbNy4mE/woiGHekzF90ttuGvuEDTVxV4ZhtPM3yqqf5onX4g1HQg==
Date: Wed, 1 Jul 2026 22:43:41 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/4] PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not
 used
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-pci@vger.kernel.org, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260618220427.14325-1-marek.vasut+renesas@mailbox.org>
 <20260618220427.14325-2-marek.vasut+renesas@mailbox.org>
 <CAMuHMdV3tyZk8ckL-ihdbVcGV9tQumdntPc_nJB6HXEkZLytfw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdV3tyZk8ckL-ihdbVcGV9tQumdntPc_nJB6HXEkZLytfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: ub6t7dpfuhwtpwyhgrnpcye9afenpdm9
X-MBO-RS-ID: c7dec5a8f8a3f8f14ef
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
	TAGGED_FROM(0.00)[bounces-34635-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:marek.vasut+renesas@mailbox.org,m:yoshihiro.shimoda.uh@renesas.com,m:linux-pci@vger.kernel.org,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:maz@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mailbox.org:dkim,mailbox.org:mid,mailbox.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 923A06F1B4F

On 6/30/26 8:04 PM, Geert Uytterhoeven wrote:

Hello Geert,

>> +static int rcar_gen4_pcie_host_msi_addr(struct dw_pcie_rp *pp, u32 *msi_addr)
>> +{
>> +       struct dw_pcie *dw = to_dw_pcie_from_pp(pp);
>> +       struct device_node *msi_node = NULL;
>> +       struct device *dev = dw->dev;
>> +       struct resource res;
>> +       u64 addr;
>> +       int ret;
>> +
>> +       /*
>> +        * Either the "msi-parent" or the "msi-map" phandle needs to exist
>> +        * to obtain the MSI node.
>> +        */
>> +       of_msi_xlate(dev, &msi_node, 0);
>> +       if (!msi_node)
>> +               return -ENODEV;
> 
> This is not backwards-compatible with existing DTBs.
> I noticed because PCIe is broken on Gray Hawk Single with R-Car V4M
> after this series.  Indeed, "[PATCH v2 4/4] arm64: dts: renesas:
> r8a779g0: Add GICv3 ITS and update PCIe nodes" only covers R-Car V4H,
> but not R-Car S4-8 and R-Car V4M.
Thank you for spotting this, and, this code is not supposed to be 
reached. It turns out, pp->use_imsi_rx is not assigned yet in the .init 
callback. I hope this is addressed in V3 with a new patch:

[PATCH v3 1/5] PCI: dwc: Determine whether iMSI is used before calling .init

