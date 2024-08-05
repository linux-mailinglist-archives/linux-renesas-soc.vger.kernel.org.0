Return-Path: <linux-renesas-soc+bounces-7736-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 71213948073
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2024 19:38:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0380B22EE4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2024 17:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7275C161327;
	Mon,  5 Aug 2024 17:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tg9mY5or"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B141607B4;
	Mon,  5 Aug 2024 17:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722879489; cv=none; b=XjJhvMzAgYy8p57lOYI2UhnkS3xK2et0S2EyKTXMgT+C52ScjMQtXYumWlp3V4NtkUkII64iVoDH+rVR8tRE0ugHyYv6cIXXxKps1ddUj4rFd3iihuUaCnQwRJS91+ThpFQnZrPuyitLVF1M3K7DwXExm9uHkKQqGpahJ11qpOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722879489; c=relaxed/simple;
	bh=e4vMl0WFJpgP+ZSRameP81OlamnwaQLw4/br8covySQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=L5rxjbQJ4I9BZcQrVUyC+9fm30J1dZmUmtUxg8/JmtinatpFa/3CLMQAD1ZTMjCY4N7//FFjIBEt7GeJlS64LdCvslQObMIxqX39xNLkl//hf7S+HVyZd/pRDcZMv8Bm1OyNJ4VRtVmiUlDSdsNLJsboC6aRfhKYjSyhKX9bJig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tg9mY5or; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3897EC4AF0C;
	Mon,  5 Aug 2024 17:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722879489;
	bh=e4vMl0WFJpgP+ZSRameP81OlamnwaQLw4/br8covySQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Tg9mY5orKc/j244dtVoELhFc6xIassbqcDWJuIcgX5xbb+MJMJJ7sSlp9DQ69xSky
	 0ux5CMvVfjRsyCvYl1VBCx3YwYjj883WVny+Ma7//E+mmyJXKbmtz4xdv+zB8gLsv2
	 +0xjk4+XKRMPhGs6ttyLxHFHfrkL+OFCmxHMIYmDVD4ejD0U9l45XF4L8pUjjacdIx
	 9JDNXYpdknThn07HhpzskXkGlFblsqcORbQ3P8n8/q5YUL/YU47f0CNJK9swsXWLbN
	 wcmd44aGyKULTWnSX1oU62o9K28FDapIdUOD1CrPMWIyVo/PFbSIDxdFmoBaBnVOFd
	 WEV4g7RQDK0XQ==
From: Vinod Koul <vkoul@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 geert+renesas@glider.be, magnus.damm@gmail.com, mturquette@baylibre.com, 
 sboyd@kernel.org, biju.das.jz@bp.renesas.com, 
 Claudiu <claudiu.beznea@tuxon.dev>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, 
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240711123405.2966302-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240711123405.2966302-1-claudiu.beznea.uj@bp.renesas.com>
Subject: Re: (subset) [PATCH 0/3] dma: Enable DMA support for the Renesas
 RZ/G3S SoC
Message-Id: <172287948486.489137.12345106993142276983.b4-ty@kernel.org>
Date: Mon, 05 Aug 2024 23:08:04 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 11 Jul 2024 15:34:02 +0300, Claudiu wrote:
> Series enables the DMA support for the Renesas RZ/G3S SoC.
> It adds DMA clock and reset support, updates the documentation and SoC
> dtsi with DMA node.
> 
> Thank you,
> Claudiu Beznea
> 
> [...]

Applied, thanks!

[2/3] dt-bindings: dma: rz-dmac: Document RZ/G3S SoC
      commit: 7492b2f89cf6d83e2a68400c43be25bd8d4cff4b

Best regards,
-- 
Vinod Koul <vkoul@kernel.org>


