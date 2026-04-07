Return-Path: <linux-renesas-soc+bounces-30949-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNrZKWRa1Wmu4wcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30949-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 21:26:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B82A83B37F8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 21:26:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 151373015140
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2026 19:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26948344020;
	Tue,  7 Apr 2026 19:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="npjQSRma"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D4A33CEA9;
	Tue,  7 Apr 2026 19:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775589874; cv=none; b=p+HtCZYmXsgT+Edp8bjujKlxneUSYkkfCs43OGAuK7uCYGw1n6ibf8LItHfU74qseDSPjauB0wKzDdwRzgXuPkl4bOvxU9DWAz5An4QFB1bFw9nwI9+h8+p2z4IfVFcFnnxcXT6K4pOeE7GNbRPQi8PwZQM6wm47sJb0zPArqlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775589874; c=relaxed/simple;
	bh=cm8bgpwN8kGCTAyD3zjD9MRscoZeQkpuUzeQlwumb7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KpM8Y68ch8GPaOQEMJ0ldB568rBCg62bY/AXAnG3DR9bOh+LAzetyg8PXMpDv2P9nou6ThxRvRRuQEeOg0rn6q4ApwFUFQoM/QnD3f5dhkwOQc0a6vIlIADFg7xrj3BrqYh8Rw+83lZedM/04CvMmruzcuH77+G3r/hrpFH/tYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=npjQSRma; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D471C116C6;
	Tue,  7 Apr 2026 19:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775589873;
	bh=cm8bgpwN8kGCTAyD3zjD9MRscoZeQkpuUzeQlwumb7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=npjQSRma784+e/pI8mT2XQu2lMhD/1oouU+dNAQULcS+XDf6zka80W2Dnk70nVtVa
	 zTxPaAN0P6uYVFe3SV0o0oKEKwvQhwAikSOW3b4sYnnEdGY/5R73CzB0djSFwRAdoP
	 kuUzpDQ8tRl5ZuACg+BbEG6M1hKGDvGr9UPgzHiOxguRwjjtwTdQupHZh7NsK/N/1w
	 jdIaVWuOI5bkUZte7DZq1JI5U4SLWtevxWiXbrrSMdOw1MSwcmcz7bduq3NybdwUtF
	 Du/4BvoqtgtlumLmO9j3lczPEaSLFJfLb53FR8uQkDN7lSHILyCs2p5HrWVyqqkM32
	 9/duR98NOkB7g==
Date: Tue, 7 Apr 2026 14:24:31 -0500
From: Rob Herring <robh@kernel.org>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 08/11] dt-bindings: timer: renesas,rz-mtu3: document
 RZ/{T2H,N2H}
Message-ID: <20260407192431.GA3526777-robh@kernel.org>
References: <20260327192425.438263-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260327192425.438263-9-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327192425.438263-9-cosmin-gabriel.tanislav.xa@renesas.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,glider.be,gmail.com,baylibre.com,pengutronix.de,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-30949-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B82A83B37F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 09:24:22PM +0200, Cosmin Tanislav wrote:
> Compared to the previously supported SoCs, the Renesas RZ/T2H and RZ/N2H
> SoCs do not have a reset line.
> 
> Add a new conditional only matching RZ/T2H and RZ/N2H which disables the
> resets property.
> 
> Document RZ/T2H and RZ/N2H, and use the generic compatible as a
> fallback, as functionality is the same.
> 
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
>  .../devicetree/bindings/timer/renesas,rz-mtu3.yaml  | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/renesas,rz-mtu3.yaml b/Documentation/devicetree/bindings/timer/renesas,rz-mtu3.yaml
> index 4623f6cddaf0..410951ca53f8 100644
> --- a/Documentation/devicetree/bindings/timer/renesas,rz-mtu3.yaml
> +++ b/Documentation/devicetree/bindings/timer/renesas,rz-mtu3.yaml
> @@ -112,6 +112,8 @@ properties:
>            - renesas,r9a07g043-mtu3  # RZ/{G2UL,Five}
>            - renesas,r9a07g044-mtu3  # RZ/G2{L,LC}
>            - renesas,r9a07g054-mtu3  # RZ/V2L
> +          - renesas,r9a09g077-mtu3  # RZ/T2H
> +          - renesas,r9a09g087-mtu3  # RZ/N2H
>        - const: renesas,rz-mtu3
>  
>    reg:
> @@ -245,6 +247,17 @@ allOf:
>        required:
>          - resets
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,r9a09g077-mtu3
> +              - renesas,r9a09g087-mtu3

This can just be an 'else' on the prior if/then schema. Really, these 2 
patches can be combined as the motivation for the 1st patch is the 2nd 
patch.

> +    then:
> +      properties:
> +        resets: false
> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.53.0
> 

