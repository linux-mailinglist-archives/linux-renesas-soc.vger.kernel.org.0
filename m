Return-Path: <linux-renesas-soc+bounces-15409-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF93A7C3EE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Apr 2025 21:37:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4751189F316
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Apr 2025 19:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4354721D3EA;
	Fri,  4 Apr 2025 19:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FyDmWrN2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125B921CA1D;
	Fri,  4 Apr 2025 19:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743795473; cv=none; b=lsFjqaFBWnQrlYdE2HArcSvnV1PBFiD0aLECovfK3PiXatch+xCidsFtjCv38DkgcnuUiXPhClLJHhAn+Q7hGYKs3vSKZ6WmKridttjRiO5+iPkyKlF7HPO8mJ+EEWhX8ijwnlXOcifGpidT+y2bXlQ40Fm5smVVLF8v/gn9e3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743795473; c=relaxed/simple;
	bh=QqbxWJCDil8vLvIzlQ5V4nA/TEATI4Lk2bxFbOBzaIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MzrsRRwiwTdfNkfGChc5qQvys5+SB2Z17tLujWuvtJtnf+wfNsmwo/BMuPn4wJygYcCK+p+lYXRVrKTWNl/XGrIjulv0YSj8SQ+t7mdZwvSKY7G0Lkc/AKUun3tFoUvRC75Ok7I8acjPmYARB3A0bLNAw6f+2FUVswcr4xeiTZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FyDmWrN2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EB5EC4CEDD;
	Fri,  4 Apr 2025 19:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743795472;
	bh=QqbxWJCDil8vLvIzlQ5V4nA/TEATI4Lk2bxFbOBzaIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FyDmWrN2diWCdkM62eqtrm+m4u8o0O+bjCriOULGHEdqaLZGnBwjJVL5UNy6NmzmN
	 TTXYREQdtDf4nRGVW7aja5vmi3+C8mCSqZiAtnRw7qONOriSL0fui/yvDWTfMeMqKR
	 ueTvwtj5mZj+g7fDg715z7XntVA7DXiFCNBe05DudIQ+yWicQwgFSdWMezh2RjSN7q
	 vLWFm33+xJqGFa7E/79cAZsDRQ8PLd8I5NhD6V6vArh86jj+pe5IrkCH3+50Z1f+b0
	 UvF6g4vDFxuOn1SXexXddVcWWknlU2SJeW8JULb0otdfpAiuopUbZKyB7Dyx1EbU/0
	 /VW1p9MA5Hiyw==
Date: Fri, 4 Apr 2025 14:37:51 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org, paul.barker.ct@bp.renesas.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 02/13] dt-bindings: clock: Add cpg for the Renesas
 RZ/T2H SoC
Message-ID: <174379547063.167169.10771770243233080433.robh@kernel.org>
References: <20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com>
 <20250403212919.1137670-3-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403212919.1137670-3-thierry.bultel.yh@bp.renesas.com>


On Thu, 03 Apr 2025 23:29:04 +0200, Thierry Bultel wrote:
> Document RZ/T2H (a.k.a r9a09g077) cpg-mssr (Clock Pulse Generator) binding.
> 
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
> Changes v6->v7:
>   - Add description for reg property
> Changes v5->v6:
>   - Set clock minItem constraint
>   - Moved additionalProperties after 'allOf' section
> Changes v4->v5:
>   - Set reg minItems and maxItems defaults at top level
> Changes v3->v4:
>   - Handle maxItems and clocks names properly in schema.
> ---
>  .../bindings/clock/renesas,cpg-mssr.yaml      | 61 ++++++++++++++-----
>  .../clock/renesas,r9a09g077-cpg-mssr.h        | 49 +++++++++++++++
>  2 files changed, 94 insertions(+), 16 deletions(-)
>  create mode 100644 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


