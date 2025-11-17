Return-Path: <linux-renesas-soc+bounces-24676-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 44302C62A00
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 08:00:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3236C4E1D26
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 07:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA62625F7A5;
	Mon, 17 Nov 2025 07:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jH/3sOh5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC101FDA8E;
	Mon, 17 Nov 2025 07:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763362830; cv=none; b=DkSnklgi4+3Sb3Pmf4V81O4cyDncSL9UdcBhwHrpYu6qzg/0W5sDLWrugWPmobmHZmUso4JuvdwuVy6MF9WCm7zIN5p7a64n2AFB15DSLOtl7PknPpttyxzZT/61HJyG+3SZfslRTVzQ/NKMED/O7cL0DAvJF4srAQEzRt61FsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763362830; c=relaxed/simple;
	bh=aZN7zbXZXHa7wcgVartfQ5nXipXYlMCiZfigd0SdNLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WMqgs+XR+T6MtTY3oZ8j7O2B3gdY77ZqYrMCwaxjI+d1qlWMnR+kYBZTa2Ys0ofF1PlmrC2gUMn6XKqBHUMHhxbMCtwcgQMSLsFuNmyIe3YyaK+Xsrh0n+eYZnjfSN6NOEI5wJSqfTIAGbJ3r3wx7vStiHPr/3CqsHaQEvjKY6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jH/3sOh5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9AADC4CEF5;
	Mon, 17 Nov 2025 07:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763362830;
	bh=aZN7zbXZXHa7wcgVartfQ5nXipXYlMCiZfigd0SdNLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jH/3sOh553iNuvqJzZEEhjMGtt2bcN1UWZ8gn40Kc6uvg7hZdXCj+rtc/UI10jG/R
	 1NH+zU9IEq1KHtOdvdgYag4OyDSeZMexuBZFgX8DxXOirnnHTDblblquhFNFM1q5Yc
	 WAa3sB3jNuGNIrljkZYU6LBEFJOQi7ufeHHq8t86n1hwIXtZ8G0Ls2nw91Y5pcQhz1
	 nlYGmg9fKa7bn+sBBc0wKVcD9zrROHc7NQz3TRkw6ai6tOhI5az7ESfDnufa74YG0e
	 oENNgH0A/5QCRdTy3iVXaUv/Hw65C51boqV/3RPp5Ajtfos2UI0REvlcJ8dgSAElXR
	 WMoJGt2P6U2Jw==
Date: Mon, 17 Nov 2025 08:00:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Rosin <peda@axentia.se>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/21] dt-bindings: reset: renesas,rzv2h-usb2phy:
 Document VBUS_SEL mux
Message-ID: <20251117-sturdy-resourceful-crab-c14bb8@kuoka>
References: <cover.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
 <8fba0b7235bd398d41329fd087d68f7e98bbbaca.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8fba0b7235bd398d41329fd087d68f7e98bbbaca.1762773720.git.tommaso.merciai.xr@bp.renesas.com>

On Mon, Nov 10, 2025 at 01:08:04PM +0100, Tommaso Merciai wrote:
> Document the 'mux-controller' child node in the Renesas RZ/V2H(P)
> USB2PHY reset binding to support describing the USB VBUS_SEL
> multiplexer as a mux-controller.
> 
> This is required to properly configure the USB PHY VBUS source on
> RZ/V2H(P), RZ/G3E SoCs.

And where did you explain why this cannot be folded into parent node? If
you do not provide context why reviewer's advice cannot be fulfilled,
then you will get the same comment.

> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v2->v3:
>  - Manipulate mux-controller as an internal node.
>  - Improved commit body.
> 
> v1->v2:
>  - New patch
> 
>  .../bindings/reset/renesas,rzv2h-usb2phy-reset.yaml   | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
> index c1b800a10b53..03da74ff2d08 100644
> --- a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
> @@ -37,6 +37,12 @@ properties:
>    '#reset-cells':
>      const: 0
>  
> +  mux-controller:
> +    $ref: /schemas/mux/mux-controller.yaml#
> +    description: Mux controller for USB VBUS source selection.
> +    type: object
> +    unevaluatedProperties: false
> +
>  required:
>    - compatible
>    - reg
> @@ -44,6 +50,7 @@ required:
>    - resets
>    - power-domains
>    - '#reset-cells'
> +  - mux-controller
>  
>  additionalProperties: false
>  
> @@ -58,4 +65,8 @@ examples:
>          resets = <&cpg 0xaf>;
>          power-domains = <&cpg>;
>          #reset-cells = <0>;
> +
> +        mux-controller {
> +          #mux-state-cells = <1>;

Do not mix up indentation.

Best regards,
Krzysztof


