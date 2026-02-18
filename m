Return-Path: <linux-renesas-soc+bounces-28298-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONoLD2dvlWmgRAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28298-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Feb 2026 08:51:03 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C40153C49
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Feb 2026 08:51:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 178C4301F7BF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Feb 2026 07:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1608930EF6A;
	Wed, 18 Feb 2026 07:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9pFgJwk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E662D244665;
	Wed, 18 Feb 2026 07:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771401034; cv=none; b=b549dBu3b2IdqcQv6hKBwsdFY/FKGFQpRYtkPUARAj4odmH6S0Tdyn/lrwG7m6XeNHpRibigDBd26OjlzWdu32Tn/+nKpoPoTmFKeQ7O87Z4uUWZom/IFCxiXO4I1eaXDPyOmZxyD5HTXciXZzCymlQPeYxQ9iz1csVqDoIZUhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771401034; c=relaxed/simple;
	bh=X7bP3ObTNjSBS2BdKVTSimAgexhX+AOVB5SdkTLbPPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zj1+xW5Lqw1beb9EqxK7SxwDEI+egs05I9Hgoaj+PDkRJX2MA6AFWIeWIXILmwnLKBUcgCXB8leX0FsMF4X/f47qFgXAMK9IRHpotXZjF8rviyJHtw6c9PGMYNVwsBLBBO+cSRlu30CmQT3veN38pyEuNzNi/jODgHNWFm0GuMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9pFgJwk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28F79C19421;
	Wed, 18 Feb 2026 07:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771401033;
	bh=X7bP3ObTNjSBS2BdKVTSimAgexhX+AOVB5SdkTLbPPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E9pFgJwkCai07jpNYjE2yEwBsW5UD4B1kfImT2pHol/movRb2ucouzR+tLnTi2yuD
	 id5PXETeDrtvmA+4wqKgqW3Kh1mlY8GkCl+ddyrIXy+8RvFY8iq1bCeTbELucEIf+9
	 BB6eOs/XlxZFk71KpKfxEEViN07/s4RT8f9XQHrSshjWF+JbVyI54N9Fq3V5qhXDN9
	 0jDOmEwxDa/qa50oIhHsOJBN6IKbBpj9D744lG3EOXvSiDa74Jok6QbznyFZBNelNF
	 gp5V/q1IrRr5TvBHjyfc8g6GMiUic7sax+FBkuc1PmMoZz3VWatZeoYEltfCapO9+B
	 gE0YV4xw5zfCQ==
Date: Wed, 18 Feb 2026 08:50:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 3/5] spi: dt-bindings: renesas,rzv2h-rspi: Document
 RZ/G3E SoC support
Message-ID: <20260218-qualified-octopus-of-luck-5fcbf1@quoll>
References: <cover.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
 <f6b43f0dc64e13b1c9942c164dea30002d4c4466.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f6b43f0dc64e13b1c9942c164dea30002d4c4466.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28298-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,baylibre.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A8C40153C49
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 05:23:47PM +0100, Tommaso Merciai wrote:
> Document the RSPI controller on the Renesas RZ/G3E SoC. The block is
> compatible with the RSPI implementation found on the RZ/V2H(P) family.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  - This patch depend up on [0]
>  - [0] https://lore.kernel.org/all/20260128215132.1353381-2-cosmin-gabriel.tanislav.xa@renesas.com/

I am not even looking there, start reviewing each other patches, so you
won't be sending FIXES instead of reviews.

Best regards,
Krzysztof


