Return-Path: <linux-renesas-soc+bounces-19552-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6752AB0555B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Jul 2025 10:50:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B44721AA4DC2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Jul 2025 08:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32104273D7C;
	Tue, 15 Jul 2025 08:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jNxSiwWC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C621DED5F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Jul 2025 08:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752569379; cv=none; b=ccpRQl/RU6C+X6X2S2PCfcAko6O66KB4dclvah781wg3AziV991CVewXgl1yX9EGPlaSErlVpMVU3iEeOlB9NFsnGaUYEU0sy8EqDG6chfSkZXw2gWjvssHNP+KrF4JlRZcl24GBE5qxdRE341oKyrzWq625ULE1WbJyzYT9eU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752569379; c=relaxed/simple;
	bh=H4Dc0DCB3n989Dk7DQ8dw1w6vX5O8BFxX4Y0ZbIjumM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ik8g78RLSLxgtiYj8K6JeCBG9X0pKeCNXab20UxG1Tm+DlfI6jbBn49Ziwi8zF1EWlMuVuVRPV3kxlNTMr5g3S4a2iwUVQP0t82fS8xsoOxpQBZE7lcVTqRx++Ii9/Sbm9hMBiwC/3xbxwu7g7R5oqeTSqLH0rZyPQdeNOcfyts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jNxSiwWC; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Sywa
	sp0aNghKdI+BXx2W0GdIAOcfY73wopCUSjG9ySg=; b=jNxSiwWC2Zx4d8QwU5xo
	0HOwmswbb+bqh8J8x5tVDU7ipPmu2UKy3p8TVTIGeKCzgSAh55Ip2IhZXoatWdWL
	xJ8IQdihcZdCten9QQpQMjpQvrysbPh7W5ZTksiACL0Mikl7lItaF21kYWORreS7
	x0oQL7OTWItaaI7Kg96JOlwARiUdaG9ZIcJ0n31uVHyIoXMtNByOZLsdwTbEkNwc
	r6rPZyJIKlDE5AXPbEEip8D+VCKS88Wn3mZMv4ym/htvJDF9udvthxdFad6/y8mJ
	fSJESRLTaiGs0+MqAVjwdoeIfCBYt4LOnom+Gy58Ll7bs23AUd254hn0uZoBcAR1
	6A==
Received: (qmail 2809330 invoked from network); 15 Jul 2025 10:49:34 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Jul 2025 10:49:34 +0200
X-UD-Smtp-Session: l3s3148p1@hYf32vM5lsUgAwDPXx+vAAkEB0lWxGP4
Date: Tue, 15 Jul 2025 10:49:33 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i3c: renesas,i3c: Add binding for
 Renesas I3C controller
Message-ID: <aHYWHcns6SRSM5uA@shikoro>
References: <20250714091211.20497-1-wsa+renesas@sang-engineering.com>
 <20250714091211.20497-2-wsa+renesas@sang-engineering.com>
 <20250715034441.GA4186417-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715034441.GA4186417-robh@kernel.org>


> > +      - enum:
> > +          - renesas,r9a08g045-i3c # RZ/G3S
> > +          - renesas,r9a09g047-i3c # RZ/G3E
> 
> You already have to have differences between these 2. So how are they 
> the same and compatible with this:
> 
> > +      - const: renesas,i3c
> 
> Even without a difference, this seems like it will be short lived for 
> how many SoC will be compatible with it (though we get to keep it 
> forever). 

Ack, will drop. Thanks for the review!


