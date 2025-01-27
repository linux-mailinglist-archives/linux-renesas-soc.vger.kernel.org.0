Return-Path: <linux-renesas-soc+bounces-12604-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0FAA1DC93
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 20:16:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C5837A05C0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 19:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A2118A6CE;
	Mon, 27 Jan 2025 19:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hQDiJnJH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9530F17E;
	Mon, 27 Jan 2025 19:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738005369; cv=none; b=MVnpt2NpAvH+XPvYek8bAPLg5uK42NtcEm+ghLYwhz21+cw2PYv+jXHNqodM/KFUv6GQqRJczaL/ATyCnZZD+vl1QSHWdpUUkPjIeoi8shML1nJWnCOt+Im38zVKnE5DK+OKIZ4OKaFKq4sQ5O7UmmrpvPjRViLaV6qS5tdumBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738005369; c=relaxed/simple;
	bh=LA8gRHfN50/2qikiaKEv/kn9dU+R33sV6FsCQeN90TE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZfRII1OEe0d1DKh3AjTpsRjtfIZUbEfILbfJ2YBh6R06Cww4Luh9fCGfu3D1iCb7oXeC9utkCRhWrrFNzY2DDOnE03ndBB00Vf7rPKhvCePnFLdj/57M1Looe47WnvxkK3qfKuevLQrUZk5IkjJ3Ex2FZUKRo5m9IwABnT8fC1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hQDiJnJH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D55F4C4CED2;
	Mon, 27 Jan 2025 19:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738005369;
	bh=LA8gRHfN50/2qikiaKEv/kn9dU+R33sV6FsCQeN90TE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hQDiJnJHk5Z+M6uWUQTaSVSxDN0rKnAy2KqGYEBs7nFYWa3pDQKm2MmlY1j7xGHb5
	 hjY2zsSBpk0qarUoVTP6OHPEtEpbMdYFQwx+8NBtmG/TKEPEZKomuaPdquY0xgubSZ
	 F8kjS41RvsKmWgQ6UYcCq7TeLsVdJpCte+2huk+7bN/d4C16f/jpQJjqYHUThAHvKv
	 6mZgVh3RZPqttW69XCQkJTEc7Cm8VQDYPhZIW5vxa2I7nwRnFonbW1adJ3tv4QgIUL
	 +GF5vPAp88aIHS1TKasN0tanIZYYgQlCEVs4AelNxafFdMEzXckNCzEm/BDWxPvAiN
	 OgXsNrWyS1p6A==
Date: Mon, 27 Jan 2025 13:16:07 -0600
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: mmc: renesas,sdhi: Document RZ/G3E
 support
Message-ID: <20250127191607.GA698483-robh@kernel.org>
References: <20250126134616.37334-1-biju.das.jz@bp.renesas.com>
 <20250126134616.37334-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250126134616.37334-2-biju.das.jz@bp.renesas.com>

On Sun, Jan 26, 2025 at 01:46:03PM +0000, Biju Das wrote:
> The SD/MMC block on the RZ/G3E ("R9A09G047") SoC is similar to that
> of the RZ/V2H, but the SD0 channel has only dedicated pins, so we must
> use SD_STATUS register to control voltage and power enable (internal
> regulator).
> 
> For SD1 and SD2 channel we can either use gpio regulator or internal
> regulator (using SD_STATUS register) for voltage switching.
> 
> Document RZ/G3E SDHI IP support.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../devicetree/bindings/mmc/renesas,sdhi.yaml | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> index af378b9ff3f4..ef3acf0f58e0 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -68,6 +68,9 @@ properties:
>                - renesas,sdhi-r9a08g045 # RZ/G3S
>                - renesas,sdhi-r9a09g011 # RZ/V2M
>            - const: renesas,rzg2l-sdhi
> +      - items:
> +          - const: renesas,sdhi-r9a09g047 # RZ/G3E
> +          - const: renesas,sdhi-r9a09g057 # RZ/V2H(P)
>  
>    reg:
>      maxItems: 1
> @@ -124,6 +127,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - renesas,sdhi-r9a09g047
>                - renesas,sdhi-r9a09g057
>                - renesas,rzg2l-sdhi
>      then:
> @@ -211,6 +215,22 @@ allOf:
>          sectioned off to be run by a separate second clock source to allow
>          the main core clock to be turned off to save power.
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,sdhi-r9a09g047
> +    then:
> +      properties:
> +        vqmmc-regulator:
> +          type: object
> +          description: VQMMC SD regulator
> +          $ref: /schemas/regulator/regulator.yaml#
> +          unevaluatedProperties: false
> +
> +      required:
> +        - vqmmc-regulator

The driver treats this as optional. If this is required, then is 
renesas,sdhi-r9a09g047 really compatible with renesas,sdhi-r9a09g057?

Rob

