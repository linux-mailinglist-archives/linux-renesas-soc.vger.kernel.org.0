Return-Path: <linux-renesas-soc+bounces-18933-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B7BAEE7B5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 21:43:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBC4D3A6091
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 19:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33292E88BD;
	Mon, 30 Jun 2025 19:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bK1k/aTn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998E32E6D1E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jun 2025 19:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751312603; cv=none; b=dEgJupArIVZ1L/4/rARtwrFUtsdIaQzv07axOuvq1JJIwPoENMsNwAxyU+rpWxMt+k9OEdhxWrS4cjLv3at9zrj+6BgK46S4p5+EzLhlPk+xg4fRtr6O4O4FCpl19TWVe6gybdzBA1bNn7i8TWGbGODn62Lt3zRJG5BIOuZOYEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751312603; c=relaxed/simple;
	bh=v3OJFDB7Np/tDUVlLKjpAPv5q3Y7Izm7m2m8utImue4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nSdN8A8zFoZtRARRizVI0vBt7UIFTdNwYb+ID29k3veOOvzOIDreAEp1PjmIGVMRD/jJaGZ20gpqJ6oIGuUcxhgEKUUzxnSzL/0SgpEW6oHNk/CSNg6cWtIBfPlEmIxQ5kqVe5CH8uRGa0kZNLGKyv8OJ0dAu6Il0tIBdvl7MP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bK1k/aTn; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=IJoM
	IVa5E7Hv4lTIbN8oe9WV112gVPK/DBDuckoPA8I=; b=bK1k/aTnRAnoUYMIsbJ/
	mF45GKFrR9eHehYS1mqtiHqyzfRNq9cNsw4+IfUNj4WVcKKB7lvP/HJLw6SzJJoF
	8E10p10UeMq6thC2qCvOCxT7qF/fiInbNUh2gWyBibITABwtyc6FeAEsoTvZxbgx
	LadI7dk2OGvoY0ohkOWEVqp5IzoijRY/xovZyGhVND2eTvbe1dCcmFKupbHN2QDH
	Q2Zm/T9k5txjCRMHS54AYOm8nyUN/Sk9qbPGX7tulcBY7hMlSJf0h8G9/DXXcYQi
	Syh0OpydatoUpgN9jKaNeQH+P8fYm+dZoYSLPh5Rs77hVyKmbYaa2uv+qOJzQkLd
	Cw==
Received: (qmail 2683149 invoked from network); 30 Jun 2025 21:43:19 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Jun 2025 21:43:19 +0200
X-UD-Smtp-Session: l3s3148p1@sIxbPc84RqAgAwDPXyUmAP5FmBXRrw7R
Date: Mon, 30 Jun 2025 21:43:18 +0200
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
Subject: Re: [PATCH RFC 3/7] dt-bindings: i3c: renesas,i3c: Add binding for
 Renesas I3C controller
Message-ID: <aGLo1mlrHT_IZHQv@shikoro>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-4-wsa+renesas@sang-engineering.com>
 <20250625200709.GA2125481-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625200709.GA2125481-robh@kernel.org>


> > +  interrupt-names:
> > +    items:
> > +      - const: ierr
> > +      - const: terr
> > +      - const: abort
> > +      - const: resp
> > +      - const: cmd
> > +      - const: ibi
> > +      - const: rx
> > +      - const: tx
> > +      - const: rcv
> > +      - const: st
> > +      - const: sp
> > +      - const: tend
> > +      - const: nack
> > +      - const: al
> > +      - const: tmo
> > +      - const: wu
> > +      - const: exit
> > +    minItems: 16
> > +
> > +  clocks:
> > +    oneOf:
> > +      - items:
> > +          - description: APB bus clock
> > +          - description: transfer clock
> > +      - items:
> > +          - description: APB bus clock
> > +          - description: SFRs clock
> > +          - description: transfer clock
> 
> It's a new binding, why don't you put SFRs clock last and simplify the 
> schema?

Similar how we handle interrupts? 16 for the one SoC, 17 for the other?
Putting the optional entry to the end of the array? Tommaso, can you
integrate this change, please?


