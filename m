Return-Path: <linux-renesas-soc+bounces-3711-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF472879065
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 10:10:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C81E1F2287A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 09:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5808B77F08;
	Tue, 12 Mar 2024 09:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rq7ilaP7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342D477A03
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Mar 2024 09:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710234629; cv=none; b=jXQSoMsBgNJ56mwNOPfpniVAlw/IVAQIvTWfSqphmXkqXfpTZdx8TtoXO0KN52O5LuXO6JYbD2faXJsAI92n7TRBChPdr9VQlB2tvA658TreqVZsM8BmJqQwmsHMRxOhPrSyO7VazW+dTXlxS92PUfxj9IWxJwjb6QHzvcURi9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710234629; c=relaxed/simple;
	bh=m7IT+5zI5OQJVD5GPqsZuo6VfKCncrhsjLrYV61uLz8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=FYwnMFcqXJi3MzRkFVusm8b30q7gemYjb7JTm54jrxsVgatGxX6VPCFt3NW+KmCt17DVtM2Y5kvd2jo4pvQjZ9mqa4hMejhOqbCJ7wilgC2hhjS+zQVlZ7Kxnel/09xmCmqftP0F8Td1nYzRtDyYSjffnCx3CThIBb5/4rBFts4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rq7ilaP7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2BE5C433F1
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Mar 2024 09:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710234628;
	bh=m7IT+5zI5OQJVD5GPqsZuo6VfKCncrhsjLrYV61uLz8=;
	h=Subject:From:Date:To:From;
	b=rq7ilaP7qJvaHVv6FA8COigmKbDRnnq9RbuOT+JyR0WniA07lps6r4Bguhs7QWgG0
	 oyUtLKXWwfgWKTCiJCD73Lh1Zy4bOJRJx6f/Ra1ptCBBZItsCbQwa6CzG02I9EFIZ3
	 w5NNBUghq//w8iBp5TofCit7jNM1UwIKtsBTMfVRTtT7OCoQmzkHhXGXg9983xhE7e
	 dAWav1VeDb+3xDhyb2SAI6r3CFFvWUXko+ESgwmex2Fk6plii2KI1zCMjIYUhkDpci
	 2TPYRgc5q2eOanHfT0Te86yXMsFi+8oSHBrD3dLeogrZzegNucP5jLm0B7XyRonYqO
	 gZk/5Yp9F4k3w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 85F9FD95053
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Mar 2024 09:10:28 +0000 (UTC)
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
 <171023462849.1927.5713102353855566655.git-patchwork-summary@kernel.org>
Date: Tue, 12 Mar 2024 09:10:28 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: arm64: dts: renesas: r8a779h0: Add thermal nodes
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=832928
  Lore link: https://lore.kernel.org/r/d1f07c77943912145583d8916ba3ca65d143b1b1.1709722573.git.geert+renesas@glider.be


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



