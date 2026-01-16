Return-Path: <linux-renesas-soc+bounces-26911-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB7ED2F6B3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 11:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 761053076755
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 10:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20F0B35EDA5;
	Fri, 16 Jan 2026 10:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JClIuVsP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25FD35C1B9
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Jan 2026 10:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768558414; cv=none; b=Rkk9aQn5pZNw7GCRxYFzR46A8kvs9uGBmF4PIVGnQjUpH9BsWpx/L6Xy51zA6ekS+xiwuLO46o9Mya+kyWZkvBv6Bg1ZAQwrHCHTL9mNS+f5I60NxmCHeQDHcnu48rt4DZBpNa9iWUPn3X0G7/YIIdob7QgvxxFN/RoVRPQh0vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768558414; c=relaxed/simple;
	bh=5aroaHt+wNWzDzJu9YfGtGikKHj+ddega9yJXcWeJGA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=redbHDVz23kXU6+saZceupn3LA9ztRvThI91oi9A5yx7dQA+Kx3x7RaRxgZ9W6lXmOOc5wbF9/Qfmzagcns5w6rwkVpoHy92RpriLPJ50xVANWN/2/qRM7/+G0F6x+/XsBy8YPR0ZjtyUjSj8uWhDYyPZnoI2wGT5K71qCrxnd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JClIuVsP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A03D4C116C6
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Jan 2026 10:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768558413;
	bh=5aroaHt+wNWzDzJu9YfGtGikKHj+ddega9yJXcWeJGA=;
	h=Subject:From:Date:To:From;
	b=JClIuVsPK7ndKXd1QqU1b3gPqeKMhPjbV4smieFog+DT1sa79Nxuc43QHHCnYqBTU
	 bgfcenGK34hQcSX4SG7kAazSVZ3CET43qC2/srVRDZ+MzmBznwMOqwpCELbrc5/s1O
	 RH7autVJOw9EiQkBFDdaVtvlkSO2+E4doPR5JJ0V/6Vbb8PjVWPBWwYJ7v8kTvKTTW
	 pjiVlmSJg/sTYzeiLMd8xFT94MzPOeLHkuqEGfN/Lqk8Z2UYDMuFZQrpMhGrKfBTD2
	 5x1VzrjMfykGS68HQglhK+nhmbn+8m9mgeoh0jWKe7ScEk3ArXdh+mRUON2NIltAj3
	 SEqXAwH1kjldA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7ED5C380AA6A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Jan 2026 10:10:06 +0000 (UTC)
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
 <176855820500.173766.5529265118653877702.git-patchwork-summary@kernel.org>
Date: Fri, 16 Jan 2026 10:10:05 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: arm64: dts: renesas: rzt2h/rzn2h-evk: Reorder ADC nodes
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1042790
  Lore link: https://lore.kernel.org/r/20260115122210.3971063-1-prabhakar.mahadev-lad.rj@bp.renesas.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



