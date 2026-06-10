Return-Path: <linux-renesas-soc+bounces-33803-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3oWtH7MqKWqBRwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33803-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 11:13:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CABC3667B42
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 11:13:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=B9gs8BjO;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="X agXfH7";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33803-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33803-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9125329B0AC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 08:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7DB3AF666;
	Wed, 10 Jun 2026 08:54:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308933ACF1E;
	Wed, 10 Jun 2026 08:53:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081640; cv=none; b=GQD1G/5vSpZ8upugpQZ1jC+XCNCc0wc//nNPVI8+88mWSUNJescjwM7g/IgDiZucXGj2/ZR+/4Sq5SDPeHqXV3gMlIYuARYa7OmP+9fHtrWOYvmTg0MmkmNU7rxJIhBqfrLqFWG3ZXyQKKi/mFDJobjDMeG3SKce1Wfglx9xrTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081640; c=relaxed/simple;
	bh=6TDivE2SVhi1ZMxwxG8G2BWGcHwicQmwDjQarJWys3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SobrsJ88mB5YTn/j7Q3iSrKUK2C35ZZctQAoUgxn7V7UoWEsJ/IUwiooH6Hs4Da3G35pN4ZrIf0EcskYX6oDVncEavx6zvIcaCyO8NeahnXjo3FTAB10X8ejGWNMZDoqOOycCredDIRdOIafUUa4yBo2ESI7dsdtp6601txb0/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=B9gs8BjO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XagXfH7k; arc=none smtp.client-ip=202.12.124.144
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id E1CC71D000A9;
	Wed, 10 Jun 2026 04:53:56 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 10 Jun 2026 04:53:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781081636;
	 x=1781168036; bh=K4eA+zCuYdCUlkff/1ZwtZxUp1wrt492KPkKomECcEY=; b=
	B9gs8BjOcdzdUW6Z6tp2zF8tuWlCM5HpNPdG4cAXfG0WKQtTYVSML7Z5VL3Hm6L1
	y8sfuF+WJu6/dk8COtGDf9RiuVJcNESxRsVQe+Tq1ZbJUsyBYA+f0ZKxesxjo7Zb
	6KRZCI8slf7Wp/6vYf7rQkSLHz/hdUO4qtSj6wIdRqYwjSDIzLrtgzdSxq0BhH+I
	ohj2X7SIPCIGZThnclUzqNzlc4l3qG1eFJOz6x6LV9I0lU4MIYSs26YxBDRE43Nz
	cqUH+nlYIU7ruuvQLdLbMY4cOW9wITDlv8L2xx76UoeOkUr+UmC+Ae2c0S797e8V
	KHP96A+0zBZ3TWQTMQMT0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781081636; x=
	1781168036; bh=K4eA+zCuYdCUlkff/1ZwtZxUp1wrt492KPkKomECcEY=; b=X
	agXfH7kbeRt8GPa/9XOmqcvSVERuPI9KK6hzCFH49wHk8v0LwRXwIIwEJosmvhZG
	H2pKaeqAc5XYyX6dZiRrOIrXg6134RMnXsz78jDrHUhyQhlgu6Z91KyGYZhisRJ9
	p+NrCfXA74Nfr75rv80i3rgP2hoElc4DVq2q2gb9zTGpoZi9h++qfDTJD60w6YSc
	P443Who7D7PJFmacIqVq7xygQB0eSlMm4LTkGHtLULGRvx+l5/4QLkwMpdOqXHTV
	921Xythcc7vgtDJktXCw4wPQUpVHm1O1GcYL8GUbzmfCe/Szg6hrkWpvl1njwCOA
	3EJZwUquLSjaWxEFTD5GQ==
X-ME-Sender: <xms:JCYpakofwKEB0fZaOPCQ2bSzdQrsFDiIjjqXRjCN8-c61Wsf3yYK-Q>
    <xme:JCYpapIMqF7OB5ZWrZ78OA19Dc993IFutcrJsYKWEK4yIuX9oFyDLN0yzinrJB9J3
    hwCoQxFarAp8QaNVUmHnUSTPwTPyh68CUNb0mA0zFl3u8Z_t2WyqAU>
X-ME-Received: <xmr:JCYpagCibPG8MXR8XMBmo6rLG4JRJc9Kv0cwO7oUzeVOzh57wyMRseCFaOQceCb6RbKiJjaNZ66yw_okgS60Xv7NmN-iN_J76WDt>
X-ME-Proxy-Cause: dmFkZTFrzWYbalujk9NkAWD+uOvRH99x2/0/vKKwO2ylyeSLu9NKa+2ruThusc+c33sG1e
    RuVny5zs1QkmR/Un4aefDM4wkSzrCyr4XGVe04SB7ACOeWMCNXau+wHLrmlv11UqDjeV6S
    IHsLnPLv7fZV6ybL9SrGIW7XeVtEJAMzsZHIvrnAoVb40MNIef1nNdCv/hCHG3ERkPhPNC
    LuqtWoE52dJGBZe1j6v14/GmusuolqOwT81UuDI6Meg8CkeYF20wlWBY0A0DX4G2ipZaZC
    0vwv+zzD4jOCtBe8VgUxTvVZAfA0tb1vhGviO9Zt/hTMF0vy3aPANceCzxlbdsguNKohEh
    HD+pc4lTJl7JhDGcH/e9oocIy+CYJjuXlT4+lBkmU9NynqcwQfXRJYuRwFckqVIu2Zs0sQ
    OLhn+Ccd+ZuX6G/DEklMgo9oVmNbhkWFHK90xfVPxg/xaUso6W0kTxFCO5+dIgxz+g5WmC
    dg/80uLcUnVSkHObDM+t0QcyzgnBMQuZ1pADh7fW4IRk8sAqhAO5w+7i3HDHRma4A6CDDE
    tNTS7d+clhprvtsrNu4zHF2qZJR73ucW1Y8bsmgv5ZXJ43cHZrlpvTYBvqo3Ct8+V1/Y9l
    gW1F8C/NNRYNxm6t7mWuZHGTAsW29WmJYZOJzlRFS5zN4BGFsKeZoaR0Jmhw
X-ME-Proxy: <xmx:JCYpar5FM444ZlLcMC5Ql3ySc-U75p13idzWle5rM5IJ8s8cwp5_VA>
    <xmx:JCYpasGjpHvHXCJswZcDophdVHOG_pMpEhJeUOYWcyr4JwdvUiX7yA>
    <xmx:JCYpamSdXSCb6WaAIMQYAmVwFFJgNjVFC8rsX0dZOcLVoVGM-AgGnw>
    <xmx:JCYpamfhIJI7Ft2qSI1_kp_cqR-OXnM_U-zn9-_6pQppE0KDjjFhmg>
    <xmx:JCYpauUn_8PGnjB_HopA7l1ujc2eoizpq9pW9W1Q_y9Fs2bzFvBtk3wS>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Jun 2026 04:53:55 -0400 (EDT)
Date: Wed, 10 Jun 2026 10:53:54 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"DavidS. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [net-next 1/3] dt-bindings: ptp: renesas,rcar-gen4-gptp: Add
 binding for R-Car Gen4
Message-ID: <20260610085354.GC2465390@ragnatech.se>
References: <20260609215711.2960150-1-niklas.soderlund+renesas@ragnatech.se>
 <20260609215711.2960150-2-niklas.soderlund+renesas@ragnatech.se>
 <6bd0229b-4895-48a2-9e36-0ea5296c7fb5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6bd0229b-4895-48a2-9e36-0ea5296c7fb5@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33803-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:richardcochran@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,devicetree.org:url,vger.kernel.org:from_smtp,ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:from_mime,messagingengine.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CABC3667B42

Hi Krzysztof,

Thanks for your comments.

On 2026-06-10 08:54:06 +0200, Krzysztof Kozlowski wrote:
> On 09/06/2026 23:57, Niklas Söderlund wrote:
> > Add bindings for the R-Car Gen4 gPTP timer. The timer enables accurate
> > synchronization of the clock in the control system. The timer is
> > system-wide and used by different Ethernet devices on each Gen4 platform.
> 
> A nit, subject: drop second/last, redundant "binding for". The
> "dt-bindings" prefix is already stating that these are bindings.

Thanks, will fix.

> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Not sure I follow this one, L18 reads,

  "Few subsystems, like ASoC, media, regulators and SPI, expect reverse 
  order of the prefixes::"

But 'git log Documentation/devicetree/bindings/ptp/' shows all commits 
in that directory use the 'dt-bindings: ptp:' prefix.

> 
> 
> > 
> >   - On R-Car S4 it is shared between RSWITCH and RAVB.
> > 
> >   - On R-Car V4H it is shared between RTSN and RAVB.
> > 
> >   - On R-Car V4M it is only used by RAVB.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  .../bindings/ptp/renesas,rcar-gen4-gptp.yaml  | 64 +++++++++++++++++++
> >  MAINTAINERS                                   |  6 ++
> >  2 files changed, 70 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml b/Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml
> > new file mode 100644
> > index 000000000000..99e6e3ca73b6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml
> > @@ -0,0 +1,64 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +# Copyright (C) 2026 Renesas Electronics Corp.
> > +# Copyright (C) 2026 Niklas Söderlund <niklas.soderlund@ragnatech.se>
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/ptp/renesas,rcar-gen4-gptp.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas R-Car Gen4 gPTP timer
> > +
> > +maintainers:
> > +  - Niklas Söderlund <niklas.soderlund@ragnatech.se>
> > +
> > +description:
> > +  The R-Car Gen4 gPTP timer enables accurate synchronization of the clock in
> > +  the control system. The timer is system-wide and used by different Ethernet
> > +  devices on each Gen4 platform.
> > +
> > +    - On R-Car S4 it is shared between RSWITCH and RAVB.
> > +    - On R-Car V4H it is shared between RTSN and RAVB.
> > +    - On R-Car V4M it is only used by RAVB.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - renesas,r8a779f0-gptp # S4-8
> > +          - renesas,r8a779g0-gptp # V4H
> > +          - renesas,r8a779h0-gptp # V4M
> > +      - const: renesas,rcar-gen4-gptp # Generic R-Car Gen4
> 
> Please drop comment or drop generic compatible and make it specific.
> Generic compatibles are discouraged, so don't advertise that. Look how
> other RECENT Renesas bindings do it.

Thanks, I will drop the 'Generic R-Car Gen4' comment. The reason is to 
reduce cruft in the driver. My current view is that there are no 
platform specific quirks needed, but experience show this sometimes 
happens.

Looking at RECENT Renesas bindings this seems to be the way.

> 
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - power-domains
> > +  - resets
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/r8a779g0-cpg-mssr.h>
> > +    #include <dt-bindings/power/r8a779g0-sysc.h>
> > +
> > +    gptp: gptp@e6449000 {
> 
> Drop unused label. Node name usually is "phc". Could be "ptp", but not
> "gptp". What is gptp in generic names?

Wops, thanks. Indeed there should be no label and the node named ptp.  
gptp is the name used in the R-Car documentation and I must have typed 
it from muscle memory, my bad.

> 
> >  L:	linux-iio@vger.kernel.org
> 
> 
> Best regards,
> Krzysztof

-- 
Kind Regards,
Niklas Söderlund

