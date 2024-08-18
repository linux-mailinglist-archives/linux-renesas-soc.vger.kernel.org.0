Return-Path: <linux-renesas-soc+bounces-7876-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B519955E68
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Aug 2024 19:51:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D3A11C209F3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Aug 2024 17:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE7E149E09;
	Sun, 18 Aug 2024 17:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XJPEn9w3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D3747F69;
	Sun, 18 Aug 2024 17:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724003509; cv=none; b=BGLApy0bec9UyLmnQPOHLbbi5/9L8+cQy2vVQ1/r9Z2GHR2jAozrPKPtCNhLkNo3qUjWqV5GIHaolG5ZoOq4q3ME0+2pYoS68aRJohWVJkl6Tq+M2C1aqIA3uQUq/jhqfxXD2ElQ2yQmYbPhVQFnaahVp8rYXnGRvtogPz+dFSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724003509; c=relaxed/simple;
	bh=tidVSY8rGlKZOZ/mG0BgYK99Ekuv0IZphfvjl/fYTac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nB0D5htnO2xWZofMRGbxW0uehRbNxbnHtMMvIeRjKtxxqNWk3CJNg1zakH1LzZLVgOaya/ZPULmmp2C990qOzoLwDJVSpDtmlENP3RtkrYiaG2We/vqdfce+Uoald65jljW150Oc3H5AlCyG7Sj+0Th6a7zM936flBxcnfp1Hnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XJPEn9w3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2AC57541;
	Sun, 18 Aug 2024 19:50:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724003445;
	bh=tidVSY8rGlKZOZ/mG0BgYK99Ekuv0IZphfvjl/fYTac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XJPEn9w358MvTwtX9mZJn4kwOCClwMA9nTvzWfvCUsCSXYW0tXEIm9nUbkT/Zcm51
	 U575WtWwgZVHkV808z4eMjUADz8zbVaPfaz4bBCMcL/w9FnPjN6HCTpaicl52ru8zC
	 bCqtaoRLB5jovSx5CXxohuVgF3CluwiVfdlAT1Wo=
Date: Sun, 18 Aug 2024 20:51:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: renesas,du: narrow interrupts
 and resets per variants
Message-ID: <20240818175118.GF29465@pendragon.ideasonboard.com>
References: <20240818173003.122025-1-krzysztof.kozlowski@linaro.org>
 <20240818174137.GC29465@pendragon.ideasonboard.com>
 <4615f52b-4e4c-4fe4-bfef-a66e196410d7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4615f52b-4e4c-4fe4-bfef-a66e196410d7@linaro.org>

On Sun, Aug 18, 2024 at 07:44:22PM +0200, Krzysztof Kozlowski wrote:
> On 18/08/2024 19:41, Laurent Pinchart wrote:
> > Hi Krzysztof,
> > 
> > Thank you for the patch.
> > 
> > On Sun, Aug 18, 2024 at 07:30:02PM +0200, Krzysztof Kozlowski wrote:
> >> Each variable-length property like interrupts or resets must have fixed
> >> constraints on number of items for given variant in binding.  The
> >> clauses in "if:then:" block should define both limits: upper and lower.
> > 
> > I thought that, when only one of minItems or maxItems was specified, the
> > other automatically defaulted to the same value. I'm pretty sure I
> > recall Rob asking me to drop one of the two in some bindings. Has the
> > rule changes ? Is it documented somewhere ?
> 
> New dtschema changed it and, even if previous behavior is restored, the
> size in if:then: always had to be constrained. You could have skipped
> one side of limit if it was equal to outer/top-level limit, e.g:
> 
> properties:
>   clocks:
>     minItems: 1
>     maxItems: 2
> 
> 
> if:then:properties:
>   clocks:
>     minItems: 2

Where can I find a description of the behaviour of the new dtschema
(hopefully with some documentation) ?

-- 
Regards,

Laurent Pinchart

