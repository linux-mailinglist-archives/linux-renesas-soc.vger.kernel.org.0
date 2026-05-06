Return-Path: <linux-renesas-soc+bounces-32175-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IQcJTJy+2m7bAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32175-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:54:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9133B4DE605
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6A1EE302436F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 16:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D27494A00;
	Wed,  6 May 2026 16:52:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683D8274B28;
	Wed,  6 May 2026 16:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086370; cv=none; b=rc1/7tAXVtIc/b4C8nkzebCe0t6W+HYmrFLC/qiZDUp4a+skr1rbK4rZ0vxGloj5MhKYn6kerUAxruqf9hNTxgsdPUfbrSfHgS73dQ7Ga1L595hoID223i0/CiuItLz9c0FfJUW4FThBoQORUpRzNKG9f2o1LIzB89WmRoVclQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086370; c=relaxed/simple;
	bh=QrDTjLEBe8htzcCqzkIpCIk/TZcsonbqK2zG/dxegwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rnbYf9jXBbLPscNPrFvtKmmOGPK8A8wneZGeAYw7b+dBRZh7a1SqUndsdg3KjF4/RYGEtRZLkop9sTyMusQLStmIIiJbS5Mb0CGx4qklXaUHoo2Qi+R2AXUl59bXSpNAprmjpsq5Uylhpn8p8/SXnm3qiNwBaLlU4+vGcYhf7v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC42EC2BCB0;
	Wed,  6 May 2026 16:52:44 +0000 (UTC)
Message-ID: <bd0f4589-b586-4f01-b12c-6ae5c19ec21b@tuxon.dev>
Date: Wed, 6 May 2026 19:52:42 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] PCI: rzg3s-host: Add 100 ms delay after link
 training
To: Hans Zhang <18255117159@163.com>, bhelgaas@google.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 vigneshr@ti.com, jingoohan1@gmail.com, thomas.petazzoni@bootlin.com,
 pali@kernel.org, ryder.lee@mediatek.com, jianjun.wang@mediatek.com,
 claudiu.beznea.uj@bp.renesas.com, mpillai@cadence.com
Cc: robh@kernel.org, s-vadapalli@ti.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260506152346.166056-1-18255117159@163.com>
 <20260506152346.166056-9-18255117159@163.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260506152346.166056-9-18255117159@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9133B4DE605
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32175-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[163.com,google.com,kernel.org,ti.com,gmail.com,bootlin.com,mediatek.com,bp.renesas.com,cadence.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

Hi, Hans,

On 5/6/26 18:23, Hans Zhang wrote:
> The Renesas RZ/G3S PCIe host driver currently does not enforce the
> mandatory 100 ms delay after link training completes for speeds > 5.0 GT/s,
> required by PCIe r6.0 sec 6.6.1.
> 
> The driver already has a 'max_link_speed' field (derived from the device
> tree). Add a call to pcie_wait_after_link_train() in
> rzg3s_pcie_host_init() after reading the link status, ensuring that the
> delay is applied before any Configuration Request is sent downstream.
> 
> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---
>   drivers/pci/controller/pcie-rzg3s-host.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
> index d86e7516dcc2..6ab59c5464cf 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -1390,6 +1390,8 @@ static int rzg3s_pcie_host_init(struct rzg3s_pcie_host *host)
>   	val = readl_relaxed(host->axi + RZG3S_PCI_PCSTAT2);
>   	dev_info(host->dev, "PCIe link status [0x%x]\n", val);
>   
> +	pcie_wait_after_link_train(host->max_link_speed);

There is an msleep(PCIE_RESET_CONFIG_WAIT_MS) after 
rzg3s_pcie_set_max_link_speed() call. Shouldn't that msleep() call be replaced 
with your pcie_wait_after_link_train() ?

Thank you,
Claudiu

