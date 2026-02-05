Return-Path: <linux-renesas-soc+bounces-27936-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0L2YLkJPhGkE2gMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27936-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 09:05:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E967EFB6B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 09:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 24472301916C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Feb 2026 08:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1737E2C11D5;
	Thu,  5 Feb 2026 08:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VxkP9BDL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83D225A640;
	Thu,  5 Feb 2026 08:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770278719; cv=none; b=eYqxTXFljvBIVZ1FOPTCK8XE1JLpjvjYW9+CM1A8+yuEY6ou56GeiTtoRFkk3D0MdCFEu0UOUhFc5t3qOnFxEE0oYGZPpDBpFl1cl2rlso7ZiBiu/UpGYLmm1s/x/Z8Ts8G6g6GLgOFWvXG0kJqBwjwz3SepM8oBkQbOYoR3ars=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770278719; c=relaxed/simple;
	bh=2DFLxlQRe/rzNiKeyKOF9vMMK7CYEmVHNpQxUYsuLcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jZrdtUf2qPbZCBiFQRJwA7tkkYWP8QLxvjAX9DUQcEz4Sh94ANY7FcUBo+rqOyXbuH07mflUB47g0yt5zTQqYB1uJIdjvFUb8w73n0uDpuZmNyXF3iIzrC47pDUo4S2RigfCII6mthFZmJue5YHRJfwCpnspwwsGTZB4a60q2DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VxkP9BDL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85EDDC4CEF7;
	Thu,  5 Feb 2026 08:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770278718;
	bh=2DFLxlQRe/rzNiKeyKOF9vMMK7CYEmVHNpQxUYsuLcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VxkP9BDL1EPDPGbg6M2As5yGjvdUmNWS5XP4P9Z37LwtLbuVCXQUMmL0iw1mRLAJg
	 hU38MVKCuiArE1lkhYUirn8sxlMcc99udyyv3EMdxVKhUSQ+ubVUKKFCmfU+LDLRaK
	 O1cLVMnDvDzkjxDe16cxrYN/CxeBwCLXMoyVUwqgQpcZxfcooYshAAAipICqetjr78
	 Ta1vdzb0OiSoVGX0Zzn1gjx4xGFLqyAVR72aW2ouFzpA/I+1Hf3YxPvhlN+maI+wPO
	 yA5/1C+p9l0zSKakn7zAWPMXNP3nWgydDvV4TMFtNAP2gE998BQMWEvxTyPdRsHtMZ
	 Dr8p3T37EM36g==
Date: Thu, 5 Feb 2026 13:35:07 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Felix Gu <ustc.gu@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: rzg3s-host: Fix device node reference leak in
 rzg3s_pcie_host_parse_port()
Message-ID: <3fpgdpvfgnif6fir4ijr3m2qnh75zna6nx5ob4dpgukwgqflcm@aib4ctdaox3m>
References: <20260204-rzg3s-v1-1-142bc81c3312@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260204-rzg3s-v1-1-142bc81c3312@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27936-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,google.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2E967EFB6B
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 12:46:24AM +0800, Felix Gu wrote:
> In rzg3s_pcie_host_parse_port(), of_get_next_child() returns a device
> node with an incremented reference count that must be released with
> of_node_put(). The current code fails to call of_node_put() which
> causes a reference leak.
> 
> Use the __free(device_node) attribute to ensure automatic cleanup when
> the variable goes out of scope.
> 
> Fixes: 7ef502fb35b2 ("PCI: Add Renesas RZ/G3S host controller driver")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Patch LGTM. But we are nearing the merge window. So I'm not sure if Bjorn would
be happy for me to merge any patches atm.

Since this fix is trivial, we can defer it for 7.1.

Bjorn, if you decide to merge this still, feel free to add:

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

On a side note, I see that this driver just parses the first Root Port instead
of parsing all Root Port nodes because the current IP design has only one RP.
But for uniformity, it should parse all nodes so that if the IP gets extended
in the future, driver can still hoepfully work.

This further motivates me to come up with host controller generic APIs to parse
the Root Ports :)

- Mani

> ---
>  drivers/pci/controller/pcie-rzg3s-host.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
> index 5aa58638903f..2809112e6317 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -1142,7 +1142,8 @@ static int rzg3s_pcie_resets_prepare_and_get(struct rzg3s_pcie_host *host)
>  
>  static int rzg3s_pcie_host_parse_port(struct rzg3s_pcie_host *host)
>  {
> -	struct device_node *of_port = of_get_next_child(host->dev->of_node, NULL);
> +	struct device_node *of_port __free(device_node) =
> +		of_get_next_child(host->dev->of_node, NULL);
>  	struct rzg3s_pcie_port *port = &host->port;
>  	int ret;
>  
> 
> ---
> base-commit: 193579fe01389bc21aff0051d13f24e8ea95b47d
> change-id: 20260204-rzg3s-bc7c27c80a89
> 
> Best regards,
> -- 
> Felix Gu <ustc.gu@gmail.com>
> 

-- 
மணிவண்ணன் சதாசிவம்

