Return-Path: <linux-renesas-soc+bounces-16234-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D88DA97C79
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Apr 2025 03:50:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D9827ADA89
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Apr 2025 01:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44AC22641C3;
	Wed, 23 Apr 2025 01:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gw2Xi4CO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B1D2566DF;
	Wed, 23 Apr 2025 01:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745372896; cv=none; b=Oz1nP4S7Vb63zXNMJnZqtc65saFjYtjyr+G5veRe7yM2pv6H/V3rfVb8kv55XfP0XP/+WL1z8/0UQhA6ECh7BwIPLHKaOJZRARMxXhhYzhBqlgzHtTAPTXnspuFaDdGxl0tzB+lLIRld2m/L5eyxq0jV2Z0ItqddP8brVv5bh0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745372896; c=relaxed/simple;
	bh=b2Ty2Y4IHTlG+wCuGIQJJ+LjqBQxitk5tYKjHEox70M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o+TM2wiHM2KLyb+3zmhZqX4b4GHWp2wz5Q5+VeT3CFrtlf/Zt5Eb2m35p0Kv3AWGUwj7IVkrDj2lc16IbRY3WcS2AvCityKLuJ4nmh7TOx9Im32X6LkBrC7x2Wc9VbDYINtctaoPKUIst3Bs0VdjZOOpFjh/o9tZ6YpkDY7EJrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gw2Xi4CO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6879DC4CEE9;
	Wed, 23 Apr 2025 01:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745372895;
	bh=b2Ty2Y4IHTlG+wCuGIQJJ+LjqBQxitk5tYKjHEox70M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Gw2Xi4CODtGpUsSD2n7vzegKZNAZrX7v7cP5MoWILH/deNzm1Mc6zYYPZyjAgzEUP
	 b5RHT7XkZw9rcxU1kAdZouBfsUPF/Ea6MAS1C68foXvQn9KlVl1IUKD/p+MG0GKTiM
	 e7OhHfTpWbI2gj2556A0HiCdv0k1eWyDTlWcfRaeLCq1PCYJo5Qt8Npe4cXlvMXjQI
	 VGQ2xKKQRHKx628jjrIuDHLjjb4OtLDEEonf3W43a6W0ZNI6itZhkhcbkxzEAMvFtR
	 +xBrfrLCLoDih5+yyQ3T9OaZ0DOQcb76WYojV5Dr/7OoVmG/CXNhQCNblxrZvQCD9f
	 syV4wS6dwAtzw==
Date: Tue, 22 Apr 2025 18:48:13 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, "Russell
 King (Oracle)" <rmk+kernel@armlinux.org.uk>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Biju Das
 <biju.das.jz@bp.renesas.com>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v8 4/4] MAINTAINERS: Add entry for Renesas
 RZ/V2H(P) DWMAC GBETH glue layer driver
Message-ID: <20250422184813.02b21095@kernel.org>
In-Reply-To: <20250417084015.74154-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250417084015.74154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
	<20250417084015.74154-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Apr 2025 09:40:15 +0100 Prabhakar wrote:
> +RENESAS RZ/V2H(P) DWMAC GBETH GLUE LAYER DRIVER
> +M:	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> +L:	netdev@vger.kernel.org
> +L:	linux-renesas-soc@vger.kernel.org
> +S:	Supported

I'm going to make this Maintained when applying, please see:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#supported-status-for-drivers

> +F:	Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
> +F:	drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c

