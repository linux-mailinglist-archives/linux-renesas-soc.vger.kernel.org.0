Return-Path: <linux-renesas-soc+bounces-27856-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aO3ODVc4gmmVQgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27856-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 19:03:03 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C67FDD42F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 19:03:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E9CA3011112
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 17:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02C0D364EB2;
	Tue,  3 Feb 2026 17:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dYtW/Tsk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B360527A916;
	Tue,  3 Feb 2026 17:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770141418; cv=none; b=Ea6xfYni6fNNW9XuHJrxINKWYrYIoqTc2RhpRWn8uPnYN8teBmuHL7TFmK/or0SO9aOIh9VW2bZZ0vKXw3ggHH1JoNjZF7UguvqFItOvlpc4O8u7LAL/4HKRTmcYcFCZ33ldRG36NwnjLDZWchGIaTke1XBvF5uZ3zTYuMenzSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770141418; c=relaxed/simple;
	bh=2o1PTbDuStWjTBoqYDX9/qLgrhUfoQCc8nPocn80vVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ljc3LRc5MN73Tw8kjDZosmYLPaoOcfc7dLdpU/Ptmlkx88SK6GqP1MaxqGK91Ep/fD/kHsLPotkE1S62DFMszwlk41rkMgVNc9n1xJQngQiQxOSnC4DDEceEqOc6qSnswqZGMV194hFAZCjRPOSjcGcetk2BUU563ZsXKqzmcAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dYtW/Tsk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AB36C116D0;
	Tue,  3 Feb 2026 17:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770141418;
	bh=2o1PTbDuStWjTBoqYDX9/qLgrhUfoQCc8nPocn80vVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dYtW/TskrnqRFsS8wAKitJbUEZ8gOVvf9FOzsIDGkonJeSEmCtwkuxYOdaRnu8Dxz
	 6nldus+ijoPHusCh1rIFuEKs0+Tfdm9ecpy9EEcmvvKGC8rnckJVagyWJRpnkydn+1
	 kNlc5ZqzNTfMakn5vW3b/95lzSPS3FlG7J3rdkSNwsPUrb9Q/C7/Merw1DIye6AC0P
	 izLoO+hGOiHPcqgoFTG230A/GWPUGau8NOVIFbjuC3cfvEL6tDcY//Uz7VsvThhyBg
	 kSRcJWLWvvjEfMhFSNnIbYFEZlKpUaMWmhXo+a6nfAjP3w2AGXRtYVoanntsllEhqZ
	 Z+ftaUZcs6Y7w==
Date: Tue, 3 Feb 2026 11:56:57 -0600
From: Rob Herring <robh@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: devicetree@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, tomm.merciai@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v7 1/4] dt-bindings: reset: renesas,rzv2h-usb2phy: Add
 '#mux-state-cells' property
Message-ID: <20260203175657.GA2788294-robh@kernel.org>
References: <cover.1769704000.git.tommaso.merciai.xr@bp.renesas.com>
 <af75145b08e24034dcf367932002079363e5dd81.1769704000.git.tommaso.merciai.xr@bp.renesas.com>
 <176971213156.1637421.14962977334514056951.robh@kernel.org>
 <aYG2ostrecBVuMPs@tom-desktop>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYG2ostrecBVuMPs@tom-desktop>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,renesas.com,pengutronix.de,gmail.com,kernel.org,oss.qualcomm.com,glider.be];
	TAGGED_FROM(0.00)[bounces-27856-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.241.139.240:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,renesas.com:email]
X-Rspamd-Queue-Id: 8C67FDD42F
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 09:49:38AM +0100, Tommaso Merciai wrote:
> Hi Rob,
> 
> On Thu, Jan 29, 2026 at 12:42:11PM -0600, Rob Herring (Arm) wrote:
> > 
> > On Thu, 29 Jan 2026 17:52:55 +0100, Tommaso Merciai wrote:
> > > Add the '#mux-state-cells' property to support describing the USB VBUS_SEL
> > > multiplexer as a mux-controller in the Renesas RZ/V2H(P) USB2PHY binding.
> > > 
> > > The mux-controller cannot be integrated into the parent USB2PHY node
> > > because the VBUS source selector is part of a separate hardware block,
> > > not the USB2PHY block itself.
> > > 
> > > This is required to properly configure USB PHY power selection on
> > > RZ/V2H(P) and RZ/G3E SoCs.
> > > 
> > > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > ---
> > > v6->v7:
> > >  - No changes
> > > 
> > > v5->v6:
> > >  - Collected KKrzysztof tag
> > > 
> > > v4->v5:
> > >  - No changes
> > > 
> > > v3->v4:
> > >  - Switch back to v2 implementation.
> > >  - Improve commit body.
> > > 
> > > v2->v3:
> > >  - Manipulate mux-controller as an internal node.
> > >  - Improved commit body.
> > > 
> > > v1->v2:
> > >  - New patch
> > > 
> > >  .../bindings/reset/renesas,rzv2h-usb2phy-reset.yaml          | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.example.dtb: reset-controller@15830000 (renesas,r9a09g057-usb2phy-reset): $nodename:0: 'reset-controller@15830000' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
> > 	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml
> > 
> > doc reference errors (make refcheckdocs):
> > 
> > See https://patchwork.kernel.org/project/devicetree/patch/af75145b08e24034dcf367932002079363e5dd81.1769704000.git.tommaso.merciai.xr@bp.renesas.com
> > 
> > The base for the series is generally the latest rc1. A different dependency
> > should be noted in *this* patch.
> > 
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> > 
> > pip3 install dtschema --upgrade
> > 
> > Please check and re-submit after running the above command yourself. Note
> > that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> > your schema. However, it must be unset to test all examples with your schema.
> > 
> 
> This series depends on related mux series [0].
> Was splitted the series into per subsystem series for easy merging.

It's not easier when there's a dependency. I don't care so much as long 
as this series is merged after [0] is in linux-next. But don't make the 
maintainer figure that out. Either make it clear there is a warning 
until that happens or just wait to send this until the dependency is 
applied (still need to mention any dependency that's only in linux-next 
and not mainline).

Rob

> 
> [0] https://lore.kernel.org/all/cover.1769703480.git.tommaso.merciai.xr@bp.renesas.com/
> 
> Thanks & Regards,
> Tommaso
> 

