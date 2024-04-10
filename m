Return-Path: <linux-renesas-soc+bounces-4434-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DF489F1D9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 14:16:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 961ED1F226DE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 12:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBEA015B14B;
	Wed, 10 Apr 2024 12:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+G9RV4B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9376715957F;
	Wed, 10 Apr 2024 12:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712751390; cv=none; b=nj71+ZIRUaj0Zz6aX1kTOKWhgSVMM4iC+Fe0WuOSkycpGefrzkn7kjDfuhll1WrG328UnnBeMd/2o0i90cFMaIVOENmdWGEvziZQynQKDqVQuoNXtrRoNK9UV5qbXaf+2fMGO5oM+i9fWTnIVxKRc0d241g4ehc09aPL4eCxErk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712751390; c=relaxed/simple;
	bh=uqgIbQjDdQ7mXlLuRp0MGBFFQHK0OHDSrqq0mSqlVPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZGekQ+2MB6KFpKG5NNIIcMnNGFEdE9L8QYVnySrTXJYSHZ4819R2dDVPfa/umWbhKGrm5k/cCqJZDOk54JACrE/8Kjz1oUahAGqloDmCdE97KKgEzjQ5YZ5jrGmwLwyPOWtsEPZAqQ87sy0C06nXpvs2yVsmCxbdu/knyc7aVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g+G9RV4B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA30DC433C7;
	Wed, 10 Apr 2024 12:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712751390;
	bh=uqgIbQjDdQ7mXlLuRp0MGBFFQHK0OHDSrqq0mSqlVPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g+G9RV4BO0X3JsN/4qj/fub/YCO1DybeOA5yiCnNbFx3qhkImsTvXTWQ79tkGkp1i
	 VUYo/Xh+LaQIJ3EyEZ1gfvBdVXQWpImOH3Ks5aDGqrtuu7ZRf959UinfC11+FR7nNy
	 4M0WFulk4cnWOsQA0YA7SEISW7DLRwmtgHTwDf4pplsY9D5Ikf0fH3zDjT6Jr5Wui1
	 s8N61TgN8zWUlMmCSoSOF5Xa1dspvlcq51zUskwiRaJ36rsGZ5wf89rT5r8fxFRZpk
	 xf931uUP91Pl/8O+3CN2NdTNbzb6pEmifUJujQp40Mr7p3mYKFDqrmXin8Na+GBtLB
	 T6FpY0ioZg8og==
Date: Wed, 10 Apr 2024 07:16:27 -0500
From: Rob Herring <robh@kernel.org>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-sh@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Lee Jones <lee@kernel.org>, Helge Deller <deller@gmx.de>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Shawn Guo <shawnguo@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, David Rientjes <rientjes@google.com>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	Vlastimil Babka <vbabka@suse.cz>, Baoquan He <bhe@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Guo Ren <guoren@kernel.org>, Azeem Shaikh <azeemshaikh38@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Sam Ravnborg <sam@ravnborg.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-pci@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [RESEND v7 12/37] dt-bindings: pci: pci-sh7751: Add SH7751 PCI
Message-ID: <20240410121627.GA4069350-robh@kernel.org>
References: <cover.1712207606.git.ysato@users.sourceforge.jp>
 <5ab3c5952b49d7998734855e2ec1ee980795a724.1712207606.git.ysato@users.sourceforge.jp>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ab3c5952b49d7998734855e2ec1ee980795a724.1712207606.git.ysato@users.sourceforge.jp>

On Thu, Apr 04, 2024 at 02:14:23PM +0900, Yoshinori Sato wrote:
> Renesas SH7751 PCI Controller json-schema.
> 
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  .../bindings/pci/renesas,sh7751-pci.yaml      | 89 +++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/renesas,sh7751-pci.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/renesas,sh7751-pci.yaml b/Documentation/devicetree/bindings/pci/renesas,sh7751-pci.yaml
> new file mode 100644
> index 000000000000..115c2bb67339
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/renesas,sh7751-pci.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/renesas,sh7751-pci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas SH7751 PCI Host controller
> +
> +maintainers:
> +  - Yoshinori Sato <ysato@users.sourceforge.jp>
> +
> +allOf:
> +  - $ref: /schemas/pci/pci-bus.yaml#
> +
> +properties:
> +  compatible:
> +    const: renesas,sh7751-pci
> +
> +  reg:
> +    minItems: 2
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: PCI Controller
> +      - const: Bus State Controller
> +

> +  "#interrupt-cells":
> +    const: 1
> +
> +  "#address-cells":
> +    const: 3
> +
> +  "#size-cells":
> +    const: 2
> +
> +  ranges: true
> +
> +  dma-ranges: true

All 5 of these are defined in pci-bus-common.yaml, so you can drop them.

> +
> +  interrupt-controller: true
> +
> +  renesas,bus-arbit-round-robin:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |

Don't need '|'.

> +      Set DMA bus arbitration to round robin.
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#interrupt-cells"

> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges

These 3 are already required, so drop.

> +  - interrupt-map
> +  - interrupt-map-mask
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    pci@fe200000 {
> +            compatible = "renesas,sh7751-pci";
> +            #address-cells = <3>;
> +            #size-cells = <2>;
> +            #interrupt-cells = <1>;
> +            interrupt-controller;
> +            device_type = "pci";
> +            bus-range = <0 0>;
> +            ranges = <0x02000000 0 0xfd000000 0xfd000000 0 0x01000000>,
> +                     <0x01000000 0 0x00000000 0xfe240000 0 0x00040000>;
> +            dma-ranges = <0x02000000 0 0xc000000 0x0c000000 0 0x04000000>;
> +            reg = <0xfe200000 0x0400>,
> +                  <0xff800000 0x0100>;
> +            interrupt-map = <0x0000 0 0 1 &julianintc 5 IRQ_TYPE_LEVEL_LOW>,
> +                            <0x0000 0 0 2 &julianintc 6 IRQ_TYPE_LEVEL_LOW>,
> +                            <0x0000 0 0 3 &julianintc 7 IRQ_TYPE_LEVEL_LOW>,
> +                            <0x0000 0 0 4 &julianintc 8 IRQ_TYPE_LEVEL_LOW>,
> +                            <0x0800 0 0 1 &julianintc 6 IRQ_TYPE_LEVEL_LOW>,
> +                            <0x0800 0 0 2 &julianintc 7 IRQ_TYPE_LEVEL_LOW>,
> +                            <0x0800 0 0 3 &julianintc 8 IRQ_TYPE_LEVEL_LOW>,
> +                            <0x0800 0 0 4 &julianintc 5 IRQ_TYPE_LEVEL_LOW>,
> +                            <0x1000 0 0 1 &julianintc 7 IRQ_TYPE_LEVEL_LOW>,
> +                            <0x1000 0 0 2 &julianintc 8 IRQ_TYPE_LEVEL_LOW>,
> +                            <0x1000 0 0 3 &julianintc 5 IRQ_TYPE_LEVEL_LOW>,
> +                            <0x1000 0 0 4 &julianintc 6 IRQ_TYPE_LEVEL_LOW>;
> +            interrupt-map-mask = <0x1800 0 0 7>;
> +    };
> -- 
> 2.39.2
> 

