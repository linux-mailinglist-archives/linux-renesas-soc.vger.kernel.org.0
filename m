Return-Path: <linux-renesas-soc+bounces-31257-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMEyEXfl3WnDkwkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31257-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 08:57:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BE53F64EA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 08:57:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3755D30432DD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 06:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BF07342514;
	Tue, 14 Apr 2026 06:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q6x30m1k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42602DCBF4;
	Tue, 14 Apr 2026 06:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776149754; cv=none; b=MaMiLt/SMq6yLLhY56ZajZGMLR1JXo/7KDTb2Cj1Di3fwZYE69t1TEJDa6dX/McZ2eetMXwWqC7l3PlxHhRPBL2ai3ZHmzm1NuYyqY26sAlUGnr/+koxHZ8K0W3H/FiTMFKcqWr2npMgbu5BPpJp1nNhGD34lGsvMPSYMjjCD9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776149754; c=relaxed/simple;
	bh=EfH4MTu+2jVhhMEvEQ3L43wiPJIxCzLMfVBQmbEOsk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mktFioJ0+p6M4P0/Fe1oa+RG+tZwjMgfKhNZQzcgo5EokIruN11XF9Q3Bka9vRJ3iTagA5xDwF/aR6G7ka7x6wcdhlU2/WxfBCyh90L29UNA5G5lUkgjsS3T807kCbi2TUvh0AnyfVssiU7bIIqKMk2TDW1XztpNag9KtIL7u6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q6x30m1k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9E1CC19425;
	Tue, 14 Apr 2026 06:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776149754;
	bh=EfH4MTu+2jVhhMEvEQ3L43wiPJIxCzLMfVBQmbEOsk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q6x30m1kl863VqU2f8g0Gbm1mSb7OAeYo5SH0xvQ5aEul//oHf/TUKvNfuFK4MiBF
	 w2a7H2TRkPb1c47NZUZlRt6NbLcV9SuvgA1I5edpO0yxW8Sv8zKKNfK/iUSCDQS4N7
	 DUgFoKu2A+eO6Alfk3CcqoKbIae+vmW+AYYkX7KR294JV+V898E8gnPWi/6iFz4j1O
	 NGfRCboo6uDSmP1owPWrKH+ufKMAY71rA1tOCppHwUpP+B8E2YEh90vCYyBC1pgCer
	 u5drnPW9GLyjzk4pTVNQSyZ3A7rFwaBQhOwMNmcBMGa6pB0fqtP9njy45Q4n0Z8srW
	 G+3TcOdoWgIRg==
Date: Tue, 14 Apr 2026 08:55:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: phucduc.bui@gmail.com
Cc: kuninori.morimoto.gx@renesas.com, broonie@kernel.org, 
	lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] ASoC: dt-bindings: renesas,fsi: add support for
 multiple clocks
Message-ID: <20260414-funky-sincere-polecat-20b0bf@quoll>
References: <20260413100700.30995-1-phucduc.bui@gmail.com>
 <20260413100700.30995-7-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260413100700.30995-7-phucduc.bui@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31257-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,gmail.com,glider.be,perex.cz,suse.com,vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 98BE53F64EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 05:07:00PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> The FSI on r8a7740 requires the SPU bus/bridge clock to be enabled before
> accessing its registers. Without this clock, any register access leads to
> a system hang as the FSI block sits behind the SPU bus.
> Update the binding to support a flexible positional clock list to properly

Flexible is not allowed. Provide reasons for exception.

> describe the hardware clock tree, including:
>   - SPU bus/bridge clock (spu) for register access.
>   - CPG DIV6 clocks (icka/b) as functional clock parents.
>   - FSI internal dividers (diva/b) for audio clock generation.
>   - External clock inputs (xcka/b) provided by the board.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
> 
> Changes in v2:
>  - Rename FSI module clock to "own" to match driver.
>  - Add "spu", "icka/b", "diva/b", "xcka/b" clock names.
>  - Use YAML anchors to constrain clock-names properly.
>  - Add "if" rule to require "spu" clock for r8a7740.
>  - Update example with full clock configuration.
>  - Clean up schema by moving allOf location.
> 
>  .../bindings/sound/renesas,fsi.yaml           | 61 +++++++++++++++++--
>  1 file changed, 56 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
> index df91991699a7..d0ae54f3d321 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
> @@ -9,9 +9,6 @@ title: Renesas FIFO-buffered Serial Interface (FSI)
>  maintainers:
>    - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>  
> -allOf:
> -  - $ref: dai-common.yaml#
> -
>  properties:
>    $nodename:
>      pattern: "^sound@.*"
> @@ -38,7 +35,36 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    maxItems: 1
> +    description: |
> +      Clock driving the FSI Controller. The first clock must be
> +      the module clock ("own").
> +    minItems: 1
> +    maxItems: 8
> +
> +  clock-names:
> +    description: |
> +      Names of clocks corresponding to entries in "clocks":
> +      - "own": Main FSI module clock (must be first and always present)
> +      - "spu": SPU bus/bridge clock. On R8A7740, this clock must be
> +        enabled to allow register access as the FSI block is connected
> +        behind the SPU bus.
> +      - "icka" / "ickb": CPG DIV6 functional clocks for FSI port A/B
> +      - "diva"/"divb": Internal FSI dividers for port A/B used for
> +        audio clock generation
> +      - "xcka"/"xckb": External clock inputs for FSI port A/B
> +        provided by the board

This goes to the "clocks:"

> +    minItems: 1
> +    items:
> +      - const: own
> +      - &fsi_all_clks

I don't understand this syntax.

Best regards,
Krzysztof


