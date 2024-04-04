Return-Path: <linux-renesas-soc+bounces-4337-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 104F1898569
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Apr 2024 12:51:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C5211C21FAA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Apr 2024 10:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3814C84D0F;
	Thu,  4 Apr 2024 10:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LF7TKBnD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BBC84D08;
	Thu,  4 Apr 2024 10:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712227829; cv=none; b=S1Tf0JkSTjhRw+HUvbul0+GTaX1tfkKO5fbM865YEyySlJPP0KfBoSwEW7YJuDxglreB4OfBm/8oxi1cLg0EL+cgr7WM6lsB76tYdFmiJMIEoAG+nc9EKBqywKgt8FKSK4owypaX/0yW0RLqZiWHoGEyoMtbN/sf0o2MqM2CG+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712227829; c=relaxed/simple;
	bh=+IMhv+hHLcEPWxDhhfXnyLyfIsrX37Q+lDnPXU2T1oc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=WhzEfeTBPlFzh22I109gGtN2qsUk6iDhKFeomQC4efURbrxj1bMBLhg7stb2LiHvB0QKevO+jZVdTXGFeplqj5STsPO4HWnzTxW/h//0LJJdBFPY70bbfF/b/6tgfeFtD3uCvZYG5fhbFuji421vLFxG5ikyNhsWLWCSTQpYYlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LF7TKBnD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F87DC43142;
	Thu,  4 Apr 2024 10:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712227828;
	bh=+IMhv+hHLcEPWxDhhfXnyLyfIsrX37Q+lDnPXU2T1oc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LF7TKBnD/WUDxIrNBAXi+VFhnDwf+bw7kipZZmlvMkAw/EcavIjvBg3YlIRBoFFsu
	 5++W+Ee2GlQctXAmifzxYuZfH3JPe0YHYVZ2yoP5wFJ128fEswqNTyx7F9o6XqJoQb
	 Wekn1zn0EN6IEVR2ql2APR6pZuffdtk/TcnI9j/qWvWE2SpCUedufEf4kRI50UU5pG
	 72t9JYB9qzqkq+sO7cHlBu2cZ9EKb352KjeirAaC2AedrLuaFuS6i9+5O9h/mVBFGM
	 98aOKI7eGbOJww6jnOBrz97MFpLd4FbLcR2GjeIRZ2A3d1k1nDv1VPbeyjBNy47jIU
	 EX/Ou6ZbvUTCw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 65928D84BAD;
	Thu,  4 Apr 2024 10:50:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/2] net: ravb: Always process TX descriptor ring
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <171222782841.23550.12563797338225580141.git-patchwork-notify@kernel.org>
Date: Thu, 04 Apr 2024 10:50:28 +0000
References: <20240402145305.82148-1-paul.barker.ct@bp.renesas.com>
In-Reply-To: <20240402145305.82148-1-paul.barker.ct@bp.renesas.com>
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, niklas.soderlund+renesas@ragnatech.se,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue,  2 Apr 2024 15:53:04 +0100 you wrote:
> The TX queue should be serviced each time the poll function is called,
> even if the full RX work budget has been consumed. This prevents
> starvation of the TX queue when RX bandwidth usage is high.
> 
> Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
> 
> [...]

Here is the summary with links:
  - [v2,1/2] net: ravb: Always process TX descriptor ring
    https://git.kernel.org/netdev/net/c/596a4254915f
  - [v2,2/2] net: ravb: Always update error counters
    https://git.kernel.org/netdev/net/c/101b76418d71

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



