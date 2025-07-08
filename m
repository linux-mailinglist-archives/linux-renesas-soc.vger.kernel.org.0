Return-Path: <linux-renesas-soc+bounces-19377-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D30AAFC888
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 12:40:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F5A7421AE1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 10:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076D12D660D;
	Tue,  8 Jul 2025 10:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mvn49aUG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A9025A320
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Jul 2025 10:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751971195; cv=none; b=Uw9DZWUZhoWod5uGdzEnD2zQAY1dKWaTHX8prjZU2L6ij9yEWuEj/due3NqWoGjVgd3O6PoLVUMQVYplbM27vwKqdLfnXQJF3fjTYfoO0sedXf0094TKTo4G9pP0S8qG1V1CKn5NHGcjTMMU4tDOFsvosGKCy4tvCG7YVUGXTeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751971195; c=relaxed/simple;
	bh=LjRPp+WhO9i+4j1LT/r2damDD1p5oluQGEbXbaoTjK8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=QxQ62WNsb0ktwxGY0RFoc92Rhb/2bbEYXPb4VuBseyF4A0ljHKV7StuIFhgzTdEzs4Anne46kQgnabYAMlYByZTd0vW37Wj74CQw7JVXDmZBJnkBGINOkOih4cfLvSOUQh7hJlrk3yPJx7KhkgBgpkuOMw057cWl9PD+wfUGb1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mvn49aUG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A23C4CEED
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Jul 2025 10:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751971195;
	bh=LjRPp+WhO9i+4j1LT/r2damDD1p5oluQGEbXbaoTjK8=;
	h=Subject:From:Date:To:From;
	b=mvn49aUG/bBcmrN8dgaXrcOGeBsANRLY3r8fGXtWy/8W2i7j1a+5XP0FM/3czlixm
	 HcnGnq+Gw6qG82/doNWqTN5Ly4UfPuYSci8y0hVvj+j1G7lJgOiU8aUoUXZMeLlpM6
	 Zy9boDkythAJ6JcBForjixGVZMstFwHe1UTQQhlMbH0CiY6pj2oC1uq+5RhgGsvOle
	 Nr7HYNgM8QZ0vXVsB/fSRKlytkZi0sNX9bTFcq8S4LgHYe8zkXo2+YoHaqmb0jg7fw
	 IBsq+MsY5WuDyyK4dRA3WeIE0pZ19DHSMvI8xKYzPgJkaXrIRV7S1V9bsiPQZQnNqc
	 /xNP+5Ctrt8SA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 74B7F380DBEE
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Jul 2025 10:40:19 +0000 (UTC)
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
 <175197121799.4019242.1066773097279955983.git-patchwork-summary@kernel.org>
Date: Tue, 08 Jul 2025 10:40:17 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: arm64: dts: renesas: r9a09g056n48/r9a09g057h44: Fix pinctrl node names for GBETH1
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=978895
  Lore link: https://lore.kernel.org/r/20250703235544.715433-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Fix pinctrl node name for GBETH1
             [2/2] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Fix pinctrl node name for GBETH1

Series: arm64: dts: renesas: Add XSPI support for RZ/V2N and RZ/V2H(P) SoCs and EVK
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=979155
  Lore link: https://lore.kernel.org/r/20250704140823.163572-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v2,1/4] arm64: dts: renesas: r9a09g056: Add XSPI node
             [v2,2/4] arm64: dts: renesas: r9a09g057: Add XSPI node


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



