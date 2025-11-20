Return-Path: <linux-renesas-soc+bounces-24894-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 618FCC759B4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 18:20:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C90C84E8408
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 17:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AA8B393DCA;
	Thu, 20 Nov 2025 17:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ib+c8rVw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDA9372AD9;
	Thu, 20 Nov 2025 17:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763658695; cv=none; b=lDSgvbz3fElfCNNfIiQNny51uw4IlmEkkWr8oQJawBGRR9L+62HtmIbkCJWJnG4b/a9yXkX9TBpRu2Slkk5pNz28+sZlSAqDK9I3lX9MbHKhK01VDJGtxiWTpiB+6ciKRO45DKDSk9VdVE2dIxGqzRrGnyK2R0C+05oqKPCM5xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763658695; c=relaxed/simple;
	bh=5wzxcrvaGv7atXkrXN0bTcUzJ7kZ+lrRO/axNUDhPZs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=p8RwUTBfM2NiPVFYJ8xoBIsynW5cXANx1qf9+D/GTCeCNXj0WkNVyxLSTyclyOWMh0LtNbYV4Ygq/zqbxm9Qk1VP4w4/eqQFn2tuUF+eGM9/smave+hYoPe4OmpTXhLIxrVyG7y9FFQO7ggZJPpJZrp0+jrmaaT3HNOePIb07ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ib+c8rVw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E92EC116C6;
	Thu, 20 Nov 2025 17:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763658695;
	bh=5wzxcrvaGv7atXkrXN0bTcUzJ7kZ+lrRO/axNUDhPZs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ib+c8rVwYpC7/0y/ecf7L6ifkoJNECXqkp4IPKJdaA1QOfDrYCGMV57LIhXktOBlL
	 +gy7JLJo32O9x+5N05aHEjO1YD6n7DhQlWrekY1RRZ4VD+0tXUNyT7c5HMfizGIETl
	 lTwW2U8+/Hu/JNfTVc0mMSQtpDKEu/2nxSyeDYnVxOab8uw87WffcPM9nJkG4Y5F4n
	 F3WftcpJc7OzIH1UB+GGDDXKoOvnymwxbAf0veH4I1aeGMHp7lNZ2DRibXnNzrF9N8
	 ZwC2+p8n50AgDh/m1r0BBOP3LuhbSwq8NcKOlXe91MupXI1nrr6e/Xrmoq0M+figlo
	 waMvlbd3JpD8w==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, p.zabel@pengutronix.de, geert+renesas@glider.be, 
 magnus.damm@gmail.com, yoshihiro.shimoda.uh@renesas.com, 
 biju.das.jz@bp.renesas.com, Claudiu <claudiu.beznea@tuxon.dev>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20251023135810.1688415-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251023135810.1688415-1-claudiu.beznea.uj@bp.renesas.com>
Subject: Re: (subset) [PATCH v8 0/7] Add initial USB support for the
 Renesas RZ/G3S SoC
Message-Id: <176365869114.207696.6136305677225848114.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 22:41:31 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 23 Oct 2025 16:58:03 +0300, Claudiu wrote:
> Series adds initial USB support for the Renesas RZ/G3S SoC.
> 
> Series is split as follows:
> - patches 1-2/7		- fixes on bindings and driver for USB PHY
> - patches 3-5/7		- updates the rzg2l-usbphy-ctrl driver and documentation
> 			  with support for setting PWRRDY though SYSC
> - patches 6-7/7		- add device tree support
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: phy: renesas,usb2-phy: Mark resets as required for RZ/G3S
      commit: bc6f8b756c89d831c91a65ef9f3b5ceabdbae441
[2/7] phy: renesas: rcar-gen3-usb2: Fix an error handling path in rcar_gen3_phy_usb2_probe()
      commit: 662bb179d3381c7c069e44bb177396bcaee31cc8

Best regards,
-- 
~Vinod



