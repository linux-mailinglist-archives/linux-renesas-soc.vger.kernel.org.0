Return-Path: <linux-renesas-soc+bounces-34181-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w4jkD9RdM2o8/wUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34181-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 04:54:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D53FB69D2C4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 04:54:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=gnXJqtxG;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=KQl+HXcW;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34181-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34181-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21E0B302D087
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 02:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 609E130BF5C;
	Thu, 18 Jun 2026 02:54:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391401E0E14;
	Thu, 18 Jun 2026 02:54:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781751248; cv=none; b=TLS3oA5izM8y92l+BnutZj0goA4mJG27dCVR8f9dUo39Pv0AsLkePr1eRzoF/3ORpmrTwBqVtnl4EEzhXLxv08UGlUXTAgnnoxVDKmoODgNxTpVb0x9GZj3urVKFYJKVfeyemcm8NGFa3W/uFOIo63lZVyklReKcrkSAE/K4S4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781751248; c=relaxed/simple;
	bh=KRNEfSiOrtv3K+wBdDhPC/qXTIjTcNylYx7yvhT7U0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jOgcldKi66h3mMZxkZrT4NrgI9QQNTqs2j8MytjAGyWIQZkPldVY55vebfVY8+snVykDweiIT2dnhwyeT+UMOlICzlklux97l/q21YQPXcHwj+f1WtJHMio9hyci0QS+Ku9RYn7tVceFBoiwXFnCMvynoJ3Tmp5V8F2nZRxHU00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=gnXJqtxG; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=KQl+HXcW; arc=none smtp.client-ip=80.241.56.172
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gglfs69zlz9twp;
	Thu, 18 Jun 2026 04:53:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781751237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u7s2zD+ufnu+hSSQ37cUfttPzkItvf1fkn4axYyChhg=;
	b=gnXJqtxGokv87Uhwtq92Zpy7pf35EC6WWb4Xh24xgtrM6c+MQcPYWVJfU87dRBHvJuPFXi
	CNKT6hrg1YiA2/nKGV3VWzPPbVX+2/aZzw9DdSHX52vbL+GUh+2qJxjH/iF9wWdj4VX1Uv
	LOHJE7rS344wILbf0UMt+o8nRsnHeJZw/2W0xuQSIJif/5uzxEqevnY+R1WKoQPmuo/kyP
	YuPIzDGQPe5mmuGx0cICfoLbNpwbutTR4HR/3sG5oT7qvWYq/OoM2qyXrIMSTU4KWuJ+1O
	A7WTNS7R9616tOYdgxpQuRD0R2rOd3TYzLQ7/HEg4boqNrs9jpci0jQEf0OiXg==
Message-ID: <9fb93f5f-51dc-47aa-aa8e-53cceaef876e@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781751235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u7s2zD+ufnu+hSSQ37cUfttPzkItvf1fkn4axYyChhg=;
	b=KQl+HXcW1qn+mTDayQd6nmoQpiQz7FCo8dJr9SWmAyrrm0LF8RzesrwZw32pF6Hif0e8eq
	pt1WszUJSTttOqxM11XC0gsh4mI7aJ2fBAtnrD6EC6vrpsiCfWlPyiW3LRLZH0DPcf91cY
	wQ49rCzAyCeQV16aXDSvD5AvdtbKnEGB2N/52a+tX2SyJ4gpN0GnvggciosRNmdphBzbnN
	lWC2V/kgBCd4HifSY7gY/L/oFZQmXtau0osytDHPsxX3Nr2sdbK6ygFa0ItqrMKDLf9Vbi
	h2kqTmCnMQHgaQDXrTBq/yq7CCulnZ6c03Ixno0h96AcSjR4YX+76ydguImldQ==
Date: Thu, 18 Jun 2026 04:21:54 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not used
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260617030008.154449-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdU0SJ0q2hcpu+qZCH3eZ5eFDyo8Z964h9DhuSaQ7QdHSg@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdU0SJ0q2hcpu+qZCH3eZ5eFDyo8Z964h9DhuSaQ7QdHSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 11c23285409aedd437f
X-MBO-RS-META: ono3swuaqbfmkf7fudm8y53ztzrp6bp5
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34181-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:marek.vasut+renesas@mailbox.org,m:linux-pci@vger.kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:maz@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D53FB69D2C4

On 6/17/26 10:26 AM, Geert Uytterhoeven wrote:

Hello Geert,

>> +static void rcar_gen4_pcie_host_msi_init(struct dw_pcie_rp *pp)
>> +{
>> +       struct dw_pcie *dw = to_dw_pcie_from_pp(pp);
>> +       struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
>> +       u32 val;
>> +
>> +       /* Make sure MSICAP0 MSIE is configured. */
>> +       val = dw_pcie_readl_dbi(dw, MSICAP0);
>> +       if (pci_msi_enabled())
>> +               val |= MSICAP0_MSIE;
>> +       else
>> +               val &= ~MSICAP0_MSIE;
>> +       dw_pcie_writel_dbi(dw, MSICAP0, val);
>> +
>> +       if (!pci_msi_enabled() || pp->use_imsi_rx) {
>> +               /* Clear AXIINTC mapping. */
>> +               writel(0, rcar->base + AXIINTCADDR);
>> +               writel(0, rcar->base + AXIINTCCONT);
>> +       } else {
>> +               /* Point AXIINTC to GIC ITS and enable. */
>> +               writel(AXIINTCADDR_VAL, rcar->base + AXIINTCADDR);
>> +               writel(INTC_EN | INTC_MASK, rcar->base + AXIINTCCONT);
>> +       }
>> +
>> +       /* Configure MSI interrupt signal */
>> +       val = readl(rcar->base + PCIEINTSTS0EN);
>> +       if (pci_msi_enabled())
>> +               val |= MSI_CTRL_INT;
>> +       else
>> +               val &= ~MSI_CTRL_INT;
>> +       writel(val, rcar->base + PCIEINTSTS0EN);
>> +}
>> +
>>   static int rcar_gen4_pcie_enable_device(struct pci_host_bridge *bridge,
> 
> FTR, this has a contextual dependency on "[PATCH v2] PCI: rcar-gen4:
> Limit Max_Read_Request_Size and Max_Payload_Size to 256 Bytes"
> (https://lore.kernel.org/all/20260519195219.189323-1-marek.vasut+renesas@mailbox.org).
It is not an explicit dependency, I only had these patches in my tree 
and clearly that was an interaction. I'll rebase this dependency out for V2.

Thanks!

-- 
Best regards,
Marek Vasut

