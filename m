Return-Path: <linux-renesas-soc+bounces-21971-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F308CB8072A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 17:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8E0C3A358C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 15:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C9A032E749;
	Wed, 17 Sep 2025 15:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="GI2hr8NU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDFA2EACF3;
	Wed, 17 Sep 2025 15:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758121952; cv=none; b=GRC/rDHztz9SKGBW/LjdN8PLYkRTJa/gk8GcMMvhiB/5hR8Td/+gTkrqw8HEx4luZI5hIFjQQAQYGiPJebISL4la3DnU/NfUnkphNNKE3awDjMPlHhcWeTRYa21u1lW9+r3WyS3reV2ksG22LSJl4UFqc56gu/GhH98BlTJf0lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758121952; c=relaxed/simple;
	bh=fU8v0fIA14SUY+kAFYkLjnzFIT02aVtsijqSQ2zNf8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qs1pPcTUxiSVdKAGYrU9QIQ9nbvWNctQQ9d8AyKUlspN8j+9jM0N2emaOTGJEzwgPHEMUBJPjnGxw/I+qYk11KnEQ+tFx/NxmJAFQBRMVzI+g8flikLFwnDz9oKk/AkC2+FJRn1E+8G2IGsLROx8nWJe1FMSAXt1L5OLgfb0xok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=GI2hr8NU; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=SbUH+ytp/I7r/qS0bTCYNaSJzrM2N4H+oZ5XzytcBc8=; b=GI2hr8NUA/wBoWosZZr4g/4/8R
	lh/GHsVJEfQBe1JCCzTQcDmOYfx8xG4Lb9qNRvwPqQmVv8MP8Qgy7rc/DDVgKctW/899gLrFqCP/t
	VLGWtcNnnByIsFzV8Ahz0ux9ZpaNZ8sCdyE1SgnOcJj3s0pCJLVe4JZoNmBVJKweRSrM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uytpK-008hZD-5s; Wed, 17 Sep 2025 17:12:10 +0200
Date: Wed, 17 Sep 2025 17:12:10 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v1 0/2] Add Meta (Facebook) Yosemite5 BMC (AST2600)
Message-ID: <9bb9929a-8130-48da-983e-2901a7c3da36@lunn.ch>
References: <20250917074812.4042797-1-kevin.tung.openbmc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917074812.4042797-1-kevin.tung.openbmc@gmail.com>

On Wed, Sep 17, 2025 at 03:48:08PM +0800, Kevin Tung wrote:
> Summary:
> Add device tree for the Meta (Facebook) Yosemite5 compute node,
> based on the AST2600 BMC.
> 
> The Yosemite5 platform provides monitoring of voltages, power,
> temperatures, and other critical parameters across the motherboard,
> CXL board, E1.S expansion board, and NIC components. The BMC also
> logs relevant events and performs appropriate system actions in
> response to abnormal conditions.
> 
> Kevin Tung (2):
>   dt-bindings: arm: aspeed: add Meta Yosemite5 board
>   ARM: dts: aspeed: yosemite5: Add Meta Yosemite5 BMC

The threading between your patches are broken? How did you send them?
git send-email? b4 send?

	Andrew

