Return-Path: <linux-renesas-soc+bounces-14873-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB90AA7178E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Mar 2025 14:30:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7104F3BB453
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Mar 2025 13:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165401EDA13;
	Wed, 26 Mar 2025 13:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="M/lMZ4t4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188FC1EA7E2;
	Wed, 26 Mar 2025 13:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742995751; cv=none; b=PJ+ZngUtGe7+evj7OdD42qwGUHhTwmRMK0kyK9rNxgwOrCV3hhqNDohyZPfRiVmoQdg3PBNHrmyJRzwBp+8QDxK/HeOU3bOYaf52jyWH1mefXv3WAi+xXG95fu37cvqVAYXCLH9XwNI1IKOEOxN3bHPxn2SaIZ0P1Akwn2r9Hsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742995751; c=relaxed/simple;
	bh=kguJJhPYz5/htA5NtVTKhdOGS30Px3fhtT4b5StUkJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ESnoDBzQbkBfYZPocBxqWMGrQrVVrt1uKv7fLSN1ECIjVy0G2mL+tsUV8CJYpLLByhEktyWNuAWnZcPyNehgQDxa+svkCCHYUgv0MM2ZpvneulIdcjzShGLvJ30oMg6akBT+sD5GSTbDlxaRrVuC1q+Qk66yXWr/scoO8Wjk0RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=M/lMZ4t4; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=SDoR5FFj6YH1ZnnsoIj+TX7WHGm6lgBkuRdiMaNLP+M=; b=M/
	lMZ4t4tXBoj9E0BbdK7E8hljdWhfA68URJAb6/eMfKFzJC77lgGpoV/qHlqHodmJy7CPN8aIUBP0L
	aPly6jW1NkoL9FC0P+x5LbQqzO52XvMxlCRvRpE9ejfsaBfnEY4Tt/Zdka5dH6nf5I2VoOSYwcAX8
	bQnxYT2el98jskY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1txQoL-007AgP-Ue; Wed, 26 Mar 2025 14:28:49 +0100
Date: Wed, 26 Mar 2025 14:28:49 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jakub Kicinski <kuba@kernel.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, netdev@vger.kernel.org,
	Jose Abreu <joabreu@synopsys.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v4 0/3] Add GBETH glue layer driver for Renesas
 RZ/V2H(P) SoC
Message-ID: <d614f117-d07d-4ac8-b5e7-7114a3ec8404@lunn.ch>
References: <20250318205735.122590-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8tBh1Ev-8=0vcmz0XB7iqKzZZ5dKefrZCrY49Je3KTCAg@mail.gmail.com>
 <20250326062148.152e3daa@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250326062148.152e3daa@kernel.org>

On Wed, Mar 26, 2025 at 06:21:48AM -0700, Jakub Kicinski wrote:
> On Wed, 26 Mar 2025 12:52:17 +0000 Lad, Prabhakar wrote:
> > This patch series has been marked as "Changes Requested" on Patchwork,
> > but there were no review comments on the series. If the status was
> > marked as "Changes Requested" due to build failures reported by the
> > kernel bots, I’d like to clarify that the failure was caused by a
> > patch dependency, which has now been merged into net-next [0]. As a
> > result, this series should now build successfully on net-next.
> > 
> > Please let me know if you would like me to resend the series.
> 
> Don't send patches which can't be immediately merged.
> You will have to repost, obviously, and after the merge window.

Just expanding on that a bit. We do more than build testing of
patches. Some runtime testing is also performed. So if they failed to
build, they cannot be fully tested. Hence the request to only post
patches which build.

You can however send the patches as RFC, so we know to ignore them for
merging.

	Andrew

