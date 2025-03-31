Return-Path: <linux-renesas-soc+bounces-15222-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 111E7A77198
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 01:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBA6816B9E6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 23:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815E121C9E5;
	Mon, 31 Mar 2025 23:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WLhUPBJT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B40B8472;
	Mon, 31 Mar 2025 23:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743465575; cv=none; b=FYdRp2hGjzwI8SjgStNkhXK1J4Vt8mcYNTsZjxcFySlTnoQFgmjO1HvIUJrRsAcp1d5sUgohU67AWlPPJhxymGkBF/LkKLq8woOFa3lN+urFDmMf1e434rweo0kqiywZHRq5CezYIjle74lIlfDQUpGOLbpjVuDWyWUHOOXpVpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743465575; c=relaxed/simple;
	bh=2rq9HGTV9LJ6Wk1RQxNQBqHOXLKVMLBUyTX+63XeGNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E13F/NSWKbz7d+G2xYYa1erosNJ6EAac2z4R2O9UNvcikNxkUiBoxGY4SDgmaV2pE9j2JelxgorBu9H2wTNY3a2ElD+wTz9eEM6UaYXwHthZsiTXilVVdl6onke+SWEonxDBPCUZmGHwTaWZqUCx5Vnw+VTzCGXDrYf5xNE/ZW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WLhUPBJT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65D1CC4CEE3;
	Mon, 31 Mar 2025 23:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743465574;
	bh=2rq9HGTV9LJ6Wk1RQxNQBqHOXLKVMLBUyTX+63XeGNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WLhUPBJTkfLnk0JAgD+xqEwUNwq0mImtqwUUAlahAuqRju9fnI+oqQjBBBLMoIvMR
	 s2VlimfVqV7CbTFmMUThAMcqkuO1az1+aZSUuJwKhsFb7AfGvWCTPjnTbNYwYNseJP
	 kMjL/2M6+RiNbzXhrifdpcI6sGr76DZ1vo64JzirVtvMG30x2vWiXgjTLXUBZAu0Pw
	 HkE3DrcnMtQj2vdgHW3R+fWNEH2cPW2//BoLLC0kK3OAhuPg3G8iNKAGACvTAhJh0P
	 qXUy7XZ5VSRjLEcYNXwdCk1AEoCqup4pkJGpHkh/lbKLAuKAu7s9rOCYfCDgu3Ieyr
	 TP6TrK72ZKjtQ==
Date: Mon, 31 Mar 2025 18:59:33 -0500
From: Rob Herring <robh@kernel.org>
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org, paul.barker.ct@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 02/13] dt-bindings: clock: Add cpg for the Renesas
 RZ/T2H SoC
Message-ID: <20250331235933.GA2857038-robh@kernel.org>
References: <20250331122657.3390355-1-thierry.bultel.yh@bp.renesas.com>
 <20250331122657.3390355-3-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331122657.3390355-3-thierry.bultel.yh@bp.renesas.com>

On Mon, Mar 31, 2025 at 02:26:43PM +0200, Thierry Bultel wrote:
> Document RZ/T2H (a.k.a r9a09g077) cpg-mssr (Clock Pulse Generator) binding.
> 
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
> Changes v5->v6:
>   - Set clock minItem constraint
>   - Moved additionalProperties after 'allOf' section
> Changes v4->v5:
>   - Set reg minItems and maxItems defaults at top level
> Changes v3->v4:
>   - Handle maxItems and clocks names properly in schema. 
> ---
>  .../bindings/clock/renesas,cpg-mssr.yaml      | 57 +++++++++++++------
>  .../clock/renesas,r9a09g077-cpg-mssr.h        | 49 ++++++++++++++++
>  2 files changed, 90 insertions(+), 16 deletions(-)
>  create mode 100644 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> index 77ce3615c65a..dee4c44ef025 100644
> --- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> @@ -52,9 +52,11 @@ properties:
>        - renesas,r8a779f0-cpg-mssr # R-Car S4-8
>        - renesas,r8a779g0-cpg-mssr # R-Car V4H
>        - renesas,r8a779h0-cpg-mssr # R-Car V4M
> +      - renesas,r9a09g077-cpg-mssr # RZ/T2H
>  
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2

You need to define what each entry is. And do that here assuming the 
first entry is the same in either case.

