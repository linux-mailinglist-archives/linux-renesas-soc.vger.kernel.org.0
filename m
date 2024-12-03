Return-Path: <linux-renesas-soc+bounces-10815-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFE99E189F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 10:58:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FAEE28719B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 09:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1531190068;
	Tue,  3 Dec 2024 09:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WMv0VQ8R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9E4165EEB
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Dec 2024 09:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733219924; cv=none; b=HTze54kwBM64y7dCekee9/IDPXC/fSb4aOpntU+KN65ZnMYHn+U6GJXFrw2o/Ee91A5E8eOaSDyJjLxQ4Jh0cfhFbLOvhYCexNQiabNAecVy1DOo78xKuP4RDj6euYcF8uMse64y5PJNwglE/20y4H4xxTwa4Lu52rRsDaREvQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733219924; c=relaxed/simple;
	bh=zTOFZxAvByBSolaSGOdB9e0PkqOr6awRklZ9M7DEM2o=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=WjifFZ/9icfyx9GAiCnSYEPtQ72NhljCjJ70h08Xa32ZwGvBxcJT9psh5Rj4rx51VE5oHt3FHWULZVA0DhxYw5+O5/M7gbAP2g052fCy/rRJsgr2LPW+uAGYC6kLhm1LGHl8wY6WmICIBg4VmFnR+04qK7RxRY78iVrx/mS10c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WMv0VQ8R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EFE2C4CECF
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Dec 2024 09:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733219924;
	bh=zTOFZxAvByBSolaSGOdB9e0PkqOr6awRklZ9M7DEM2o=;
	h=Subject:From:Date:To:From;
	b=WMv0VQ8RY6X3/7CQoiTnV7uiIeIcDcTRMkm5t46j1TRRdB0MdJf/lN2Ses1r4STAG
	 ckYMJXYtdEceHsCdL3ydMFyaXmOlXuNHaoQeZ7qLcizheF2sDt7w70WxFExtTI2MZm
	 IvUA8UCnVwmPpqT3q/Lc8DS4YsEUSXsNR08MvhPNVdqTRBLc1jh7rt/CM8rCtCXiW4
	 Y4XuyDK4eZau2e4bfIh4eOSHNtLL9He7V6eIXKDVV2Ef1RL6EyVisHn9EjabpU9HKJ
	 xUZe3UOT31EZzFrJvfa+vOxhas2NkPCbfUgiSk4Ga7MMQAQXCCWT1W21O1V7WZfq1g
	 RaW7itt4zFFWw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 768123806656
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Dec 2024 09:58:59 +0000 (UTC)
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
 <173321993802.4135237.12667024837544861793.git-patchwork-summary@kernel.org>
Date: Tue, 03 Dec 2024 09:58:58 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: arm64: dts: renesas: rzg3s-smarc: Enable I2C1 and connected power monitor
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=911197
  Lore link: https://lore.kernel.org/r/20241120085345.24638-2-wsa+renesas@sang-engineering.com

Patch: arm64: renesas: ulcb: add Sample Audio Codec settings
  Submitter: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=909468
  Lore link: https://lore.kernel.org/r/87wmh6pqje.wl-kuninori.morimoto.gx@renesas.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



