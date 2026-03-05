Return-Path: <linux-renesas-soc+bounces-28835-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8/6GBW4bqWnf2AAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28835-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 06:58:06 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B85F20B181
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 06:58:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0AB41300AD41
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 05:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98DF2586C2;
	Thu,  5 Mar 2026 05:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PrJQubme"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CBC13D891;
	Thu,  5 Mar 2026 05:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772690278; cv=none; b=JVJfXIxXiP3HSnZ6pgu/SOxhb7vAgVjKpgQ0O4wM3pzim1GRUV+3ln6d8vW9TEhPOKyQ2+x8kHf1xBePUQ3Wsrxgs6S19ZFSsNrJZ3V8GBZjSQqFvYn1yZcy6AAX60EN2lspceLEfJYJ7xWPFgh7eHVx9tLH+ISAmngu7jm5xGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772690278; c=relaxed/simple;
	bh=Wa2MbVyceRbjJZtLgREJ/DegDPHmxBQRDXp2svoQxPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pOLE3WnaApMn0VsDrBA+Tsa/d9i6cWMh09ufMR6beOf5eShe55OtvAy0qa1jumJ2U9aWKsfKYvziH3lC/FJzc/Xv7zptguU5uoPVLsVOI/8LgXz1W/F/oinzMbX3W4qSoLa4jlOX/kHh4K3GxIURXaI2xHfdLUCDbZG1gHkb7FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PrJQubme; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CEACC116C6;
	Thu,  5 Mar 2026 05:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772690278;
	bh=Wa2MbVyceRbjJZtLgREJ/DegDPHmxBQRDXp2svoQxPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PrJQubmemjcruXbGv0tiQltdM4kb6FKR/DE9DXri5pYb26GfkVwOCtb1GbehhkjZ5
	 /tpi9vH3AoSdqpnOZ6lcED3YkGo1VHOi8v+nm1tm8v5+qc1SKXjr2DVwgcB5dWVznB
	 rWeTpALmhUD3eU72LwcIXsFPA1ExtmA+iINCaqrkcPQtr4t5wxvsYv8eDWQKgFGZdB
	 e/FLlAyUgVEo63+ojEhC6Kc6sFH6gTPl+2TjI12r4s6G6SAyOhv/MEvs6a2PMEGJ1r
	 nUuRZJn65b2AmDmmV2+SogooLxiDZdqyS6+ZL+eF/1g5sgjtdxFyFkMAgr9EKZYqsO
	 RVSH8pxDr0AzA==
Date: Thu, 5 Mar 2026 11:27:42 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Koichiro Den <den@valinux.co.jp>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Niklas Cassel <cassel@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: dwc: rcar-gen4: Use 4K EPC BAR alignment
Message-ID: <4o42bskgjazgawswex7sfuvptmbho5gb7inmilntygpm7vdt7p@fcb6ttbbnb45>
References: <20260305015439.1529006-1-den@valinux.co.jp>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260305015439.1529006-1-den@valinux.co.jp>
X-Rspamd-Queue-Id: 0B85F20B181
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28835-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,renesas.com,kernel.org,google.com,glider.be,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,valinux.co.jp:email]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 10:54:39AM +0900, Koichiro Den wrote:
> R-Car S4 Series (R8A779F[4-7]*) uses a 4K minimum iATU region size
> (CX_ATU_MIN_REGION_SIZE = 4K) as per R19UH0161EJ0130 Rev.1.30.
> 
> Update the advertised alignment to 4K, as described in
> commit 2a9a801620ef ("PCI: endpoint: Add support to specify alignment
> for buffers allocated to BARs").
> 
> With the previous 1MB alignment requirement, iATU programming for BAR4
> on this platform often cannot be performed, since a 1MB-aligned target
> address may fall outside the tiny 256B BAR4 window.
> 

Can you clarify this part? What do you mean by 'falling outside of the 256B
BAR4 window'? Where does the failure happen exactly?

> Signed-off-by: Koichiro Den <den@valinux.co.jp>

Fixes tag?

- Mani

> ---
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> index 3d4a889e38cc..396ef9432299 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -428,7 +428,7 @@ static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
>  	.bar[BAR_3] = { .type = BAR_RESERVED, },
>  	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = 256 },
>  	.bar[BAR_5] = { .type = BAR_RESERVED, },
> -	.align = SZ_1M,
> +	.align = SZ_4K,
>  };
>  
>  static const struct pci_epc_features*
> -- 
> 2.51.0
> 

-- 
மணிவண்ணன் சதாசிவம்

