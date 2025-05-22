Return-Path: <linux-renesas-soc+bounces-17342-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FBEAC0534
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 09:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B13DF7A1CAA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 07:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3CA3221DA1;
	Thu, 22 May 2025 07:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fZL/UWwA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1799D517;
	Thu, 22 May 2025 07:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747897424; cv=none; b=qBdJ/QABVhR7ygA2PHpxlVW7sXyaMgwywVnGBg37B6l5diwyzQArUQw8TxmuKhqKW2r1oCIAwivnX0XBUzcB8BTXOc1WwELiSBKJ7kaENCXv5kFiLsRREGulJr2mZIHFnrxGyz5XXwpGKFcHtg4MyYb4AivJOLqP2XMetXO177k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747897424; c=relaxed/simple;
	bh=O6hy5R2mjeBm5Vf7qI0qCm2aawLVKSqcX2UGvROau3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R74E1eSNNC5NLKDKjdV3LZjP0XiZu+T6RY0eJD93HV8tcH8lZB9MbJ/Hka02Lt1QWdH/5dytPbRJ3s/QmzAOdcku4TWdhDQ+INnCsU8XD+2VFhLjTnmFE3gD9exmcgJ/P77a45BRBpId9gVfd8WdYwAEIXkVHz/Z4nGRh+vI91Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fZL/UWwA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B36F8C4CEE4;
	Thu, 22 May 2025 07:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747897424;
	bh=O6hy5R2mjeBm5Vf7qI0qCm2aawLVKSqcX2UGvROau3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fZL/UWwA/7tkx6NstZdnvbhwIWCrU73q8YG0aG1/UrAqmcMMGFdf894Mlc35zIA5N
	 9A3H8i5D17sWmSuQGEsbxcOToAu4VnQ+4UElCFbRAIiKZf/oWgyDfRiNF5kqWAA1Bp
	 oOdPwsto9MwtR5h4u9fDcQheSwnZ3NoRahzeEOfba4ngyC8pJgZ6Br803HkimFxu0W
	 ZSDM59lny5ynGEH99GghKoELpLnV34SmygdhxzcCT1P0TGzgZCohB+PRqFOrUnUWz0
	 yctyVaW/Sqjovf0ryejXlkDcvlZ6Ph62sFnOMONasMB4zzaOs2Qne+5xNG8GEtTmae
	 8Qt/RbKxCvJsw==
Date: Thu, 22 May 2025 09:03:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	geert+renesas@glider.be, magnus.damm@gmail.com, yoshihiro.shimoda.uh@renesas.com, 
	kees@kernel.org, gustavoars@kernel.org, biju.das.jz@bp.renesas.com, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-hardening@vger.kernel.org, john.madieu.xa@bp.renesas.com, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v3 05/12] dt-bindings: phy: renesas,usb2-phy: Add
 renesas,sysc-signals
Message-ID: <20250522-evasive-unyielding-quoll-dbc9b2@kuoka>
References: <20250521140943.3830195-1-claudiu.beznea.uj@bp.renesas.com>
 <20250521140943.3830195-6-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250521140943.3830195-6-claudiu.beznea.uj@bp.renesas.com>

On Wed, May 21, 2025 at 05:09:36PM GMT, Claudiu wrote:
>  .../bindings/phy/renesas,usb2-phy.yaml        | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> index 12f8d5d8af55..e1e773cba847 100644
> --- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> @@ -86,6 +86,16 @@ properties:
>  
>    dr_mode: true
>  
> +  renesas,sysc-signals:
> +    description: System controller phandle, specifying the register
> +      offset and bitmask associated with a specific system controller signal

This is 100% redundant information. system controller specifying system
controller signal.

Drop.


> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: system controller phandle

What for? Explain the usage. How is ut used by this hardware.

> +          - description: register offset associated with a signal

What signal? That's a phy.

> +          - description: register bitmask associated with a signal
> +
>  if:
>    properties:
>      compatible:
> @@ -117,6 +127,18 @@ allOf:
>        required:
>          - resets
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,usb2-phy-r9a08g045
> +    then:
> +      required:
> +        - renesas,sysc-signals

That's ABI break.

Best regards,
Krzysztof


