Return-Path: <linux-renesas-soc+bounces-20675-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AC470B2B962
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 08:29:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0AB1C7AC59C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 06:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD16F26A1DD;
	Tue, 19 Aug 2025 06:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VB5z9w+y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAA6269CF0;
	Tue, 19 Aug 2025 06:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755584959; cv=none; b=GDHQjDBcmoSWaNn5JI/+H9fY0GlLVwPi8B2hzHRXfuLnrg3CaY9IzUS9AAgWrBpxTLIscBb8bCG1Bt3/WtAIapMFoNBl4Kdslguo3U+Srj5gb+UFjNE9lIhQeIR/Bf2tuyyt32Zcsm2l5SrA45uez6wY2lDYtMO4yuiT4kNxgQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755584959; c=relaxed/simple;
	bh=33iJBot7S5LwwyXwV9Q7aUs8pqt5AdVKb1EuKgPON70=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=vCpe0JJmAjxOBJCYxGtwWLPv8bKFO32MM1fUn44usPEyKlnClMyKlntfylmTxHQlA8qzUFPVxL3+eBRHG8g66VcgcpEQWT43th7hQYZXXEBgG4BT93Sr3dxLu761YVbbOKNBnFT8HdXWslE1T9hFrnXD8USjK153qE49SZdDxEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VB5z9w+y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3474C113CF;
	Tue, 19 Aug 2025 06:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755584959;
	bh=33iJBot7S5LwwyXwV9Q7aUs8pqt5AdVKb1EuKgPON70=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=VB5z9w+yPAkEqZs+JpC5OAMBHnmP3l8z//DBSeMGv6HP0+pC3UXLhY+VViI0wYL53
	 kC9vOzszLygIWCz9uBFsDvN8i3sg5XuRROsaF//oPzr+zzoTlkX9fyBCWAwh8I9gnb
	 PxJ5KLCRwmBF5+1ArkKUcGhFD3sPsetxfU8sm8Wi6ztUlSg5RVLdFmIffzt/YQpxEg
	 to53WrfQ6D7DRS+M1SHiJFhs1kGVLTXMdfXFIP1ShcN8jtdXLt+KEMr8OLzL9Ne2tw
	 EmTK0fm/WwiF7B1ZW/jD9OOiBer8McVI5jMxL2aH086AU9YM97QJYMopY6x21HJUq4
	 rzIkocCx9jGmA==
Date: Tue, 19 Aug 2025 01:29:18 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: biju.das.jz@bp.renesas.com, linux-phy@lists.infradead.org, 
 kishon@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de, 
 yoshihiro.shimoda.uh@renesas.com, conor+dt@kernel.org, 
 magnus.damm@gmail.com, geert+renesas@glider.be, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 vkoul@kernel.org
To: Claudiu <claudiu.beznea@tuxon.dev>
In-Reply-To: <20250819054212.486426-4-claudiu.beznea.uj@bp.renesas.com>
References: <20250819054212.486426-1-claudiu.beznea.uj@bp.renesas.com>
 <20250819054212.486426-4-claudiu.beznea.uj@bp.renesas.com>
Message-Id: <175558495586.3265727.15591420113777968646.robh@kernel.org>
Subject: Re: [PATCH v5 3/7] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl:
 Document RZ/G3S support


On Tue, 19 Aug 2025 08:42:08 +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> The Renesas USB PHY hardware block needs to have the PWRRDY bit in the
> system controller set before applying any other settings. The PWRRDY bit
> must be controlled during power-on, power-off, and system suspend/resume
> sequences as follows:
> - during power-on/resume, it must be set to zero before enabling clocks and
>   modules
> - during power-off/suspend, it must be set to one after disabling clocks
>   and modules
> 
> Add the renesas,sysc-pwrrdy device tree property, which allows the
> reset-rzg2l-usbphy-ctrl driver to parse, map, and control the system
> controller PWRRDY bit at the appropriate time. Along with it add a new
> compatible for the RZ/G3S SoC.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
> 
> Changes in v5:
> - fixed description formatting
> - collected tags
> 
> Changes in v4:
> - dropped blank line from compatible section
> - s/renesas,sysc-signals/renesas,sysc-pwrrdy/g
> - dropped description from renesas,sysc-pwrrdy
> - updated description of renesas,sysc-pwrrdy items
> - updated patch description
> 
> Changes in v3:
> - none; this patch is new
> 
>  .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 41 ++++++++++++++++---
>  1 file changed, 35 insertions(+), 6 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250819054212.486426-4-claudiu.beznea.uj@bp.renesas.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


