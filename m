Return-Path: <linux-renesas-soc+bounces-21469-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 06911B4561A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 13:18:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 407497BCE75
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 11:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B51B3469E2;
	Fri,  5 Sep 2025 11:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Az302rKe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774282EE608
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Sep 2025 11:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757070982; cv=none; b=Zca6bvv5rMr3PMzF7AV1XwFar7ulClmi4as/mHKE2IEwW9nGdluMdrUnfyeCYQiguo3vyBaXfJaXASHz87aVI6I1NXcWRMH5Dy2NO8Q4nDUY9IfcACR9LIyHA7cX03wkOvHvJw/XJ4LTagswnDFZGeZhlWsJRHtrkL27W4QGyFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757070982; c=relaxed/simple;
	bh=bOAYj291jkUOw3rHJJrmHKmXeWOQO9TtjeihHIB/ndg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qowwCFyCB/hGMnj3NqR0i+qKATvvGai4VgizpOMH1ur5OAl9FSt+Gb6VjqSzP8zjpwyEMlmWiMq7bZW+eOb8bzkTnErAGCT96uxEio2ozX+ZYr+g+oEB/0qZ0m02uXnrhLOttn1EP9mIafPNo56eLlSql7PFOrVhanGUcgVNtt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Az302rKe; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=zVWE
	ldUDLWXndlkuAPr07pm2azCdz/l59iuF+leqIYs=; b=Az302rKeRwRyNr72awQg
	TlQq3AF47qfdya83T1YdQG1z9ouFaKMVUItbvI6Mz29NLN8qu1PU+bIijnKsVufB
	cHsEB43Qrk+cvXhiwbr/q44d33Kg9pTr9eHDoobfG6rFtNOLOHgNvP3Fk3dhZDGs
	74zwjAnYFKPTIGzUnaw/FKpw+TVCMcECtojnZNmgmm8XyuIlSP2Otsro+ySaP7WT
	XaZXPv7jCRK3HfPHMBqzYrL1XSf2OWeVEh0Z87VKkMbvCOGUj3Q5x9lBfbvdiLbO
	GRddJoK+lNXHBrQ3iMkxZUZHW28gOelkKOr1gSHAKRl56vVA9y4RG9F5naQ0SMbI
	/g==
Received: (qmail 4018941 invoked from network); 5 Sep 2025 13:16:11 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Sep 2025 13:16:11 +0200
X-UD-Smtp-Session: l3s3148p1@Ye0P9ws+as0gAwDPXxPDAOCjMSL5jkIv
Date: Fri, 5 Sep 2025 13:16:10 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: i3c: renesas,i3c: Add RZ/V2H(P) and RZ/V2N
 support
Message-ID: <aLrGehz-3FA4qO3C@shikoro>
References: <20250904160305.247618-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aLm5kbgRIcomBo6a@ninjato>
 <aLrF1OnctYZwy15y@tom-desktop>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLrF1OnctYZwy15y@tom-desktop>


> Maybe "Renesas RZ I3C Bus Interface"
> 
> ?

It is on R-Car Gen5 as well, so... no :)


