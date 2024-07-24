Return-Path: <linux-renesas-soc+bounces-7495-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 718AC93B81E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jul 2024 22:39:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26AC91F21AD8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jul 2024 20:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC66B132492;
	Wed, 24 Jul 2024 20:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="W6yI3tXV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Bm/Ga072"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393DD65E20;
	Wed, 24 Jul 2024 20:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721853571; cv=none; b=GU+SmNw2QgvFS0M4gJaFtpYmE4C42S3TDj2wvrKBYf+YBBDAcWfKB4K4Wb2+XEwTRivioX/1FO8LV9r5mngTtoMOYGog+mlZ15MQ3JxyAWxZu3/uM0uVZ6uU8l1at6ngXTnz7gaDQbR8gf3fxt9Rf9Tw/MpGY03cgMSJ1NBCgZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721853571; c=relaxed/simple;
	bh=/yx+7tfaIgUk5kN8zhSGSzSs+UISBZJKcH2TmfbbgYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ktzdKQyEFIYvluz4PHFglZNLvOpm578/MFQgQy4hsUNVU2fuD1vkzsusSdnblov9PBQuBIQwvC/+nzTsWaQxbX9gH0DgqoHlTAGTiXdNwIrve76pzFWCOWA0poBqwL2OkJtJBgACaQZwU4w/5JzHf32cfGxRD2SYl0id5hyua9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=W6yI3tXV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Bm/Ga072; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id 1E67C1385D68;
	Wed, 24 Jul 2024 16:39:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 24 Jul 2024 16:39:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1721853565;
	 x=1721939965; bh=1cWzR+7Vwv/EgLb3hFhM6ar6lC/oYj1b70wKWwXM/78=; b=
	W6yI3tXVeM6+3Cg6w2WCov8aq2PJz6EBVNnL8gvYLDfEBs6yiM/AEUeHfEUjVZfH
	BasRFFNmhUEtUVITd7VIMT15Pi11nv3ZCdwLHsILFI6HkFj2CAFmr0QFLN1l+ZO1
	oTyv+wZRlW8Y7cOSZdWWrB+qmH7eQPK4Z9xnEtEYbCUZgN2X70PJO15k7nFcuDdj
	eRdX3jfTKocr/ltPaX5UZa9yegeid2Qw5bNImmr5PCVTwMHUHo18+ipAGz16h0SV
	DVJCE5Q0NZ9p8ZQgNsyAMCiSYo5832bXthOHfoOlSb3Zr1bZQ/DnJIykn9kvrMI0
	wA42OHwiyUCkV2eDGS7zMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1721853565; x=
	1721939965; bh=1cWzR+7Vwv/EgLb3hFhM6ar6lC/oYj1b70wKWwXM/78=; b=B
	m/Ga072/u8s4+JEmiVLONaEBYAU/6yvgBDnQJDFJs+23vTN3k7EH6c2vof148CBz
	rlFaN7frHEZNEOqsJTHKD5IIrkRqB/w6I3ctjjrzDHJ63jAmJYSdiyTuKLagDFKP
	BiWBxayyAz9PQCVCGYTDdr2TUGHfx1K8bBIeNdPUF4KbhngrsNxwNCWX9nybZp+P
	TlVRKzAR5LTdjEdyXWh/9f+C9JEFBw++1wAQ8ZN1LJpqPyHxf0NuWikJdAjykNrj
	C0bV3Nw+UB0A1G/ILUmoC5oYLCb93V0rwEFDLucSHUUr78ii6Jduw9ADQ6YHm0Gh
	HeLTzgc74zOdiLCoPv4zg==
X-ME-Sender: <xms:fGahZn0h1FtDS-GTHNCfbbH858cxg5n1wjVOcbeam8LIm-grZmjSgg>
    <xme:fGahZmGsmjyN4XslG7poNSqE9haxeeE1gKoXQ2akVUppjuJbD--Vf6xrDzNPxGBK6
    VZCCECDR-Qn84Cpbm4>
X-ME-Received: <xmr:fGahZn7jhsOcYGwkYSgLsMoOzSITtGOJFw3U-PL9tuT_Mge-3m_tbj-ASUzRIbkVjB_knF2Q8ikPs3niH8kEPseq3MJgUHo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddriedugdduhedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrgh
    hnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeef
    heetheekkeegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgr
    ghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopedt
X-ME-Proxy: <xmx:fGahZs183bHdMFFNv4t_EKDeqKRdK1W7EvL9bkB9LH9exWIb-dyV8Q>
    <xmx:fGahZqEVrsiC1_FoPi_fDEJX9Pmf8lWUtnAhScCFDiFCyTvng-h4TQ>
    <xmx:fGahZt934Oh0bHKRPdHM0YF6w-vA64h-8v4Efr9Mo7OgSMHcEUEHrQ>
    <xmx:fGahZnn1dikrKgdqJzfpksdqWBfNfciDByO6sZKpiZUx5j9Q8XsdRw>
    <xmx:fWahZl9AkBEvX6BuwokWodtSL5v80o0XYFUk4q9zb4gQj2io5YU2hCnP>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Jul 2024 16:39:23 -0400 (EDT)
Date: Wed, 24 Jul 2024 22:39:21 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 2/2] dt-bindings: soc: renesas: renesas-soc: Add pattern
 for GP-EVK
Message-ID: <20240724203921.GA2820193@ragnatech.se>
References: <20240724094707.569596-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240724094707.569596-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240724094707.569596-3-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Lad,

Thanks for your work.

On 2024-07-24 10:47:07 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add a pattern for the Renesas RZ/V2H GP-EVK board.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml
> index 5ddd31f30f26..3e93e0c73ed9 100644
> --- a/Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml
> @@ -37,7 +37,7 @@ properties:
>        anyOf:
>          # Preferred naming style for compatibles of SoC components
>          - pattern: "^renesas,(emev2|r(7s|8a|9a)[a-z0-9]+|rcar|rmobile|rz[a-z0-9]*|sh(7[a-z0-9]+)?|mobile)-[a-z0-9-]+$"
> -        - pattern: "^renesas,(condor|falcon|gr-peach|gray-hawk|salvator|sk-rz|smar(c(2)?)?|spider|white-hawk)(.*)?$"
> +        - pattern: "^renesas,(condor|falcon|gp|gr-peach|gray-hawk|salvator|sk-rz|smar(c(2)?)?|spider|white-hawk)(.*)?$"
>  
>          # Legacy compatibles
>          #
> -- 
> 2.34.1
> 

-- 
Kind Regards,
Niklas Söderlund

