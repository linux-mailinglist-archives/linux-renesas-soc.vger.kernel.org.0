Return-Path: <linux-renesas-soc+bounces-21359-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD68B44248
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 18:09:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3172A453FD
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 16:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BACED2D12EA;
	Thu,  4 Sep 2025 16:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fwATaZHN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEDE2367CE
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Sep 2025 16:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757002136; cv=none; b=LRE4W8fgyqE+raclxGdiTSJMz8nwOZPtrPr/XPXQDIJguPjgDXvdXHCqrSU4tHNd6na7CVYOSjgSsqxqopBRjMnwsTjLa5h1qByCNzvnZOW2kPywtrC0Yx3h6uIe1flBbhNSMnbyaHZUYXuJPE7b5FKY7SMcsBxVlLQC0toIyLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757002136; c=relaxed/simple;
	bh=fGXsrzt6u8YTKnC/hBZpqHUAVKGxcAQu9zwDNMaiVlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/WMLT63nHqMwVD+BH9C8K3GzrL0AoR+wlm8zo2rui/jxzzMXIdYfpyfJF9IIElXZYQnlsz/8aKK0qoAGejaABUs/yrhuu9QQNnFPrQOoXI4cs51Mj/XHYHWELCNLTmI27iyDfGMQ5yaFRitwDHJDT2qUooX35k1J1BrMcnzuY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fwATaZHN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=fGXs
	rzt6u8YTKnC/hBZpqHUAVKGxcAQu9zwDNMaiVlo=; b=fwATaZHNVLw5UQDUrrt/
	Vs66TdoJ8AIiN4XiINPlBk6/WdC3Ye80fUOSfLwNnnIZp7G+XlFknHpfUqRYocFC
	ZRqPaAIsAC7XlIwfQwfnK/n+6qci6i/80I1N65Srr72JaD+FlcMN8L822lp6R6Uc
	tUq1fD56DjxXBQTmQi9ySso1HHOdGaserRCikoBL0kmsV1fSwrx4X+ueJA/HAfIl
	rTAuPePQcDgHclAUfcEAO8XoQi6b86E73VrRxIfIPwYiw4vS6vgT85+31+6SSkhR
	ukCuGscr/4q26PzKnyu7lo1Zp2Upivn5l5M2Ch0A+xIQBlMuZc6zv2ArwTUjYvNE
	KA==
Received: (qmail 3727582 invoked from network); 4 Sep 2025 18:08:50 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Sep 2025 18:08:50 +0200
X-UD-Smtp-Session: l3s3148p1@gcfS7/s9SN8ujnuV
Date: Thu, 4 Sep 2025 18:08:49 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: i3c: renesas,i3c: Add RZ/V2H(P) and RZ/V2N
 support
Message-ID: <aLm5kbgRIcomBo6a@ninjato>
References: <20250904160305.247618-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904160305.247618-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi,

> Add device tree binding support for the I3C Bus Interface on Renesas
> RZ/V2H(P) and RZ/V2N SoCs. The I3C IP on these SoCs is identical to
> that found on the RZ/G3E SoC.

Cool, has it been tested with devices already?

> -title: Renesas RZ/G3S and RZ/G3E I3C Bus Interface
> +title: Renesas RZ/G3S, RZ/G3E, RZ/V2H(P) and RZ/V2N I3C Bus Interface

I suggest "Renesas I3C Bus Interface". The above is not going to scale.

Rest looks good from a glimpse!


