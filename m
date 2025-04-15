Return-Path: <linux-renesas-soc+bounces-16037-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 817D3A8AAE0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 00:09:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0208189B21D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 22:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9900225742D;
	Tue, 15 Apr 2025 22:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tv580yO+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3857F253938;
	Tue, 15 Apr 2025 22:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744754961; cv=none; b=qHLjsNQAqETdqk/SHuXGaPk+MDX5PTk7y5WAc0k2sPE+lCcItCJn1ubqJYSp/+gjUEsij8kcnU2s94lf3IGfybuotJqxRkNK/AyqS2KNrO+eQnvs2CoStyTNdVsdEYFD20b80elnfKXYxboAbRe4sY01CuC4aXRVY8GlQzRH2rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744754961; c=relaxed/simple;
	bh=fT9KURxC+hnVBNlWWLo90bn9GjX86Jg2rXvY5sft3M0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JZKUQMZS4RgmfyNczSRiyWqrXJCIqaaKT43sKDe7YcsULSYSDAZFDjoC617h6yPQVnRRHttYshqaM+B6bylSAEq6RdRAlfEp6B/3kb+V511uT+dSmkYoKe74xxFzlxSBfzVb/xPiIq1vLS2QVFI/FaA5MC2DXxB5e1w4a5ODw24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tv580yO+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E7CDC4CEE7;
	Tue, 15 Apr 2025 22:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744754960;
	bh=fT9KURxC+hnVBNlWWLo90bn9GjX86Jg2rXvY5sft3M0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tv580yO+H2hOAOPlBB3efQAxuBRfoVkSJRz0fPP82iu2H+MDc9T4BGaCi39QUw/Px
	 ElmDuFOHLsg+yWOZwPXvmONCyWqblstsRgCLYtTsfQluf9LoHTNm0lHBIle/sQ8Th4
	 2bAZVzNpBt2AKZP4yOliVmXMGBpgbPDlUzEHuCKg8gev8050v7hQrhXbBB2HJ9lAtx
	 29p2vPQWDJYE300DzbpjnxOsjeWUInfNoLOcDYoMoRUDrFZbEsBqUFUNHug1xLGBBO
	 pxKOpEzQv1aB2+Sq88wrAcXBWnDWfKjivDitp9pWOc3pgs7aVc/lwbz5hoqKZWhfbK
	 u30xF55sakPXQ==
Date: Tue, 15 Apr 2025 17:09:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Kishon Vijay Abraham I <kishon@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: phy: renesas,usb2-phy: Add clock
 constraint for RZ/G2L family
Message-ID: <174475495805.919973.18097238405448838308.robh@kernel.org>
References: <20250414145729.343133-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250414145729.343133-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414145729.343133-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


On Mon, 14 Apr 2025 15:57:26 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The RZ/G2L family requires two clocks for USB2 PHY, which are already
> defined in the DTSI files. Add a constraint in the DT binding document
> to ensure validation with `dtbs_check`.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


