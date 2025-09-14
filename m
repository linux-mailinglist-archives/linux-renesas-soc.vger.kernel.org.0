Return-Path: <linux-renesas-soc+bounces-21847-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1196FB56C4C
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 14 Sep 2025 22:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7A1717B689
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 14 Sep 2025 20:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56C42E1C7B;
	Sun, 14 Sep 2025 20:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QeyRXE6G"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A188E2DCF69;
	Sun, 14 Sep 2025 20:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757883237; cv=none; b=h5BuUlbzWLUx2QkSb31HjgUG9xsLPFzZDkv5pptqpbuk1veMP4fOrrRjTRM87/OWQ/0b3RETd9+wjgqUxcOFuXPa6V+aMUU4sRD7Ws0wa+ZnbLfb2nYRLewb1Kb0SotpUgmE/fAs8g+7s3XZYvDSK7Q79GQ4BfGG4Bfw4iz2zEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757883237; c=relaxed/simple;
	bh=JDdCHIxDfQ3AJnTMXc0VF5Q2RCCsvH4MDbxZQYKi8EE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IlsRfmUmmPq9f3PsILMICW1MYw4Z36zpyZrI3EMY9nuu7EZIXpzd9vzqi3WkuhN953cnjLgHMSsEhIsY942jWkxx0SVAnMYBIuNNOp0Jbj1Cfdk2AvhpJ3amMWwS/IRK6H6T+2HNh9QqyBpMBVzyQLjRIM/ToCeII/fLRNYImtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QeyRXE6G; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EAF5A4E40BD1;
	Sun, 14 Sep 2025 20:53:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BEB056063F;
	Sun, 14 Sep 2025 20:53:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 694A4102F2A7F;
	Sun, 14 Sep 2025 22:53:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757883233; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=7xQaSzl/TxXQwIRozChDy9Tm+5Lzv6IuUtQ4mWGkAgY=;
	b=QeyRXE6GcF8lBbDkyGWh9+amy8cLIw7ntDBnRdyEXuiNgbP/aYoh6ADxf6vNCPzUiLbz0F
	pqaiy+sbbdG2o9oKZktxDx1dDI4uxN0/sBFrVxSnvD83SBEysQ0avybyiKOjr5sYTE9tPe
	b/1oKLTWKDHonJo0H/Wd3K/QCeRRn/80eSjNCN5V1/Kd0F2XnNaWyabckJAKCr6WVPxrpa
	sUKz/kGVXdZ683iF5BVJ14YiLuBUNjUEmCYxgNMh9spHX+pvpKCxk8MOB+iMMJF08n7oEw
	HybkFAX8QwxSbaRFsKk6frbQdI0zK8I0ijJ3jv9xtp6ONwqVKKvRmp8aYnVPcw==
Date: Sun, 14 Sep 2025 22:53:46 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2] dt-bindings: i3c: renesas,i3c: Add RZ/V2H(P) and
 RZ/V2N support
Message-ID: <175788312845.382502.12492963502213477306.b4-ty@bootlin.com>
References: <20250908093930.12591-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908093930.12591-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 08 Sep 2025 10:39:30 +0100, Prabhakar wrote:
> Add device tree binding support for the I3C Bus Interface on Renesas
> RZ/V2H(P) and RZ/V2N SoCs. The I3C IP on these SoCs is identical to
> that found on the RZ/G3E SoC.
> 
> Add new compatible strings "renesas,r9a09g056-i3c" for RZ/V2N and
> "renesas,r9a09g057-i3c" for RZ/V2H(P). Both variants use
> "renesas,r9a09g047-i3c" as a fallback compatible to indicate hardware
> compatibility with the RZ/G3E implementation.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: i3c: renesas,i3c: Add RZ/V2H(P) and RZ/V2N support
      https://git.kernel.org/i3c/c/12ba31828681

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

