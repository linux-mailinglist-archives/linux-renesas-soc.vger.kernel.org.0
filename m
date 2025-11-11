Return-Path: <linux-renesas-soc+bounces-24462-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D54C4E188
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 14:24:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 52CC54E6965
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 13:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80DA2336EFF;
	Tue, 11 Nov 2025 13:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="L4x6/pZ3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A66331A75;
	Tue, 11 Nov 2025 13:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762867427; cv=none; b=qRPRwlHVedo3GOIUQO465luaV2slpzbNLnJAZviLEhGn8+TQWSPabEVU3ivi4Fam+lSIA6saVvl3hxhklFovXybLl/kWvJj6J4wTDxwK+UOxbHVhcnnpf+FPdkxTNLTR0Yqnoq2Bj/yrx/Si3lbrfs95QrXOKm44+I58iOflK/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762867427; c=relaxed/simple;
	bh=7ev7hD2A8uKF1uNS8Br/14vX/hw22t4AgYbwoWxGJqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fgsePmFqrIdcX0b+oJOLR5oLdrOqus4XtgS3Ci95JveIo3Ux/LoL2OXWoFsXyMjmaxDY5d9SepDTZ4Wp3cdDilEFRxEac0Aurq6hAiUqnlgxVgb/2hU/cZslEt66B/qZHAlMXsIIExDECQgMewnYhr6lD0mHw0sEUstiAPdh5l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=L4x6/pZ3; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=5qxymBp9GB4UQdBJjwPk5UAkWsjQwEJnJTooqTUl26w=; b=L4x6/pZ3eb2S0PoM/dj6KXHWU4
	d6gtIVKgSqAYOzmaJUrjJ53OYNV2Mz3eyWFWQtoIektBE/edaIEIklyCucGt0qWEwaQPLlE+BGa/i
	GoVUff3FycoOFTpKWLGaf9m3Wp5nIBVn4M3R8Cdbu0ieUR0Fy40lPK01nsM8l0eyKouY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vIoLK-00DdGi-BE; Tue, 11 Nov 2025 14:23:30 +0100
Date: Tue, 11 Nov 2025 14:23:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v3 2/3] net: phy: mscc: Consolidate probe
 functions into a common helper
Message-ID: <537d14f5-b01f-4472-a69a-a8298bde5c68@lunn.ch>
References: <20251111091047.831005-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251111091047.831005-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111091047.831005-3-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Tue, Nov 11, 2025 at 09:10:46AM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Unify the probe implementations of the VSC85xx PHY family into a single
> vsc85xx_probe_common() helper. The existing probe functions for the
> vsc85xx, vsc8514, vsc8574, and vsc8584 variants contained almost
> identical initialization logic, differing only in configuration
> parameters such as the number of LEDs, supported LED modes, hardware
> statistics, and PTP support.
> 
> Introduce a vsc85xx_probe_config structure to describe the per-variant
> parameters, and move all common setup code into the shared helper. Each
> variant's probe function now defines a constant configuration instance
> and calls vsc85xx_probe_common().
> 
> Also mark the default LED mode array parameter as const to match its
> usage.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

That additional flag to diff made it a lot easier to read. Thanks. I
will have to remember that for the future.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

