Return-Path: <linux-renesas-soc+bounces-32646-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOlABFPBBmpdngIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32646-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 08:46:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A090354A1A3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 08:46:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CB041301D59C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 06:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9828389101;
	Fri, 15 May 2026 06:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TWv/pDGQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8451535F185;
	Fri, 15 May 2026 06:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778827600; cv=none; b=lQ2HwoIxjo2YanY10GZmh3WDIrIPVbi/JMyL514gKWUZEaLaJaOw6+rOAsf8579nQ/mmUwENqU76uecm+5UsGclSb6q0iHY+3BWfstRvKGrkR614naOHqvuGJgT/cwkgS8B3Sj3rqAZANlPwKldOjt3gIL7l/yAvCD0ScxPCN+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778827600; c=relaxed/simple;
	bh=F3jdHxGiGdei4iwTLiITYa/NO2f+4a70KPCGxhnfEas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kAYodkT+/W2Te25U5u06MsHkvoIznirmoRfPFCuq/o/l9XfbG8412mz/KKnnAv7hn68QFCPG3Wj5195+h6neZHG6+RF3SELFtH0/sQ/ezcwStndavejpRrgtFtcEpxHWC9aDEVAVAHxLU5+Q9hATDQ1sb8sh7jffu79iWNbdM+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TWv/pDGQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9757EC2BCB0;
	Fri, 15 May 2026 06:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778827600;
	bh=F3jdHxGiGdei4iwTLiITYa/NO2f+4a70KPCGxhnfEas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TWv/pDGQF3Bwy3w6hJWe/smogcaMqjfEdTnTbzhJ+Z6u4xSaUb89LPQZt/gJ9WN/J
	 4jRdYAc8UXFRPzImfVYKdVTS2xCW4VItleScARA6FMYB/2h5AKzTzeb8QD1Vsb6jPM
	 REOTAIW0oteBPUYY8Youa0Fdhh1XHwgZjKMOQGKUlpOLkR+ta3VyszAFMSvfI80sfR
	 bP9acFwHvLfMxgnRkqKpJ+SCiDUVxviRAvWDN86pkcFOQDQrHmvnbZ8cqawk4RenKw
	 zvQbAbxZM7gNSviUFvuQ2eRRfPowKFFKTBcqlrefp/rZ3YcB91Kmf12J/Y9rRFwPB5
	 gnjYwAXFKU+EA==
Date: Fri, 15 May 2026 08:46:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: phucduc.bui@gmail.com
Cc: kuninori.morimoto.gx@renesas.com, broonie@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, geert+renesas@glider.be, 
	krzk+dt@kernel.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org, magnus.damm@gmail.com, 
	perex@perex.cz, robh@kernel.org, tiwai@suse.com, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 01/10] ASoC: dt-bindings: renesas,fsi: add support
 multiple clocks
Message-ID: <20260515-transparent-calculating-ocelot-bdec04@quoll>
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
 <20260510084303.122426-2-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260510084303.122426-2-phucduc.bui@gmail.com>
X-Rspamd-Queue-Id: A090354A1A3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32646-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,vger.kernel.org,glider.be,gmail.com,perex.cz,suse.com,linux-m68k.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Sun, May 10, 2026 at 03:42:54PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> The FSI on r8a7740 requires the SPU bus/bridge clock to be enabled before
> accessing its registers. Without this clock, any register access leads to

But why are you adding all these clocks to sh73a0 as well?

> a system hang as the FSI block sits behind the SPU bus.
> Update the binding to support multiple clocks to properly describe the
> hardware clock tree, including:
>   - SPU bus/bridge clock (spu) for register access.
>   - CPG DIV6 clocks (icka/b) as functional clock parents.

You do not need to add parents of clocks.

>   - FSI internal dividers (diva/b) for audio clock generation.

Internal dividers do not have representation. They are internal.

>   - External clock inputs (xcka/b) provided by the board.
> 
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  .../bindings/sound/renesas,fsi.yaml           | 27 ++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
> index df91991699a7..c50e7115b21a 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
> @@ -38,7 +38,32 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Main FSI module clock
> +      - description: |
> +          SPU bus/bridge clock. On R8A7740, this clock must be enabled to allow
> +          register access as the FSI block is connected behind the SPU bus.
> +      - description: CPG DIV6 functional clocks for FSI port A
> +      - description: CPG DIV6 functional clocks for FSI port B
> +      - description: Internal FSI dividers for port A used for audio clock generation
> +      - description: Internal FSI dividers for port B used for audio clock generation
> +      - description: External clock inputs for FSI port A provided by the board
> +      - description: External clock inputs for FSI port B provided by the board
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 8
> +    items:
> +      enum:

This cannot be flexible.

> +        - fck  # Main FSI module clock
> +        - spu  # optional SPU bus/bridge clock
> +        - icka # optional CPG DIV6 functional clocks for FSI port A
> +        - ickb # optional CPG DIV6 functional clocks for FSI port B
> +        - diva # optional Internal FSI dividers for port A used for audio clock generation
> +        - divb # optional Internal FSI dividers for port B used for audio clock generation
> +        - xcka # optional External clock inputs for FSI port A provided by the board
> +        - xckb # optional External clock inputs for FSI port B provided by the board

Best regards,
Krzysztof


