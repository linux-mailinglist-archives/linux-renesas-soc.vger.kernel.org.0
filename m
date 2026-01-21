Return-Path: <linux-renesas-soc+bounces-27217-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MF8yG1wYcWmodQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27217-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 19:18:04 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D06255B29D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 19:18:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5272F7EFE5D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 16:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EF0433343A;
	Wed, 21 Jan 2026 16:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IsFrn/Vb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B1631D38A;
	Wed, 21 Jan 2026 16:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769012820; cv=none; b=dBcoPZPNsbUTghBfOQtvD+TDgIWU403vzKuHad3pNthH7cytgMbBWC2pFDOPKAHQSTAU2FBh8QjQxkni3lBtaO3iLdufpfKlnp9/mcJ6vT833Ti/WrBdorORenZfgrZkw31xYn4ZqaIwUgbMSg55L4kAudFk5+1IpTAGVV4XK5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769012820; c=relaxed/simple;
	bh=lPZEsy/R0TWCo+vIlgpfWmuSY9TFELbqcAynRk1xTZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PkbFRLLNXoyixgo6IXQV8qElN+ZtxHBOml5QrABc9kUhpJ9+uBe9IKuD0804WDcWMYK4rO7/KObGJKdrCcCPgemOwBGMGso1myo/KZXqPo2gUNj/u67iAHxY/KupVCX21dkJFoQ58hrmejNvBcHUZwhwbVhqBnEQL06IipwFipw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IsFrn/Vb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D8E6C4CEF1;
	Wed, 21 Jan 2026 16:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769012819;
	bh=lPZEsy/R0TWCo+vIlgpfWmuSY9TFELbqcAynRk1xTZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IsFrn/VbHO2nn92pkkVJI9MKbIShiRgObfWNxeoMuMY+8XBh2y+wDDQsdNzWVry82
	 pWMVvCoVGogcldv/4L1GEJRo/AXz1nBicDA2MTn/0okJXiwa8CH3MgioTm5gzWxfUI
	 DhlkxGVAIWiA4jOr9n9byYIbxMTNvNLb5Xl/zmRF6qunSR22dc5mV+37bE8qj5ycCu
	 lK7cflSEbi5K6kpPA8AsyTLg4EugTJttbzxTjhOr29wXeDiSaczR6Q5Eeq5X2IAmW4
	 SQ4eGP0mWY6iHkWNZNeayWoezRc0dbzO3GOv9tmy6Y25Gl+wFtbH7nmLEh2GCkHIzG
	 HVNGVVzKrzpqg==
Date: Wed, 21 Jan 2026 10:26:58 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-omap@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] dt-bindings: display: bridge: nxp,tda998x: Add missing
 clocks
Message-ID: <176901278536.3411449.15766842466714764313.robh@kernel.org>
References: <2b66577296583a6787f770f0eb13c42a6b50768b.1768233569.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b66577296583a6787f770f0eb13c42a6b50768b.1768233569.git.geert+renesas@glider.be>
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,intel.com,linaro.org,armlinux.org.uk,kwiboo.se,gmail.com,kernel.org,ideasonboard.com,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-27217-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_PROHIBIT(0.00)[0.0.0.70:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,devicetree.org:url]
X-Rspamd-Queue-Id: D06255B29D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 12 Jan 2026 17:02:40 +0100, Geert Uytterhoeven wrote:
> Some TDA998x variants (e.g. TDA19988) have an OSC_IN pin, to connect
> an external oscillator circuit or clock source.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This fixes "make dtbs_check":
> 
>     arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
> 	    from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml
>     arch/arm64/boot/dts/renesas/r8a774c0-cat874.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
> 	    from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml
>     arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
> 	    from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml
>     arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
> 	    from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml
> 
> This patch can be considered v3 of "[PATCH v2 2/3] [RFC] arm64: dts:
> renesas: cat874: Drop bogus clocks property"[1], as the pin is actually
> connected to a clock source on that board.  On BeagleBone Black, it is
> also connected to a clock source, but not described in DT.
> 
> The linux driver does not use this clock directly, but I suspect[2] the
> use of this pin is controlled through the AP_ENA register value, as
> specified in the second cell of the the audio-ports property.
> 
> [1] https://lore.kernel.org/97b949cddd7e30e9c05873800330dccd3483b12b.1663165552.git.geert+renesas@glider.be
> [2] I do not have access to the programming manual.
> ---
>  .../devicetree/bindings/display/bridge/nxp,tda998x.yaml        | 3 +++
>  1 file changed, 3 insertions(+)
> 

Applied, thanks!


