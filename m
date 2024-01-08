Return-Path: <linux-renesas-soc+bounces-1350-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B95D8269C4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jan 2024 09:50:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E15A1F21638
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jan 2024 08:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0795BE6F;
	Mon,  8 Jan 2024 08:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hxd6s8XI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C694EBE65
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Jan 2024 08:50:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46BF5C433C9
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Jan 2024 08:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704703846;
	bh=WJoZnGj8OtfMpUxnjonYfGgcFCFY09So/8jz0UR9zQw=;
	h=Subject:From:Date:To:From;
	b=Hxd6s8XIMW2EJRy6orhik6/O/TD5oyT58M+z/pBPbTAY7rX9p3zIRDsnFTTOScWE5
	 0St2W5nVW5Xv3shMf1LiO+GvORDEAJ/St1O7n59uylxpZCYyZPiQoSTNfVJ7MGApK0
	 a6K3efKZmlttOnbU9Vd2fuKLHpNEwlF6wdFpkit0YZhjyQQjv8+lVEyEHM9y72gfNw
	 +/cZMYIPUWYrP6Xm9FgKTEhche8I7+XDhxtiULPGHh8X5Jcs/7B+zdEusJmacj8M+w
	 FeMtFDOuTiIjO9tmbp+iIIt8Xb7vwhwrTIw0J98b9czYIcMulnAbv9cK+s+ZPIohwi
	 4sbhqBKqtjWiQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2FEEFC4166F
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Jan 2024 08:50:46 +0000 (UTC)
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
 <170470384613.11892.10023970733438830174.git-patchwork-summary@kernel.org>
Date: Mon, 08 Jan 2024 08:50:46 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: net: ravb: fixes for the ravb driver
  Submitter: claudiu beznea <claudiu.beznea@tuxon.dev>
  Committer: David S. Miller <davem@davemloft.net>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=814017
  Lore link: https://lore.kernel.org/r/20240103081353.4165445-1-claudiu.beznea.uj@bp.renesas.com

Patch: [v2] mmc: core: Cancel delayed work before releasing host
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Ulf Hansson <ulf.hansson@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=806572
  Lore link: https://lore.kernel.org/r/205dc4c91b47e31b64392fe2498c7a449e717b4b.1701689330.git.geert+renesas@glider.be


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



