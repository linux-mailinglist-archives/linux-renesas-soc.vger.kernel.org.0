Return-Path: <linux-renesas-soc+bounces-22810-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F04BC6CDB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Oct 2025 00:42:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 956DC3C4218
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Oct 2025 22:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E49322C21D0;
	Wed,  8 Oct 2025 22:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="epDxNrmM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE321E25F9;
	Wed,  8 Oct 2025 22:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759963329; cv=none; b=ncQgvTmAg5IzwKiDTJF1AC/EcYNVm426t7KzrbNowgebalsAbIFWOGGzzPgYRYoYKkNACRj2yLmCOmXvqzGIW/MqqK/qPEEl5HdZ5KpwYlye3mBeuc62peUM8T8Lwj6zLGfJFs5lFW1B39axRf9/E6GUcKtorLImMEM8OUuo/b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759963329; c=relaxed/simple;
	bh=vmjOkNtkKR5B7k3MFrCN5mD1VOvLH+TW5swX4wPdE3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SQZujAY/Mr1M7EmampRTXGT5AiLVzerH+iN4ScymOKw8NeQ55TNhze3cz6pfbzLn+j5OJVdGZQtOLnKu1wAdPTY4FcR+iB7Wq1R0Mjap+I4sNAciKS7bRlev8fh502p8EU0OJx3MTpxzxz5MujzXAZOjclR4P6GC9Hsk2a1lxck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=epDxNrmM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D487C4CEE7;
	Wed,  8 Oct 2025 22:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759963329;
	bh=vmjOkNtkKR5B7k3MFrCN5mD1VOvLH+TW5swX4wPdE3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=epDxNrmMpTAnkkY1KjkDTfDsVWGQagivyiE6aAxJ2RwhoDbt+9F7ZwhYJB0NqL779
	 XdFcz6yLBVX/xcdTXBa9vCww6qJ4znnaUa8hOED+pQ/xe5qoO8uKBdTdSVjA53hOOI
	 WptpgVOkU7gTyzdMPKSBowgv/iVfc19CqQ7aLmpsSNiA/MvFXmCW6mW+oqKYNhm++T
	 Vt5vBoHFwY4AIf8E9AFQjKVM41zTbTKHo60+VVj4Zss9KaPpZ4jJK5l9dOzeTQYM44
	 DjZcgYo7t27zeBEjFc1/vi/ut8mD5LGt6jujg4C99nU0Yg08n6Bik8b1+UoOB0M/ZX
	 vNV9jJ8uWoKFw==
Date: Wed, 8 Oct 2025 17:42:08 -0500
From: Rob Herring <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: bus: renesas-bsc: allow additional
 properties
Message-ID: <20251008224208.GA237448-robh@kernel.org>
References: <20251007032209.7617-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdUChRoJ-A4W-PBBQssMvsn1GZY5zXmWxJ9y+EA8M2p3gw@mail.gmail.com>
 <aOWGWkQn1AK22tJB@shikoro>
 <CAMuHMdUXoq3d010y0vyXvvaHpgaV7rHb66VAHrwJxAZXzt+z=g@mail.gmail.com>
 <aOY2tdEXmhdZ0Yeq@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOY2tdEXmhdZ0Yeq@shikoro>

On Wed, Oct 08, 2025 at 12:02:29PM +0200, Wolfram Sang wrote:
> 
> > > As said, I copied this from 'bus/allwinner,sun50i-a64-de2.yaml', so this
> > > got reviewed already. I have no strong opinions on your suggestions
> > > above. But whatever we agree on, it should be reused for all busses, I'd
> > > say. So, we should put it where it can be referenced?
> > 
> > In my defense, this is a DT bindings file for Renesas BSC, so we can
> > (and IMHO should) add restrictions.
> > 
> > If you want to go the fully generic way: as per the device tree
> > specification, a unit-address can take all characters from the same
> > set as a node name...
> 
> Well, I think consistency makes sense, but I don't even have a strong
> opinion on that. If DT maintainers are fine with having multiple
> patternProperties for busses, I will include the restriction you
> suggested.
> 

There's always examples not to follow...

Adding back context:

> +  "^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+$":                                                

The node name pattern before the '@' is just what's a valid node name. 
That is checked by the core schema on *every* node already. Even ',', 
'.', '+', and '_' are allowed which have long been deprecated. (Do you 
know how long it took to get QCom to stop with the 'qcom,' node name 
prefixes...).

The unit-address is the only part a bus schema should define. And there, 
lowercase hex is standard unless you have distinct fields (e.g. chip 
select and offset).

Rob

