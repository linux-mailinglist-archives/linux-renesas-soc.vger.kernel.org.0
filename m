Return-Path: <linux-renesas-soc+bounces-28024-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGpFH+JlhmlLMwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28024-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 23:06:26 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C34E103A5D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 23:06:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E7CC93006016
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 22:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46DB530497C;
	Fri,  6 Feb 2026 22:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GSlyaPDk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227FE2C2374;
	Fri,  6 Feb 2026 22:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770415581; cv=none; b=KgEPc6bPBCjPmraPzSzfYD7bHELI6DBNsxSEqYq2w2IHSTJKYGX91r+0d4Jdo/FDhHljN3+MSnnm621XHKSUrldqP7KNbeWHe2yL4zbohLM2oottRrgXzs/GcHNm9+rlD1NLHmj9Opzw3reSSA47+z44Dymnj5rDAr6yU2tTTss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770415581; c=relaxed/simple;
	bh=TEEyO3FVrhEbYPRYz0t1DuX45dQIXNgbEtrGOp2dds8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=lrnnBGcmBA+pQKVJS84kUhTDdnIcfleUSrRGaMNt1FJQ8gXahO+/YuAzSj6z4R/ZHGZY/WUbY4GzfXLAmhgWfO8Q9csV5gTcfGHzqap8ZItMuQeiLloaqZ7YtvBEr/j9givB/HgUSdaMxvDRtCC0DuUONCX4BPawTy4yErhIZu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GSlyaPDk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8A0C16AAE;
	Fri,  6 Feb 2026 22:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770415581;
	bh=TEEyO3FVrhEbYPRYz0t1DuX45dQIXNgbEtrGOp2dds8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=GSlyaPDkTGaRoCC7hOYmOxswRQSPSf4hXXrBnZEzhNJVRnuvylj1+tc5LkxhSQAMa
	 DzqJ2mByEB+DHfmUs9XDOdf9ZLtqbQ+iWCzW+chhR4Af2XcrLt7r9t7X1XrEK1dj5E
	 IT0tvGjEAqSuVNR9CQM8iEww/7pry2h0m82N1d+T7k9+vVWexHoeBfasN0+EvN+I21
	 j7e9vkyY8bWXc6nV5PTkUqPXwtlVjgOHcWbgy0Vvl1vIz7XOIA0RFqmxR/qWyae2oK
	 w8L58ubbM1N0+ztY+WDGg84vUbPmP69fRwa5+l/0K39MyGKeRBqQpixwQueBDi9/VI
	 P+mhFO8nt6IGg==
Date: Fri, 6 Feb 2026 16:06:19 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: rzg3s-host: Fix device node reference leak in
 rzg3s_pcie_host_parse_port()
Message-ID: <20260206220619.GA96887@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204-rzg3s-v1-1-142bc81c3312@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28024-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8C34E103A5D
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

Applied to pci/controller/rzg3s-host for v6.20, thanks!

It's close to the merge window, but only affects a single driver
that's pretty new, so if anything breaks it won't affect many people.

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

