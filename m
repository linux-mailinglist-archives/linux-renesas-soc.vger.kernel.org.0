Return-Path: <linux-renesas-soc+bounces-29802-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIIbBUHaummfcgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29802-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 18:00:49 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2122BFCEE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 18:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BAE0335B239
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 16:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60DA93E0C60;
	Wed, 18 Mar 2026 16:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="McnO5ZXe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C76E34572B;
	Wed, 18 Mar 2026 16:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773851693; cv=none; b=SjmBTbIqzIb2xhcZBj0OwZG9Bg8gV4l5Mxo2Mw+xlkb2MijM3GuMn/s9vrOruq7RvOxZ4NeRY23VfRLTooppAQ6GqB5mLJKdrUPVX2yJtVS5xJOjVmx/1wNJaDh8jFcwwkjaJDyBhxhvgbNEE36S+uQ6XmP7rn/dHlilY6xEU5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773851693; c=relaxed/simple;
	bh=uLFstbnbdF6osUoT9yOT9HY4Ac8+BSDGfuBeoQDxK9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=h8jLGAoRZuG4nOAele2Xh56aZ6PrNC0NQ5rtUHe0sQVRaJi2vc3/O0udeLVlR35P4eMGE+09SwDA9mSg3o7Djy0d9YXAB1K7vsHCEaEQ8Z+Ixu0p17idmj/cv02m9X6E7px91GnUDKii6s8HehTQ43E9RfPLBpRZ/JvtNg6iTL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=McnO5ZXe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A732C19421;
	Wed, 18 Mar 2026 16:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773851692;
	bh=uLFstbnbdF6osUoT9yOT9HY4Ac8+BSDGfuBeoQDxK9Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=McnO5ZXen2hwrfl/iBqYtwGEp5/5dWL1diqK4HYpcWRZoscyHljfAIcftM583fu/z
	 mQ44b6ReVGnsPhSKLTaLLNeeBS+tvelvFlUlFWMws0++9j4JVgZh84zUObpMl2s/Z0
	 yw5MRZSyJZqVvHfmfZtdAnJwXHqmlQIUke7E3aGygHNL7Vraq2HPohGsxM6MF2iNxi
	 aDbI1VDnSXdCe5hzKAxZ2TLXrZgGNnnotuCRX2839pC/GHb/prsl0fda63jM+tu4h0
	 gLJhhSTWP2kcbiOkV63Un+R0G4e7VBXyC70aUNWqZP5h5/v375aRfxTHNGenXwLLrt
	 n8NWwTnjLvbSg==
Date: Wed, 18 Mar 2026 11:34:51 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/5] dt-bindings: pci: renesas,r9a08g045-pcie: Add RZ/V2N
 support
Message-ID: <20260318163451.GA45978@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318124450.163471-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29802-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[bp.renesas.com,google.com,kernel.org,pengutronix.de,glider.be,gmail.com,sang-engineering.com,vger.kernel.org,renesas.com];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9F2122BFCEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Conventional capitalization for subject lines here is:

  dt-bindings: PCI: renesas,r9a08g045-pcie: Add ...

You can easily see this with:

  git log --oneline --no-merges Documentation/devicetree/bindings/pci/

On Wed, Mar 18, 2026 at 12:44:46PM +0000, Prabhakar wrote:
> ...

> @@ -152,6 +158,7 @@ patternProperties:
>          enum:
>            - 0x0033
>            - 0x0039
> +          - 0x003B

Other constants in this file use lower-case hex.

