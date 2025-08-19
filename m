Return-Path: <linux-renesas-soc+bounces-20674-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BE0B2B96A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 08:30:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8336682444
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 06:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94FC426A0AD;
	Tue, 19 Aug 2025 06:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FrZgtdBk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7A42698A2;
	Tue, 19 Aug 2025 06:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755584959; cv=none; b=WbR9hYQX66E2mf2LYWZCp/OilLljn2KUr/VhdgOp91cscC9l3wh8JVic2E7G7R5MQtwJpSjkrv7bF/j/peyf9b7GjkmhUxZn+ZW8+tFiQQkZ3Xc9hhwrD4sRXawMhgySonIh7hynhNsF0fcM6CcMoURRtnezTwWYmBGfOn3zr3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755584959; c=relaxed/simple;
	bh=oryBQIdKjY756Nst8iWxcVs7SdpR6a2b9Ll7LxOLMko=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=d6EcuTan4QrMTYJM6BskxFFRwuDhh+N3fPkTx/Ek65BPWCzk3NeeO8CC7aSEW72iUFZ6sGqSrWnHI0HCHn7YDwAyh5K+lKriyNqwlShaRblKzWdyh+uSJx/6Mlg7wwMsV8XXqZmyS6Ilft6AIIAcIVw0g2GvyNSI49VX7FNav+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FrZgtdBk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA0C1C4CEF4;
	Tue, 19 Aug 2025 06:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755584958;
	bh=oryBQIdKjY756Nst8iWxcVs7SdpR6a2b9Ll7LxOLMko=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=FrZgtdBkw4QRhOm1QxHHuN/izy/wq7YCKBBXxr9ACBcR8rb7UeX59r7Xy9NawIjR+
	 fLb8dWap4GEYAP70I+P/ip9KmYenL9ZKnWyyrh/KjzKfkrF4Uk9/z1PB5zjvDoMtSJ
	 s+/XlnjJvc6hFm2c3ibursJf6w+UgeBJaRd6bDMHFi8SlpJBq+a4hxqFk5QH3ZsEYA
	 P8g6Uwh2yFQCcLDsGW/mbZW2zcmehZbXB0KSR9H0cN9gNhnpw0KlXNth2PKU1vnS7I
	 dPizijebuN19IYZcLn6RlXHgu9eDt9X9uloq1aVK610GGEUj8sAsLfBIuWn+srhGS6
	 ncKcpS1UgDUqA==
Date: Tue, 19 Aug 2025 01:29:17 -0500
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
 krzk+dt@kernel.org, geert+renesas@glider.be, kishon@kernel.org, 
 linux-phy@lists.infradead.org, yoshihiro.shimoda.uh@renesas.com, 
 conor+dt@kernel.org, magnus.damm@gmail.com, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, p.zabel@pengutronix.de, vkoul@kernel.org
To: Claudiu <claudiu.beznea@tuxon.dev>
In-Reply-To: <20250819054212.486426-2-claudiu.beznea.uj@bp.renesas.com>
References: <20250819054212.486426-1-claudiu.beznea.uj@bp.renesas.com>
 <20250819054212.486426-2-claudiu.beznea.uj@bp.renesas.com>
Message-Id: <175558495459.3265640.2032619822487575179.robh@kernel.org>
Subject: Re: [PATCH v5 1/7] dt-bindings: phy: renesas,usb2-phy: Mark resets
 as required for RZ/G3S


On Tue, 19 Aug 2025 08:42:06 +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> The reset lines are mandatory for the Renesas RZ/G3S platform and must be
> explicitly defined in device tree.
> 
> Fixes: f3c849855114 ("dt-bindings: phy: renesas,usb2-phy: Document RZ/G3S phy bindings")
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
> 
> Changes in v5:
> - none
> 
> Changes in v4:
> - none
> 
> Changes in v3:
> - collected tags
> - rebased on top of latest version of renesas,usb2-phy.yaml;
>   Conor, Geert: I kept your tags; please let me know if you consider it
>   otherwise
> 
> Changes in v2:
> - none; this patch is new
> 
>  Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250819054212.486426-2-claudiu.beznea.uj@bp.renesas.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


