Return-Path: <linux-renesas-soc+bounces-33945-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7y+UOdU7LGp5OAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33945-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 19:03:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3FB67B2E0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 19:03:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=llm605R7;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33945-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33945-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BCAD2300E3E2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 17:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19CA3403142;
	Fri, 12 Jun 2026 17:01:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F53B3F1AAF;
	Fri, 12 Jun 2026 17:01:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781283713; cv=none; b=XkrwBmW8G2v/EKV+vMFVn4YskLQhMNPatv96fsKg5TZUX0swFSs9KFZECfaq+TazZa74JTJ5ANPeMgyRXR+FCFYSEAA5wOooBAO5Fx+Ue6PgTI3D5VGTjHrtjriqzVH9Q2H6wgS4GvyNOxa6fCmfvK7U3JYVLbOGNsGFy5B7k5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781283713; c=relaxed/simple;
	bh=KVbtAEEtprqp5yyIoAXBQcwpPK0XelSa5kEMMWYCbAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nQ/EzgxMUhuLQBrw7mYKszxnBulazGoc77Z72ngipUyc1V+szNHVQuUhZvV9auBxvIEWzYud5/synh64OY9OzfVisZHuEwmxS9gbNZfY+zSmD1x/qA/w4NkG3vxz7qHX6rD80YNhn/iFQ90+H2khcDPvYPLtE/RYl0MJHFxJyLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=llm605R7; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6A615225;
	Fri, 12 Jun 2026 19:01:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781283677;
	bh=KVbtAEEtprqp5yyIoAXBQcwpPK0XelSa5kEMMWYCbAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=llm605R7ZrLc9err8IAkvdf4IzX4Spd6MKK7m6pw5EdHUOYoTigYq5B62jlv0yazg
	 mbg/joeHg1oy1aTU96k+hDxZ+KHpvqentcezJiiytYRIT/SPXAZ6sC5Np6Zi7D7Han
	 0pCNsBhLoieIxwIdVVc1UQ6I5cQalETck5BgagGw=
Date: Fri, 12 Jun 2026 20:01:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Conor Dooley <conor@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
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
Subject: Re: [PATCH v2 2/5] dt-bindings: display: bridge: Document Renesas
 R-Car V4H DSC bindings
Message-ID: <20260612170146.GA2094246@killaraus.ideasonboard.com>
References: <20260515-rcar-du-dsc-v2-0-f6b9240a1240@ideasonboard.com>
 <20260515-rcar-du-dsc-v2-2-f6b9240a1240@ideasonboard.com>
 <20260515-fraying-trickle-7511a2eeaf44@spud>
 <81f89aa1-84d8-44e1-813b-2bbcafe3687e@ideasonboard.com>
 <20260612-landed-remedial-79582e900699@spud>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260612-landed-remedial-79582e900699@spud>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33945-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:conor@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:marek.vasut+renesas@mailbox.org,m:kieran.bingham+renesas@ideasonboard.com,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:geert@glider.be,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:magnusdamm@gmail.com,m:marek.vasut@mailbox.org,m:kieran.bingham@ideasonboard.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_CC(0.00)[ideasonboard.com,glider.be,baylibre.com,kernel.org,intel.com,linaro.org,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,mailbox.org,pengutronix.de,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:from_mime,killaraus.ideasonboard.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B3FB67B2E0

On Fri, Jun 12, 2026 at 05:09:48PM +0100, Conor Dooley wrote:
> On Fri, Jun 12, 2026 at 01:43:44PM +0300, Tomi Valkeinen wrote:
> > On 15/05/2026 20:32, Conor Dooley wrote:
> > > On Fri, May 15, 2026 at 10:56:15AM +0300, Tomi Valkeinen wrote:
> > > > From: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > > > 
> > > > The Renesas DSC Display Stream Compression is a bridge embedded in the
> > > > Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
> > > > 8k or 400 Mpixel/s .
> > > > 
> > > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > > > [tomi.valkeinen: fix the example]
> > > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > > > ---
> > > >   .../bindings/display/bridge/renesas,dsc.yaml       | 96 ++++++++++++++++++++++
> > > >   1 file changed, 96 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsc.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsc.yaml
> > > > new file mode 100644
> > > > index 000000000000..2918d592732b
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsc.yaml
> > > 
> > > Filename matching the compatible please.
> > 
> > All the other Documentation/devicetree/bindings/display/bridge/renesas,*
> > files follow the same style, where the file name is in a generic format, but
> > the actual compat strings are per SoC (and no generic compat string).
> 
> No idea why it's like that currently, but filename matching compatible
> is the policy.

I wonder if we should use

  compatible:
    items:
      - enum:
          - renesas,r8a779g0-dsc
      - const: renesas,rcar-dsc

to prepare for the other SoCs that include a DSC. It's of course hard to
predict how compatible all new silicon will be, but we know there will
be some compatible ones.

This being said, looking for instance at renesas,du.yaml in the same
directory, we have

  compatible:
    enum:
      - renesas,du-r8a7742 # for RZ/G1H compatible DU
      - renesas,du-r8a7743 # for RZ/G1M compatible DU
      - renesas,du-r8a7744 # for RZ/G1N compatible DU
      - renesas,du-r8a7745 # for RZ/G1E compatible DU
      - renesas,du-r8a77470 # for RZ/G1C compatible DU
      - renesas,du-r8a774a1 # for RZ/G2M compatible DU
      - renesas,du-r8a774b1 # for RZ/G2N compatible DU
      - renesas,du-r8a774c0 # for RZ/G2E compatible DU
      - renesas,du-r8a774e1 # for RZ/G2H compatible DU
      - renesas,du-r8a7779 # for R-Car H1 compatible DU
      - renesas,du-r8a7790 # for R-Car H2 compatible DU
      - renesas,du-r8a7791 # for R-Car M2-W compatible DU
      - renesas,du-r8a7792 # for R-Car V2H compatible DU
      - renesas,du-r8a7793 # for R-Car M2-N compatible DU
      - renesas,du-r8a7794 # for R-Car E2 compatible DU
      - renesas,du-r8a7795 # for R-Car H3 compatible DU
      - renesas,du-r8a7796 # for R-Car M3-W compatible DU
      - renesas,du-r8a77961 # for R-Car M3-W+ compatible DU
      - renesas,du-r8a77965 # for R-Car M3-N compatible DU
      - renesas,du-r8a77970 # for R-Car V3M compatible DU
      - renesas,du-r8a77980 # for R-Car V3H compatible DU
      - renesas,du-r8a77990 # for R-Car E3 compatible DU
      - renesas,du-r8a77995 # for R-Car D3 compatible DU
      - renesas,du-r8a779a0 # for R-Car V3U compatible DU
      - renesas,du-r8a779g0 # for R-Car V4H compatible DU
      - renesas,du-r8a779h0 # for R-Car V4M compatible DU

Could the file have been named renesas,du-r8a7790.yaml ? Sure. Would it
be better for users than renesas,du.yaml ? I'm less sure.

-- 
Regards,

Laurent Pinchart

