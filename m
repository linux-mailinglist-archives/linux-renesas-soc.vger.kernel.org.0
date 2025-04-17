Return-Path: <linux-renesas-soc+bounces-16130-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6192A9256F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 20:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 894163AD611
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 18:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8932580C2;
	Thu, 17 Apr 2025 18:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Wt5nIaRk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C092561A2;
	Thu, 17 Apr 2025 18:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744912907; cv=none; b=fJSXMjZfziPGHwqhj0dqOHe+jlGH0b0qrnsremci+O7kglkWcvBJmW5UGznEgZSBCATzIi+s+OBuIbbDW0MJXy3etwYSpsa83oC60kzXAMB9hW6sL84er+poLC9jUmR5xjaeNG5ShiiLK9R8SYKMO9QZLtbVig8/lC2Ar9sv0hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744912907; c=relaxed/simple;
	bh=hrY06wZ/lCjT4SR8swXoEfICFl8fq0IM3ngoBDWxNQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Au3CRHYB9t5mVwgpptq5ewG+djpWRgKmaVh9IULOBnDXgOfBa/bss4c15wJLdhsC/0Rj40xqOUzBGfCcYjfmECElCIpbZGyhwXV8rqo/wxkrvLi6FdF0uZzO2dev9hkYRVh3g+Ht61Z2EcA0jYzzG9FRgKr/hZoAPTJUAWqJPvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Wt5nIaRk; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=bSErsB4OWqx/9+Tbzvj7ylkAv0Sp5+vAreUi9Ph9D64=; b=Wt5nIaRktXy2a/MQ+85J/HIyW5
	EBP4qm+0aHoDbUlDNPLw3qicQpVxQQqPDXJ82tQgayBWNfDMyAkjcAyWA+Osiy0TCZjn/qbgYituG
	rtuO/JCsC7MU2JYeHIjUzJ5HHqO4nk5HklujYTixlTqSZstHXceCvpnZwf9uncmWZgKg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u5TYE-009oZl-Ss; Thu, 17 Apr 2025 20:01:26 +0200
Date: Thu, 17 Apr 2025 20:01:26 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v8 4/4] MAINTAINERS: Add entry for Renesas
 RZ/V2H(P) DWMAC GBETH glue layer driver
Message-ID: <d53d4cc9-c1db-432c-8ab3-3c4c71e1b9ac@lunn.ch>
References: <20250417084015.74154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250417084015.74154-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417084015.74154-5-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Thu, Apr 17, 2025 at 09:40:15AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add a new MAINTAINERS entry for the Renesas RZ/V2H(P) DWMAC GBETH
> glue layer driver.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

