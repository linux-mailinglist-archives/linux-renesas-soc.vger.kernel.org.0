Return-Path: <linux-renesas-soc+bounces-8639-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB9C969760
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 10:40:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7915B283556
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 08:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E5971DAC4D;
	Tue,  3 Sep 2024 08:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n6EQdTHd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEA01C62A8
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Sep 2024 08:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725352832; cv=none; b=Pi8GuQfhDN0+JiWbCOx9kpmdtXS9EE5Xg9+ZPFITlD2iyvq7QaUd7i/x61sAPBR/8wGW/GQj4nvKcnLCPwTrOc/O3ZbVoxyNl/TLlAPxcQLk5m5OLUTz4v1QV9oh05F/pKRi3ex126wWl0i+IjXTcFWWH7vedvVK2ik7mOohzI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725352832; c=relaxed/simple;
	bh=h/nJg+H7uYFSuGu1WaD8+oRmF5pF8F+s4XQB681qDKc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=QEZzyYrC3KqgbWh5IugrQmd9KR1wbLWxwutgry2e4KyPsKo9oGvMfU5/5G1z5aOq42j4H6e+L2DtU+R46DPR8QsEzFkoYjFcqydFVWemL574PUHWABumc7G8QrkUZar78vZmP00bUHHKuc+QHBe/iiYiheC62s9MfslC4aqw7PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n6EQdTHd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B6AC4CEC4
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Sep 2024 08:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725352830;
	bh=h/nJg+H7uYFSuGu1WaD8+oRmF5pF8F+s4XQB681qDKc=;
	h=Subject:From:Date:To:From;
	b=n6EQdTHdJDcUK7SOhB6VppznHS5bPW1EX12CSl9gU1yICEQv2FzUNkgIP+1yY4T6n
	 iXQoV1tNziBaQAojabz9VvhupX9bJ2XVhXA2rOOZLpijSudiBDB8Yp5p/HV+nD7Zqe
	 GD2um9Vy+LD6TqAT2j7XLNB2eOQ98eBBl/GZHUJDhizmkckiWrnyon3QNDGmI/8tEY
	 T93/ku4DVyoC+UW0H0umnbdLZO8/+qv9ohRE9Emlhk1+uIKtThfyz9X7ppGScaUP8p
	 FLkQN0YONQ0WM6/IK7E2Kg7JsaAy8Ssm2lq9YyMRSq+RXvc6I2ybTDWzh/Ltpa/MW9
	 ERudMZjlrrmew==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3E7093805D82
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Sep 2024 08:40:32 +0000 (UTC)
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
 <172535283062.212503.5325299491937726138.git-patchwork-summary@kernel.org>
Date: Tue, 03 Sep 2024 08:40:30 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: rcar-vin: Add support for R-Car V4M
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=868526
  Lore link: https://lore.kernel.org/r/20240704161620.1425409-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [v5,1/6] dt-bindings: media: renesas,vin: Add Gen4 family fallback
             [v5,2/6] arm64: dts: renesas: r8a779g0: Add family fallback for VIN IP
             [v5,3/6] arm64: dts: renesas: r8a779a0: Add family fallback for VIN IP
             [v5,6/6] arm64: dts: renesas: r8a779h0: Add family fallback for VIN IP

Series: rcar-isp: Add support for R-Car V4M
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=883381
  Lore link: https://lore.kernel.org/r/20240826144352.3026980-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [v2,1/6] dt-bindings: media: renesas,isp: Add Gen4 family fallback
             [v2,2/6] arm64: dts: renesas: r8a779g0: Add family fallback for CSISP IP
             [v2,3/6] arm64: dts: renesas: r8a779a0: Add family fallback for CSISP IP
             [v2,6/6] arm64: dts: renesas: r8a779h0: Add family fallback for CSISP IP


Total patches: 8

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



