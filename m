Return-Path: <linux-renesas-soc+bounces-23622-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A5EC0CEEF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 11:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C32DD3478A0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 10:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F63B22424E;
	Mon, 27 Oct 2025 10:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ieafRJEU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9CF1DF252
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Oct 2025 10:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761560476; cv=none; b=UdWP+crJ5yDLcxJ7PrR+A/epu8L3UuVCw+3jW3ifGuoPCbktDl62Sve4RWJkXSFRPHmiDGH631rvhpONtpByvfII6iHzJlek3ejzIPYDJKBi8E06d1Us2EEbta/+eOIgZh3AEIOObYNxyK5sT4dIS3GpP6sb3EMhqShD2JrzCWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761560476; c=relaxed/simple;
	bh=K89QwKy4uBZezUDHJcvh0j7qFqsu+/R3kPoeFrJyB5s=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=hZ81nDKJ2t+A38LuUN0p+WIBNvsJhw1hgQEc9KlgsWP51AUI8RsVv822tRFYShpJT1Fb+2AvRaIqTxt5PU6+zq3fIIbAJ+zJMX7ehmjbB1FH7ijf1kZ3VcPHQcLhtAyKjCvdmh8SqOUkkOtInhEEBoF2OGuuU0ZO7Wv3CqIsvd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ieafRJEU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF84CC4CEF1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Oct 2025 10:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761560475;
	bh=K89QwKy4uBZezUDHJcvh0j7qFqsu+/R3kPoeFrJyB5s=;
	h=Subject:From:Date:To:From;
	b=ieafRJEUylYbvjKXdrK06Zmp29DS7G568qQJVGXl5A8rD4c0ffZ+ruuSiKR619fXO
	 vcM5hfS+Q+fMAJPtrICNHkaivgpbpeVlbyJsypaJ+Jsur7gNmQ3ECqNYp6mFc2fanq
	 uh9PPnEj066NWrJe92BZhomFHCmf/umDjEz4FtQZIhouuVlU+Anr2tcFtEkKl3kamd
	 hcIoWt5TfHk7cL6PY9Uy4MhuRbLS2yXcJPj5uqL+4pRUWuHTH8WjkXXIJuxLRm1Cuq
	 wmld6zlFvBlO8Ve3GrzJpqjyvfWWpYP+bFrpD+7e7nwP6qFR/hXnSafTwDDNYVhgPi
	 /CdeDj8KmL9dA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4E342380CEDE
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Oct 2025 10:20:55 +0000 (UTC)
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
 <176156045403.1300955.12561797194110505873.git-patchwork-summary@kernel.org>
Date: Mon, 27 Oct 2025 10:20:54 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: dt-bindings: serial: sh-sci: Fix r8a78000 interrupts
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1009344
  Lore link: https://lore.kernel.org/r/09bc9881b31bdb948ce8b69a2b5acf633f5505a4.1759920441.git.geert+renesas@glider.be


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



