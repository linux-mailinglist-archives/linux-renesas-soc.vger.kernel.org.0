Return-Path: <linux-renesas-soc+bounces-34746-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Cl9QEdaKS2q/VAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34746-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 13:00:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B0C70F957
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 13:00:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=BWFu4YUB;
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34746-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34746-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6DFF63033893
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2026 10:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B8741D4C1;
	Mon,  6 Jul 2026 10:03:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028EE41D4EC;
	Mon,  6 Jul 2026 10:03:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783332212; cv=none; b=EQQbNKrMHXnKzzLj20k6UxBxlm7qtrgMLNWl6fGzk/fghKnSYIEGlF0p2rlumxeUh9ardNOYCCIEZGChLnXX2rws+Slffn8kudJLoqiJVAWwdqez35XZ/+swmVzfH1UBwmyHp82Bwm3EHs+rVnwe/vs2bSU7DrWbu4OifR2u4A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783332212; c=relaxed/simple;
	bh=Sb4iMYjbedO64WmPLzaRf05zqar0z8v+EnBWdzETtUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hbw2DJGbqz7FyENRjnT8QFUjypl3mnbWUA7A2xEEmNkZi7DHgFPRUlHglMkSpATakyGVwO/WofBNyoP88sAtNjuTafYK2msJmyEgQ2yQWEm5weGt3OX2liJIj1YjSV7pSrG4g0VxFj5/2F8DTiiP2IU5PHLK3e+qGMQGdN4jBR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BWFu4YUB; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21E8133D;
	Mon,  6 Jul 2026 12:02:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783332160;
	bh=Sb4iMYjbedO64WmPLzaRf05zqar0z8v+EnBWdzETtUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BWFu4YUBI/IcrAAjTK1CItkEH1FftGsDP7SOEZp9j02bgYinuypdBO11soxkSjvA8
	 JUrJ6PgZHVkFxO+iKj0vkdfTPhpMH+TELU8hb9oTM7V4LqPJlqsFhllXBAvv0UE3x3
	 +f97cTPme7hAI5ubiZRfwQDMmQ5h8WotKuUDjX6M=
Date: Mon, 6 Jul 2026 13:03:27 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: display: vga-connector: Allow
 hardcoding EDID
Message-ID: <20260706100327.GA66892@killaraus.ideasonboard.com>
References: <20260705213542.28987-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260705213542.28987-2-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdUCqTQ0fWDyHJkU=0gzFe88r0hsSk9tsgfQUZq4TRcAoQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdUCqTQ0fWDyHJkU=0gzFe88r0hsSk9tsgfQUZq4TRcAoQ@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-34746-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:thuan.nguyen-hong@banvien.com.vn,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:linux-renesas-soc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,banvien.com.vn,linux.intel.com,kernel.org,suse.de,glider.be,gmail.com,intel.com,linaro.org,kwiboo.se,bootlin.com];
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
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:from_mime,ideasonboard.com:email,ideasonboard.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A3B0C70F957

On Mon, Jul 06, 2026 at 10:08:57AM +0200, Geert Uytterhoeven wrote:
> On Sun, 5 Jul 2026 at 23:35, Laurent Pinchart wrote:
> > Since DDC version 2, introduced in 1996, VGA monitors have exposed EDID
> > data over an I2C bus. The bus is also used to detect the presence of a
> > connected monitor by trying to read the EDID data.
> >
> > Some devices where the VGA display is integrated in the device and
> > always connected do not connect the DDC pins. Some development boards,
> > such as the Renesas M3N Salvator-XS, also do not connect the DDC pins.
> >
> > To support those, add the ability to provide hardcoded EDID data in the
> > device tree. This is mutually exclusive with specifying a DDC bus, and
> > can only be done when the VGA display is guaranteed to be always
> > connected.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Thanks for your patch!
> 
> > --- a/Documentation/devicetree/bindings/display/connector/vga-connector.yaml
> > +++ b/Documentation/devicetree/bindings/display/connector/vga-connector.yaml
> > @@ -19,10 +19,25 @@ properties:
> >      description: phandle link to the I2C controller used for DDC EDID probing
> >      $ref: /schemas/types.yaml#/definitions/phandle
> >
> > +  edid:
> > +    $ref: /schemas/types.yaml#/definitions/uint8-array
> > +    description:
> > +      When the DDC signals are not wired to the connector, and the connected
> > +      display is not removable, this property is used to supply a binary EDID
> > +      blob for the display.
> > +
> >    port:
> >      $ref: /schemas/graph.yaml#/properties/port
> >      description: Connection to controller providing VGA signals
> >
> > +allOf:
> > +  - if:
> > +      required:
> > +        - ddc-i2c-bus
> > +    then:
> > +      properties:
> > +        edid: false
> > +
> 
> What if the DDC signals are wired to the connector on the provider side,
> but not on the consumer side?
> A DT overlay describing the consumer device can add an edid property,
> but it cannot delete the ddc-i2c-bus property in the base DTB.

As the use case is devices where the VGA display is an integral part of
the device, I don't this this is a big issue. I would be quite surprised
if a manufacturer wanted to support different SKUs with multiple VGA
display overlays, with the DDC signals wired up in the base board on all
SKUs, and on the VGA display side in some SKUs only. If that happened,
they could set the ddc-i2c-bus property in the overlays that wire the
signals, implement /delete-property/ support for overlays (would be an
interesting feature in my opinion), or as a very last resort propose
relaxing the constraint here.

> >  required:
> >    - compatible
> >    - port

-- 
Regards,

Laurent Pinchart

