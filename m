Return-Path: <linux-renesas-soc+bounces-24893-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B32C75926
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 18:12:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sto.lore.kernel.org (Postfix) with ESMTPS id ED57728A58
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 17:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DAC136CDFF;
	Thu, 20 Nov 2025 17:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tmXb6Be8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62047372ACF;
	Thu, 20 Nov 2025 17:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763658691; cv=none; b=i+oBE/jWSthJ4myOQ/sKJ/oFy3K7nBun1kyQ0AEoVK4oN/nl/XpzCVYnYcpVBlaCIdaJZb5NNozjUUiZFa/mzkn0bdVGfIS2kob9kNyOXlVjDIf2WI3txConjJFWItHpbDX3fuQtqAw1fiRwmm1pz43mdji+KqtHiuuAwgR9TFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763658691; c=relaxed/simple;
	bh=4gDXXfR4OBn+Cslup+GRLwS8qXLrh4q0g5uO3UkJ8II=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mRP5RdiiBBLmLSZP73JVuncqUHeNJSVjCq+cD0aIE381hG+RiBathJWHT5OmWTpbuc+Ga6meyY9zyCGrzPAaniqAnmP9nGiyEDnZZBljKex/SXS/pAofZc0GQ3eL6oII17he8W4pWbRI3qyUuXch2ENeSJYl7A+7vsVCR8dVj+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tmXb6Be8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C10C4CEF1;
	Thu, 20 Nov 2025 17:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763658690;
	bh=4gDXXfR4OBn+Cslup+GRLwS8qXLrh4q0g5uO3UkJ8II=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tmXb6Be8FhtMCgdNITbjBlcazXKHIevTC4ZaOulWLhsuqDAdWNYoYxnIQW+x+5yMo
	 o783cthk2L3cLPXEfMAtSaUg1pP9w3P9Bw/De1mJ4QMO6lDTGtJJT69kCJE99s/G6a
	 pykoKQFGSC79jLqRA5l9DEFDvxpfZxR0usVVNW1XCqjIO74o24ofboUKynRP1d1k5K
	 z6eB4xWNXxQRE1/z9iPWTQYxMTSiaH9g3J47AdUVJ1OKEZIKv5IbPLscx3FxNFQARF
	 PYZMSBdAYr435h4Be/TipdUmUPW4KQNW1F8GyToGo6gWOfsfRFfKAoyXiNaRR44Qo8
	 31OckAcxn6hUA==
From: Vinod Koul <vkoul@kernel.org>
To: yoshihiro.shimoda.uh@renesas.com, kishon@kernel.org, 
 geert+renesas@glider.be, magnus.damm@gmail.com, p.zabel@pengutronix.de, 
 Claudiu <claudiu.beznea@tuxon.dev>
Cc: linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20251119120418.686224-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251119120418.686224-1-claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2 0/2] phy: renesas: rcar-gen3-usb2: Add suspend to
 RAM support
Message-Id: <176365868797.207696.14151835181332093165.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 22:41:27 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 19 Nov 2025 14:04:16 +0200, Claudiu wrote:
> Series adds suspend to RAM support for the Renesas R-Car GEN3 USB2 PHY
> driver. Along with it, a preparatory patch was added (patch 1/2).
> 
> Series is built on top of patches 1/7, 2/7 at [1]
> 
> Thank you,
> Claudiu
> 
> [...]

Applied, thanks!

[1/2] phy: renesas: rcar-gen3-usb2: Move phy_data->init_bus check
      commit: 79d9db7f7a0c94b2b505666513879ac470c7e12f
[2/2] phy: renesas: rcar-gen3-usb2: Add suspend/resume support
      commit: 942a7a6bf4c6a8661324539f686a34c9448610bd

Best regards,
-- 
~Vinod



