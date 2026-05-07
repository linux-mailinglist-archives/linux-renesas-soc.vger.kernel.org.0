Return-Path: <linux-renesas-soc+bounces-32228-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ioHQLDts/Gm7PwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32228-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 12:40:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 324F24E6ECF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 12:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B5AE3020EF3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 10:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEC043E92AF;
	Thu,  7 May 2026 10:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SSLrc/lN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15A93D525B;
	Thu,  7 May 2026 10:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778150314; cv=none; b=RtcpG0V+SfDQOUghjp22HSRKiOqsN/QI+YVJzIYd+LlGmYKR/IKtBrJx2igliR56KsDCc6ke8fr4N6p9eRDj94kThM9Rflu8+X1eNANwI5AolaZKx2bW6TPqpGxfuiQhgZZ8uUn5RVuKBYbVs0KcQ7KnoXS7x5stWHdmm2lniiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778150314; c=relaxed/simple;
	bh=ydmTmsjfRJ0hth7ILhAiLaP0jMYvJoZgq1tSBlpEHq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FZyB/y3eF5z7KVUBxof27isj8XfLO6UhfJT4bliA7joPFrbOSNt1p+D4UkMjPl8UmLEcTfomylN1nLTH5R/mVa04UaVeEfja+MATwnu88fy32sK/U6vp6xHFdC64KR/PoBnSS1F2dQTKV92xSKnOdlRTw1q05mWth4/jrWFOVdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SSLrc/lN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7DFB664;
	Thu,  7 May 2026 12:38:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778150307;
	bh=ydmTmsjfRJ0hth7ILhAiLaP0jMYvJoZgq1tSBlpEHq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SSLrc/lNt577vc7KdRU5Lp7rvS19wjBj/Atp47wfhnbIQE29QoLJ9Z/c0K9jzOxMV
	 P+0fOPK2eBeuitkxn2PxO76f2/ceMBkRx+EiwzLx0uHlfYzXQHv2INJ3XT+eJWAvEl
	 2ToegnWLEYNhE3g++h6115a5yHLIzBGuC3nZoonk=
Date: Thu, 7 May 2026 13:38:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"magnus.damm" <magnus.damm@gmail.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: renesas,rzg2l-du: Add RZ/T2H
 and RZ/N2H support
Message-ID: <20260507103830.GM1778786@killaraus.ideasonboard.com>
References: <20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260429170012.366537-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260506195002.GA1778786@killaraus.ideasonboard.com>
 <CA+V-a8u8=mfR0zDJRNMEjnjrzFVAkOrqtro05Zgd1JFqGRByKw@mail.gmail.com>
 <TY3PR01MB1134676FA7479724BDCE40649863C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TY3PR01MB1134676FA7479724BDCE40649863C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-Rspamd-Queue-Id: 324F24E6ECF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,pengutronix.de,glider.be,lists.freedesktop.org,vger.kernel.org,renesas.com,bp.renesas.com];
	TAGGED_FROM(0.00)[bounces-32228-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[ideasonboard.com:s=mail];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	RCPT_COUNT_TWELVE(0.00)[20];
	DMARC_POLICY_ALLOW(0.00)[ideasonboard.com,none];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.030];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.105.105.114:c];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,renesas.com:email,killaraus.ideasonboard.com:mid,0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 09:24:48AM +0000, Biju Das wrote:
> On 06 May 2026 20:58, Lad, Prabhakar wrote:
> > On Wed, May 6, 2026 at 8:50 PM Laurent Pinchart wrote:
> > > On Wed, Apr 29, 2026 at 06:00:09PM +0100, Prabhakar wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Document the Display Unit (DU) support for the RZ/T2H and RZ/N2H SoCs.
> > > >
> > > > The DU block on RZ/T2H is functionally equivalent to the RZ/G2UL DU
> > > > and supports the DPI interface, but includes SoC-specific register differences.
> > > > Add a dedicated compatible string to represent this variant.
> > > >
> > > > As the DU implementation on RZ/N2H matches RZ/T2H, describe it using
> > > > an RZ/N2H specific compatible string with the RZ/T2H compatible as fallback.
> > > >
> > > > Unlike other DU variants which use a multi-port model, the RZ/T2H
> > > > and RZ/N2H DU has a single output and is modelled using a single
> > > > port node with one endpoint. Add a port property to support this and
> > > > update the allOf constraints accordingly.
> > >
> > > Wouldn't it be simpler to always have a "ports" node, even for
> > > variants with a single port ?
> > >
> > I agree that, from a binding perspective, always having a "ports" node keeps things simpler and
> > consistent. Biju suggested this change based on earlier feedback for the RZ/G3E series.
> 
> From G3E feedback, I got the impression that going forward all future SoCs needs to have
> single port and multiple endpoints. That is the reason for suggesting port for new SoCs.

Right, let's clarify that.

TL;DR: it depends on the hardware architecture (what a surprise :-))

When reviewing the G3E, I noticed that the LCDC has a single output that
is connected to one or multiple encoders, depending on the SoC. I think
this should be modeled in DT with a single port.

Note that this does not preclude using a "ports" node, containing a
single "port@0". If you're confident enough that no future generation
will require multiple ports, then it makes sense to standardize on a
single "port" node and no "ports". If, on the other hand, you think that
some SoCs would have multiple ports, then using a top-level "ports" node
unconditionally would lead to simpler bindings.

I'll let you all decide what you think is the most suitable approach.

-- 
Regards,

Laurent Pinchart

