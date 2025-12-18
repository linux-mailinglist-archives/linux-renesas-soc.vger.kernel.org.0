Return-Path: <linux-renesas-soc+bounces-25899-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D23BCCC981
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Dec 2025 16:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E09A30194EA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Dec 2025 15:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07CBF358D30;
	Thu, 18 Dec 2025 15:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hVcrjQTd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A3C358D1A;
	Thu, 18 Dec 2025 15:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766072975; cv=none; b=TFheQdBZfAXDZTNq4us3ivM7bSAToyfd7aI5FKIAtsEamATtpK9mgL+yBk7fEkOmoYtLvlWsr4S6NqIllh0/X/3eURNuhA9KJw4qyx1Q5qtv7NxKcNIZmattPkPFg1pNAXv42mD8GENO8S0RNopSbQc/EizF8gMGKI85xnlqz1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766072975; c=relaxed/simple;
	bh=8mW2aD4UBObqi03Dld0xUMtjHcv+gt9U8kqqcPQHt1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RI0Cn7C8tgBtWhUe7O1PoEXWJEXsMKDYrOvtKLAFzvJj6Rb7j+sbNNq2eLFVcdVTm76Fhu2bNhLFCsvtDtSimNkLxgvCy2TjSVFJp0v3Q4xI5z8royGBVr2bGybknIJ6VDGYuMxFD1Jvv572gmgh3U+ZDU4x0182oLNp4F8aVmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hVcrjQTd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC832C4CEFB;
	Thu, 18 Dec 2025 15:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766072974;
	bh=8mW2aD4UBObqi03Dld0xUMtjHcv+gt9U8kqqcPQHt1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hVcrjQTd9ExLAGGG7a8y3JonfT97FxOYBFxnUqUXTXl8nKgbLaMSDV0xBLO663Npa
	 swspwOFxkrB/beoY0/YStd9ld/SpYr151oKTRnzNpUikKr16TjIVrVN7P/RfbiCJM/
	 xw/RNm7W9MMelCilslf1d5GiUUn0yQnh6oSnzFrc=
Date: Thu, 18 Dec 2025 16:49:31 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marex@denx.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH 5/6] arm64: dts: Add TQ imx8qm based board
Message-ID: <2025121810-tactless-pegboard-feb5@gregkh>
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
 <20251218154412.1524249-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218154412.1524249-1-alexander.stein@ew.tq-group.com>

On Thu, Dec 18, 2025 at 04:44:07PM +0100, Alexander Stein wrote:
> * TQMa8QM on MBa8x

I do not understand this changelog text at all, sorry.

Please be more verbose.

thanks,

greg k-h

