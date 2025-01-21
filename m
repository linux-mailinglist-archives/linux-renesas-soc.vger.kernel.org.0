Return-Path: <linux-renesas-soc+bounces-12288-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D250A17945
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Jan 2025 09:30:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47221188BBF1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Jan 2025 08:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 410311B81DC;
	Tue, 21 Jan 2025 08:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="um3FvWvo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1310E8F6B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Jan 2025 08:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737448207; cv=none; b=llZUhkNzNuolFslvvxQQZEUuZ0sBPSa8jPK4o5LE+z6eV8IYlwBwvr4Iv/PDeI3Tg/GhlhyjJmtyHy5uCqwK83lS2JM1glmzqCKCU7vV7vrmE70EM7d008l2+n9yurgoRjajcjlAF8GqWYzjswSmQ67RJPEsWEuWSnJVrb6+Png=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737448207; c=relaxed/simple;
	bh=Rh+9IWBSCS1FnV6PcKnir5+tEFJUphDrv5Bp5Asqp00=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=BjZhCoLpyTfDecIYi4jc9snUcPaPLJ0d9i5UvyqawP9V8suqSOgqFnkN5OYQ8b/lqiGAwqNuwhiJcWAGu4C1MwLHGc+RcTE8A39NjcdLnPUhTHDLnfMiGgAmm5rFdtxXmVmX52MunQMtE61kOHHrCBq8WQbb8locQG58uL9IODY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=um3FvWvo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD662C4CEDF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Jan 2025 08:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737448206;
	bh=Rh+9IWBSCS1FnV6PcKnir5+tEFJUphDrv5Bp5Asqp00=;
	h=Subject:From:Date:To:From;
	b=um3FvWvoFTQRgCIdM7Fa2rEwpMDZrrihQa26pWulgrvGAE0xUqB0ba0tPEsnNiyuw
	 cE1oNV6AWQqElmIVah5BZpKZuyB0Cw0ApmS1QqklubhvDrLpJ4uwxgHmAaKQiK6cuL
	 cAAgv0e36WKh0ZZtaZiTtG0U99wrq/GEWXIwdsf9wyAQ3xcKFGu0srAPJmqFQ0dJ7b
	 PJo0Vw4qvhulJd/UKjbeo8Z7o7AKRYtiU++F3novmMTKs6acFE6tzzLlQq63JsD8qo
	 TKkbztlJLqb1ViWY9UXf6vS9IOxlYO2bV6UU6eUTvtaTQ3tHz1r5dg/bjEFJEQR7hT
	 1kF3asQ76Cr7g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 002E5380AA75
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Jan 2025 08:30:31 +0000 (UTC)
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
 <173744823049.4103664.12096273916674348851.git-patchwork-summary@kernel.org>
Date: Tue, 21 Jan 2025 08:30:30 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: arm64: dts: renesas: r8a779g0: Restore sort order
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=926920
  Lore link: https://lore.kernel.org/r/ccd215c1146b84c085908e01966f7036be51afa8.1737370801.git.geert+renesas@glider.be

Patch: arm64: dts: renesas: r8a77970: Align GPIO hog name with bindings
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=925848
  Lore link: https://lore.kernel.org/r/20250115211755.194219-1-krzysztof.kozlowski@linaro.org


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



