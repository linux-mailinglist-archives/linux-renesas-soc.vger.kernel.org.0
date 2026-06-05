Return-Path: <linux-renesas-soc+bounces-33637-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IrEVF4NCI2ormgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33637-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 23:41:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF7764B760
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 23:41:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=O2gBKJMx;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33637-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33637-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 756BB3029774
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jun 2026 21:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194113D3332;
	Fri,  5 Jun 2026 21:29:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D644071F9;
	Fri,  5 Jun 2026 21:29:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780694970; cv=none; b=haFcVb8ONq8+S1Ev4J7+LIEAD50VuodSqnlpNCv70HEVQUYh1LGqOYUKY78dGJmbig0o4E0c0kzHAh4qDKT/zP1ZnKFYWcdTTZgD6M+hBYvSICeDi6WovM8hthgXjbJj+VsJ5qF4k+CKhHqjZUIaIgeH9WSoASYXxONhH0xZaMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780694970; c=relaxed/simple;
	bh=2KWf50awt6+PWOzqGfsckiRayFkdP15qzZBLba2lUVY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=eIkZJM4wGDyyje8ZL43IJeqrqI7RF7oa02yH0XEYD+P2+MONLmmb4+ptHTppx77ZVj2yckEJMveHNYuyvjl/rxhjnr0ceLhqs/O/4gayALM481pWeSrR+ONST/Wt85h4mV3Bf0RLcYDl+Wb1u6RmFR5o7x/tgNMRlIfRgkO4CxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O2gBKJMx; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C11D1F00893;
	Fri,  5 Jun 2026 21:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780694968;
	bh=DcggTgsolLSUNA/DEK7Z2qW7ZFvhwm16TwbPdXE5VG8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=O2gBKJMxeZHllrkj33LYj93AkovV1OYYfOY5xDb4U/Y8qzdqM8q08G5GbIm/tLozg
	 xtgwDkr36+BgJvakus/JUTgqcprymmdtN4nqk3az1pPfUpYSm+r7FlDfwTk3y+K2B7
	 vqbLhveLDDqWo+XuGqG9i8jQJKZ2GJMVt9Xil/zz4eJk3xgwXKFhCDToreAjf04Poo
	 1n/VnumaSyrMTJ0e1meTXfZKOmY8jZ4bOEbJ5qy24h+ygqDAOP0xwJ0X7NBwuFH62j
	 6ea2Th8FG7pLON/gFQ39zNdb46eSVjUIwuxPPd01lLclDpz2mbw0Tdi0PvNoQyhjAY
	 N4eNNNTsXQUpA==
Date: Fri, 05 Jun 2026 16:29:27 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 biju.das.jz@bp.renesas.com, lgirdwood@gmail.com, magnus.damm@gmail.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 john.madieu@gmail.com, geert+renesas@glider.be, krzk+dt@kernel.org, 
 kuninori.morimoto.gx@renesas.com, broonie@kernel.org, conor+dt@kernel.org
To: John Madieu <john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260605200526.683577-1-john.madieu.xa@bp.renesas.com>
References: <20260605200526.683577-1-john.madieu.xa@bp.renesas.com>
Message-Id: <178069496769.286078.10840905064274842451.robh@kernel.org>
Subject: Re: [PATCH v2] ASoC: dt-bindings: sound: renesas,r9a09g047: Fix
 dma-names and ports schema
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,glider.be,kernel.org,renesas.com];
	TAGGED_FROM(0.00)[bounces-33637-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:devicetree@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:lgirdwood@gmail.com,m:magnus.damm@gmail.com,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:john.madieu@gmail.com,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:conor+dt@kernel.org,m:john.madieu.xa@bp.renesas.com,m:magnusdamm@gmail.com,m:johnmadieu@gmail.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ADF7764B760


On Fri, 05 Jun 2026 20:05:26 +0000, John Madieu wrote:
> Replace the allOf-wrapped enum in the dvc/src/ssiu dma-names with a plain
> scalar items schema bounded by minItems/maxItems and point the ports
> container at graph.yaml's ports definition instead of port-base (a ports
> container is not itself a port).
> 
> While at it, drop the unused top-level #address-cells/#size-cells since no
> child node uses a unit address and the ports node provides its own, require
> interrupts/dmas/dma-names on the src sub-nodes to match the ssi/ssiu
> sub-nodes and the driver, and pin clocks and resets to their fixed counts
> (47 and 14) to match the clock-names/reset-names lists. In the example, put
> compatible and reg first, include renesas,r9a09g047-cpg.h, and restore the
> CPG_MOD cell on the clock specifiers.
> 
> Fixes: a86fd3c20218 ("ASoC: dt-bindings: sound: Add DT binding for RZ/G3E sound")
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
> 
> Changes:
> 
> v2:
>  - dma-names: drop the per-position items list in favour of a scalar items
>    schema with minItems/maxItems. The list form forced exactly N entries,
>    and a scalar items schema needs both bounds to satisfy string-array.yaml
>    (Rob Herring, sashiko-bot).
>  - Example: restore the CPG_MOD cell on the clock specifiers and add the
>    renesas,r9a09g047-cpg.h include (Geert Uytterhoeven).
> 
> v1:
>  - https://lore.kernel.org/r/20260603202805.3530046-1-john.madieu.xa@bp.renesas.com
> 
>  .../sound/renesas,r9a09g047-sound.yaml        | 100 +++++++++---------
>  1 file changed, 50 insertions(+), 50 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.example.dtb: sound@13c00000 (renesas,r9a09g047-sound): ports:port@0:endpoint:capture:0: [6, 7, 8] is too long
	from schema $id: http://devicetree.org/schemas/sound/renesas,r9a09g047-sound.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.example.dtb: sound@13c00000 (renesas,r9a09g047-sound): ports:port@0:endpoint:playback:0: [3, 4, 5] is too long
	from schema $id: http://devicetree.org/schemas/sound/renesas,r9a09g047-sound.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260605200526.683577-1-john.madieu.xa@bp.renesas.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


