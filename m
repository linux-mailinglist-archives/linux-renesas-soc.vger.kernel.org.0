Return-Path: <linux-renesas-soc+bounces-24742-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BDFC6AFD2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 18:33:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 26B2A4E3915
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 17:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55AC736C0BF;
	Tue, 18 Nov 2025 17:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I18UtjqP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28ACE36C0BC;
	Tue, 18 Nov 2025 17:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763486313; cv=none; b=RirjN2yo85FrHmN8oN/51YK5SANVijYfpvrAewKp1AyMmo9oYGpbykVc5hlwt9gLokUrTtMgtF0BC4qp3yrYhZRj5kxJFG41qE2FbPQ92WWYCy8G3xLs6Eo/uVnLx2mDRWUu9I4/YpkAWWodtcxi9/9RgApOozvn0A4PSPd+/xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763486313; c=relaxed/simple;
	bh=RiGFzfXmZO4+VW2Jlm31IvVgpbQb3+giKHuHjhhJwgs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=o0E/QKCI5RXM4eQYAyZoCnLe++dMOGJIq5VJn8s+1R0h2o1evPI8+ZLS9r4mLpWfKKSGBrvbKovE4UIpzjcQrkTFhxTSEwToXKNmbcvHsU1KkEwyiJW7+XMhGNNLaYWcaneB7WTYInK9SMmNOvyRFR1tI3KF5R71at8//iQ+kRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I18UtjqP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96638C2BCAF;
	Tue, 18 Nov 2025 17:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763486312;
	bh=RiGFzfXmZO4+VW2Jlm31IvVgpbQb3+giKHuHjhhJwgs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=I18UtjqPqYnixIi5FDSgas4/atMW1EQ9o6lY185VTZaiaL7ZvAESGiRL0HYiZwad/
	 LiwAxvGPNNH3jdl2mbMLR203FMWcCXM5EoEJkMkEFidY+0x45ecx37EfDwsrl1P9tL
	 6fINqEuE6XFGLiBTXzsRZcnevpFTzKKGZUVdvOWrcPlbOoLzEKnYj/lDLdFabnRQxT
	 jJiviQ1Smlvrx+oVGwuiO3b1AsxuzwroINlTog92wzexxRpVz1/5ssa3nh4COnH/QJ
	 V4kXSrWC5b38H3emVxqHg1BcR9gCu/sgsfeLqbNM1WD9qdKJqGqblpm/OuwHk4LSkv
	 kbhgcrr9aRrfA==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251029084037.108610-1-biju.das.jz@bp.renesas.com>
References: <20251029084037.108610-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v4 0/2] Add Renesas RZ/G3E USB3.0 PHY driver
Message-Id: <176348630816.62598.8877829293827996179.b4-ty@kernel.org>
Date: Tue, 18 Nov 2025 22:48:28 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 29 Oct 2025 08:40:32 +0000, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> This patch series aims to add Renesas RZ/G3E USB3.0 PHY driver support.
> This module is connected between USB3 Host and PHY module. The main
> functions of this module are:
>  1) Reset control
>  2) Control of PHY input pins
>  3) Monitoring of PHY output pins
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: phy: renesas: Document Renesas RZ/G3E USB3.0 PHY
      commit: 4f816512aaa1fa3b74df7473ef771ebef511255e
[2/2] phy: renesas: Add Renesas RZ/G3E USB3.0 PHY driver
      commit: ee5f1a3f90a4720f89fd1e250fa6754470da1510

Best regards,
-- 
~Vinod



