Return-Path: <linux-renesas-soc+bounces-32152-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNMUODxm+2kxawMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32152-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:03:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BCB4DDC90
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:03:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 77E9230BB20A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 15:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B077A496914;
	Wed,  6 May 2026 15:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tfEeQw/d"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F98496905;
	Wed,  6 May 2026 15:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778082952; cv=none; b=XuuwCzH986d+7z680KsSOw5dLooYCsqJ0ZBIn7dkiJ6bLivauhT70uBiPdynto1KC6Ua5w8qiFFBYX66eDy/n4D2kiljGqwVbtAakib3aF7FXJGjxXc6w77vDsyyXVPdz2uyk6M3D5mZHt0SkkQK4trnBCsUjDv1aT5nJpD5ick=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778082952; c=relaxed/simple;
	bh=Ph5NSUFFQWfRFBXRYCMYPAzIJbj1RVi6AHZ+xntAAFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=di6mNL606P7ZiWZiC9zR6tVRYE2zYWDlU9yAn6Uy50HjjN2EKoBJAFX5FKDl5wv0IeG/6NY3KOEtaDwywYoqDpg1x08pGBBSMfqBGuxJp7rb2N7/d3hPfXv47P0gdgBF53nT/BcrHhwLzyg/NXH5lS74uWG4Owcd69oheQq0G0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tfEeQw/d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2252C2BCB0;
	Wed,  6 May 2026 15:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778082952;
	bh=Ph5NSUFFQWfRFBXRYCMYPAzIJbj1RVi6AHZ+xntAAFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tfEeQw/dEE9ZvynULyLEVP7NROJ17+o5Zid3jA3XxADKGiWLaVX6pA0Mc4EGbzUoy
	 grMbANHbWa/oRAll7VELcgEWxYM1xYjMAZCGhPn23K9ro5Ac9esX1ZmctTY3cGhVfg
	 O9D5dMOSkMfTQ+UkDhil5Dl6ugh5eqyCsDiS1Ex3j/XvLoqICT5jjfoh8lTugrDQqa
	 C+/ozpmkDU0zWqx1jD3zzF6TShiKT4Ug0LkW8VSyMnm2vv+99PvgFcm8CCk/ah5qqx
	 IN07dtX8NXTP1CmuNGlVnw8tIcjd8iEMKjFLibvSqWMWxVIQkkbSS40xb64aosafnp
	 8EyEtHW5sEN5g==
Date: Wed, 6 May 2026 21:25:41 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	vigneshr@ti.com, jingoohan1@gmail.com, thomas.petazzoni@bootlin.com, 
	pali@kernel.org, ryder.lee@mediatek.com, jianjun.wang@mediatek.com, 
	claudiu.beznea.uj@bp.renesas.com, mpillai@cadence.com, robh@kernel.org, s-vadapalli@ti.com, 
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/8] PCI: Add pcie_wait_after_link_train() helper
Message-ID: <qryvbq7tn7gpkx63ljauddp3qxczgbzlpfkxiula7vq6f23yaz@oi2pal2ynzgv>
References: <20260506152346.166056-1-18255117159@163.com>
 <20260506152346.166056-2-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260506152346.166056-2-18255117159@163.com>
X-Rspamd-Queue-Id: 53BCB4DDC90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32152-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,kernel.org,ti.com,gmail.com,bootlin.com,mediatek.com,bp.renesas.com,cadence.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Wed, May 06, 2026 at 11:23:39PM +0800, Hans Zhang wrote:
> PCIe r6.0, sec 6.6.1 (Conventional Reset) requires that for a Downstream
> Port supporting Link speeds greater than 5.0 GT/s, software must wait a
> minimum of 100 ms after Link training completes before sending any
> Configuration Request.
> 
> Introduce a static inline helper pcie_wait_after_link_train() that checks
> the given max_link_speed (2 = 5.0 GT/s, 3 = 8.0 GT/s, etc.) and calls
> msleep(100) only when the speed is greater than 5.0 GT/s. The helper uses
> the existing PCIE_RESET_CONFIG_WAIT_MS macro defined in pci.h.
> 
> This allows multiple host controller drivers to share the same mandatory
> delay without duplicating the logic.
> 
> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---
>  drivers/pci/pci.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 4a14f88e543a..a8705a2a2d85 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h

Since this helper is for host controller drivers, this needs to be defined in
pci-host-common.h.

> @@ -60,6 +60,19 @@ struct pcie_tlp_log;
>   */
>  #define PCIE_RESET_CONFIG_WAIT_MS	100
>  
> +/**
> + * pcie_wait_after_link_train - Wait 100 ms if link speed > 5 GT/s
> + * @max_link_speed: the maximum link speed (2 = 5.0 GT/s, 3 = 8.0 GT/s, ...)
> + *
> + * Must be called after Link training completes and before the first
> + * Configuration Request is sent.
> + */
> +static inline void pcie_wait_after_link_train(int max_link_speed)

pci_host_common_link_train_delay()?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

