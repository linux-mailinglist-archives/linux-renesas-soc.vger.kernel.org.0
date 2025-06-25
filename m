Return-Path: <linux-renesas-soc+bounces-18754-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 310C4AE8F28
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 22:05:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F26C5A8137
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 20:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 500CA26A0F2;
	Wed, 25 Jun 2025 20:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SjAaOqGZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2BF20C026;
	Wed, 25 Jun 2025 20:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750881892; cv=none; b=s1Q6gKjDSmjcuoEyC//wZ7RMPnga5jwDyQfNWbvO0ry1UtcLjfoXXWRLTymn6W5AnVnwtaVJR63rISE09ZtpV4rTC67PHA7WjxUU2YrHzmYd6FTqcHiZytNg/h2J5Co0aWoiAkN7TzTzs8zAQGzGMU3F4bouo53otx7cu+oX4UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750881892; c=relaxed/simple;
	bh=Wge9Fm4x36OgbfZOTFgwfrZuYoukt8bZYelLZzh4bd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N253ySnXpi7TMsT/scjUVxQYYjriXO3QOK2J6NBV0GlB2uGTYrdau/z1TDo4BtPMw8Vd9XSJFuCfcXzHXLninCXY0GAkQVgr4iJbLnpk8hFn1AA4V4Egeo+D3WVKEyhudvwss/7PH/rAFmzG+FewW++JbaUatp6ASsx9f0QYkUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SjAaOqGZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6D92C4CEEA;
	Wed, 25 Jun 2025 20:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750881892;
	bh=Wge9Fm4x36OgbfZOTFgwfrZuYoukt8bZYelLZzh4bd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SjAaOqGZZk9YzmGzRpHefzfJlf6naR6zPr4PH5BcqwtGrlsEaInaMI18oGzB69azi
	 ukB+4+1wCNHwqmjI0zpXz9X08fBkyUHeh50D6CNYX01s8fhMEWnyqz7K54EtNnfsKx
	 OFFajCgQ7UW5zE9FR8tnNgxJlMghlqlqKftJfHlsExvUQJcdxziWN4whV56tzfwABz
	 F3uOmvQnljBbSivOb0Z1im/Xnq3ISH6acCmhKlOS5DQwNhN+LOuOMHTtryOuj+E6bQ
	 QcOOqhyAe9llU9z5XwEg3HKAT5eJbFbNUYW+ee6BUcucCwvJVNjJGko38UmGVIFH0e
	 IfNc7eurzjyxg==
Date: Wed, 25 Jun 2025 15:04:51 -0500
From: Rob Herring <robh@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.li@nxp.com>, linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 3/7] dt-bindings: i3c: renesas,i3c: Add binding for
 Renesas I3C controller
Message-ID: <20250625200451.GA2117971-robh@kernel.org>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-4-wsa+renesas@sang-engineering.com>
 <aEmjbY8ifoI5Cs5t@lizhi-Precision-Tower-5810>
 <aErkyDQvV3C0TZSu@shikoro>
 <52401543-28df-4f13-8b7a-6463fe54cd5f@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52401543-28df-4f13-8b7a-6463fe54cd5f@bp.renesas.com>

On Thu, Jun 12, 2025 at 04:51:42PM +0200, Tommaso Merciai wrote:
> Hi Frank, Wolfram,
> 
> Thanks both for your work.
> 
> On 12/06/25 16:31, Wolfram Sang wrote:
> > Hi Frank,
> > 
> > > > +  clock-names:
> > > > +    oneOf:
> > > > +      - items:
> > > > +          - const: pclk
> > > > +          - const: tclk
> > > > +      - items:
> > > > +          - const: pclk
> > > > +          - const: pclkrw
> > > > +          - const: tclk
> > > 
> > > Suggested clock name is, apb, trans, srfs.

Suggested by who?

> > > Needn't clk surfix and provide meanful name.
> > 
> > ? Why can't we have the name from the datasheets? It will be
> > unnecessarily hard for users to verify the correctness of the clock
> > assignments if they need an artifical mapping of these names. If they
> > are the same as in the datasheet, the same task becomes very easy.
> > 
> 
> Agreed.
> Since the name comes from the hw manual I think is better to leave it as is.

Agreed.

While 'clk' is considered redundant, naming clocks 'p' and 't' is too 
terse even for me. So the rule is clk is redundant unless it is with a 
single letter. The rules apply to s/w folks making up names, not h/w 
manuals.

Rob

