Return-Path: <linux-renesas-soc+bounces-29867-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDrSNRrDu2n1ngIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29867-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 10:34:18 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5AC2C8C04
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 10:34:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1FD253014FE5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 09:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E770437DEAB;
	Thu, 19 Mar 2026 09:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gDncbqlm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8332937DEA3;
	Thu, 19 Mar 2026 09:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773912853; cv=none; b=nH0LNYNSjdvSFeo3o6wNKn5rq0N24PioG1YH598bYn+Z/qd017tnUfPmnzdb0plai8o+hIX6xATQEwQd8f3MGltU1TSnBWipyiZSWk2cC6H242M+zAdsso6kzfYPJEG0jxp7kW6V1uPm409o8341Oyi9BBiW4/JQbfxgto7g/Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773912853; c=relaxed/simple;
	bh=/Ppb97Ypb2Q0b69Z2VZneA9BSfsBgNrulVOqfB+3t4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EgGCzJp5eefOcYl0a09LrnqLTs5YlllgHK+j33qlHaoaV7CM8IeMSrzLHbRYjmJNm0S5RIAQGSlOWWj0lqzIReBnfDptnROlpdzvudKt1Zrn5HFO8vapecdtR+/MmzbUvQ4Xk6SIgTdZfxMd/gVR4e4zKdMDctROwVky5uYaqIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gDncbqlm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E054C19424;
	Thu, 19 Mar 2026 09:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773912852;
	bh=/Ppb97Ypb2Q0b69Z2VZneA9BSfsBgNrulVOqfB+3t4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gDncbqlmzv86BTzFpykRxi5JZWw76RvplueRa+eYbwzrleBAmBsWiQ8Betd2+GDD9
	 dZUrOiNtGmuKLt9qVkku8rUVbCwKAM1xycP4VefWfS+QEx/ETPn60rrW21QomPyOM3
	 AXfvNlygLhk0yGraCk9+Dh0OqMPjN0NIv0nT7xe3nbxnBGgpUPy9AfM7wIu8d0SSAb
	 NbUQgIcHOjUJFnfor0NHCCf8wpl2GcatCg+CUmJAA4wxVInXyf6atH4YBF0mIcLSHh
	 lUeZgsAaqujlgosWTvz41/oFuozhUG7MO1x85t0O0bxMQ+RO4HcSY8XXWsTR5s2Ws6
	 O19pOLBgM/aJw==
Date: Thu, 19 Mar 2026 10:34:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, John Madieu <john.madieu.xa@bp.renesas.com>, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 2/5] dt-bindings: pci: renesas,r9a08g045-pcie: Add
 RZ/V2H(P) support
Message-ID: <20260319-outstanding-rustling-galago-79bbce@quoll>
References: <20260318124450.163471-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260318124450.163471-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260318124450.163471-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29867-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.963];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[bp.renesas.com,google.com,kernel.org,pengutronix.de,glider.be,gmail.com,sang-engineering.com,vger.kernel.org,renesas.com];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BD5AC2C8C04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 12:44:47PM +0000, Prabhakar wrote:
>      then:
>        properties:
>          interrupts:
> @@ -236,6 +239,21 @@ allOf:
>          reset-names:
>            maxItems: 1
>  

I do not have above hunk in next from 16th March. Nothing about
dependencies in cover letter or changelog. What am I missing?

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g057-pcie
> +    then:
> +      properties:
> +        linux,pci-domain:
> +          enum: [0, 1]
> +        num-lanes:
> +          enum: [2, 4]
> +      required:
> +        - linux,pci-domain
> +        - num-lanes

Best regards,
Krzysztof


