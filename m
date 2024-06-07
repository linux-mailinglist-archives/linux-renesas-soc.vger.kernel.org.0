Return-Path: <linux-renesas-soc+bounces-5962-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A33B9003C3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2024 14:40:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFE23B224F5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2024 12:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1AA187324;
	Fri,  7 Jun 2024 12:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XD8ynKQM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63EA15DBC1
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Jun 2024 12:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717764029; cv=none; b=I/mOu+sHLcUzQ4EmcBbEiGi9o/mN7LdYLk/3Lb7MEZqRzAyZI8NWosaMdHKAr98PGkPkjFF01WcwZohwVv7dj0BjUGrkB9ZGbGf1agpYcedYf0w14zkh3v+LZXrJky9+zuS5ZVBgrg/kH9Jpnaw5BymoVxxDYWrBLHo09ycZAtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717764029; c=relaxed/simple;
	bh=JaqJDhhlJ8mhQPHgY4U6n8TxzikLPMIsGqUgyiYRoaA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=TuoIuSNEp8UOCAhej8Ot0LnijDwt+WF5IwMhITvDRgdJGMdBKWkW9d2+mUuh3txht9ulamnr/hg0Wd+Gbjl+66b12V149oaAZgZxEY6doVscWUnwWLUJ1b9nZBg0bl6R+k8fUByICSdZURtf/OvUDmZUMRAd+jXFI8v/9vDeN7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XD8ynKQM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4559EC2BBFC
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Jun 2024 12:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717764029;
	bh=JaqJDhhlJ8mhQPHgY4U6n8TxzikLPMIsGqUgyiYRoaA=;
	h=Subject:From:Date:To:From;
	b=XD8ynKQMJEhnJ44kVL0EifT89pT/78/mDMiLM9QH9CxoX6i9AqwXQzxz8Iap5Nafr
	 iHoy8die6yIaCt9+Or2BH3/EjstWfnTXfE5rFldZxi3wwWLBv7A6lc8/I4wzxpa+DT
	 aPp0CNCO3JF4awn3vJFsAp+2n1OM1XQJf3jjrXuDqLgxMAzVAsUziUxQ/tDl5haoe6
	 JdSE3epQl9YJmTlhTAbdIoKUtirzRXoOHZCdmYntexWjpy1+RMt+B9pT5LaMTCxEO+
	 uHDxVC095Qgkj5yfj002p0dXR/cNmtBhgMrDIhM8TqDsxb5risQNkSniljYSjUkiwp
	 lFQaYgTk49ELQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 33A75C43168
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Jun 2024 12:40:29 +0000 (UTC)
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
 <171776402915.30665.11843318512348766022.git-patchwork-summary@kernel.org>
Date: Fri, 07 Jun 2024 12:40:29 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: arm64: dts: renesas: gray-hawk: Add video capture pipeline
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=856186
  Lore link: https://lore.kernel.org/r/20240527134129.1695450-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [1/3] arm64: dts: renesas: r8a779h0: Add video capture nodes


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



