Return-Path: <linux-renesas-soc+bounces-30426-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNbDDJZJxmmgIAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30426-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 10:10:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CC4341858
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 10:10:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 783F03007E19
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 09:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 059363CBE7B;
	Fri, 27 Mar 2026 09:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lBm9bbWj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E133CCFDE;
	Fri, 27 Mar 2026 09:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774602451; cv=none; b=FLenRlpPUr7qcMfcf0Uai8koKyDDkoAwGLt0THgTFTljlgJHz2P46BpjeSXspe4oMSAE+SwNjpLD4B9yThdf3HxZqjLqtfT7wLewsvHfi1qXn5NpWz0sdnKluD+bglG6Qhh5/zLA4aTFLbgrdyMEIbbm8wsIfaZukDpqWRcK1Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774602451; c=relaxed/simple;
	bh=ZjebFdSihxZLgJjAVBYMuUvCsxxt6OaZ8SQEmNE3ewA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lekwPDR45jajWfyWL73objZXxGWKQ6+50Yvult4vQtH/PEjElMAoNumUEC9WZb94iQJx62LPoiAWUS8c8VmFBsp1HOI3Q/6e6hd2XiNsrZt/Q6wPHzrVVPQrAWzwp3nLSFMWpqovUXEFM/PUYaZ+5atPDC0J8xdgHf1RbHSxzc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lBm9bbWj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E9822190A;
	Fri, 27 Mar 2026 10:06:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774602370;
	bh=ZjebFdSihxZLgJjAVBYMuUvCsxxt6OaZ8SQEmNE3ewA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lBm9bbWjFN4/OZSMEelhHf0QPQRYl72Dhq8RYVZCxPcy0hGxja5sMThYMXaLX1rel
	 X1ZZnF+We8LegC55l8RLOXAPKSTiMEttEtQxwlZ4ekjCNDwU/zfopIhdysVyU7lDgV
	 f2LwiNndKl0kkwu8FdF5nFfEjdKy3oLWn0qbPhRA=
Date: Fri, 27 Mar 2026 11:07:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/4] arm64: dts: renesas: Fix missing cells and reg in
 Salvator-X panel DTO
Message-ID: <20260327090727.GB3026970@killaraus.ideasonboard.com>
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
 <20260326042411.215241-3-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260326042411.215241-3-marek.vasut+renesas@mailbox.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-30426-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:email,killaraus.ideasonboard.com:mid,0.0.0.2:email,ideasonboard.com:dkim,ideasonboard.com:email,0.0.0.1:email]
X-Rspamd-Queue-Id: 90CC4341858
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Marek,

Thank you for the patch.

On Thu, Mar 26, 2026 at 05:23:59AM +0100, Marek Vasut wrote:
> Add missing cells and reg DT property into Salvator-X panel DTO to fix
> the following warning:
> 
> "
> arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso:30.10-34.5: Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@1: node has a unit name, but no reg or ranges property
> "
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso b/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso
> index c83a30adc6adf..7807c3f80409a 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso
> +++ b/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso
> @@ -27,7 +27,12 @@ &lvds0 {
>  	status = "okay";
>  
>  	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
>  		port@1 {
> +			reg = <1>;
> +
>  			lvds0_out: endpoint {
>  				remote-endpoint = <&panel_in>;
>  			};

-- 
Regards,

Laurent Pinchart

