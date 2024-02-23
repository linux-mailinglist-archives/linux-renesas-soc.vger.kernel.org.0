Return-Path: <linux-renesas-soc+bounces-3123-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA246860FD0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Feb 2024 11:50:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84FD2287453
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Feb 2024 10:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B65D29B;
	Fri, 23 Feb 2024 10:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XD5w6qbx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B23614B835
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Feb 2024 10:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708685429; cv=none; b=dEy4lMdXaMnJQeV6k35IBgzp8XIugoC9GrNNUwLA10NkqlgMt4e+vBawfEz3t9X8cYmWbJyBjPSdZ4X17vZnJM62mRA+lQAxZ3rPPIWyaSNKuFORAes9/lkqhvfXxEZsZ0CEEYFvaU80vwsGoC4QLHAtc3jIRS124WH7h4yO/do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708685429; c=relaxed/simple;
	bh=S8JyZ3ARyFjr2BhLajfiRtR4neHPW1i4xdyXDIKIejs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=Gbafmov0lXpt29XP7bilLOXRIvS8/1dAT+5K3VMen86VA8oNa7Eapxz7YEfOTVbcw32JXxwj5id0LJdfwpdGRiWUxoQHLrgbzsjU3qVrzWny+xqqkgkxQzSkZNBGqVoVi5Mly6gAoW8g79ifAEOit88zI+B2CDMaGd7N4OGrJi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XD5w6qbx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E57E7C433F1
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Feb 2024 10:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708685428;
	bh=S8JyZ3ARyFjr2BhLajfiRtR4neHPW1i4xdyXDIKIejs=;
	h=Subject:From:Date:To:From;
	b=XD5w6qbxgFuxVp99Y4+mYShAjyqhlAz8ksCc2IlXMCuZHwoUtOyDfVk3mDcyl4G03
	 b5wyAnAC4zOv3vkWC7G/nYy+HppCc8f7r+Lhsq0A9MbCipLbK3omuV1cuM5d7Bna4D
	 gEQIbnAinkFHDIc1W0W+KieXjdJ1ma7Brov7fVHmVtlvqLTR62Q9N3xHQFPGLDqB20
	 Vq0jiytf5AutUgJ9D+F/hjXXqwc0atLKAwylI6sZUtfFq6TyasKKQVolCWJQpMVPa/
	 NERgFO15vmFWra6WbCYFnxriVPrhjID3xDN/2J/w1LR8RWAIv/qP60whJlwvn1qGC6
	 +ACwhMdqtVk2g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C9A2DC39563
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Feb 2024 10:50:28 +0000 (UTC)
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
 <170868542876.12956.11861529584560873164.git-patchwork-summary@kernel.org>
Date: Fri, 23 Feb 2024 10:50:28 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Enable RZ/{G2L,G2LC} and RZ/V2L DU
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=828683
  Lore link: https://lore.kernel.org/r/20240222132117.137729-1-biju.das.jz@bp.renesas.com
    Patches: [v9,1/3] arm64: dts: renesas: r9a07g044: Add DU node
             [v9,2/3] arm64: dts: renesas: r9a07g054: Add DU node
             [v9,3/3] arm64: dts: renesas: rzg2l-smarc: Enable DU and link with DSI


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



