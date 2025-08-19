Return-Path: <linux-renesas-soc+bounces-20709-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 808C5B2C5E8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 15:42:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2CDB3AA0A3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 13:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E217732BF27;
	Tue, 19 Aug 2025 13:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lcrfizb6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B653827877F;
	Tue, 19 Aug 2025 13:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755610667; cv=none; b=RzjiWtEaMYr7xoxRiBLOCXv5my40V7xKzb34rNGecK270Mbel8r7LT8u4PetmibWxz0lUu2sa+c8izX+wPFIxirelF8QmCgTC3ebFBpStHVoy3q7U73RLoBXlOpx/BoIXJcj7LZFJZ3v/kI6fZjiOGpSzBKwNo9+cy5EbFGGO3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755610667; c=relaxed/simple;
	bh=IjvO8MRPzpUeuM8/2D//N63PWS1LI+f/m9iVVe4v5Oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rg3i/AgotmaCLzOnkoOyOshssYmKEuC+GW16j5K+5nk2DAyVCxsKpkuBWBcIZbC5VrpTGSeawpD09hl1QX5GESsGUxOl8auZMG62TIJ+3hMoM0Vnaa37D6SEioolhoD7Ae/2TMIj1w9S4uXdQ8jrC1ihO04YjIqX4FBkVEc48iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lcrfizb6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10A07C4CEF1;
	Tue, 19 Aug 2025 13:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755610667;
	bh=IjvO8MRPzpUeuM8/2D//N63PWS1LI+f/m9iVVe4v5Oc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lcrfizb6x3EAFuHF/ZyIxcnEpwCVW2+Rf5wsQtYm8b5qELGl3DTKAPZUQmTHb9eA1
	 IRM1AKifssli+ROh4Rkdypj2HKqBhVR1nFolAk8/StheFcjJFFLEQwgxEM4hhCB7/5
	 bN9q3bzp9jlL+/YQakpWH99L5ze9eSMgKl94hgXpW8ftw2HgwkEK1I7G7wCzqSDRRD
	 MbtBmV9L1chTn7YYTguvKYSs1cIFjcy5V8ZYz9tpyYmUKY5PTHzhISfAosW5NoOX1V
	 nbO14HhZ22a2FioOZg8SUq6Ps+Suq01CQmdCSbVSfxvI11sjZgFunVmJsSmviDXS58
	 0GeSUR2RY8cbw==
Date: Tue, 19 Aug 2025 08:37:44 -0500
From: Rob Herring <robh@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: devicetree@vger.kernel.org, biju.das.jz@bp.renesas.com,
	krzk+dt@kernel.org, geert+renesas@glider.be, kishon@kernel.org,
	linux-phy@lists.infradead.org, yoshihiro.shimoda.uh@renesas.com,
	conor+dt@kernel.org, magnus.damm@gmail.com,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	p.zabel@pengutronix.de, vkoul@kernel.org
Subject: Re: [PATCH v5 1/7] dt-bindings: phy: renesas,usb2-phy: Mark resets
 as required for RZ/G3S
Message-ID: <20250819133744.GA87211-robh@kernel.org>
References: <20250819054212.486426-1-claudiu.beznea.uj@bp.renesas.com>
 <20250819054212.486426-2-claudiu.beznea.uj@bp.renesas.com>
 <175558495459.3265640.2032619822487575179.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175558495459.3265640.2032619822487575179.robh@kernel.org>

On Tue, Aug 19, 2025 at 01:29:17AM -0500, Rob Herring (Arm) wrote:
> 
> On Tue, 19 Aug 2025 08:42:06 +0300, Claudiu wrote:
> > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > 
> > The reset lines are mandatory for the Renesas RZ/G3S platform and must be
> > explicitly defined in device tree.
> > 
> > Fixes: f3c849855114 ("dt-bindings: phy: renesas,usb2-phy: Document RZ/G3S phy bindings")
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > ---
> > 
> > Changes in v5:
> > - none
> > 
> > Changes in v4:
> > - none
> > 
> > Changes in v3:
> > - collected tags
> > - rebased on top of latest version of renesas,usb2-phy.yaml;
> >   Conor, Geert: I kept your tags; please let me know if you consider it
> >   otherwise
> > 
> > Changes in v2:
> > - none; this patch is new
> > 
> >  Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> 
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250819054212.486426-2-claudiu.beznea.uj@bp.renesas.com

No issue here. The QCom folks have broken "make dt_binding_check" in 
linux-next...

Rob

