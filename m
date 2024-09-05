Return-Path: <linux-renesas-soc+bounces-8727-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC57696CBB8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Sep 2024 02:20:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91F951F28873
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Sep 2024 00:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB25FCA6B;
	Thu,  5 Sep 2024 00:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dJ6LdzCA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A299CCA64;
	Thu,  5 Sep 2024 00:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725495632; cv=none; b=YoJOh58rT6O8xGKREmHRGxh8DzuCQ/JZqSDzedmUtpB0hIYViTwE6lK7IyaXlGaKB+yzHEby/V5/jWldVP3vbaf6oJ0y+bIPYAf6CVJ1clTpXXfWWzO8vl3BjRJ/54/wXgN18Jrv1PVOGy/lknNrXm3x50FzBbjHQseyURsm16k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725495632; c=relaxed/simple;
	bh=wYVmpyE/1QXYWH0zGA8Q0kGiKXAxLJEbPTA5RnydJC0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=G3KKoV6YK2JdMwI9A8pQels2Eh1dJzVhy/9EUvJ7rXFvAx5KbqYPoGoBAEMI+vfPhV5TrN/JnXIJl1lnWlY1BgeHk/v4vZ7xcbbXwwPlUu4m35+uz3CutyTkNVe+X3xMnNktBSKwZXshxjym+kBJbC6bMbJ/7iTG7J9TI+r4te0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dJ6LdzCA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7301AC4CEC2;
	Thu,  5 Sep 2024 00:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725495632;
	bh=wYVmpyE/1QXYWH0zGA8Q0kGiKXAxLJEbPTA5RnydJC0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dJ6LdzCA82IH1MQM1F6jqV0c3zgqN5xNz2/5n4s/TYXDNySy8/elJS8OHaIwlgQPT
	 7HX1MAK4o/mgqWTszYoGCddIAsNKQLZ0PHfqjEVXiSUweJIti68vtbhCK/pYGPl2FF
	 kFq/Gj5ps0Bbm4+iFEtCy3R+DA4QSclWGoHn3dLp+b7PWvA+nqD4pCT/vWekER2McJ
	 cqpFUFaNS9oa2EEMTMEblcOmkcfCORuP+/rgP4lvFVZmCmV51VlNRG8q1l2Hp4iogY
	 Cu9V09meubN92CdbMu7ywZQxpWzs0jZD5tpxnmfdOcO9bnf45dozt4wMn6CCKF2lpH
	 FwQgczR8Zd8YQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E203822D30;
	Thu,  5 Sep 2024 00:20:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next] net: phy: Check for read errors in SIOCGMIIREG
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <172549563324.1208771.16266964158237189171.git-patchwork-notify@kernel.org>
Date: Thu, 05 Sep 2024 00:20:33 +0000
References: <20240903171536.628930-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240903171536.628930-1-niklas.soderlund+renesas@ragnatech.se>
To: =?utf-8?q?Niklas_S=C3=B6derlund_=3Cniklas=2Esoderlund+renesas=40ragnatech=2E?=@codeaurora.org,
	=?utf-8?q?se=3E?=@codeaurora.org
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  3 Sep 2024 19:15:36 +0200 you wrote:
> When reading registers from the PHY using the SIOCGMIIREG IOCTL any
> errors returned from either mdiobus_read() or mdiobus_c45_read() are
> ignored, and parts of the returned error is passed as the register value
> back to user-space.
> 
> For example, if mdiobus_c45_read() is used with a bus that do not
> implement the read_c45() callback -EOPNOTSUPP is returned. This is
> however directly stored in mii_data->val_out and returned as the
> registers content. As val_out is a u16 the error code is truncated and
> returned as a plausible register value.
> 
> [...]

Here is the summary with links:
  - [net-next] net: phy: Check for read errors in SIOCGMIIREG
    https://git.kernel.org/netdev/net-next/c/569bf6d481b0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



