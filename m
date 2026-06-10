Return-Path: <linux-renesas-soc+bounces-33824-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XIYqLpJ5KWrdXQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33824-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 16:49:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA2966A66B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 16:49:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b="KlRY/4B+";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33824-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33824-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3369F30FE5DA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 14:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C7933F591;
	Wed, 10 Jun 2026 14:33:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F0233F36B;
	Wed, 10 Jun 2026 14:33:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781102033; cv=none; b=WluwUUCK4wzcQB1NSBFmjHtzNvqR3teVFgjjYKuoSInbuXWgKJ3k0fcmEUkRg2TvlINcG/ZpFuJFtvcZhtkdNQgPkQHOqsnyvFDFUj6v2USVedUkuUYPhYE1KoxhbtXvrzcCdGMNbS+cRjItLF6FmtOvs80gIB+1tajfo7W4uaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781102033; c=relaxed/simple;
	bh=i7RQ4Gw4M6Wu82GkUyGskRHB6aI+zOw86mvfJkP5tWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGKQYE6TGlS52dx/2b4yQsD7d5NJtNu3JASbwjDKB2n3Ih0YKDE9zsY9G2RH3G22rPDVQ0dbwIz6zvmUq/K3k6I51croJy9Ywv1UlxADmFmRihh4JbIGCJFpHTb+cx9JSNc7tsSFtUieIMmI0FNnxYx3v3FZACf9PIqFl/pLR9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KlRY/4B+; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 814619A0;
	Wed, 10 Jun 2026 16:33:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781101998;
	bh=i7RQ4Gw4M6Wu82GkUyGskRHB6aI+zOw86mvfJkP5tWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KlRY/4B+3NDJ4asXb99Q1Ud+fRwK17IFnHqQmA0jexOuAeiGG4p4PTYB2NKgysO+5
	 mZzCri0SH+8nej6YuJb+NunyYI9WJ1PeVb1mc7xTELGrqV27NR6CZbg+I9UEGjXQua
	 2406mb7uDMeq/zOhnS76Fxs215a5VWVKrPcsjbuY=
Date: Wed, 10 Jun 2026 17:33:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/3] media: dt-bindings: media: renesas,fcp: Document
 RZ/T2H and RZ/N2H SoCs
Message-ID: <20260610143346.GA1335994@killaraus.ideasonboard.com>
References: <20260430100929.1088281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260430100929.1088281-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260430100929.1088281-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33824-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kieran.bingham+renesas@ideasonboard.com,m:p.zabel@pengutronix.de,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:kieran.bingham@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,ideasonboard.com,pengutronix.de,glider.be,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:from_mime,killaraus.ideasonboard.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0AA2966A66B

Hi Prabhakar,

Thank you for the patch.

On Thu, Apr 30, 2026 at 11:09:27AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Document the FCPVD blocks present on the RZ/T2H and RZ/N2H SoCs.
> 
> The FCPVD implementation on these SoCs is identical to that found on the
> RZ/G2L family.
> 
> Update the schema to disallow the "resets" property for these SoCs,
> reflecting the absence of a reset control for the FCPVD instance.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../devicetree/bindings/media/renesas,fcp.yaml | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> index 5e11ae0ee456..cbb16a7a5481 100644
> --- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> @@ -34,6 +34,8 @@ properties:
>                - renesas,r9a09g047-fcpvd # RZ/G3E
>                - renesas,r9a09g056-fcpvd # RZ/V2N
>                - renesas,r9a09g057-fcpvd # RZ/V2H(P)
> +              - renesas,r9a09g077-fcpvd # RZ/T2H
> +              - renesas,r9a09g087-fcpvd # RZ/N2H
>            - const: renesas,fcpv         # Generic FCP for VSP fallback
>  
>    reg:
> @@ -66,7 +68,6 @@ required:
>    - reg
>    - clocks
>    - power-domains
> -  - resets
>  
>  additionalProperties: false
>  
> @@ -83,6 +84,8 @@ allOf:
>                - renesas,r9a09g047-fcpvd
>                - renesas,r9a09g056-fcpvd
>                - renesas,r9a09g057-fcpvd
> +              - renesas,r9a09g077-fcpvd
> +              - renesas,r9a09g087-fcpvd
>      then:
>        properties:
>          clocks:
> @@ -94,6 +97,19 @@ allOf:
>          clocks:
>            maxItems: 1
>          clock-names: false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,r9a09g077-fcpvd
> +              - renesas,r9a09g087-fcpvd
> +    then:
> +      properties:
> +        resets: false
> +    else:
> +      required:
> +        - resets
>  
>  examples:
>    # R8A7795 (R-Car H3) FCP for VSP-D1

-- 
Regards,

Laurent Pinchart

