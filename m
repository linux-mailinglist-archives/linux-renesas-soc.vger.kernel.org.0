Return-Path: <linux-renesas-soc+bounces-3691-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6356287891C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Mar 2024 20:50:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DCB71C20DC3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Mar 2024 19:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D972555792;
	Mon, 11 Mar 2024 19:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="inXe2LAM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D9A5467F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Mar 2024 19:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710186649; cv=none; b=OfCtm2bgle0X5QdAwaM7OwaGSWACByEyyuXO+eZd/kN334qh4xxWu2XLfDOz/BiqNIIZSYrHEFEMWRm0bBPgY/ig1ZIMBj2w5T3wfOhlGn17Qe8WTQ1a/sqRrATPH95XXVjhClIv/fgG+rNKWJbI52PWF0Ikbm+gFEu0XcF5csk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710186649; c=relaxed/simple;
	bh=KK7G90sIQe5hdYWol3CvSliPsL1GgZKrALDgv4p5anw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=CmCvhLahx9mV0qHp1U0i/snp5Fd2uZ10rlaC2sMqjAXc9kSeLpVFwQRWbwZy84eg3TAUGVhEfDBBatXnq0DWT3jPEfrLGiMgiHEUDpuO70FMrFOmtWYa0xD01TY+TSaJh3tqOZHj5AvRvwAoLNR3FOp3e14dN9ijJ3NCgjXsIbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=inXe2LAM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42CACC433F1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Mar 2024 19:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710186649;
	bh=KK7G90sIQe5hdYWol3CvSliPsL1GgZKrALDgv4p5anw=;
	h=Subject:From:Date:To:From;
	b=inXe2LAMwqgsJRetvNLrChyzdj6Ogt/DbG3HGh5lhcrWOl0MsWV54ofen119x8T5R
	 e5vwNgKO+IiX4T9VCXt3fn7iFTOwcumO0me06beTAQ3Jd6M1MHRtn4s7FmAz/wWQoX
	 mWgUzTvZodumId5OVtRLKhh+Jxdt9FA5Z1T6U8snsCyOwWpAS8izGz08k9e9CWuICP
	 SaQwzH7oU2IzIenVm23tlvhI6UBQITqpjEYi6nORU24RaO4MPjg3sQiBohr2tVHToG
	 KwiChJ1CZw4y8NiU71k2dmQRQeNcpkNgCyUMdhBCRgqS4P2yudM/qW5YtQ9gyws9lz
	 W3QonxHNwfuBg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 30C00D95055
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Mar 2024 19:50:49 +0000 (UTC)
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
 <171018664919.32255.5780533312961716956.git-patchwork-summary@kernel.org>
Date: Mon, 11 Mar 2024 19:50:49 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: dt-bindings: net: renesas,ethertsn: Document default for delays
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: David S. Miller <davem@davemloft.net>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=829277
  Lore link: https://lore.kernel.org/r/20240223195526.1161232-1-niklas.soderlund+renesas@ragnatech.se


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



