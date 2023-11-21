Return-Path: <linux-renesas-soc+bounces-51-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DED7F36FB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 20:54:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B994EB21ABD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 19:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7568A4206E;
	Tue, 21 Nov 2023 19:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="jlSQktc3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37DDCD47;
	Tue, 21 Nov 2023 11:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=oCWDeKEBiiqfqbYup69P6A3J0FDsD9pdJ9Svzw7qqDk=; b=jlSQktc35PwwApo7oa/8jIsXQv
	zrKwDYza06mlvXFbZEu3LDUiRGQXousXtvgq5RPcnPndInkDlVC9gJDY/Hp4lx4AX0cnzuzCkjvXE
	a6I5PXN+neEm/V+PyTWF9zMxBlNqPSQ1tha3oAAm6/UafEAQjN+CaSrrNb3lA5utC7JM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r5Wok-000nCV-GA; Tue, 21 Nov 2023 20:53:54 +0100
Date: Tue, 21 Nov 2023 20:53:54 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: net: renesas,ethertsn: Add bindings for
 Ethernet TSN
Message-ID: <badce6b1-c614-4fc2-b3a2-5b1b5c011a80@lunn.ch>
References: <20231120160740.3532848-1-niklas.soderlund+renesas@ragnatech.se>
 <2ab74479-f1fb-4faf-b223-ae750b4c08ce@linaro.org>
 <ZVyeMKjVhjW2F2e0@oden.dyn.berto.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZVyeMKjVhjW2F2e0@oden.dyn.berto.se>

> > > +  renesas,rx-internal-delay:
> > > +    type: boolean
> > > +    description:
> > > +      Enable internal Rx clock delay, typically 1.8ns.
> > 
> > Why this is bool, not delay in ns?
> 
> The TSN is only capable of enabling or disable internal delays, not set 
> how long the delay is. The documentation states that the delay depends 
> on the electronic characteristics of the particular board, but states 
> that they typically are 1.8ns for Rx and 2.0ns for Tx.

Do you have a board that actually requires this?

In general, we try to have the PHY add the delay, not the MAC. So i
would start with hard coding the delay to 0ns, and only implement
these properties if you have a board where the PHY cannot add the
delay.

	Andrew

