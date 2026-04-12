Return-Path: <linux-renesas-soc+bounces-31201-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 55t3AX3y2mno7QgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31201-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 03:16:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 938E83E2525
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 03:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 094B7301BCFF
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 01:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00C925F984;
	Sun, 12 Apr 2026 01:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HF26g5E6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DD4178372;
	Sun, 12 Apr 2026 01:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775956599; cv=none; b=oryMjF+r+JPkzklj9pB5P4cxR4n68Yw5IXXbpcQyN5UaukhR4v+vm3VEBlZyc5lUVMVSWJ/aBBL2VW9SzvZ7yuLxF9NvGDltF+yDO4XF8DY0hbr4vd6UH6uQFUb/gingZ3Q6SHdeYfg00SBagEILicrl/GLJzU0qMbx/E10WzTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775956599; c=relaxed/simple;
	bh=dcdt1GbKTISRYGcIs0T5kcYxV8n+4Ggpw1QkfID+hfw=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=qLZjxgnkZSBPaxTnA9BUAbxRndZKIUMj6vhH6tzprYPOqSw75BHfm/pBBaQ0eZ0mwrr/uHPxe0Rxqm8tqqw2d035buCKBkL395gkOivdxRTLVIO643YkP4QqmD4ObwrifRRyG1hrC5bW3xzzNpXdTeAG3+DcUx5gAm9eYtfn/wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HF26g5E6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B153C116C6;
	Sun, 12 Apr 2026 01:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775956599;
	bh=dcdt1GbKTISRYGcIs0T5kcYxV8n+4Ggpw1QkfID+hfw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=HF26g5E6BEzb6e9Er9inq9ckyKzrpqib7bX5hhEZtWeCzRHuDY+bs5oi8ADFedWUf
	 QuYCK1D1MO0V9k1Ijq30ruH5/5xh3odItnkBTLfKA56in1lDeZ1ocWT5Op07+euDUS
	 giHL8qEAG4IhK19XBwiTXeMA4xxgj/XuOgLX+Wn+xdoUop+N/ImdXxf8ezPz5W4Q6+
	 2sgydXbpP5qM8dxKb2UlnCNy/F6BEnd0AkJ8lib51r2DbPAMPvELCHHg8evBBxEZBm
	 xCuEYYkRoSpQNGRoEeYUODyKPYLUAhxvW6twda1aHuJqf7GikxrCjTZEZRvo9ex/Pj
	 7G7ZL/sA4g0XA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260327-schneider-v7-0-rc1-crypto-v1-1-5e6ff7853994@bootlin.com>
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com> <20260327-schneider-v7-0-rc1-crypto-v1-1-5e6ff7853994@bootlin.com>
Subject: Re: [PATCH 01/16] dt-bindings: clock: Introduce nexus nodes
From: Stephen Boyd <sboyd@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Pascal EBERHARD <pascal.eberhard@se.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org, "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, Antoine Tenart <atenart@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, Conor Dooley <conor+dt@kernel.org>, David S. Miller <davem@davemloft.net>, Geert Uytterhoeven <geert+renesas@glider.be>, Herbert Xu <herbert@gondor.apana.org.au>, Jayesh Choudhary <j-choudhary@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Olivia Mackall <olivia@selenic.com>, Rob Herring <robh@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Date: Sat, 11 Apr 2026 18:16:37 -0700
Message-ID: <177595659711.5403.18166114937625609985@lazor>
User-Agent: alot/0.12
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,gmail.com,davemloft.net,glider.be,gondor.apana.org.au,ti.com,baylibre.com,selenic.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31201-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sboyd@kernel.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 938E83E2525
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Quoting Miquel Raynal (Schneider Electric) (2026-03-27 13:09:23)
> diff --git a/Documentation/devicetree/bindings/clock/clock-nexus-node.yam=
l b/Documentation/devicetree/bindings/clock/clock-nexus-node.yaml
> new file mode 100644
> index 000000000000..f07e2972e8aa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/clock-nexus-node.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/clock-nexus-node.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Clock Nexus
> +
> +description: >
> +  A nexus node allows to remap a phandle list in a consumer node through=
 a

Should this say "remap a clock specifier list" instead of "remap a
phandle list"? A phandle list sounds like there are zero cells.

> +  container or a connector node in a generic way. With this remapping,
> +  the consumer node needs to know only about the nexus node. Resources
> +  behind the nexus node are decoupled by the nexus node itself.

