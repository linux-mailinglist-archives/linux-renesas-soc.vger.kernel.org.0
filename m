Return-Path: <linux-renesas-soc+bounces-33408-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJZvM1KPHmodlAkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33408-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 10:07:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A93562A2D5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 10:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E3BE30C250F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 08:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44A753BB678;
	Tue,  2 Jun 2026 08:00:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5EF3BE16E;
	Tue,  2 Jun 2026 08:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387256; cv=none; b=pAoWUz0yOg7aCS7RldabZ1xPbbTqtOAPwIdV6GkJKI1jwFQhCXjYydlM5mk9U5tHy8qJFRj0HPqHtfnrqJy7llK3DyX0hPMw+2keb/0qT0Z23H9XIFXAOggrtuUUCCF2aN683DUzhGZ+VJPU2JnH5bqrf01oyR4HLBRLNYOkvlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387256; c=relaxed/simple;
	bh=NkfBW5FHnHW4bfvwamUKH16Nw5pxunHkiLN/hP36ZmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=obMyZVCnb7h4StQn6qvh75UJqUe6fCBT0zlNyNIl1TpJXUMN6hQD7/oUzcN5R4/D0FkMbzE/h8sljuUjyeS0VcVIvFV3avbexUB3goMJWGx5Y0bl8PQNw6I1wcM29EvufIQrCE85ZT19+uQWMDRtFFf3E/4i4TLZ8a8LH8mWSsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B34341F00893;
	Tue,  2 Jun 2026 08:00:50 +0000 (UTC)
Message-ID: <86e80877-b860-4b93-a5ae-a416840eb393@tuxon.dev>
Date: Tue, 2 Jun 2026 11:00:49 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] PCI: rzg3s-host: Add support for RZ/V2H(P) SoC
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260520164823.436992-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260520164823.436992-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260520164823.436992-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33408-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[tuxon.dev];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,bp.renesas.com,google.com,pengutronix.de,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tuxon.dev:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3A93562A2D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi, Prabhakar,

On 5/20/26 19:48, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add support for the RZ/V2H(P) SoC PCIe controllers to the rzg3s-host
> driver.
> 
> The RZ/V2H(P) SoC features two independent PCIe controllers that share
> four physical lanes. The hardware supports two configuration modes:
> single x4 mode where the first controller uses all four lanes, or dual
> x2 mode where both controllers use two lanes each.
> 
> Introduce a setup_lanes() function pointer to configure the PCIe lanes
> based on the hardware instance. Implement rzv2h_pcie_setup_lanes() to
> detect the configuration at boot time and program the lane mode via the
> system controller.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
> - Parsed controller-id from the "renesas,sysc" property instead of
>    using linux,pci-domain.
> 
> v1->v2:
> - Updated commit message.
> - Added locks to protect shared lane configuration state and
>    prevent concurrent access issues during probe.
> - Added cleanup action to release lanes on driver removal.
> - Reconfigured RZG3S_SYSC_FUNC_ID_LINK_MASTER in resume path.
> - Renamed num_channels to num_pcie_controllers for clarity.
> ---
>   drivers/pci/controller/pcie-rzg3s-host.c | 180 +++++++++++++++++++++++
>   1 file changed, 180 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
> index edb49af7429a..15879b2c0bd2 100644

[ ...]

> +static int rzv2h_pcie_setup_lanes(struct rzg3s_pcie_host *host)
> +{
> +	struct device_node *np = host->dev->of_node;
> +	u32 num_lanes;
> +	int ret;
> +
> +	ret = of_property_read_u32(np, "num-lanes", &num_lanes);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * RZ/V2H(P) supports up to 4 lanes, but only in single x4 mode
> +	 * for the first controller. Dual x2 mode is supported with 2
> +	 * lanes for both controllers.
> +	 */
> +	if (num_lanes != 4 && num_lanes != 2)
> +		return -EINVAL;
> +
> +	if (host->controller_id == RZG3S_PCIE_CONTROLLER_ID_1 && num_lanes > 2)
> +		return -EINVAL;
> +
> +	guard(spinlock)(&rzv2h_lane_lock);
> +	if (rzv2h_num_total_lanes + num_lanes > RZV2H_PCIE_MAX_LANES)
> +		return -EINVAL;
> +
> +	ret = rzg3s_sysc_config_func(host->sysc, RZG3S_SYSC_FUNC_ID_LINK_MASTER,
> +				     num_lanes == 2 ?
> +				     RZG3S_SYSC_LINK_MODE_DUAL_X2 :
> +				     RZG3S_SYSC_LINK_MODE_SINGLE_X4);
> +	if (!ret) {

I personally would prefer:

	if (ret)
		return ret;



> +		rzv2h_num_total_lanes += num_lanes;
> +		host->num_lanes = num_lanes;
> +	}
> +
> +	return ret;

And return 0 here. Up to you.

w/ or w/o that addressed:

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Tested it on RZ/G3S:

Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thank you,
Claudiu

