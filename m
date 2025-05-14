Return-Path: <linux-renesas-soc+bounces-17106-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A6AAB6D3A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 15:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 113314A3C33
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 13:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A57B319341F;
	Wed, 14 May 2025 13:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="nlO/tXi+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6E817A2EE;
	Wed, 14 May 2025 13:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747230550; cv=none; b=DxlOEH60+miOPDS0vxtRJpmuL7C93iBSu6S3PtQqoeVo/G+mYoY7BwZMfw263tD6Gb7aq7O/k7BDp1mUj7vrXZ1+94xNSG9yVJqLasPZMiOLm304zi2Y70dCXEKi01/lq22EqVNoecjQ+TA5G79TILkCL703nIsvmzmi1ObBM0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747230550; c=relaxed/simple;
	bh=Q2lysS+vPrBbSnzAngAUoZI9AHWABvjETg1sMcy+DaA=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=hQ1QHWHDv0pkSY1lP2RJibTPF2H7VCZ1YhTxGiYKMbQ+R+lEOZJ2V7vlzKwUegiwSSlU5zUnmrCo60EjN/GLyvWbUVHb9hrxqBBcjffb1+Qj5FcUVlMwEujQk/obbe7B93TVYdGus+UWdG3VLN7TyKDkX3UC8vsPQaJ1iiten7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=nlO/tXi+; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=QWmKFyTdeYapSnvQ2+VDkbzoBuqd/kCMCtd+ENn7Edc=; b=nlO/tXi+4LdaKeE5cMwrSoB6xm
	69/CangaQN8haMBtee8rzItO8EGV2fx1zgoQBEANv52vu8x7sDbeeWZEPdCJyGECJL/Omce0KfY2T
	7kTGER9RSAzwYY0pwwpqeBBLE7QL0e/ih4AM77UtpjMSDVQNykCGe3TbSBin0igd2Jd0=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:56048 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1uFCTb-0002EM-EZ; Wed, 14 May 2025 09:48:52 -0400
Date: Wed, 14 May 2025 09:48:49 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 laurent.pinchart <laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Message-Id: <20250514094849.cac2bd27d047fbc1ae6ba74f@hugovil.com>
In-Reply-To: <TY3PR01MB11346612A2A298818D0787B028691A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250513162300.532693-1-hugo@hugovil.com>
	<TY3PR01MB11346612A2A298818D0787B028691A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
	*      blocklist
	*      [URIs: hugovil.com]
	*  0.1 URIBL_CSS Contains an URL's NS IP listed in the Spamhaus CSS
	*      blocklist
	*      [URIs: hugovil.com]
	* -2.1 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH] dt-bindings: display: bridge: renesas,dsi: allow
 properties from dsi-controller
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

On Wed, 14 May 2025 06:00:28 +0000
Biju Das <biju.das.jz@bp.renesas.com> wrote:

> Hi Hugo Villeneuve,
> 
> Thanks for your patch.
> 
> > -----Original Message-----
> > From: Hugo Villeneuve <hugo@hugovil.com>
> > Sent: 13 May 2025 17:23
> > Subject: [PATCH] dt-bindings: display: bridge: renesas,dsi: allow properties from dsi-controller
> > 
> > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > 
> > Allow to inherit valid properties from the dsi-controller. This fixes the following warning when
> > adding a panel property:
> > 
> > rzg2lc.dtb: dsi@10850000: '#address-cells', '#size-cells', 'panel@0' do not
> >     match any of the regexes: 'pinctrl-[0-9]+'
> >     from schema $id:
> >         http://devicetree.org/schemas/display/bridge/renesas,dsi.yaml#
> > 
> > Also add a panel property to the example.
> > 
> > Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > ---
> >  .../bindings/display/bridge/renesas,dsi.yaml  | 21 +++++++++++++++++--
> >  1 file changed, 19 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > index e08c24633926b..e0906a46fb118 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > @@ -128,14 +128,17 @@ required:
> >    - power-domains
> >    - ports
> > 
> > -additionalProperties: false
> > +unevaluatedProperties: false
> > 
> >  examples:
> >    - |
> > +    #include <dt-bindings/gpio/gpio.h>
> >      #include <dt-bindings/clock/r9a07g044-cpg.h>
> >      #include <dt-bindings/interrupt-controller/arm-gic.h>
> > 
> >      dsi0: dsi@10850000 {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> >          compatible = "renesas,r9a07g044-mipi-dsi", "renesas,rzg2l-mipi-dsi";
> >          reg = <0x10850000 0x20000>;
> >          interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>, @@ -160,6 +163,20 @@ examples:
> >          reset-names = "rst", "arst", "prst";
> >          power-domains = <&cpg>;
> > 
> > +        panel@0 {
> > +            compatible = "rocktech,jh057n00900";
> > +            reg = <0>;
> > +            vcc-supply = <&reg_2v8_p>;
> > +            iovcc-supply = <&reg_1v8_p>;
> > +            reset-gpios = <&gpio3 13 GPIO_ACTIVE_LOW>;
> > +
> > +            port {
> > +                panel_in: endpoint {
> > +                    remote-endpoint = <&dsi0_out>;
> > +                };
> > +            };
> > +        };
> > +
> >          ports {
> >              #address-cells = <1>;
> >              #size-cells = <0>;
> > @@ -175,7 +192,7 @@ examples:
> >                  reg = <1>;
> >                  dsi0_out: endpoint {
> >                      data-lanes = <1 2 3 4>;
> > -                    remote-endpoint = <&adv7535_in>;
> > +                    remote-endpoint = <&panel_in>;
> 
> Can we make panel example as separate one?
> 
> 1) One example for using bridge device
> 2) One example for using direct panel.

Hi Biju,
sure, will do in V2.

Thank you,
Hugo.


> 
> Cheers,
> Biju
> 
> >                  };
> >              };
> >          };
> > 
> > base-commit: e9565e23cd89d4d5cd4388f8742130be1d6f182d
> > --
> > 2.39.5
> 
> 


-- 
Hugo Villeneuve

