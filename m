Return-Path: <linux-renesas-soc+bounces-27850-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cK1GBYoLgmmCOQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27850-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 15:51:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67828DAD16
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 15:51:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13B7C30BAF08
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 14:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E03F4394481;
	Tue,  3 Feb 2026 14:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mTK4R+js"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3ED2E92C3;
	Tue,  3 Feb 2026 14:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770130003; cv=none; b=d/65f30ZuxYmlk7KtYVJw22TWaNvDjj5s6s6ulvafsvMAp23D6gU3kqX91Kd0Uc0k2HQZWedQCuVRSMyNhpTX3/dLg1r+qyDHMGnZ2yRyJAIWNJFPYJauZct8BKrVy1GtVRiZ3MngD3fpuyolhiKomH/XAXeJFqFXCNXDs3y/7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770130003; c=relaxed/simple;
	bh=+I4EbU5H2CwfCr+HfX4PmdXBArW7/Kor7ez70HR28NM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=uXEC4nvzRMJ43ZAjRItR86nVbgY4FjnTB6dbP42rQ0TUp7qCKn6d7w4GpIBB+Cg2SoWxvOtmClxhK1B1wX5OOR1R8nLUK05J81+BTCjD+nHBXknvNYGvjJbAriwVyCj4tRtmw7pEx9hvzW0DVi7E7oNZCRV2ZueKH60LG+hCL0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mTK4R+js; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27441C116D0;
	Tue,  3 Feb 2026 14:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770130003;
	bh=+I4EbU5H2CwfCr+HfX4PmdXBArW7/Kor7ez70HR28NM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=mTK4R+jseB79bDOwofKnoc4O4HqwYbCEuyE7zvExIlNoOxkBe6KGHJcE8OEfxACqw
	 v6Yhrbz9oSp/1/25hZ5GNEOaIIP3QhzIAr8AA4qBk8B8yGs260eSsbvL3jvSIUlCqt
	 vaVXG6uKKe4kG/vs4cQ5K4R0RLcjvVP6vdnofQ3q+l0o49ntm9hxUBJRtnCI9F/kq/
	 A6Y3TrPQP9EN4G3nUMIKouuU6D2Yh+Z3o1Ii5P5v+PArDM5JaMn4drGRbkdLnEOLZ+
	 o38xynNt7FyAx7b9+HqPV9xWkptL34X/EQl9bbOIZUSqba5m9GSO5k85WLj23vfjAA
	 b4XFgC9F38d7A==
Date: Tue, 03 Feb 2026 08:46:42 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, netdev@vger.kernel.org, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, 
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Stefan Eichenberger <eichest@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
To: Biju <biju.das.au@gmail.com>
In-Reply-To: <20260203121723.312336-1-biju.das.jz@bp.renesas.com>
References: <20260203121723.312336-1-biju.das.jz@bp.renesas.com>
Message-Id: <177013000212.2528321.6355698211808393488.robh@kernel.org>
Subject: Re: [PATCH net-next] dt-bindings: net: micrel: Fix dtbs compatible
 too long warnings
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27850-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[redhat.com,bp.renesas.com,kernel.org,vger.kernel.org,glider.be,google.com,davemloft.net,lunn.ch,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.8:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.4:email,0.0.0.0:email,0.0.0.1:email,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: 67828DAD16
X-Rspamd-Action: no action


On Tue, 03 Feb 2026 12:17:21 +0000, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> The KSZ9131 PHY is suitable for IEEE 802.3 applications.
> 
> Fix the below dtbs warning "compatible: ['ethernet-phy-id0022.1640',
> 'ethernet-phy-ieee802.3-c22'] is too long" on the below dts:
> 
> r8a774b1-beacon-rzg2n-kit.dtb
> r8a774a1-beacon-rzg2m-kit.dtb
> r8a774e1-beacon-rzg2h-kit.dtb
> r9a08g046l48-smarc.dtb
> r9a07g043u11-smarc.dtb
> r9a07g044c2-smarc.dtb
> r9a07g044l2-smarc.dtb
> r9a07g044l2-smarc.dtb
> r9a07g054l2-smarc.dtb
> r9a07g054l2-smarc.dtb
> r9a09g047e57-smarc.dtb
> r9a09g047e57-smarc.dtb
> r9a09g056n48-rzv2n-evk.dtb
> r9a09g056n48-rzv2n-evk.dtb
> r9a09g057h44-rzv2h-evk.dtb
> r9a09g057h44-rzv2h-evk.dtb
> r9a07g043u11-smarc-cru-csi-ov5645.dtb
> r9a07g043u11-smarc-pmod.dtb
> r9a07g043u11-smarc-du-adv7513.dtb
> r9a09g047e57-smarc-cru-csi-ov5645.dtb
> r9a07g044c2-smarc-cru-csi-ov5645.dtb
> r9a09g047e57-smarc-cru-csi-ov5645.dtb
> r9a07g044l2-smarc-cru-csi-ov5645.dtb
> r9a07g044l2-smarc-cru-csi-ov5645.dtb
> r9a07g054l2-smarc-cru-csi-ov5645.dtb
> r9a07g054l2-smarc-cru-csi-ov5645.dtb
> r9a09g056n48-rzv2n-evk-cn15-emmc.dtb
> r9a09g056n48-rzv2n-evk-cn15-emmc.dtb
> r9a09g056n48-rzv2n-evk-cn15-sd.dtb
> r9a09g057h44-rzv2h-evk-cn15-sd.dtb
> r9a09g056n48-rzv2n-evk-cn15-sd.dtb
> r9a09g057h44-rzv2h-evk-cn15-emmc.dtb
> r9a09g057h44-rzv2h-evk-cn15-sd.dtb
> r9a09g057h44-rzv2h-evk-cn15-emmc.dtb
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../bindings/net/micrel,gigabit.yaml          | 23 +++++++++++--------
>  1 file changed, 14 insertions(+), 9 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mscc-phy-vsc8531.example.dtb: ethernet-phy@0 (ethernet-phy-id0007.0772): compatible: 'oneOf' conditional failed, one must be fixed:
	['ethernet-phy-id0007.0772', 'ethernet-phy-ieee802.3-c22'] is too long
	'ethernet-phy-id0022.1640' was expected
	'ethernet-phy-id0007.0772' is not one of ['ethernet-phy-id0022.1610', 'ethernet-phy-id0022.1611', 'ethernet-phy-id0022.1620', 'ethernet-phy-id0022.1631', 'ethernet-phy-id0022.1640', 'ethernet-phy-id0022.1650', 'ethernet-phy-id0022.1660', 'ethernet-phy-id0022.1670']
	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mscc-phy-vsc8531.example.dtb: ethernet-phy@0 (ethernet-phy-id0007.0772): Unevaluated properties are not allowed ('load-save-gpios', 'vsc8531,edge-slowdown', 'vsc8531,led-0-mode', 'vsc8531,led-1-mode', 'vsc8531,vddmac' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/faraday,ftgmac100.example.dtb: ethernet-phy@1 (ethernet-phy-ieee802.3-c22): compatible: 'oneOf' conditional failed, one must be fixed:
	['ethernet-phy-ieee802.3-c22'] is too short
	'ethernet-phy-id0022.1640' was expected
	'ethernet-phy-ieee802.3-c22' is not one of ['ethernet-phy-id0022.1610', 'ethernet-phy-id0022.1611', 'ethernet-phy-id0022.1620', 'ethernet-phy-id0022.1631', 'ethernet-phy-id0022.1640', 'ethernet-phy-id0022.1650', 'ethernet-phy-id0022.1660', 'ethernet-phy-id0022.1670']
	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/qcom,ethqos.example.dtb: phy@4 (ethernet-phy-ieee802.3-c22): $nodename:0: 'phy@4' does not match '^ethernet-phy(@[a-f0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/qcom,ethqos.example.dtb: phy@4 (ethernet-phy-ieee802.3-c22): compatible: 'oneOf' conditional failed, one must be fixed:
	['ethernet-phy-ieee802.3-c22'] is too short
	'ethernet-phy-id0022.1640' was expected
	'ethernet-phy-ieee802.3-c22' is not one of ['ethernet-phy-id0022.1610', 'ethernet-phy-id0022.1611', 'ethernet-phy-id0022.1620', 'ethernet-phy-id0022.1631', 'ethernet-phy-id0022.1640', 'ethernet-phy-id0022.1650', 'ethernet-phy-id0022.1660', 'ethernet-phy-id0022.1670']
	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/qcom,ethqos.example.dtb: phy@4 (ethernet-phy-ieee802.3-c22): Unevaluated properties are not allowed ('#phy-cells', 'device_type', 'reg' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/brcm,unimac-mdio.example.dtb: ethernet-phy@0 (ethernet-phy-ieee802.3-c22): compatible: 'oneOf' conditional failed, one must be fixed:
	['ethernet-phy-ieee802.3-c22'] is too short
	'ethernet-phy-id0022.1640' was expected
	'ethernet-phy-ieee802.3-c22' is not one of ['ethernet-phy-id0022.1610', 'ethernet-phy-id0022.1611', 'ethernet-phy-id0022.1620', 'ethernet-phy-id0022.1631', 'ethernet-phy-id0022.1640', 'ethernet-phy-id0022.1650', 'ethernet-phy-id0022.1660', 'ethernet-phy-id0022.1670']
	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/renesas,etheravb.example.dtb: ethernet-phy@0 (ethernet-phy-id0022.1622): compatible: 'oneOf' conditional failed, one must be fixed:
	['ethernet-phy-id0022.1622', 'ethernet-phy-ieee802.3-c22'] is too long
	'ethernet-phy-id0022.1640' was expected
	'ethernet-phy-id0022.1622' is not one of ['ethernet-phy-id0022.1610', 'ethernet-phy-id0022.1611', 'ethernet-phy-id0022.1620', 'ethernet-phy-id0022.1631', 'ethernet-phy-id0022.1640', 'ethernet-phy-id0022.1650', 'ethernet-phy-id0022.1660', 'ethernet-phy-id0022.1670']
	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/renesas,etheravb.example.dtb: ethernet-phy@0 (ethernet-phy-id0022.1622): Unevaluated properties are not allowed ('rxc-skew-ps' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/socionext,synquacer-netsec.example.dtb: ethernet-phy@1 (ethernet-phy-ieee802.3-c22): compatible: 'oneOf' conditional failed, one must be fixed:
	['ethernet-phy-ieee802.3-c22'] is too short
	'ethernet-phy-id0022.1640' was expected
	'ethernet-phy-ieee802.3-c22' is not one of ['ethernet-phy-id0022.1610', 'ethernet-phy-id0022.1611', 'ethernet-phy-id0022.1620', 'ethernet-phy-id0022.1631', 'ethernet-phy-id0022.1640', 'ethernet-phy-id0022.1650', 'ethernet-phy-id0022.1660', 'ethernet-phy-id0022.1670']
	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.example.dtb: ethernet-phy@8 (ethernet-phy-id0180.3301): compatible: 'oneOf' conditional failed, one must be fixed:
	['ethernet-phy-id0180.3301', 'ethernet-phy-ieee802.3-c22'] is too long
	'ethernet-phy-id0022.1640' was expected
	'ethernet-phy-id0180.3301' is not one of ['ethernet-phy-id0022.1610', 'ethernet-phy-id0022.1611', 'ethernet-phy-id0022.1620', 'ethernet-phy-id0022.1631', 'ethernet-phy-id0022.1640', 'ethernet-phy-id0022.1650', 'ethernet-phy-id0022.1660', 'ethernet-phy-id0022.1670']
	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.example.dtb: ethernet-phy@0 (ethernet-phy-ieee802.3-c22): compatible: 'oneOf' conditional failed, one must be fixed:
	['ethernet-phy-ieee802.3-c22'] is too short
	'ethernet-phy-id0022.1640' was expected
	'ethernet-phy-ieee802.3-c22' is not one of ['ethernet-phy-id0022.1610', 'ethernet-phy-id0022.1611', 'ethernet-phy-id0022.1620', 'ethernet-phy-id0022.1631', 'ethernet-phy-id0022.1640', 'ethernet-phy-id0022.1650', 'ethernet-phy-id0022.1660', 'ethernet-phy-id0022.1670']
	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/fsl,fec.example.dtb: ethernet-phy@0 (ethernet-phy-ieee802.3-c22): compatible: 'oneOf' conditional failed, one must be fixed:
	['ethernet-phy-ieee802.3-c22'] is too short
	'ethernet-phy-id0022.1640' was expected
	'ethernet-phy-ieee802.3-c22' is not one of ['ethernet-phy-id0022.1610', 'ethernet-phy-id0022.1611', 'ethernet-phy-id0022.1620', 'ethernet-phy-id0022.1631', 'ethernet-phy-id0022.1640', 'ethernet-phy-id0022.1650', 'ethernet-phy-id0022.1660', 'ethernet-phy-id0022.1670']
	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/brcm,bcmgenet.example.dtb: ethernet-phy@1 (ethernet-phy-ieee802.3-c22): compatible: 'oneOf' conditional failed, one must be fixed:
	['ethernet-phy-ieee802.3-c22'] is too short
	'ethernet-phy-id0022.1640' was expected
	'ethernet-phy-ieee802.3-c22' is not one of ['ethernet-phy-id0022.1610', 'ethernet-phy-id0022.1611', 'ethernet-phy-id0022.1620', 'ethernet-phy-id0022.1631', 'ethernet-phy-id0022.1640', 'ethernet-phy-id0022.1650', 'ethernet-phy-id0022.1660', 'ethernet-phy-id0022.1670']
	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/brcm,bcmgenet.example.dtb: ethernet-phy@0 (ethernet-phy-ieee802.3-c22): compatible: 'oneOf' conditional failed, one must be fixed:
	['ethernet-phy-ieee802.3-c22'] is too short
	'ethernet-phy-id0022.1640' was expected
	'ethernet-phy-ieee802.3-c22' is not one of ['ethernet-phy-id0022.1610', 'ethernet-phy-id0022.1611', 'ethernet-phy-id0022.1620', 'ethernet-phy-id0022.1631', 'ethernet-phy-id0022.1640', 'ethernet-phy-id0022.1650', 'ethernet-phy-id0022.1660', 'ethernet-phy-id0022.1670']
	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260203121723.312336-1-biju.das.jz@bp.renesas.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


