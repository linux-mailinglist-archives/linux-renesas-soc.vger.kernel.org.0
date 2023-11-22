Return-Path: <linux-renesas-soc+bounces-113-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B02C7F485F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 14:57:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E8F7B20C66
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 13:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A358E6FCE;
	Wed, 22 Nov 2023 13:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="maDGtmiO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2187197;
	Wed, 22 Nov 2023 05:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=1wijzKURERLH5YMhL7NrTp/hCMnJxekCwGU9OnXsq2s=; b=maDGtmiOxWJKDfjBmAM+wHVdAR
	75p7j+ULwccG19J/GkksVt/dv7oaEguHYrwurVYtzDFvUMbIONrGIQ573stnnbKBdogIdP99X/bcD
	BpjfIhVs2VnDcWzUvfhk9OEH6OMVhJEeiMKg3S+Ng+GrJihi4k3xcbe+HT5KkUfPoXAg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r5nj0-000s1E-LH; Wed, 22 Nov 2023 14:57:06 +0100
Date: Wed, 22 Nov 2023 14:57:06 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: net: renesas,ethertsn: Add bindings for
 Ethernet TSN
Message-ID: <7fce3813-daa6-41ac-8167-21ccdd733fbc@lunn.ch>
References: <20231120160740.3532848-1-niklas.soderlund+renesas@ragnatech.se>
 <2ab74479-f1fb-4faf-b223-ae750b4c08ce@linaro.org>
 <ZVyeMKjVhjW2F2e0@oden.dyn.berto.se>
 <badce6b1-c614-4fc2-b3a2-5b1b5c011a80@lunn.ch>
 <CAMuHMdWYFrx-CUapCQPX=hJtZBHycRTyN-dq8fXSXZwOiPJDMw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWYFrx-CUapCQPX=hJtZBHycRTyN-dq8fXSXZwOiPJDMw@mail.gmail.com>

> > In general, we try to have the PHY add the delay, not the MAC. So i
> > would start with hard coding the delay to 0ns, and only implement
> > these properties if you have a board where the PHY cannot add the
> > delay.
> 
> If I understand the KSZ9031 bindings correctly, that PHY is limited to
> a skew of up to 960 ps, not 1800 or 2000 ps.

Reading ksz9031_config_rgmii_delay(), it implements the four
PHY_INTERFACE_MODE_RGMII* interface modes. So it should be able to
provide the 2ns delay. Sometimes the tuning ability is relative to the
base delay. So maybe it can do 2n +- 0.960/2 ?

Anyway, try interface mode "rgmii_id" with the MAC not providing any
delay.

	Andrew

