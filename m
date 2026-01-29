Return-Path: <linux-renesas-soc+bounces-27639-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOhcE1aqe2m8HgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27639-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 19:43:34 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F88DB3AD8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 19:43:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BD1D303AF32
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 18:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2189C2F9D9A;
	Thu, 29 Jan 2026 18:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZGtf5QLw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A5C1ADFE4;
	Thu, 29 Jan 2026 18:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769712133; cv=none; b=aW3gRZEWSag5L2j2YpyGrT0rfojXkmYhVtcjG7t4EXgPFnyYUMDRHN0N8b7HuZEh7LuTucenGPwg7h7XI0JvDYgLYfn2JC5GXI1TzG5QC9SdfpEBBoHD50OFBVDXXm+3Oqbpyjhj9p8QmfRnfzfG5SoKN1oF/SZfjDtzbepk3uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769712133; c=relaxed/simple;
	bh=oGKj3bJmdms/bUUnXYRdNRQubOf7F48t5aJal+BsCgw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Gvu/FGreYCqQVeK20N6cNpkLNIQYrJHYZ+rpClMcCykWJDqHTxqz2KcJ6kgZqQOtBmV6J6JNHII9mS3tjAUtr2Fvpnt2xfn7SQO/8OF8S5d0aQyOGEc+VgcN1Dj19QuSdp7r8+6aJQr0qJuqS9hgEyXUeS7/Ru00w/v8lTdn+4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZGtf5QLw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF3CC4CEF7;
	Thu, 29 Jan 2026 18:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769712132;
	bh=oGKj3bJmdms/bUUnXYRdNRQubOf7F48t5aJal+BsCgw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ZGtf5QLw9zwCqxr4xXdxFrjU8IT9HhG5kRNRUlVuW3rrjJgbtAhEreEi4GpBcB6Y0
	 RXFJheuMDU7w37cE5KoYTJEMxJLxhMefERDww15DMZ3GGE1UgqvaYGgLbj5nTA4FrS
	 lWh2LXfjonH/0TmECs2p+NqS+77SZDZ2FXSsCGZxY5LEqkZShiCd6rXPUoVmWriUrS
	 mmqi1ubT+aQRg5TU4XbVXFKJoojHbkEz/YVC0oGoRWWMPncTzX8dhc0/vywHPjMdqC
	 6msCosHo4JC+aSENu5d/eVvDCsxZc64U5BOI5RoRUQz5O9yYZcKCToAzVsEyH3Lh3K
	 aoR9MuSDXlHnw==
Date: Thu, 29 Jan 2026 12:42:11 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, biju.das.jz@bp.renesas.com, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, 
 Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, tomm.merciai@gmail.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <af75145b08e24034dcf367932002079363e5dd81.1769704000.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1769704000.git.tommaso.merciai.xr@bp.renesas.com>
 <af75145b08e24034dcf367932002079363e5dd81.1769704000.git.tommaso.merciai.xr@bp.renesas.com>
Message-Id: <176971213156.1637421.14962977334514056951.robh@kernel.org>
Subject: Re: [PATCH v7 1/4] dt-bindings: reset: renesas,rzv2h-usb2phy: Add
 '#mux-state-cells' property
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,renesas.com,pengutronix.de,gmail.com,kernel.org,oss.qualcomm.com,glider.be];
	TAGGED_FROM(0.00)[bounces-27639-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.241.139.240:email]
X-Rspamd-Queue-Id: 9F88DB3AD8
X-Rspamd-Action: no action


On Thu, 29 Jan 2026 17:52:55 +0100, Tommaso Merciai wrote:
> Add the '#mux-state-cells' property to support describing the USB VBUS_SEL
> multiplexer as a mux-controller in the Renesas RZ/V2H(P) USB2PHY binding.
> 
> The mux-controller cannot be integrated into the parent USB2PHY node
> because the VBUS source selector is part of a separate hardware block,
> not the USB2PHY block itself.
> 
> This is required to properly configure USB PHY power selection on
> RZ/V2H(P) and RZ/G3E SoCs.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v6->v7:
>  - No changes
> 
> v5->v6:
>  - Collected KKrzysztof tag
> 
> v4->v5:
>  - No changes
> 
> v3->v4:
>  - Switch back to v2 implementation.
>  - Improve commit body.
> 
> v2->v3:
>  - Manipulate mux-controller as an internal node.
>  - Improved commit body.
> 
> v1->v2:
>  - New patch
> 
>  .../bindings/reset/renesas,rzv2h-usb2phy-reset.yaml          | 5 +++++
>  1 file changed, 5 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.example.dtb: reset-controller@15830000 (renesas,r9a09g057-usb2phy-reset): $nodename:0: 'reset-controller@15830000' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/af75145b08e24034dcf367932002079363e5dd81.1769704000.git.tommaso.merciai.xr@bp.renesas.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


