Return-Path: <linux-renesas-soc+bounces-21733-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1E9B51E28
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 18:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D3C61C87795
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 16:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D56527CB21;
	Wed, 10 Sep 2025 16:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vHrJMIQa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042C627B35C;
	Wed, 10 Sep 2025 16:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757522849; cv=none; b=UdTOGzxuqDkpQdwO5wsGpUEWWlxH75zzGCl2QCzxRvTANYT7UvxrZ0bLTCBGI0lcpCOi5DrYseHXyOQZhoOOSlZMG49589iqo+Xwtgf7TS5+xyRZrQ42kPvWxNVtlBBZYCUPap3Rg8L1FT7w1MSy7Zgzll0T8dyS9CZCP3lyo7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757522849; c=relaxed/simple;
	bh=Vtn84X32CANz54Mc66T5jFTvifZ9RbwAhO8sHt69ICg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Y1rp3WTiDm0h4sHyXotFpmQ+T00gRaEr4pkkHWtw4QVAWUXZylw1fMiJmtStVsqSezH0pjshf/iEany5NoCjl2eXwPEjPDkqQDM+N1u/qop5zpYb8yWHc/OVG+1VQgRWvumoiGXh4ZrxRsHK5id247ug6mC2zd/NOv/SRgdsSnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vHrJMIQa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4527FC4CEEB;
	Wed, 10 Sep 2025 16:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757522848;
	bh=Vtn84X32CANz54Mc66T5jFTvifZ9RbwAhO8sHt69ICg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=vHrJMIQaabwbFB5pu8LdZTDT0UsQuGEQmMmfYAxaznBf1rkuUoF+bIGJqd+eWU5Uc
	 l9imGigKjp2zRU6TdAdmqll2yEXJNfke7OboqxfH3mEEXwBMYJayalDObp4XAV0mPm
	 +aDDfuJkczib07AdrDoaPfaa9ehgiFo3zcXFZ8K8nKcZaVE8wQ62G0a4HVoq0TLoPs
	 orBOtlzDq0xdfq9+6JmWfqhN/BU2JsdBf+4fB3pYv4ajSipXfY/7BeEdejBgXcRsDj
	 xZ9gM22RwMwkdYvxHi+DOuI25BaZdK2U29b6m9Yf2dIATY786S7Z88GOSjG+VlU8EV
	 G4TSGFvnPKU6g==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Michael Dege <michael.dege@renesas.com>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
In-Reply-To: <20250703-renesas-serdes-update-v4-0-1db5629cac2b@renesas.com>
References: <20250703-renesas-serdes-update-v4-0-1db5629cac2b@renesas.com>
Subject: Re: [PATCH v4 0/2] phy: renesas: r8a779f0-ether-serdes: driver
 enhancement
Message-Id: <175752284587.484319.14293466138559863532.b4-ty@kernel.org>
Date: Wed, 10 Sep 2025 22:17:25 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 03 Jul 2025 13:07:22 +0200, Michael Dege wrote:
> This patch set adds the following to the r8a779f0-ether-serdes driver:
> 
>  * USXGMII mode support for 2.5GBit/s ethernet Phys
>  * A new configuration step suggested by the latest R-Car S4-8 users
>    manual V. 1.20.
> 
> Changes in v4:
> - Fixed email threading
> - Link to v3: https://lore.kernel.org/r/20250528-renesas-serdes-update-v3-0-8413fcd70dba@renesas.com
> 
> [...]

Applied, thanks!

[1/2] phy: renesas: r8a779f0-ether-serdes: add USXGMII mode
      commit: d337c557581eeb008a06d66ad72152e871967fa5
[2/2] phy: renesas: r8a779f0-ether-serdes: add new step added to latest datasheet
      commit: e4a8db93b5ec9bca1cc66b295544899e3afd5e86

Best regards,
-- 
~Vinod



