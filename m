Return-Path: <linux-renesas-soc+bounces-14784-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A475DA6E28D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 19:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BDA2188E841
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 18:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03AAF263F5F;
	Mon, 24 Mar 2025 18:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nu6kL7n8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F6325E44D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 18:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742841621; cv=none; b=IAFVARMe2vcHUbzqM+gZ7xvNC6IdR5SXbW9u6qPtT5jjIBsPxEfdhyGIO1f/aylbe2uZrjRv4lljCxqNqxhQsB2efv1wdLxQK3um1KtMJ2G/hnAx1fEPbAi35XS+9TWGUA3asBEgS51fDOSsl3IXv1UXBgOMZR3mgmxwMfJA69M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742841621; c=relaxed/simple;
	bh=5s7hwDV47KUG4SJWcJC0vfCugncKPmw852JspX9/sFw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=rpSq/CAPosHfq1pu2zkkhjRhE0yyw/gxX72a7voYFDCFgnFAarA16jlatVTJsievh3wMZedpVXubmFvXIjiYtYS6ze4Z/9vBh5ODZ9PcKxZRXmoVKARTXw41uXfZdKFDGofummmbspGkB4KBOJATu+yVDEWZ0l/CxNWzKlMsfFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nu6kL7n8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB5F7C4CEDD
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 18:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742841621;
	bh=5s7hwDV47KUG4SJWcJC0vfCugncKPmw852JspX9/sFw=;
	h=Subject:From:Date:To:From;
	b=Nu6kL7n8FSWsqueJTrw5Sf4JeAwecWSXbLOJamDpRYz4GDOrlDOEc/gmTxhBW9jp6
	 IO4EmVZrtmctQI7VeqAAzt10pwDXHqD+Xk/74/QqiFqNGd+8/Bq9AqWIMi55ueWmgo
	 uHCevSeGpfbD5N2ubv9Kv33NJ9dQ9n8ncYa8ZB+tDfcvYknNopLws+YbqnVg70zrFp
	 QofeB/L7VZLiJLEdK0MYk07HNdxuklR/4h/jCQ9CMg+B1y3x8F2+MGhh+NCNy6LdGd
	 REKxT7enkQarkMkZL9AYMkESjGPEyHY6J2IRiJoMlqZ1z0DuYLPDR5hrrEr4vYVOPJ
	 cMp5KKbNggFhA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F2F82380664D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 18:40:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From: patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: 
 <174284165738.4128681.4591302431078444161.git-patchwork-summary@kernel.org>
Date: Mon, 24 Mar 2025 18:40:57 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: R-Car CANFD fixes
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Marc Kleine-Budde <mkl@pengutronix.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=941608
  Lore link: https://lore.kernel.org/r/20250307170330.173425-1-biju.das.jz@bp.renesas.com
    Patches: [v3,1/2] dt-bindings: can: renesas,rcar-canfd: Fix typo in pattern properties for R-Car V4M
             [v3,2/2] can: rcar_canfd: Fix page entries in the AFL list


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



