Return-Path: <linux-renesas-soc+bounces-18020-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B68A2AD32E9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 11:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 895797A33BA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 09:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C503128B7F8;
	Tue, 10 Jun 2025 09:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZTFvFE/7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D16F1F0984;
	Tue, 10 Jun 2025 09:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549488; cv=none; b=htn502nYTFi1h+UDxWarqXrqi0/FkFs73yzykDChQ6JqQ6wudR/2rbi6249j4iTPWfmluRJk87RRavX+qk89JEpWU/1Kn6FmXy/nm6pyaquwU+DgO04qGZQhfQfqmi1nGQNchG/+662u+k+HX3TCJd7hBiYQmNbeRpLawAwQVFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549488; c=relaxed/simple;
	bh=RAxa8eTNx+BBiaQgCdS697j8LqDE6hZhl4PgNuwVzOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cF2fx2i9AGziV/XxpApeSUR0oeHIJ/fP1tk511Ltqla0hQtMz7bRut1Bx6yWi4bI+jVBnEbVoGuBpqVk6ZHzGO7oQJD28Vtai7sbe2aDfJZu2f14m+j46BdzzKZ3d997mEefSGNyG7ee1htf5vwPMQNEKI9zM93RCbMoA3DMrzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZTFvFE/7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1514D169;
	Tue, 10 Jun 2025 11:57:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749549478;
	bh=RAxa8eTNx+BBiaQgCdS697j8LqDE6hZhl4PgNuwVzOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZTFvFE/7wv9Lt//6o9XPbsEd+rhIqdoLhYd/5g/icDwc5IbeywXteOg3XEZqPgQ9q
	 XmNLlzLlknxcXHixykb+zLwGbBzl3mDXtjdwsccu4JD0ipttXyTAfaN98fmiiAw3V0
	 APxGpwvGqnb64KA2v8NM806tRiBtaTng2NCW70fM=
Date: Tue, 10 Jun 2025 12:57:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: display: renesas,rzg2l-du: Add support for
 RZ/V2N SoC
Message-ID: <20250610095753.GD24465@pendragon.ideasonboard.com>
References: <20250609231905.511904-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250609231905.511904-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Tue, Jun 10, 2025 at 12:19:05AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Document support for the DU IP found on the Renesas RZ/V2N (R9A09G056) SoC.
> The DU IP is functionally identical to that on the RZ/V2H(P) SoC, so no
> driver changes are needed. The existing `renesas,r9a09g057-du` compatible
> will be used as a fallback for the RZ/V2N SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Assuming this gets merged after
https://lore.kernel.org/r/20250530165906.411144-2-prabhakar.mahadev-lad.rj@bp.renesas.com
("[PATCH v6 01/12] dt-bindings: display: renesas, rzg2l-du: Add support
for RZ/V2H(P) SoC"),

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../devicetree/bindings/display/renesas,rzg2l-du.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> index 1e32d14b6edb..2cc66dcef870 100644
> --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> @@ -25,6 +25,9 @@ properties:
>            - enum:
>                - renesas,r9a07g054-du    # RZ/V2L
>            - const: renesas,r9a07g044-du # RZ/G2L fallback
> +      - items:
> +          - const: renesas,r9a09g056-du # RZ/V2N
> +          - const: renesas,r9a09g057-du # RZ/V2H(P) fallback
>  
>    reg:
>      maxItems: 1

-- 
Regards,

Laurent Pinchart

