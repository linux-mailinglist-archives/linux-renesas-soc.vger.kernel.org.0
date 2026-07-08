Return-Path: <linux-renesas-soc+bounces-34839-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MLSaKG0LTmqzCAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34839-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 10:33:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 314B1723327
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 10:33:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ZXgQaSyx;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34839-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34839-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 108473001ACD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 08:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 785063F54B4;
	Wed,  8 Jul 2026 08:29:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8ED27FD75;
	Wed,  8 Jul 2026 08:29:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499375; cv=none; b=l2YqYWBFi8tYgk4gZpRXwKbNFkwsffSrflyzsSYiYv+Fc/MQJeXXnUPEY7pqiRmNXRdV2VRrR0jgNA1zmNs6xzWF81alXdGhyYSfQs3AMDRcxTK/h8zmY1xucN/rUZsL9zx5yBI4Nss+qr+T7uuStVyC7olDXrXeGFZ5i5JO+vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499375; c=relaxed/simple;
	bh=xkjPZOWZJ0gBAldxLah5iX3ePWb2A6PPRRluNZ+a8M4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aYn1hher/DH4/4+cKG8huugxFlM1emsMy0T3KLi2M22QPCzIeuM/dja1j8p+H3HmjoXxDRpuOaUwCJah1Vo60QeLmWxQ+x6XcHETr+57KCJJOd74xQFt6fv2mbY5r4R/VwwVEGNKpYz/35S9L5Bwse5WpLkJgArNxxKC/ZgLxvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZXgQaSyx; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF88F1F000E9;
	Wed,  8 Jul 2026 08:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783499373;
	bh=CWIm+NgsXwAVtIsalyxLXYc9JK4CbYz1QiTAMRXEaUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZXgQaSyxuwRdfO0MsiB5Go3qFhqa+he7eIP+MyDR0EfVjUny+iA1YsbMkVzJLDbcB
	 s6yP1suFqfAk06R4ZJSY5t0We0XvbG2Iuz9Xj9e1YQVPkjDkzlVQp4fz0xkHJtnndj
	 qea9JuS77BoMxunXeqpWRR7e8Lrezm4IIGBzQYLzNNB/GiYQgpWcVMkJN8l95Y2i1+
	 4FYmsAH5fw3wFjY6aDLG32V6fasQ+/Z0sw2ofls1jtq5VssOWRyZuA24+hYiK/pIrM
	 u3UThc0jkNPLsN4ZBayko3AHABMcAiuRhe7+l5RME74+C03uF1MflLqVYZkb3d/o93
	 5kXdcESec7PbQ==
Date: Wed, 8 Jul 2026 10:29:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 01/16] dt-bindings: display: bridge: renesas,dsi:
 Document RZ/G3L
Message-ID: <20260708-hopping-exotic-baboon-6c5a46@quoll>
References: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
 <20260704093433.273672-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260704093433.273672-2-biju.das.jz@bp.renesas.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-34839-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,gmail.com,ffwll.ch,linux.intel.com,suse.de,glider.be,bp.renesas.com,ideasonboard.com,kwiboo.se,bootlin.com,lists.freedesktop.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 314B1723327

On Sat, Jul 04, 2026 at 10:34:11AM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> The RZ/G3L DSI IP is similar to the RZ/G2L but has different global PHY
> timings and also the PLLCLK is ungateble clock. Add the compatible
> string "renesas,r9a08g046-mipi-dsi" to handle these difference for the
> Renesas RZ/G3L SoC. The power to DSI region is controlled by SYSC block.
> Document renesas,sysc-pwrrdy property to handle the power control.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../bindings/display/bridge/renesas,dsi.yaml      | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> index c20625b8425e..b114ac3b111a 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> @@ -28,6 +28,7 @@ properties:
>            - const: renesas,r9a09g057-mipi-dsi
>  
>        - enum:
> +          - renesas,r9a08g046-mipi-dsi # RZ/G3L
>            - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
>  
>    reg:
> @@ -108,6 +109,20 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  renesas,sysc-pwrrdy:
> +    description:
> +      The system controller PWRRDY indicates to the DSI region, if the power
> +      supply is ready. PWRRDY needs to be set during power-on before applying
> +      any other settings. It also needs to be set before powering off the DSI.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

This feels a lot like a power domain. Please elaborate what is PWRRDY
and why power-on/off and power status within SoC (important!) is not
encoded as power domain.

Best regards,
Krzysztof


