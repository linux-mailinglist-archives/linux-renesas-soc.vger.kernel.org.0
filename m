Return-Path: <linux-renesas-soc+bounces-28099-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELntDEJ5imlWKwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28099-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 01:18:10 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8887C115900
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 01:18:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 589E9301C88A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 00:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A8A11F8AC8;
	Tue, 10 Feb 2026 00:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jADlMy6q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39C91DE4E0;
	Tue, 10 Feb 2026 00:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770682685; cv=none; b=NQWCnpNv/mlZo/q5HZ1f6NvXm3Tk2yU23hK/Us6YVaIGUbXTT61dJ4PZJlgVod3jpP0cQwS7dOet3twNh/BzyAzvG6HbJNZRSzxfqQbUdT7pYY/XvUNLT7sEuamiXeszo7/iffRt1cZz1KPAriIO4sNtzuBVa5Szo2SAyw1S38g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770682685; c=relaxed/simple;
	bh=yOKtSQ64lPH+pKZWkMpdayAgXkECYC0908XJETAT8rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rrsp1HGA8QnirHOsMZ69cmmPB0ttuR0JqaMFLS9CtqXnadrUAgAlgbrQ5eElfzorLI3LlErKx/f+4y6JHWaAJ53NPS6g1L9QRJmgYcFRYpvrPHhl7X6W2aoA01c0pN4XFo1QGxs7CIMF5Esi5jU9CKWGScOuQ97fUwBd0Kan0AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jADlMy6q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 096D5C116C6;
	Tue, 10 Feb 2026 00:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770682684;
	bh=yOKtSQ64lPH+pKZWkMpdayAgXkECYC0908XJETAT8rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jADlMy6q+9AdYM2KScIob+gmZ/IqiIoFvLYXRsLWOxF2F1e63FrnosDByKhahgbET
	 CiUgu7RfX6si66t8DZ6RYJur2473nH+9RhJ6xOIqjxzFGL95IAV9n52BsfJ/fCb+17
	 HDgEJw37oIS1ID6uaLJLZWblIRU1LtykbDja5l0Et5ffQzZMmolMn6ao7nx0CgrFWi
	 4kuQ9fc7a6LDDFuT4FsY2ib4pBlyBUB48RGUZ98FnEhjgunP+1ULeG4GL3oMhUEqsK
	 G5Y8UfDtpOawnd07CpBLm53Dv3APYXuHFR+EUw4aHt/BXuYNy6VQVeblTL7VNgIhyD
	 lT6JHc2e/6YYw==
Date: Mon, 9 Feb 2026 18:18:03 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: geert@linux-m68k.org, Conor Dooley <conor+dt@kernel.org>,
	biju.das.jz@bp.renesas.com, Maxime Ripard <mripard@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Thomas Zimmermann <tzimmermann@suse.de>, tomm.merciai@gmail.com,
	laurent.pinchart@ideasonboard.com, Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v4 10/20] dt-bindings: display: bridge: renesas,dsi: Add
 support for RZ/G3E SoC
Message-ID: <177068268250.2177961.13459546326597874034.robh@kernel.org>
References: <cover.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
 <9ae5c0d817ba697084be9022ad7fa20e9e167073.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ae5c0d817ba697084be9022ad7fa20e9e167073.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-28099-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[linux-m68k.org,kernel.org,bp.renesas.com,gmail.com,vger.kernel.org,baylibre.com,linux.intel.com,lists.freedesktop.org,glider.be,ideasonboard.com,suse.de,ffwll.ch];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 8887C115900
X-Rspamd-Action: no action


On Mon, 02 Feb 2026 12:57:41 +0100, Tommaso Merciai wrote:
> The MIPI DSI interface on the RZ/G3E SoC is nearly identical to that of
> the RZ/V2H(P) SoC, except that this have 2 input port and can use vclk1
> or vclk2 as DSI Video clock, depending on the selected port.
> 
> To accommodate these differences, a SoC-specific
> `renesas,r9a09g047-mipi-dsi` compatible string has been added for the
> RZ/G3E SoC.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v1->v2:
>  - Removed oneOf from clocks property, which is no sufficient to
>    differentiate between RZ/G3E, RZ/V2H(P) and RZ/G2L.
>    In particular both RZ/G3E and RZ/G2L have 6 clocks with different
>    meanings.
>  - Use the already exist vclk instead of vclk1 for RZ/G3E DSI bindings.
>  - Updated the allOf section accordingly.
> 
> v2->v3:
>  - No changes.
> 
> v3->v4:
>  - No changes.
> 
>  .../bindings/display/bridge/renesas,dsi.yaml  | 144 +++++++++++++-----
>  1 file changed, 109 insertions(+), 35 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


