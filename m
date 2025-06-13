Return-Path: <linux-renesas-soc+bounces-18229-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D4866AD807C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 03:50:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E70C17CB27
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 01:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65BAD1DF27E;
	Fri, 13 Jun 2025 01:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L1rhK76u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F68C1C4A10;
	Fri, 13 Jun 2025 01:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749779400; cv=none; b=QQEX0Bs3/JprkgvIoDll6PC7iI04F1W1Htxvz7u/VPNJ8eqju71Yjvv+x1w7FgTbTN6GD2D9ewCuvqZGTY232wohGbeNIhEMIK4MSqm1WMsPsrolkQlUdDqNf50Yhevq/IFVeVyrdPe1EUvitng0Cj2D0uCS7sJIuAoaXstjsD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749779400; c=relaxed/simple;
	bh=KvQpbekyf0KFJWKFpC0va1oh7HK6XoLcGPLoyuPICOE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=b6JiKJKeKkoAMDyIdRzcJ91TGuQRgILZ4Y6FhIR0AtAPjti8FNUFpBUq0DkpQATAvwRiUojHYCPVCygFP3uHfLgjvftw/X1tdY4WMCv0vXx/+r2GKDdoouRhxvlHf1iJz++wAQ1XVQwIVCJstCuN/5tPhqT4tVZAwQE+uL0u+ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L1rhK76u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC018C4CEEA;
	Fri, 13 Jun 2025 01:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749779399;
	bh=KvQpbekyf0KFJWKFpC0va1oh7HK6XoLcGPLoyuPICOE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=L1rhK76uFw5pFA95AqKZdJlBYNQr8MNwGTpKknRpIxCd4BCXGmw3COgzUe6dDDIa+
	 7q6TO7wwYsXkSE3PrJYCRJY/cerKIv8a7gFh3QCfIpIX47Nlv3Iw5dHQxlgE7b4LkE
	 rk5dIhapWMz01Mx3G820wVdjNl7ZgEKWBj6mqr4Fm9sJqQ4SoHXe8juk015s5fYlR/
	 rhrHiIlsBvPy8yNy0zclSthAXMJEP4QBHkVoTwpcUjqTjhT/WN1I+NorAl6CWmHVy1
	 6aDQ47dn3DuL+7wuAhhxcasj6K7x/ZyE1YJTeHygpja4tQywyipa9uuwOwYHZscghP
	 bYDp0g38BvR5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADC5039EFFCF;
	Fri, 13 Jun 2025 01:50:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] dt-bindings: net: renesas-gbeth: Add support for
 RZ/G3E (R9A09G047) SoC
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174977942950.184018.422586356896918128.git-patchwork-notify@kernel.org>
Date: Fri, 13 Jun 2025 01:50:29 +0000
References: <20250611061204.15393-1-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250611061204.15393-1-john.madieu.xa@bp.renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: andrew+netdev@lunn.ch, conor+dt@kernel.org, davem@davemloft.net,
 edumazet@google.com, geert+renesas@glider.be, krzk+dt@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 robh@kernel.org, biju.das.jz@bp.renesas.com, devicetree@vger.kernel.org,
 john.madieu@gmail.com, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, magnus.damm@gmail.com,
 netdev@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 11 Jun 2025 08:12:04 +0200 you wrote:
> Document support for the GBETH IP found on the Renesas RZ/G3E (R9A09G047) SoC.
> The GBETH block on RZ/G3E is equivalent in functionality to the GBETH found on
> RZ/V2H(P) (R9A09G057).
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviwed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> 
> [...]

Here is the summary with links:
  - [net-next] dt-bindings: net: renesas-gbeth: Add support for RZ/G3E (R9A09G047) SoC
    https://git.kernel.org/netdev/net-next/c/31b928210df1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



