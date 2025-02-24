Return-Path: <linux-renesas-soc+bounces-13553-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F91A41938
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 10:34:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C9543A373E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 09:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B293243369;
	Mon, 24 Feb 2025 09:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dpXt/3Rj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076932441A3
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Feb 2025 09:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740389423; cv=none; b=Q1YTjAkqc+Ae9GHEvZzlnYXsFEvV2n0fx1RpTjN/ETzxVCzKEak7Jv8s9IQXgt4kFwZuSIBKcTDQwa059yAInh0Tuc46fcbk7swdD9Jj8IjdaQSZ8EuwJ3pPDxpPTwIMQoqvkFHi5CJ8m19wxYtHwaIT2Od4m3Rg7PsNXbNffzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740389423; c=relaxed/simple;
	bh=A8pUGCWZqQDIE6n8jZKpV591gxbOEEGekrfqvdRHims=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=SCpzmLpK8rTFYvWfx2XVEpV5tr8cMIgUuG85Ud88yxVuHlZLJLw6jKDuRCKjYl3OpbsE0LEHuUYVnoFOukIlFHzl/m00UIAKa165B4vxJO91l3ZvEj8s0QMAIFdWCNoQSf+WgLFxmC6AHjEe+nMWpzh2fmocX8yB+Zt/WrY5JwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dpXt/3Rj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8028DC4CED6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Feb 2025 09:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740389422;
	bh=A8pUGCWZqQDIE6n8jZKpV591gxbOEEGekrfqvdRHims=;
	h=Subject:From:Date:To:From;
	b=dpXt/3Rjyv8UEc+U7b0C6lvjJilE/5A7AWs/Pu1qB61ySdLnDJrRhEqFDShoyQ90L
	 8Cc3SCrz0hjuZ9FGnYLb5oGWujpk+m2aBsgRriRzwcrrLbSXxq0hcqOtiBnN3NwkZ9
	 tVF59cMqK0yHE80o7xzlb64Lisrm4xMZxqJtpEvVbPV9Ez29YTJcW8ObkZO0SIpPn4
	 ZOgGzj2yDvqjy1Oic0DzHlMEGr6B50FXdqVTTHV27luGiRZFdRV4YnHRpwCKVyfpY2
	 8dE8VoFl06U8UT7o5gY3Hw45xBSZ8O7JjnM+KhJJWWwvN41RSXPyaM6JwwAHGWwkBS
	 /6cQX9pf5rtcA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F3D6F380CEE5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Feb 2025 09:30:54 +0000 (UTC)
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
 <174038945355.3067688.10699658337338405309.git-patchwork-summary@kernel.org>
Date: Mon, 24 Feb 2025 09:30:53 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: i2c: core: Allocate temporary client dynamically
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=936076
  Lore link: https://lore.kernel.org/r/f9aa39362e918b62aec0567f899b37d8d3c44710.1740064176.git.geert+renesas@glider.be


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



