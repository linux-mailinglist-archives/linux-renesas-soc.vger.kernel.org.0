Return-Path: <linux-renesas-soc+bounces-8866-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2192797146C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Sep 2024 11:51:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0FFA1F237A9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Sep 2024 09:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A24F1B3B0F;
	Mon,  9 Sep 2024 09:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZCNoYnB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661581B373F
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Sep 2024 09:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725875462; cv=none; b=rd6z61hcSkN7MLQs7jR6mFSeiQuMSbKkI8vA6M8Ayqi/z59zVKTKLDJTjjBsFdXEG1OGYwSVItdspQQO53PQ4e8ozb0RA3MaSIGcIAiTSn1q0+puQdDzIJm40tnDXZTO55gMg/7Ocod3A8Sv5Ggj6s3sKBpJHw8c5eXyPEcRguE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725875462; c=relaxed/simple;
	bh=BLgcCCh7oXjdUvsaLjEzDKDi7cPu1Wz4TKw89RzJI/k=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=Dj9DkDzD4eF28FjuE+B74B8uxvBo5hLiMxE92byHm9l2H0dmVrLFvJovrw0zoeZBg5xXvFcGltC4InviX31mxicZNjThndYWhQKreBmURtlw+KCK7MGNwT5ym6RmsG6ApKPahzIa7zstSF2y8QCrfsAVE+Gm47oY5OZdYP303zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZCNoYnB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2CFEC4CEC5
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Sep 2024 09:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725875461;
	bh=BLgcCCh7oXjdUvsaLjEzDKDi7cPu1Wz4TKw89RzJI/k=;
	h=Subject:From:Date:To:From;
	b=JZCNoYnBLmoJoUYFAoTuCHD+/qi3hgY0jFAWYVORVbUo6VDFtyEubXxgaZ6ZXUxm1
	 SN/Vb4zkVUVgbd2Tj7b+UZLwfwbIyYiHDJD6fCED7HFO0s44+W8sRxTIsUZ03LVGfU
	 tgailitDzEr5C1vRcxwl8TtLtqvCcvcb4fv6phwq8dAQEAaDO1Hfofg3q5QeJ9WQ37
	 CkovQ9GwuDwAD6DJ1+cWhKlDFQ4KWvU2R3OfUeTg9KkKYP/IuMdoNOrDm2QO7Y22Uv
	 IvvqMoR2zgv1uX+JUc+7K2AUTr3Zt6xrW/rAIDstYbRLQWBwLKt2umv/C+ETU0qe4Q
	 v3LVGce9ZjCqw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F229E3804CAB
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Sep 2024 09:51:03 +0000 (UTC)
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
 <172587546243.3403782.10454485504038620167.git-patchwork-summary@kernel.org>
Date: Mon, 09 Sep 2024 09:51:02 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: drm: fix two issues related to HDMI Connector implementation
  Submitter: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=886043
  Lore link: https://lore.kernel.org/r/20240903-drm-bridge-connector-fix-hdmi-reset-v5-0-daebde6d9857@linaro.org
    Patches: [v5,1/3] drm/display: stop depending on DRM_DISPLAY_HELPER
             [v5,2/3] drm/bridge-connector: move to DRM_DISPLAY_HELPER module
             [v5,3/3] drm/bridge-connector: reset the HDMI connector state


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



