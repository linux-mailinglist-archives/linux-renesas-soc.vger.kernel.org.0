Return-Path: <linux-renesas-soc+bounces-32102-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNyxH49t+mm2OwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32102-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 00:22:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4214D4457
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 00:22:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3270B301FA5F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 22:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE4613CAE7D;
	Tue,  5 May 2026 22:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fXZRIqeB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AE037F8D6;
	Tue,  5 May 2026 22:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778019723; cv=none; b=SHPIIgSo+jLrWp/Kdb1E/DE6/H1okrCYXiMDMt2+70WH2Jiv1ddeSIHx2Yqqx1usv2SJq6ll4mxlrDTurFe1iDf/gJjAMA6vJ75HCtMzGeV4epa7oqLVmJ8NI0iO6m50KllsHtsl/9SQ3vGOPVs3x1jEysz6xuXwB0hB5rAya3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778019723; c=relaxed/simple;
	bh=CPnhvTo/ayDu0ICnIu2QOn5mr/0Y2yZIkfO+u6R0rxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HckkhaKIuz+Br2uUDxOXVjd1Cq4eIYhLbtFuLZdbbluqohgpoxpy1E9cClnID/bSVFlVpa6DOc5naEaYIL2X2sxA0+20xYKg/aor/w0Af16EadCM0MIDVzZN2+0oY380IvnoBxetYL1VBzDPQU1bQ+xoCp+Kb6Uvp3LRaIxGKyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fXZRIqeB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 450B578E;
	Wed,  6 May 2026 00:21:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778019717;
	bh=CPnhvTo/ayDu0ICnIu2QOn5mr/0Y2yZIkfO+u6R0rxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fXZRIqeBIjeQo1LkaQ/vthgzsebr995OeJWxRlc2HDoL+Figv4sL/WHbn6bfmGU2p
	 QWy0MyHSQc+v23g2804kp56itaPE27DLGoAg20Zqv042VSESnu7wE1sT6xNDc60sj2
	 uDKaDnYVoahAjmygNv7JFOmgq2i1dfRtMItdhwME=
Date: Wed, 6 May 2026 01:21:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
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
Subject: Re: [PATCH 1/7] dt-bindings: display: renesas,du: Document Renesas
 R-Car R8A779MD M3Le
Message-ID: <20260505222158.GJ1547435@killaraus.ideasonboard.com>
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
 <20260419193718.133174-2-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUzRoELGedrM3ELUjZr-N6DnF4TXtdQR_k74Xmfppu9fA@mail.gmail.com>
 <71b24195-2a3c-46a4-8587-f5055a015eb8@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <71b24195-2a3c-46a4-8587-f5055a015eb8@mailbox.org>
X-Rspamd-Queue-Id: DF4214D4457
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
	TAGGED_FROM(0.00)[bounces-32102-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[linux-m68k.org,lists.infradead.org,kernel.org,gmail.com,ideasonboard.com,renesas.com,baylibre.com,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email]

On Sat, May 02, 2026 at 11:17:22PM +0200, Marek Vasut wrote:
> On 4/29/26 11:57 AM, Geert Uytterhoeven wrote:
> > On Sun, 19 Apr 2026 at 21:37, Marek Vasut wrote:
> >> Extend the Renesas DU display bindings to support the Renesas R-Car
> >> R8A779MD M3Le SoC. This SoC is similar to R-Car R8A77965 M3-N SoC,
> >> except the HDMI port@1 is not present.
> > 
> > "and DU1 is unused." (whatever that may mean...)
> 
> Fixed in V2.
> 
> >> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> >> @@ -42,6 +42,7 @@ properties:
> >>         - renesas,du-r8a779a0 # for R-Car V3U compatible DU
> >>         - renesas,du-r8a779g0 # for R-Car V4H compatible DU
> >>         - renesas,du-r8a779h0 # for R-Car V4M compatible DU
> >> +      - renesas,du-r8a779md # for R-Car M3Le compatible DU
> > 
> > I am not sure you need a new compatible value: is the DU really
> > different than on R-Car M3-N, or does it just lack some wiring? ...
> 
> It seems the DU is identical to the M3N one, so I will add another entry 
> to R8A77965 DU to handle the M3Le one, just like R8A774B1 and R8A774E1 
> DUs . I hope that is acceptable, and also addresses the feedback on this 
> patch ?
> 
> I dumped the VSP and FCP versions on M3N and M3Le and compared them, and 
> I also wrote and read-back the CMM registers to confirm CMM IPs are all 
> present on both M3N and M3Le:
> 
> FCP is identical on M3N and M3Le:
> fe950000.fcp FCP_VCR=0x106
> fe96f000.fcp FCP_VCR=0x106
> fe9af000.fcp FCP_VCR=0x106
> fea27000.fcp FCP_VCR=0x106
> fea2f000.fcp FCP_VCR=0x106
> 
> VSP is identical on M3N and M3Le:
> fe960000.vsp IP_VERSION=0x01011504
> fe9a0000.vsp IP_VERSION=0x01011404
> fea20000.vsp IP_VERSION=0x01011904
> fea28000.vsp IP_VERSION=0x01011704
> 
> CMMs are present on M3N and M3Le, tested with write of bits 28 and 24 
> into CM2_CLU_CTRL and then readback:
> fea40000.cmm CM2_CLU_CTRL readback 0x11000000
> fea50000.cmm CM2_CLU_CTRL readback 0x11000000
> fea70000.cmm CM2_CLU_CTRL readback 0x11000000
> 
> And it does indeed look like we do have DOTCLKIN1 .

So the die seems to be the same as M3N, just with some signals not wired
up. We could simply drop the HDMI output port in DT as Geert proposed.
I'm however a bit concerned we would later find differences that require
a specific compatible string.

At this point, I think more testing is needed, with local access to the
board, to check the display output. As that's hard to do right now,
let's start by upstreaming board support without the DU, and add the DU
on top.

-- 
Regards,

Laurent Pinchart

