Return-Path: <linux-renesas-soc+bounces-13932-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D520DA4C881
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 18:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38C6E178C50
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 16:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DEED235345;
	Mon,  3 Mar 2025 16:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="2rfDMlVP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56E61F2369;
	Mon,  3 Mar 2025 16:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741019662; cv=none; b=d5UDxHbCoAeI0/4UvfJVIPO7s6VbT1Z+xK0/bVTbtQaGDd1npixy5KbTcSYifIS/R/qSXHjCTAKdOyumWi8V54tKBaXGd6Jm12lacHJ7EXmjNojIcYAvDqE+XBFY0/WQ+MChv5qp+9rYYdeQzS8M0ZMHr1fA3iHfhG1L+hmpshc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741019662; c=relaxed/simple;
	bh=JEREDIx7cDVnisiJSln7PJ4q8Cuobkgpq9TFywWa9xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DUaOXMaXDjZprGMBlCqGTMihg9jm5t6KehVDRWiEnclCCSjOE5fmvO1HgG3Sa5yShQX6MX2Rr/o7Yt9XAcsMC1GxYQvNUOdCc+3kWIeRjj5D2fltzQHoYLHN1IIFyDN13uYwxUfxnAJZEf7a8/GgW/a46AFOraUGl4zZgWBWVZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=2rfDMlVP; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=tZrvmzOYhHd3Yc3bExSIoHQkrJFa5shgHlbx7+V1470=; b=2rfDMlVPuCxAb9KwnSLmbgQ2KS
	GmWIPo5hXCrLAKfouYO9pv0nASWPd8JfDgKcgdJ9OVikYoqr3Jnjhash91mONdYJR9n+LzcJ8+8td
	TtSrhdfptxivcLR4MkAjhxQtYeQfY79vWx6aY2YP2gVqEB4RSbfwaD1I3H0a0/BMUiz8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tp8jy-001rW6-Ui; Mon, 03 Mar 2025 17:34:02 +0100
Date: Mon, 3 Mar 2025 17:34:02 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/3] dt-bindings: net: dwmac: Increase 'maxItems' for
 'interrupts' and 'interrupt-names'
Message-ID: <41eb620e-7cb7-4763-9fed-1f9fd2800795@lunn.ch>
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250303152628.GA1873145-robh@kernel.org>
 <CA+V-a8ukVgx7OqDTP6EharPJxUnVw5wAohveJw+VCABvz7FSRA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+V-a8ukVgx7OqDTP6EharPJxUnVw5wAohveJw+VCABvz7FSRA@mail.gmail.com>

> How do you want me to handle this case:
> 1] Update vendors binding
> 2] Duplicate snps,dwmac.yaml in vendors binding.

Not the second. The stmmac driver is a mess because vendors do their
own thing rather than try to be the same as all other
vendors. Duplicating it will just make it worse.

	Andrew

