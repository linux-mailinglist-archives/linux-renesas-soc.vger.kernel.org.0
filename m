Return-Path: <linux-renesas-soc+bounces-6717-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5245691608F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 10:00:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 735042832AB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 08:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D793145A0A;
	Tue, 25 Jun 2024 08:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oeXVj1H5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4844F47A62
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jun 2024 08:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719302433; cv=none; b=dTyRSMmFthwMctsDqmSkAKFRxFYxqId/5Q+Rw2fNs8PIzBZyqcjOOEIW+X26LCJBtKV+DGr+7JTFaejhqz2RA/7swMa7L18ZZkDb986Iu3dNo2yoiwSHNe3qWlvEHBVcb4UKlsAp7kPwwlDKpwLPm/vkpgdlm7lO0oTqovNt9K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719302433; c=relaxed/simple;
	bh=E6s7l/wu5DRTW95CizafTJWJyY5+bUXnLmxHJz5hLp8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=NKcsKa7iSq//Dn56AvDBn1YAvh9NdBe85QO7w+7Sd24fMXRyjqcq5BO0EQus/0TEDAmuc/CVYjf7wHvPbJU8tzNeAUCxaHel1RkJeVUYDSgMVxL2GuhhJYvLiBf1QjYMgLq6AUWfsWiYSDwS+17A705lD8QoxNBDqUKGKpTGtSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oeXVj1H5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC428C32781
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jun 2024 08:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719302432;
	bh=E6s7l/wu5DRTW95CizafTJWJyY5+bUXnLmxHJz5hLp8=;
	h=Subject:From:Date:To:From;
	b=oeXVj1H5A36SeEn0XtMHdWyA8KJOzo4cTNDIsCjO3If9hSM9JDUHYxd0DEGknlCI0
	 6NCeCkVnkP5oOm/DpkqpSUtlAITstWY4dUu5CYeLXyk4O4ynwyDwnPXzT4XJi5ve7U
	 ZNbQPXGIi827ZXbagcJBDAxb9XjRtH6VdyyP8PLfUrfjZ9iPwgib4bpqRHnQYXPyeX
	 B6CwoyqesKzewDqHPYyXfpmtkRFfJHxlYGLariDfwPShJxQswvaR58ShFhJWngUsWD
	 Q0qAGWJd5xxXTBEXn6sQuq802+kEvt+RxRZSCymRSaTEAPIR8Eym4yP+q4WGJ6HPQ0
	 73XNXLHWTd8wg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id ACD6FC43638
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jun 2024 08:00:32 +0000 (UTC)
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
 <171930243265.14910.6975507854270683843.git-patchwork-summary@kernel.org>
Date: Tue, 25 Jun 2024 08:00:32 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Add R-Car fuse support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=856904
  Lore link: https://lore.kernel.org/r/cover.1716974502.git.geert+renesas@glider.be
    Patches: [v2,1/8] dt-bindings: fuse: Document R-Car E-FUSE / PFC
             [v2,2/8] dt-bindings: fuse: Document R-Car E-FUSE / OTP_MEM
             [v2,3/8] soc: renesas: Add R-Car fuse driver
             [v2,5/8] arm64: dts: renesas: r8a779a0: Add E-FUSE node
             [v2,6/8] arm64: dts: renesas: r8a779f0: Add E-FUSE node
             [v2,7/8] arm64: dts: renesas: r8a779g0: Add OTP_MEM node
             [v2,8/8] arm64: dts: renesas: r8a779h0: Add OTP_MEM node


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



