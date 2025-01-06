Return-Path: <linux-renesas-soc+bounces-11878-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 496A6A023FF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 12:10:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE5B73A1C31
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 11:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2D4F1DBB2E;
	Mon,  6 Jan 2025 11:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fBm+mYRu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE72D1DB95E
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jan 2025 11:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736161827; cv=none; b=S1l24cmH/pWs8AaXrbkItOeDXCwznQCj4TE38yFfNbB3+pAWRwOHqz5NFSQjRT++iEaOtlPP80ocfTpFk4hMA6X4+Uf4mrvWQPau1NpnlfkvsV5w0Dpsb93XZlxlu8sQfy0OSDmXo1cUWjcX9DGyUFcOBbjN/h0k6NO4N3h4IIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736161827; c=relaxed/simple;
	bh=DKBIRrctNIguYHtIgDd4XKTWJiY0xAe8YttkrRQBW0Y=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=q5l9ddUJGV+eeII+NFY8yWCq0UQMt2I9oEp0rEAanuuzHyfap/0RdBT/JQMhKqAxV49EuDP8yGTFGAhZPDNsvSMZutMUlYuWDGtuV9bOeYW3Dds1Z1hANDDz/At/VVyQTvw6+qSJVH6mi6GZgb6SchO4vzfe7e+8bM7Qby3qRSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fBm+mYRu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F98CC4CEDD
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jan 2025 11:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736161827;
	bh=DKBIRrctNIguYHtIgDd4XKTWJiY0xAe8YttkrRQBW0Y=;
	h=Subject:From:Date:To:From;
	b=fBm+mYRu/UGr+FtwOmmE8mUNXoaTUXs6wM+3FbmU+Ha5QoaAwy09XAM9CK9dJPLda
	 q/ZSlxFNaQs/uYe8SqHgcJzD5uwI+flYYg5spmCWE1HhoMg1IbnN0GMLONCFbCf3Wn
	 92OOmKFmvrUSPWKjn2UCyBYOg59mCmnSLOnm3lkJRJDlhz7BejDUXRsUreO8nkGxOz
	 G56JV7E+vORy3wHfjWRiEnot5RoApl7hog15iZ7WYKQ+G1LbIMSGdd6KJ+JaMy3b1F
	 q/kxUZp4+Uait12ezt57zmNsMx2CIfyry5uwzLa7/U/W4g9hRlTFDYadg4vACb1adC
	 Sau5TwTZF3Dlg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B3138380A97D
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jan 2025 11:10:49 +0000 (UTC)
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
 <173616184809.3453999.6398572545284752008.git-patchwork-summary@kernel.org>
Date: Mon, 06 Jan 2025 11:10:48 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: drm: adv7511: ADV7535 fixes
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=911054
  Lore link: https://lore.kernel.org/r/20241119192040.152657-1-biju.das.jz@bp.renesas.com
    Patches: [v7,1/3] drm: adv7511: Fix use-after-free in adv7533_attach_dsi()
             [v7,2/3] dt-bindings: display: adi,adv7533: Drop single lane support
             [v7,3/3] drm: adv7511: Drop dsi single lane support

Patch: arm64: dts: renesas: white-hawk-csi-dsi: Define numerical CSI-2 data line orders
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=922501
  Lore link: https://lore.kernel.org/r/20250106104458.3596109-1-niklas.soderlund+renesas@ragnatech.se


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



