Return-Path: <linux-renesas-soc+bounces-22521-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B84BB061D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 14:51:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 390C5171A98
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 12:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845F82EBDE6;
	Wed,  1 Oct 2025 12:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LKNFFIEZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBA7278158;
	Wed,  1 Oct 2025 12:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759323111; cv=none; b=TjSmXzfflhnTmUSnS4KQdprK9OgyQ5URv+B9sI9FY2SsLLqEBO/Q4b2Hcj6LAsU+r4Nq5POFIIwLWXzZSVNOp8XCKic8tZWsLnRLpXXZMwP13U7bxBzdmZKSmcSiOhYT3yMEMPD7cOr+Jr0jHHOpaoCk6lNBcLbzt7B09sx6POg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759323111; c=relaxed/simple;
	bh=vGPLUD06/U0rl4f4NPa3IVl603NeEeGBI0dMr8vFUhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d3/4FxAt3ot2ETJKyI83w4XDTsYK4B7Nui3R5zkC2OAneU9AOODZzB93O2fBQ+PcCRl5XQJYmXND1nOaG+Fvu9sfy0lu21wVQqFD7C0taJXU09jqa3rRCCt89umb6bnG9kpopdDv4bJUKsvEO0Z1D5CCI12slX9psQML3p15Abk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LKNFFIEZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDFE3C4CEF4;
	Wed,  1 Oct 2025 12:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759323110;
	bh=vGPLUD06/U0rl4f4NPa3IVl603NeEeGBI0dMr8vFUhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LKNFFIEZTsiENKQjqzx05CAfq+xED2lVKa8MHJi6npG9ZvUQEYkdb40xJl34PxXR6
	 nan06MxV4tDKWf7nO69M9bpz+uJBgB6GUWuTEiwVlZXJfNdt4ECicBDKtQpmiESSww
	 SgwHLA3oOurFPzXHUa8xaoiLhK5vpXTQzi599gTmPIERdkE6MRe5Xr3gAz45oEiZ6i
	 tOCkt2XWOG4d8bH9Ohsq7v/5WXx4zDuL54gQLYFf8SqIg8cTJOqdqcvrBOuTAxzA6l
	 wYtpn4hdsdrj7UukpWsXgie+CjmJopaO4pWNlFFPHvcCKuTPR7PlCdFlRhpqxYKOJE
	 Du1GFSFg69Kog==
Date: Wed, 1 Oct 2025 07:51:49 -0500
From: Rob Herring <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Steve Twiss <stwiss.opensource@diasemi.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: dlg,da9063: allow
 'interrupts-extended' property
Message-ID: <20251001125149.GA1122744-robh@kernel.org>
References: <20250929072306.5634-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929072306.5634-2-wsa+renesas@sang-engineering.com>

On Mon, Sep 29, 2025 at 09:20:47AM +0200, Wolfram Sang wrote:
> If nested, DT schema cannot extend required 'interrupts' to include
> 'interrupts-extended'. It needs to be added manually. Fixes:
> 
> arch/arm/boot/dts/renesas/r8a7791-koelsch.dtb: pmic@58 (dlg,da9063): 'interrupts' is a required property
> 	from schema $id: http://devicetree.org/schemas/mfd/dlg,da9063.yaml#
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Copied this solution 1:1 from:
>   Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
> 
>  Documentation/devicetree/bindings/mfd/dlg,da9063.yaml | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml b/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
> index 51612dc22748..4af5fcb856c7 100644
> --- a/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
> +++ b/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
> @@ -110,10 +110,16 @@ allOf:
>              "^buck[1-4]$": false
>          thermal: false
>        required:
> -        - interrupts
>          - interrupt-controller
>          - '#interrupt-cells'
>  
> +      # oneOf is required, because dtschema's fixups.py doesn't handle this
> +      # nesting here. Its special treatment to allow either interrupt property
> +      # when only one is specified in the binding works at the top level only.

The solution is to fix dtschema. I'll take a look at it.

> +      oneOf:
> +        - required: [interrupts]
> +        - required: [interrupts-extended]
> +
>    - if:
>        properties:
>          compatible:
> -- 
> 2.47.2
> 

