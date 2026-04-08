Return-Path: <linux-renesas-soc+bounces-30998-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FO5Iqo91mm6CggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30998-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 13:36:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E81F3BB5A9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 13:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BB373302757C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 11:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A41EF3B6C06;
	Wed,  8 Apr 2026 11:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gWwr1qk0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00FD26CE2C;
	Wed,  8 Apr 2026 11:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775648042; cv=none; b=MwWGPaxuzSCN+y+U9NKzrA390hxSIA2BohH/r4pseFkDO/XlgX2Qm5pEpTUQcn78Zt5UWLcqNbd9LMQYxQliYWhBNu6P6Gy1zRHel4jWMrw+MKiPD39wxsdz5yOwazHX+1wA5Ib/9HUc8W03PngrHD5dalObfFR5fWqVKHuS+zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775648042; c=relaxed/simple;
	bh=izDA6Rc9R+iHrl+dC4odB6QVimdK962ullRdRxnc0CY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kvKCfD0pSGAUL1kMe1fooJmQI6TuM7hAZYstlsuC4k2/+JBx66hgfPpUuAImwboYfhbHDnKkKl53q/V8fMY8aX7dvspK/AIuAMs7XOk2nbgXZd8g3RiphhBv7uK+XgeAkbgO78wVPNiwsofp7xd/AaPYS/7CWH3FsS1R4tC9aOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gWwr1qk0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 77383593;
	Wed,  8 Apr 2026 13:32:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775647951;
	bh=izDA6Rc9R+iHrl+dC4odB6QVimdK962ullRdRxnc0CY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gWwr1qk0Y2q0w3+I7Pig7qtJkuQkpVgwJRCv9oAOJoRp0YIPHq7W+91uOsXcHYq+M
	 PLDiAEpYzw7/q20sKx1ks0Y/Bc69wxpvrXYDyYk+uVstGM/X5ypE2lbwKHa1JNNswS
	 ItIQW1QLfugj37IHeHsLA7ZFzLXM5a9yoQzCFccM=
Date: Wed, 8 Apr 2026 14:33:58 +0300
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
Subject: Re: [PATCH v6 19/21] arm64: dts: renesas: r9a09g047: Add vspd{0,1}
 nodes
Message-ID: <20260408113358.GE1928916@killaraus.ideasonboard.com>
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
 <46547aaff3cdb8ea6e17cf1fdec699d83a1cd71b.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <46547aaff3cdb8ea6e17cf1fdec699d83a1cd71b.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30998-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[164b0000:email,renesas.com:email,0.251.119.0:email,ideasonboard.com:dkim,ideasonboard.com:email,killaraus.ideasonboard.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,164a0000:email]
X-Rspamd-Queue-Id: 7E81F3BB5A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 12:37:04PM +0200, Tommaso Merciai wrote:
> Add vspd{0,1} nodes to RZ/G3E SoC DTSI.
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v5->v6:
>  - No changes.
> 
> v4->v5:
>  - No changes.
> 
> v3->v4:
>  - No changes.
> 
> v2->v3:
>  - No changes.
> 
> v1->v2:
>  - Squashed vspd0 and vspd1 patches into a single patch.
>  - Collected tags.
> 
>  arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> index 3115ab4b050f..f2fdaadd9d39 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -1608,6 +1608,34 @@ fcpvd1: fcp@164a0000 {
>  			resets = <&cpg 0x11e>;
>  			power-domains = <&cpg>;
>  		};
> +
> +		vspd0: vsp@16480000 {
> +			compatible = "renesas,r9a09g047-vsp2",
> +				     "renesas,r9a07g044-vsp2";
> +			reg = <0 0x16480000 0 0x10000>;
> +			interrupts = <GIC_SPI 881 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 0xed>,
> +				 <&cpg CPG_MOD 0xee>,
> +				 <&cpg CPG_MOD 0xef>;
> +			clock-names = "aclk", "pclk", "vclk";
> +			resets = <&cpg 0xdc>;
> +			power-domains = <&cpg>;
> +			renesas,fcp = <&fcpvd0>;
> +		};
> +
> +		vspd1: vsp@164b0000 {
> +			compatible = "renesas,r9a09g047-vsp2",
> +				     "renesas,r9a07g044-vsp2";
> +			reg = <0 0x164b0000 0 0x10000>;
> +			interrupts = <GIC_SPI 921 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 0x1a8>,
> +				 <&cpg CPG_MOD 0x1a9>,
> +				 <&cpg CPG_MOD 0x1aa>;
> +			clock-names = "aclk", "pclk", "vclk";
> +			resets = <&cpg 0x11e>;
> +			power-domains = <&cpg>;
> +			renesas,fcp = <&fcpvd1>;
> +		};

This matches the documentation.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  	};
>  
>  	stmmac_axi_setup: stmmac-axi-config {

-- 
Regards,

Laurent Pinchart

