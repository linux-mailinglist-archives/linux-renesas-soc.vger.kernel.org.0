Return-Path: <linux-renesas-soc+bounces-28027-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMi/C4kVh2nBTQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28027-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 07 Feb 2026 11:35:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDCE1058A6
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 07 Feb 2026 11:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0607130180B7
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Feb 2026 10:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 526EF3112C1;
	Sat,  7 Feb 2026 10:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iZk910VJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA462E62CE;
	Sat,  7 Feb 2026 10:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770460544; cv=none; b=Drit9+n7209oK+/o3xUcCDCf4t3dbkAGvYpdJ66gL+yeammWVrxOTTGPCzARaKSs3rMIJeb0BpG46TNXEaSLQYKFVqOIvcoRq/2BtJglD27T9S8gvdpjApVW5zMcDD5VqCwujhARK3v3BZkrd8lIKH/RHP+gzVTT1ARl+W4VpuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770460544; c=relaxed/simple;
	bh=zuvbGoYooM9gYkDmmEj7/y8EUq6pIU/d8CzAZ0Y0V+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTBlvoS1NlPV6ZEpf5pnmgSkDkyBw8kP3/7qHjnsA49L484w+I2ZnNuHvtXC469i9gIlvhyeeaf+a0xPWSQ+qY+2wAHv7p4iuMQFW7vBzdpfTJZnMFyF+sn86NrifXr07DiE0n7DZulFEorf7KObeMux1miFdtoMs0WwqETI0qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iZk910VJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C7B9C116D0;
	Sat,  7 Feb 2026 10:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770460543;
	bh=zuvbGoYooM9gYkDmmEj7/y8EUq6pIU/d8CzAZ0Y0V+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iZk910VJwPz9oxqNmGhvh1Ku3IHHYVLAgpjpRWjOszGEvsCVrr2ZlLDPTozGai/Eh
	 tpd2IWl3QP+BsqWuaoujNivOthNuvoxcZBr2t/JENHF6EhLDB8nnMIiZlOoFZgqLSV
	 bxq/FxbmgPub4u+GC6w1TPz0DMJoMrHZe+Na2EfslEaubsiRPE+nf+6svQs99Sm7fe
	 JVsWJEbpIAYGnUiQkHXIpMofPtY2XXBeLTN7MUPyhq5MNICL7x4Y+cWyETDeS2N45w
	 uZQDNJTiYwNNeSdqgG2qJNqZRnaFrqVggpWy/kmcfHWubK/rllk4/n8UTXsGI5JdjG
	 uKLJqqWfKg8FQ==
Date: Sat, 7 Feb 2026 11:35:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 2/9] dt-bindings: interrupt-controller:
 renesas,rzg2l-irqc: Document RZ/G3L SoC
Message-ID: <20260207-archetypal-griffin-of-enthusiasm-ccb47e@quoll>
References: <20260206111658.231934-1-biju.das.jz@bp.renesas.com>
 <20260206111658.231934-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260206111658.231934-3-biju.das.jz@bp.renesas.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28027-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7DDCE1058A6
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 11:16:45AM +0000, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Document RZ/G3L (R9A08G046) IRQC bindings. The IRQC block on RZ/G3L SoC
> is almost identical to one found on the RZ/G3S SoC with the difference
> like it support more External IRQs, GPT Error Interrupts and also has
> additional registers for GPT/MTU IRQ selection, shared IRQ selection
> between external IRQ and TINT. Hence new generic compatible string
> "renesas,r9a08g046-irqc" is added for RZ/G3L SoC.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Dropped items and instead used enum for single compatible values
>  * Add minItems for interrupts and interrupt-names properties of 
>    the RZ/{G2L,G2UL,Five,V2L} SoCs
>  * Replaced maxItems->minItems for interrupts and interrupt-names
>    properties of the RZ/G3L SoC.
> v1->v2:
>  * Simplified the binding using pattern

Where are lore links to previous dicussions? b4 adds them
automatically.

I do not understand the rationale behind the changes in previous patch
and this makes no sense without previous one, but I feel it was
discussed before. Well, not my task to keep finding them if you decide
not to use standard tools to make review easier :/

Best regards,
Krzysztof


