Return-Path: <linux-renesas-soc+bounces-4491-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7F189FF7B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 20:12:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94B771F22261
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 18:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0211802C7;
	Wed, 10 Apr 2024 18:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E6D8RfLI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BF01802AD;
	Wed, 10 Apr 2024 18:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712772705; cv=none; b=Tk4WFNCp8dQcHvomeJ4rA3xeUHIzfCzuiv2NHgFBnwhwBE7f1uFF/lbjBuBxNsOKdc0VmZOCOrcGuOSghDNCLRavPLCJABDRBdQlpo3nm1GvcqB3h0mLpuHbFrmUW0eAmpcME3LK1HDsKVvOtCZ5tDtKo8IJF+IC5UtPVd10y0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712772705; c=relaxed/simple;
	bh=SIfBrassqv54JCwf0gOao1lkha0r6aQpuZyT4i7ALWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pVJnjCqlcpPFGprUh9C/9VG+ZQ8pwzCgVJ88aD6G6N4G7XZab0Utj10EyP5lPb72itFwsNFzSm0gNJBBNWGCA4hTl5Xdr+mMtcba6DEVzXzmhs2zCPVxZ8EhTPF+EFeT9N2smQwdD7V+RmTIdC0LFTc+BbJ8Ot3WAxW/8QLteME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E6D8RfLI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB3FAC433F1;
	Wed, 10 Apr 2024 18:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712772704;
	bh=SIfBrassqv54JCwf0gOao1lkha0r6aQpuZyT4i7ALWs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E6D8RfLIvohoDBOVtvP9WjCvBqpxPjWQi3HZG5sqrgWP/cThTY4SbcDt3N8yTcsn0
	 K5KzF1xFMZbMhzeMdc+F1UZch6i88XrLP5skhf9dN672OoqoYv5SZHFmh9Owu5UmgL
	 nfgB85Hhsd+GeUvOUbzzkl+KUJLjxRGoNadqtKzIbkUdT8veuVPY1EIF0BwXAb7use
	 Lz5+gIT4PUZ9O+xRbWbjGGwonUaW//MChfhpIT8bvKYsCEO+S/Q8SEWI6Os9aw82Zp
	 iohh7xl1xXXp7QeVRtSNDMeYQ0OWla//I4kDbqDpNyJd3dL0QIqxYmxCys9Df5UWk8
	 wloVmtobGjJfQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5176f217b7bso1570283e87.0;
        Wed, 10 Apr 2024 11:11:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWqknIo9RczD3WV3D366atbjbz0NiUSSojXTX0zgVtyBwoIetjP84HPzpweQ/caEPYFpjoaTWGJG8BPYSV5pf2rxJNZIRRkaM634FQwDBAwYu4rMnscd52SprAYMzFSVVO6Q4i1A1FBvXt7s6uiMhktGcxWLNeeD5765cB0Hbea6iFqY4MTAFDZbdNWH3rAQta67fQFapMPatO1ikQ810TX2cZTwRUGCJhqo4ec6OnCYLnW23pirM1s4d/SPwVwt8ke6HGAsQ==
X-Gm-Message-State: AOJu0YzsEXNo/Nwmuja5bpN23ONd1fJ4rhW7qMw5U9r6QmVSvB2bu6qz
	t2TmVVFHgSVsPKgsWIRdhaFoWpqhhWk30W4Bz/EEu+e8GgtirPtJriHw6mPqbnWOZiwabeXT2VK
	wKqd6lVjz7nlUiVNDjs0Z4Ycl5A==
X-Google-Smtp-Source: AGHT+IHbOoi9pe2CCyb7hsJcUyAJ3hFQu5C1Tc6qPSzdO6bIBIJ5wxJRXN6D3zuXZ5K6R7oW9afgZVIuHfjCY5eQAY8=
X-Received: by 2002:a2e:b617:0:b0:2d6:a609:9a33 with SMTP id
 r23-20020a2eb617000000b002d6a6099a33mr3024179ljn.0.1712772682322; Wed, 10 Apr
 2024 11:11:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240407102000.37213-1-krzysztof.kozlowski@linaro.org>
 <20240407102000.37213-3-krzysztof.kozlowski@linaro.org> <20240410174806.GA788199-robh@kernel.org>
 <57827422-1042-4ef6-a11e-cb53fd930a41@linaro.org>
In-Reply-To: <57827422-1042-4ef6-a11e-cb53fd930a41@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 10 Apr 2024 13:11:09 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJM-DQvZ0fyJ17nY=vqtCRxyQwXGh6sbbAJ7rFjnAGrEA@mail.gmail.com>
Message-ID: <CAL_JsqJM-DQvZ0fyJ17nY=vqtCRxyQwXGh6sbbAJ7rFjnAGrEA@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: PCI: host-bridges: switch from
 deprecated pci-bus.yaml
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Jim Quinlan <jim2101024@gmail.com>, 
	Nicolas Saenz Julienne <nsaenz@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Will Deacon <will@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Srikanth Thokala <srikanth.thokala@intel.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, 
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Mark Kettenis <kettenis@openbsd.org>, 
	Tom Joseph <tjoseph@cadence.com>, Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2024 at 1:00=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 10/04/2024 19:48, Rob Herring wrote:
> > On Sun, Apr 07, 2024 at 12:20:00PM +0200, Krzysztof Kozlowski wrote:
> >> dtschema package with core schemas deprecated pci-bus.yaml schema in
> >> favor of pci-host-bridge.yaml.  Update all bindings to use the latter
> >> one.
> >>
> >> The difference between pci-bus.yaml and pci-host-bridge.yaml is only i=
n
> >> lack of "reg" property defined by the latter, which should not have an=
y
> >> effect here, because all these bindings define the "reg".
> >>
> >> The change is therefore quite trivial, except mediatek,mt7621-pcie.yam=
l
> >> binding which have children nodes being also host bridges, apparently.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> >>  Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml   | 2 +-
> >>  Documentation/devicetree/bindings/pci/apple,pcie.yaml         | 2 +-
> >>  Documentation/devicetree/bindings/pci/brcm,iproc-pcie.yaml    | 2 +-
> >>  Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml      | 2 +-
> >>  Documentation/devicetree/bindings/pci/cdns-pcie-host.yaml     | 2 +-
> >>  Documentation/devicetree/bindings/pci/faraday,ftpci100.yaml   | 2 +-
> >>  Documentation/devicetree/bindings/pci/host-generic-pci.yaml   | 2 +-
> >>  Documentation/devicetree/bindings/pci/intel,ixp4xx-pci.yaml   | 2 +-
> >>  Documentation/devicetree/bindings/pci/intel,keembay-pcie.yaml | 2 +-
> >>  Documentation/devicetree/bindings/pci/loongson.yaml           | 2 +-
> >>  .../devicetree/bindings/pci/mediatek,mt7621-pcie.yaml         | 4 ++-=
-
> >>  Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml | 2 +-
> >>  .../devicetree/bindings/pci/microchip,pcie-host.yaml          | 2 +-
> >>  Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml   | 2 +-
> >>  Documentation/devicetree/bindings/pci/qcom,pcie.yaml          | 2 +-
> >>  Documentation/devicetree/bindings/pci/rcar-pci-host.yaml      | 2 +-
> >>  .../devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml        | 2 +-
> >>  .../devicetree/bindings/pci/rockchip,rk3399-pcie.yaml         | 2 +-
> >>  Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml       | 2 +-
> >>  Documentation/devicetree/bindings/pci/ti,am65-pci-host.yaml   | 2 +-
> >>  Documentation/devicetree/bindings/pci/versatile.yaml          | 2 +-
> >>  Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml  | 2 +-
> >>  Documentation/devicetree/bindings/pci/xlnx,axi-pcie-host.yaml | 2 +-
> >>  Documentation/devicetree/bindings/pci/xlnx,nwl-pcie.yaml      | 2 +-
> >>  Documentation/devicetree/bindings/pci/xlnx,xdma-host.yaml     | 2 +-
> >>  25 files changed, 26 insertions(+), 26 deletions(-)
> >
> >
> >> diff --git a/Documentation/devicetree/bindings/pci/mediatek,mt7621-pci=
e.yaml b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
> >> index 61d027239910..5bbb4a3f3dbd 100644
> >> --- a/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
> >> +++ b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
> >> @@ -14,7 +14,7 @@ description: |+
> >>    with 3 Root Ports. Each Root Port supports a Gen1 1-lane Link
> >>
> >>  allOf:
> >> -  - $ref: /schemas/pci/pci-bus.yaml#
> >> +  - $ref: /schemas/pci/pci-host-bridge.yaml#
> >>
> >>  properties:
> >>    compatible:
> >> @@ -33,7 +33,7 @@ properties:
> >>  patternProperties:
> >>    '^pcie@[0-2],0$':
> >>      type: object
> >> -    $ref: /schemas/pci/pci-bus.yaml#
> >> +    $ref: /schemas/pci/pci-host-bridge.yaml#
> >
> > I think this one should be pci-pci-bridge.yaml instead since it says
> > these are root ports and based on the unit-address here.
>
> I was thinking about this as well, but pci-pci-bridge.yaml defines
> compatible which is not present here at all. Since you suggest pci-pci,
> I'll go with this and make it a separate patch for easier review.

This was my concern at first. It does define compatible, but it
doesn't require it. So I think we are fine.

Rob

