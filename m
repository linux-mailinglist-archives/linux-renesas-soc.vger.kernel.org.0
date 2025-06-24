Return-Path: <linux-renesas-soc+bounces-18640-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C693AE5EC5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 10:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17D4D1B60AF9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 08:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92AF6248F64;
	Tue, 24 Jun 2025 08:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZIwu6k9P"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB0A1DF98B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jun 2025 08:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750752578; cv=none; b=qOhU5xkT36+kOVvDYyTEyT5vs9KQTosayjz47WUnESjdt5p0IZQik0Yw5fE1N6x3Nqko4P5ENioHdc+HoFscCdUKGD0pRQ9GaA1RKItVG4TdS8IpjI2AD6N+tEv0wYpnEY0coEEdwSgKBZ7EERm3zXFKjT9btma+hV2jJxJqtYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750752578; c=relaxed/simple;
	bh=WGNPZLIhZrp5PH6719SZncIrU3tM5O54/yTzE2ruS7w=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=Qm9HtgtgA/NOmYI6qxIe1c6UkZJReBGN8AEOo51Qd/33AugSooGLyPtHyuQUEdNg1U9Dua6ZIC2TF7aFVqiulX4WM3arPI/a05D429gW8kh3DqoZbHSqXlX99IRyeLHjGIW71RfO2n3Im9rxN96iJVTA9O8UxSE1Q6pB/FaT3pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZIwu6k9P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E71FCC4CEE3
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jun 2025 08:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750752577;
	bh=WGNPZLIhZrp5PH6719SZncIrU3tM5O54/yTzE2ruS7w=;
	h=Subject:From:Date:To:From;
	b=ZIwu6k9PdLeNgRf4u6I60S57lvTDXWhc4D4FC2frogbxjsw99gUuDHTFQecAIvdhP
	 YTBW+of+eLLYHeUKiZVBGT4KrGZaOn5p4fVNnXdtiRX6O5brFtpyKuni/CMNpTJtfa
	 da1hLLMmuCS1+macI93hCItzKcDzHH/gZg0P9yvlS2WltPGgUzu2ftkNfBdMpD+zDL
	 hSNBc6wXgB97oRgas4GMqPLNjOtG55XdcwAwHgErf9vs6Ec4I6ZBu1Nf3FpZkO4DaT
	 j90XyFDGCA9vA4b1MoQNjdgg46Ouh81jDi9IEadTz1xWikSGJ7Npk8qaWPD8gH3KYc
	 t2wUKHG3SQFSw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EEF3938111DD
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jun 2025 08:10:05 +0000 (UTC)
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
 <175075260452.3444717.4840926586437180957.git-patchwork-summary@kernel.org>
Date: Tue, 24 Jun 2025 08:10:04 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: dt-bindings: soc: renesas: Document RZ/T2H Evaluation Board part number
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=971434
  Lore link: https://lore.kernel.org/r/0703ecbc355164e35b90a9fe088438c821f13cd3.1749741263.git.geert+renesas@glider.be


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



