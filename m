Return-Path: <linux-renesas-soc+bounces-32101-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MZcFlpp+mlXOwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32101-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 00:04:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4124D42D3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 00:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5861930733F3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 22:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A4114A1391;
	Tue,  5 May 2026 22:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rUQ1kXUl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE141FC110;
	Tue,  5 May 2026 22:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778018624; cv=none; b=dXs25J2FbjuYRLg/w5dwgIxYBcAUAzuJnvITFAjSGrRRA3TyCvCSS8s7E+H6z+XeePeM9QItAjZ1zI6v2hrEt+zdB1Gf4bCZ5ZTLHzfkyuXqLC0ygmCAaQOWLrOn7Y0TTtOqaryadNDU1obbuUxnlVSJHfTtXw6d543R2e8HNZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778018624; c=relaxed/simple;
	bh=0enfH9MaghJe1NRHjDQd0G9Ook3g6sEavxPdH0LUlDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ran17f6WAoF4+JSJ2J6vtsSmr08oX3owW9lgVYyWG/0JpIzDMCIO1FNYRn0NuWl//nVTLxk3xD04Wwz0H1e6LLmjOYQGVvFXi5vcEkqnF1Lptav2cO5B8/atrEWr6c0I5Lb7a16TZJo/gN8f5dtizbyfkxJjMzTs+e6LoCnCRoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rUQ1kXUl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D80385B2;
	Wed,  6 May 2026 00:03:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778018618;
	bh=0enfH9MaghJe1NRHjDQd0G9Ook3g6sEavxPdH0LUlDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rUQ1kXUldVcE6uezjEG75AW4gGCp9QMg705KpcXAawY7Q2VbKt7YVux3MVo/vtUyM
	 2cyfTOw6c/polEXZeReO0AFi6IWJJvlsVsb9D8aW12ZnwOzlh+ohYspHUBTuAVaB+1
	 wKIioKgySEZupTiNthDpjOly7KtzZlUOReVteOGk=
Date: Wed, 6 May 2026 01:03:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Nguyen Tran <nguyen.tran.pz@bp.renesas.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 6/7] arm64: dts: renesas: r8a779md: Add Renesas R-Car
 R8A779MD M3Le DTs
Message-ID: <20260505220339.GI1547435@killaraus.ideasonboard.com>
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
 <20260419193718.133174-7-marek.vasut+renesas@mailbox.org>
 <20260429221153.GD132396@killaraus.ideasonboard.com>
 <380861ce-b832-4789-93fa-c2340ce487e6@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <380861ce-b832-4789-93fa-c2340ce487e6@mailbox.org>
X-Rspamd-Queue-Id: DE4124D42D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32101-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[lists.infradead.org,bp.renesas.com,kernel.org,gmail.com,glider.be,ideasonboard.com,renesas.com,baylibre.com,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim]

On Sun, May 03, 2026 at 01:39:27AM +0200, Marek Vasut wrote:
> On 4/30/26 12:11 AM, Laurent Pinchart wrote:
> 
> Hello Laurent,
> 
> >> +/delete-node/ &vin4csi20;
> >> +/delete-node/ &vin5csi20;
> >> +/delete-node/ &vin6csi20;
> >> +/delete-node/ &vin7csi20;
> >> +/delete-node/ &xhci0;
> >> +
> >> +&du {
> >> +	compatible = "renesas,du-r8a779md";
> >> +	renesas,cmms = <&cmm0>, <&cmm3>;
> > 
> > Shouldn't you then also delete the cmm1 node ?
> 
> Please see my reply to [PATCH 1/7] dt-bindings: display: renesas,du: 
> Document Renesas R-Car R8A779MD M3Le , the CMM0,1,3 all seems to be on 
> the chip and accessible. I think the CMM driver should be aware of the 
> IP, even if it is unused, e.g. to bring it into low power state if needed.
> 
> > And does the DU still need three clocks and three interrupts ?
> The Geist board schematic indicates that DU_DOTCLKIN1 is present on the 
> SoC package and is supplied by Xtal X22 on the board, so I think the 
> answer is "yes" for the first clock part of your question.
> 
> As for the interrupt part, it seems DU1 is present, but not connected. 
> That means the DU1 interrupt does exist, but is not going to be used. Do 
> you prefer to describe it or leave it out ?

Following our discussions on IRC, I understand there are quite a few
unknows at this point, and more testing is required in order to upstream
display support. I think your next version will drop support for the DU,
I'm fine with that as a first step. We can then build on top.

-- 
Regards,

Laurent Pinchart

