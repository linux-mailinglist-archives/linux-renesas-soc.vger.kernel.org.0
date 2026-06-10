Return-Path: <linux-renesas-soc+bounces-33852-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P4H+HBzyKWrhfwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33852-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 01:24:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB9F66D5D1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 01:24:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=Cs87tXWK;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33852-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33852-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E1EE33028645
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 23:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058B037996B;
	Wed, 10 Jun 2026 23:24:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5F533260B;
	Wed, 10 Jun 2026 23:24:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781133849; cv=none; b=NubvnISpail9kdkqtbRmvtpfeYqF1/orJG9RWH3GkOl2Td3L1dy1tae+fBBmwjc1pE4nJjVf0ZtXPVMPa01zCsmJyYPazUR2XawlQqFwsNeNR8Vakqx7844YK/prjrHxouR2ZDDhVe6sCTx4kdPBeMXqHtFEH9osUhzeQzBO2vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781133849; c=relaxed/simple;
	bh=1VgXq/psbzPZ5ujKREwdsJzxQTcDhvTF80CsspVxDH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iS8nBuJL8mFB67s1bfJwTAUNyWLp7tbjHsDNx1kF2dZ4Sp05KzVccK+SLxFCtn3cEohqeN1pPDQOB9XC/FCr6YMH2Zab9nrrchxwfLI62rofnLklNLGbWM89GpPBj5oSDKt3vM5VrTy/wJh5/J/+i5lYbjWfcztdKbe68Q/6VhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Cs87tXWK; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 86A02228;
	Thu, 11 Jun 2026 01:23:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781133816;
	bh=1VgXq/psbzPZ5ujKREwdsJzxQTcDhvTF80CsspVxDH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cs87tXWK6hb7EuJl/FYSVlMzECBIoDmVnwjQh86ApEAq4bvqbHWDOezgf2P0NQ/ka
	 nBTPwxU7NqsP3yRF/yIFPQKIm2F+KMoiG9GfZ19Fwu4i1W+SS0NLtDUyGR3AivFslr
	 dZIqyvBQhMCXRrJHCKDDAhlFZXSy00Sdvzs1CYQs=
Date: Thu, 11 Jun 2026 02:24:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 5/7] arm64: dts: renesas: r8a779g0: Add DSC
Message-ID: <20260610232404.GD1632628@killaraus.ideasonboard.com>
References: <20260515-rcar-du-dsc-v3-0-164157820498@ideasonboard.com>
 <20260515-rcar-du-dsc-v3-5-164157820498@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260515-rcar-du-dsc-v3-5-164157820498@ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33852-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[glider.be,baylibre.com,kernel.org,intel.com,linaro.org,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,mailbox.org,ideasonboard.com,pengutronix.de,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tomi.valkeinen+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:marek.vasut+renesas@mailbox.org,m:kieran.bingham+renesas@ideasonboard.com,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:tomi.valkeinen@ideasonboard.com,m:geert@glider.be,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:marek.vasut@mailbox.org,m:kieran.bingham@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DAB9F66D5D1

Hi Tomi and Marek,

Thank you for the patch.

On Fri, May 15, 2026 at 12:09:30PM +0300, Tomi Valkeinen wrote:
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> The Renesas DSC Display Stream Compression is a bridge embedded in the
> Renesas R-Car V4H SoC. The bridge is placed between DU and DSI1 units.
> 
> The current dtsi file does not represent the DSC at all, and thus the
> pipeline for DSI1 has not been functional.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> [tomi.valkeinen: separated the sparrowhawk changes]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> index 82a7278836e5..52a6176f9fd0 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -2298,6 +2298,35 @@ du_out_dsi0: endpoint {
>  				port@1 {
>  					reg = <1>;
>  					du_out_dsi1: endpoint {
> +						remote-endpoint = <&dsc_in_dsi1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		dsc: dsc@feb8d000 {
> +			compatible = "renesas,r8a779g0-dsc";
> +			reg = <0 0xfeb8d000 0 0x400>;
> +			interrupts = <GIC_SPI 559 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 2819>;
> +			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> +			resets = <&cpg 2819>;
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					dsc_in_dsi1: endpoint {
> +						remote-endpoint = <&du_out_dsi1>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					dsc_out_dsi1: endpoint {
>  						remote-endpoint = <&dsi1_in>;
>  					};
>  				};
> @@ -2534,7 +2563,7 @@ ports {
>  				port@0 {
>  					reg = <0>;
>  					dsi1_in: endpoint {
> -						remote-endpoint = <&du_out_dsi1>;
> +						remote-endpoint = <&dsc_out_dsi1>;
>  					};
>  				};
>  
> 

-- 
Regards,

Laurent Pinchart

