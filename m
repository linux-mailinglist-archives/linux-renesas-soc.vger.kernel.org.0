Return-Path: <linux-renesas-soc+bounces-24179-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7492CC37099
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 05 Nov 2025 18:21:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B139418C6C94
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 17:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F076126462E;
	Wed,  5 Nov 2025 17:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqdYGnTp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE500225D6;
	Wed,  5 Nov 2025 17:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762362986; cv=none; b=ZqlrqB2q6bA59aOXgausNlb2ozQg9EVQoCndX60+HUK47+ADchYnCx5NyV7SH3HQWSkmopeTTPnzIzj8zCo4yj64M+0TrQn8q4p0lZZpEXZYKqt7ADoqC7L3VMnIAJjawvNtIoOQ0D9MK1EUBpV6cylvdZ3SNsSe89skk6mE+FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762362986; c=relaxed/simple;
	bh=NAyV3n19uUAIKa88Vx2aHvLyZFltbfxA4QxL9BN8W2s=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=XutfaIZtnHLLzbWFzgLNHINQorBC+mVlEN+1hiQqJzIaqFAhlrv7QVvoGbtLHgPSgsqF9yzI5DNDjOas6qcUPoLONtXdP5HfgagxPWdYrnQzfOtTEQ+T/sBkdjKtHDYh01lauQV2C/oJuMV6lMXPEyBYNwCJZc40uFAPmN1CT4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqdYGnTp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1DE1C4CEF5;
	Wed,  5 Nov 2025 17:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762362986;
	bh=NAyV3n19uUAIKa88Vx2aHvLyZFltbfxA4QxL9BN8W2s=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=iqdYGnTpTVGg0vE6ejDxgix956okjleqN0iJKEDqAdr75YzaZYCHz7DU7oboks/6C
	 0iVt2RCzaip90eHV551PJg+mX5LgjYLO/JCDnRwDUfXyiUVYlSjY9qJVz023Fy5Z1s
	 XQZHFoYhMmsKWYvhxLEQgrqLuaEv34XkF0hUCUZ2jMXKqVxNaFe2Uljn2dUs6moeP3
	 dWNr9hTvxh6LmXD6/XKe14Nj7MJigcyBf5Gx+T6nGdJSA5eAqQXk3VZxU5Nu+QlwQX
	 +Ki3iVmGM3Gtw8y1Nuu1kQ3z05NZpAUW//YZd0xCjnoK1V2L1SlxIeoMM5cFIcdOUj
	 LZqKb208saeHQ==
Date: Wed, 05 Nov 2025 11:16:24 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, biju.das.jz@bp.renesas.com, 
 linux-phy@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
 linux-renesas-soc@vger.kernel.org, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, tomm.merciai@gmail.com, 
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Peter Rosin <peda@axentia.se>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <961741af7d4ec945945164759fe0d78bb3cf4d9d.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
 <961741af7d4ec945945164759fe0d78bb3cf4d9d.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
Message-Id: <176236298431.1342996.14167666722083112438.robh@kernel.org>
Subject: Re: [PATCH v2 04/21] dt-bindings: reset: renesas,rzv2h-usb2phy:
 Add '#mux-state-cells' property


On Wed, 05 Nov 2025 16:39:00 +0100, Tommaso Merciai wrote:
> Add the '#mux-state-cells' property to the Renesas RZ/V2H(P) USB2PHY
> reset binding to support describing the USB VBUS_SEL multiplexer as a
> mux-controller.
> 
> This is required to properly configure the USB PHY power selection on
> RZ/V2H(P), RZ/G3E SoCs.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/961741af7d4ec945945164759fe0d78bb3cf4d9d.1762354366.git.tommaso.merciai.xr@bp.renesas.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


