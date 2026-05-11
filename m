Return-Path: <linux-renesas-soc+bounces-32341-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEviDGh/AWqkbQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32341-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 09:04:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C76D7508D30
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 09:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E5C4301BF76
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 07:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F355230DED0;
	Mon, 11 May 2026 07:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OHLDXMEP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8BD296BAF;
	Mon, 11 May 2026 07:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778482964; cv=none; b=RYqJkLWW6SDyMI9tR3HI0QxFWgd9INdP42CdPylbsh8j0+lH+ZUjdV/3iSzulThwVUPqIoP5uCdsoFt/lVtLMnwBxLo03qGZI5fDrbe7ktJ0KkpFTgcBBPhcowmUlR30Iy0wwR5TmlSehP+SzaNxC0M0buG2RxSNAwUb3vPVTSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778482964; c=relaxed/simple;
	bh=Tdh/N1hAlE0eVbohv0554EUeYZWyi42yp17TIjpju5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=odlzpxAlM39HRMwZXRDoerpdmuzZgcGJRcc+d3yWv4ZnPFixx/r9Su2CurI+bvBQtwTCos4i8XJ8dHQln4d1ZuMy6Xw5dk0jVBdfncnspN7cf9K8lvOsJO/qahbc3f1P0ssNNQW3w8QK6OltJlyh/cvPOq5Gp/vFajtufRExa4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OHLDXMEP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F36C2BCB0;
	Mon, 11 May 2026 07:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778482964;
	bh=Tdh/N1hAlE0eVbohv0554EUeYZWyi42yp17TIjpju5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OHLDXMEPFhnZDfHYyDEV5HluzVN5NysVQFyveHi6v7Cwmy2warBhBJMzSqMWLQ4hY
	 0GugpNj51s6Ah+Bmc8EEmgqQbmAu4UYyMqRj/8bww+Cyac+DR2d6INKbeSvhSASHWM
	 CyQBcpQkbbXKLZsNWeGsADXKg3LSTYmnvc4iuPnvonT1VuCmTiPJeyu/HqHDxAgy1J
	 0GYltnvXZs+anrTpbMeCaGzGf5L/cjcPojB6vWaRSt0vbmYLVfndNx9Bx3C20G1TlB
	 2pbKXHZ/74Z0ZYrQh8zJQUmiYb5MAa1n16jri7Mi3w0RPE87UVQeEU0U7Co6JikQcF
	 MQW/FE2gv/KCg==
Date: Mon, 11 May 2026 16:02:42 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, mani@kernel.org, 
	vigneshr@ti.com, jingoohan1@gmail.com, thomas.petazzoni@bootlin.com, 
	pali@kernel.org, ryder.lee@mediatek.com, claudiu.beznea.uj@bp.renesas.com, 
	mpillai@cadence.com, robh@kernel.org, s-vadapalli@ti.com, linux-omap@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, claudiu.beznea@tuxon.dev, linux-mediatek@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/7] PCI: dwc: Use common
 pci_host_common_link_train_delay() helper
Message-ID: <20260511070139.GA1096586@rocinante>
References: <20260511055923.37117-1-18255117159@163.com>
 <20260511055923.37117-5-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511055923.37117-5-18255117159@163.com>
X-Rspamd-Queue-Id: C76D7508D30
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32341-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,kernel.org,ti.com,gmail.com,bootlin.com,mediatek.com,bp.renesas.com,cadence.com,vger.kernel.org,lists.infradead.org,tuxon.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kwilczynski@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hello,

> -	/*
> -	 * As per PCIe r6.0, sec 6.6.1, a Downstream Port that supports Link
> -	 * speeds greater than 5.0 GT/s, software must wait a minimum of 100 ms
> -	 * after Link training completes before sending a Configuration Request.
> -	 */
> -	if (pci->max_link_speed > 2)
> -		msleep(PCIE_RESET_CONFIG_WAIT_MS);
> +	pci_host_common_link_train_delay(pci->max_link_speed);

This comment could move to the helper you added.

Thank you!

	Krzysztof

