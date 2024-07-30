Return-Path: <linux-renesas-soc+bounces-7619-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B40940D13
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 11:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59F4B1C23648
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 09:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E9D1940AB;
	Tue, 30 Jul 2024 09:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IhmrZ7r3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822411940A9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2024 09:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722330644; cv=none; b=WTHi5I8Z9RDwqmuq0ZILzXGoqX74h63csz1W4ceBFVtcgLKb7B0bVipink7Xou6dqK2vPwUSmwji4EUzRJH56cR6FK7gafXQhbmMJN6UR33Eyru6CbKHyrxM1qvn57hFa40iaO6fQxVSN1XvcRuKPob7ofvS3KFbnVS8cRBeMjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722330644; c=relaxed/simple;
	bh=Gp1ZHc9mVj4ad/WPQggI9S5Z7kZ9ztnI04kwGRM67HI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=t5q4IzhIBgJAL101cS+qEC9WH+WVKdr9a4C5vZpzDA76F2S4jRZCmnD98Bls7vX1kpoyGLc1sj6dhkM41XHd6eF/lp8AARlQu/+Ayv/MagYtBZ3229bfdgRdGXgcCPC+yzP3xWGQHFAHutQR4VnurGOmIHeOpccWa47IHSygupw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IhmrZ7r3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1E02CC32782
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2024 09:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722330644;
	bh=Gp1ZHc9mVj4ad/WPQggI9S5Z7kZ9ztnI04kwGRM67HI=;
	h=Subject:From:Date:To:From;
	b=IhmrZ7r3+yD08l3FJGNm9bLyUK3QzLebBqSZ10Fg5U46pwdhzmwHRzs0wWprAGb0/
	 V8hu33h095SIz2xmlIIYsBmyfq4o8y22sa4mxvQ8v04JrkyDSw5ym7lFWIVqGqe4Tl
	 BI9sAxH9IrOxHhqAZzgR9JXv0cfxV33UXizlaaH0/sqT1Fwv6fwIkVvOgk0M4+EvsJ
	 2Mo08DrcnVc/9Z3BLehITgfTTkNoXlMTmjOh51lmkIVsnKlC7C6eRpWHkkOYoGw8V2
	 8WnI+IrAzDQzv3n/SIcHdGu1Mla0kmHziA9ly+RG32jEtQjp/Fad9Ku8jVK5zNXDKN
	 8IC46tPncu5dw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 07148C43619
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2024 09:10:44 +0000 (UTC)
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
 <172233064397.19494.9781944851148048757.git-patchwork-summary@kernel.org>
Date: Tue, 30 Jul 2024 09:10:43 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: PWM & TPU patches for V4M
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=873919
  Lore link: https://lore.kernel.org/r/20240725194906.14644-8-wsa+renesas@sang-engineering.com
    Patches: [RFT,1/6] clk: renesas: r8a779h0: Add PWM clock
             [RFT,3/6] arm64: dts: renesas: r8a779h0: Add PWM device node


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



