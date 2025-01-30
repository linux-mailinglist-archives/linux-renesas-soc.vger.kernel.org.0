Return-Path: <linux-renesas-soc+bounces-12728-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 832A5A2296A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 09:09:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE3BA18855F1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 08:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E9211AB507;
	Thu, 30 Jan 2025 08:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XoEywIKE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F04819;
	Thu, 30 Jan 2025 08:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738224593; cv=none; b=XGhmoZyNcFDnNm4R+5spnYilkc9xqPTIJocPLoC/5NvrUpunW3p7GZlXsabuLLNSjffD8yX2FBbgZ5SaeqmSYZJg3PeBTuGcWFwWVQR3ghlcgjzkxEzQdpIJnzcTohe1OlnSMumVKchuzvEvlVws7PUBoSxUAX1JoEur3zkmMOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738224593; c=relaxed/simple;
	bh=mIQ7zJQT213J6nyP3cdzgVwkmazK86TLNNvRq1YVQGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P7kVfiJJke9OEh6SbjMESXY2A9qx123vXF+ugsCPN99aSWRt+d33/F1UMa9HnY+Oif7Ls0rOoKS6fLNxyA1MRIfqbRuXt7VFxvFQ9wBGJ7D6pHvHqj+bo4W86JpGSqb4ApGLF0K4iRBMWOsA5CzRWoXeKEyI4CoqD92UhvlJ/H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XoEywIKE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F36D7C4CED2;
	Thu, 30 Jan 2025 08:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738224592;
	bh=mIQ7zJQT213J6nyP3cdzgVwkmazK86TLNNvRq1YVQGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XoEywIKEd906URNupud6t9UrU359OSGZ0We8Wob8Nu8ewYc2fs7k8oRNWrwShRGOA
	 OXB9c9g4lo1DrGmGUp5m8oau1yL+bo+YSIgkzSrM5LhyVF/sqcUQGkNCq/43yjtWL7
	 ZtG+30ndljqgHGBe+MszyHNRAVg53260SazJigknL+aMeKMrzUyajrFUxFx1M6p6qx
	 B5MWD+VM9j7YEXOyAFMsQJ/KlE3WN7QB9k4jSy6sP2Q/rpnfsdB4otDX8h7tSh44Dc
	 WGbmP0wVK/OUxmyUWELF6WAMBLy+8feIVxrfSxGwO523AnU55OKhMHNzM5/VuDNLju
	 DOPO8R2TLo7LA==
Date: Thu, 30 Jan 2025 09:09:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 02/14] dt-bindings: serial: Document sci bindings for the
 Renesas RZ/T2H (a.k.a r9a09g077) SoC
Message-ID: <20250130-fiery-lemon-civet-eef0cb@krzk-bin>
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
 <20250129165122.2980-3-thierry.bultel.yh@bp.renesas.com>
 <ea59455a-62c3-49c9-8954-1212125ea853@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ea59455a-62c3-49c9-8954-1212125ea853@kernel.org>

On Wed, Jan 29, 2025 at 07:31:04PM +0100, Krzysztof Kozlowski wrote:
> On 29/01/2025 17:37, Thierry Bultel wrote:
> > Document RZ/T2H (a.k.a r9a09g077) in SCI binding.
> 
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 
> And make it anyway shorter.
> 
> > 
> > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> > ---
> >  .../bindings/serial/renesas,rzsci.yaml        | 100 ++++++++++++++++++
> >  1 file changed, 100 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/serial/renesas,rzsci.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/serial/renesas,rzsci.yaml b/Documentation/devicetree/bindings/serial/renesas,rzsci.yaml
> > new file mode 100644
> > index 000000000000..70e83bbcc79d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/serial/renesas,rzsci.yaml
> > @@ -0,0 +1,100 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/serial/renesas,rzsci.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas Serial Communication Interface
> 
> 
> You are duplicating existing renesas,sci without any explanation. No,
> don't. This is pointless.


... and this wasn't tested either. :/

Best regards,
Krzysztof


