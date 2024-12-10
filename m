Return-Path: <linux-renesas-soc+bounces-11199-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0790D9EB98A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 19:45:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A800C165FE7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 18:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23BB921421B;
	Tue, 10 Dec 2024 18:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6S36Kue"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EE81D7996;
	Tue, 10 Dec 2024 18:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733856345; cv=none; b=ujHfmffvBGB7cTdeyjKhvnhazgk3nk6xiQ8aYHPX7Ud3tHB8seO3/S9jKdl+qKLk7XLQcbvA2kuMmzj8mSb7ffjW2QMCbTXS44LKSgY4C/Nx9VYw/qlAUlVd2KE+MF6ePsvHJemiEirp+Mifw8LHZGo638yPjo9ecUINzsykB2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733856345; c=relaxed/simple;
	bh=OB5DgYuePvYBlbGv8W3gJQ1FsMSp+KmUVfAIg9wjr8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQE3T8BGZBrkBOW1P6cXlMzqlTg9F7Tp/lcJZiDDzOHGwygT7PQ/Jbk4sx1w/BFQk8Ewoaal7zvYvPafrmU1vBS/l+RUdDW0gS8VMrh++il6W9zjcgGiePBPo4GzhagwcYirD85FAuH+sOoWORhNfYl+wOLiB5M+mB0Httpumvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l6S36Kue; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C80DC4CED6;
	Tue, 10 Dec 2024 18:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733856344;
	bh=OB5DgYuePvYBlbGv8W3gJQ1FsMSp+KmUVfAIg9wjr8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l6S36KueRi870kpf9AOxkZRG7YV24Ph05U8fJBCcU1qmYjUe5Wo6ro9oCAH96EK8P
	 u2q9VKDFig43EadBkj4bumesqcumc2XBav6oTqS3cV7Bh31aH11kLtx371WtwSOnlg
	 C4Vki6vtERNHDxJMdeLSYv8VcYX8a46hJNWX6IMBanfcqd8RYSIwa2ef9y62fBlkO/
	 ECYwMhopKBWsnOVkPZ/jBgwmeMEuhdisurdadEno6NpuMnD+6YxsqBPXpKPwzyt2y6
	 2ifO4nGrYvCGaqEaIuFaikHl94gZpT0rJFniFm1orY7KeGSQmzV0d0yFgauSnybni+
	 7y+EAR299GbKQ==
Date: Tue, 10 Dec 2024 12:45:42 -0600
From: Rob Herring <robh@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, kishon@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, p.zabel@pengutronix.de,
	geert+renesas@glider.be, magnus.damm@gmail.com,
	gregkh@linuxfoundation.org, yoshihiro.shimoda.uh@renesas.com,
	christophe.jaillet@wanadoo.fr, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2 01/15] dt-bindings: soc: renesas: renesas,rzg2l-sysc:
 Add #renesas,sysc-signal-cells
Message-ID: <20241210184542.GA4077820-robh@kernel.org>
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
 <20241126092050.1825607-2-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126092050.1825607-2-claudiu.beznea.uj@bp.renesas.com>

On Tue, Nov 26, 2024 at 11:20:36AM +0200, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> The RZ/G3S system controller (SYSC) has registers to control signals that
> are routed to various IPs. These signals must be controlled during
> configuration of the respective IPs. One such signal is the USB PWRRDY,
> which connects the SYSC and the USB PHY. This signal must to be controlled
> before and after the power to the USB PHY is turned off/on.
> 
> Other similar signals include the following (according to the RZ/G3S
> hardware manual):
> 
> * PCIe:
> - ALLOW_ENTER_L1 signal controlled through the SYS_PCIE_CFG register
> - PCIE_RST_RSM_B signal controlled through the SYS_PCIE_RST_RSM_B
>   register
> - MODE_RXTERMINATION signal controlled through SYS_PCIE_PHY register
> 
> * SPI:
> - SEL_SPI_OCTA signal controlled through SYS_IPCONT_SEL_SPI_OCTA
>   register
> 
> * I2C/I3C:
> - af_bypass I2C signals controlled through SYS_I2Cx_CFG registers
>   (x=0..3)
> - af_bypass I3C signal controlled through SYS_I3C_CFG register
> 
> * Ethernet:
> - FEC_GIGA_ENABLE Ethernet signals controlled through SYS_GETHx_CFG
>   registers (x=0..1)
> 
> Add #renesas,sysc-signal-cells DT property to allow different SYSC signals
> consumers to manage these signals.
> 
> The goal is to enable consumers to specify the required access data for
> these signals (through device tree) and let their respective drivers
> control these signals via the syscon regmap provided by the system
> controller driver. For example, the USB PHY will describe this relation
> using the following DT property:
> 
> usb2_phy1: usb-phy@11e30200 {
> 	// ...
> 	renesas,sysc-signal = <&sysc 0xd70 0x1>;
> 	// ...
> };
> 
> Along with it, add the syscon to the compatible list as it will be
> requested by the consumer drivers. The syscon was added to the rest of
> system controller variants as these are similar with RZ/G3S and can
> benefit from the implementation proposed in this series.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
> 
> Changes in v2:
> - none; this patch is new
> 
> 
>  .../soc/renesas/renesas,rzg2l-sysc.yaml       | 23 ++++++++++++++-----
>  1 file changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml
> index 4386b2c3fa4d..90f827e8de3e 100644
> --- a/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml
> @@ -19,11 +19,13 @@ description:
>  
>  properties:
>    compatible:
> -    enum:
> -      - renesas,r9a07g043-sysc # RZ/G2UL and RZ/Five
> -      - renesas,r9a07g044-sysc # RZ/G2{L,LC}
> -      - renesas,r9a07g054-sysc # RZ/V2L
> -      - renesas,r9a08g045-sysc # RZ/G3S
> +    items:
> +      - enum:
> +          - renesas,r9a07g043-sysc # RZ/G2UL and RZ/Five
> +          - renesas,r9a07g044-sysc # RZ/G2{L,LC}
> +          - renesas,r9a07g054-sysc # RZ/V2L
> +          - renesas,r9a08g045-sysc # RZ/G3S
> +      - const: syscon
>  
>    reg:
>      maxItems: 1
> @@ -42,9 +44,17 @@ properties:
>        - const: cm33stbyr_int
>        - const: ca55_deny
>  
> +  "#renesas,sysc-signal-cells":
> +    description:
> +      The number of cells needed to configure a SYSC controlled signal. First
> +      cell specifies the SYSC offset of the configuration register, second cell
> +      specifies the bitmask in register.
> +    const: 2

If there's only one possible value, then just fix the size in the users. 
We don't need #foo-cells until things are really generic. Plus patch 
8 already ignores this based on the schema. And there's implications to 
defining them. For example, the pattern is that the consumer property 
name is renesas,sysc-signals, not renesas,sysc-signal.

Maybe someone wants to create a 'h/w (signal) control' subsystem (and 
binding) that is just 'read, assert, or deassert a h/w signal'. Perhaps 
even the reset subsystem could be morphed into that as I think there 
would be a lot of overlap. Maybe that would cut down on a lot of these 
syscon phandle properties. I would find that a lot more acceptable than 
the generic 'syscons' and '#syscon-cells' binding that was proposed at 
some point.


> +
>  required:
>    - compatible
>    - reg
> +  - "#renesas,sysc-signal-cells"

New required properties are an ABI break.

>  
>  additionalProperties: false
>  
> @@ -53,7 +63,7 @@ examples:
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>  
>      sysc: system-controller@11020000 {
> -            compatible = "renesas,r9a07g044-sysc";
> +            compatible = "renesas,r9a07g044-sysc", "syscon";

What happens on a new kernel and a DT without this change?

Rob

