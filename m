Return-Path: <linux-renesas-soc+bounces-31001-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEu5KE9G1mkFCwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31001-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 14:13:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4593BBD4B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 14:13:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 74AC63061550
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 12:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A613BE16E;
	Wed,  8 Apr 2026 12:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eE08sLBO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7E33BE17C;
	Wed,  8 Apr 2026 12:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775650322; cv=none; b=LvxUwb7sjPS5JD2W0PIyQo55XiVq77L0ne9pibays8SRaAtPiTfrAcqmnzVa0tMEj2R3VytC8ikITKDNWz/s4CX3reWgfBquRnk1hrg/Y1Jlg0v/rSqUHVynPmwDJLDOyK8r/auIICDrBDd70zshHiiKx9kXbbwdTRjhV/dMF9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775650322; c=relaxed/simple;
	bh=yLrg4EEZxTbl+jYp5ekc58SS/dTtJj5GLA5g+mQUWpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MgXm9Du4rfPO0lI9NaDoHKg/aT+wNAVrb8Ufjov9EX9fSe9939V83p6ovZYuMfTsNwIigag1o2c1aOGPM54GO1VaXSd37d0fuxsOJaJlOO4n+YNAKuOtwtpdL3AJyGHa200EUMhxcwS3zOfdqWPbOwkIIGcfhaaZdcd6iONNIJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eE08sLBO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E52B71121;
	Wed,  8 Apr 2026 14:10:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775650230;
	bh=yLrg4EEZxTbl+jYp5ekc58SS/dTtJj5GLA5g+mQUWpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eE08sLBOA2/vKse0f9R2TP0XQyBErO4x5TJdtpQwiASGnQm0zgUS886oour18MVB8
	 SqtxtKyaTMOyrTGZ/sqYE6l9XMdKL/hwUYgJID7s+7Rsh+cIX+gGKSSO+x6+dwWfZZ
	 MeOvio4SFkomkJNO21g1xj+vxWXj8GnSVi1OKMWw=
Date: Wed, 8 Apr 2026 15:11:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, geert@linux-m68k.org,
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 20/21] arm64: dts: renesas: r9a09g047: Add DU{0,1} and
 DSI nodes
Message-ID: <20260408121156.GF1928916@killaraus.ideasonboard.com>
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
 <ca31352b03689fa9902660be5cb4d0972ce04304.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ca31352b03689fa9902660be5cb4d0972ce04304.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31001-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux-m68k.org,vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.251.158.16:email,0.251.40.224:email]
X-Rspamd-Queue-Id: 0A4593BBD4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 12:37:05PM +0200, Tommaso Merciai wrote:
> Add DU0, DU1, DSI nodes to RZ/RZG3E SoC DTSI.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v5->v6:
>  - Update ports numbering accordingly to the latest DT bindings.
> 
> v4->v5:
>  - Rename du0_out_dsi0 into du0_out_dsi.
>  - Rename du1_out_dsi0 into du1_out_dsi.
>  - Drop renesas,id entry from DU nodes.
> 
> v3->v4:
>  - No changes.
> 
> v2->v3:
>  - No changes.
> 
> v1->v2:
>  - Use single compatible string instead of multiple compatible strings
>    for the two DU instances, leveraging a 'renesas,id' property to
>    differentiate between DU0 and DU1.
>  - Use vclk instead of vclk1 for DSI Node and set to the right position.
> 
>  arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 120 +++++++++++++++++++++
>  1 file changed, 120 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> index f2fdaadd9d39..25d3a503a6cc 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -1585,6 +1585,126 @@ csi2cru: endpoint@0 {
>  			};
>  		};
>  
> +		dsi: dsi@16430000 {
> +			compatible = "renesas,r9a09g047-mipi-dsi";
> +			reg = <0 0x16430000 0 0x20000>;
> +			interrupts = <GIC_SPI 874 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 875 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 876 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 877 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 878 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 879 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 880 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "seq0", "seq1", "vin1", "rcv",
> +					  "ferr", "ppi", "debug";
> +			clocks = <&cpg CPG_MOD 0xec>, <&cpg CPG_MOD 0xe9>,
> +				 <&cpg CPG_MOD 0xe8>, <&cpg CPG_MOD 0xea>,
> +				 <&cpg CPG_MOD 0x190>, <&cpg CPG_MOD 0xeb>;
> +			clock-names = "pllrefclk", "aclk", "pclk", "vclk",
> +				      "lpclk", "vclk2";
> +			resets = <&cpg 0xd8>, <&cpg 0xd7>;
> +			reset-names = "arst", "prst";
> +			power-domains = <&cpg>;
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					dsi_in0: endpoint {
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					dsi_in1: endpoint {
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +					dsi_out: endpoint {
> +					};
> +				};
> +			};
> +		};
> +
> +		du0: display@16460000 {
> +			compatible = "renesas,r9a09g047-du";
> +			reg = <0 0x16460000 0 0x10000>;
> +			interrupts = <GIC_SPI 882 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 0xed>,
> +				 <&cpg CPG_MOD 0xee>,
> +				 <&cpg CPG_MOD 0xef>;
> +			clock-names = "aclk", "pclk", "vclk";
> +			power-domains = <&cpg>;
> +			resets = <&cpg 0xdc>;

I'm a bit concerned here. The same reset line is shared by the FCP, VSP
and DU. The FCP driver doesn't currently control it, but the VSP and DU
both assert and de-assert reset, without any coordination. Does it work
by chance ?

> +			renesas,vsps = <&vspd0 0>;
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					du0_out_dsi: endpoint {
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +					du0_out_lvds0: endpoint {
> +					};
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +					du0_out_lvds1: endpoint {
> +					};
> +				};
> +			};
> +		};
> +
> +		du1: display@16490000 {
> +			compatible = "renesas,r9a09g047-du";
> +			reg = <0 0x16490000 0 0x10000>;
> +			interrupts = <GIC_SPI 922 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 0x1a8>,
> +				 <&cpg CPG_MOD 0x1a9>,
> +				 <&cpg CPG_MOD 0x1aa>;
> +			clock-names = "aclk", "pclk", "vclk";
> +			power-domains = <&cpg>;
> +			resets = <&cpg 0x11e>;
> +			renesas,vsps = <&vspd1 0>;
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					du1_out_dsi: endpoint {
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					du1_out_rgb: endpoint {
> +					};
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +					du1_out_lvds1: endpoint {
> +					};
> +				};
> +			};
> +		};
> +
>  		fcpvd0: fcp@16470000 {
>  			compatible = "renesas,r9a09g047-fcpvd",
>  				     "renesas,fcpv";

-- 
Regards,

Laurent Pinchart

