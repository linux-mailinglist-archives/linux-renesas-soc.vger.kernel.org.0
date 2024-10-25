Return-Path: <linux-renesas-soc+bounces-10133-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 185F49AFFC5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 12:13:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D00DD288056
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 10:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB5D1F818C;
	Fri, 25 Oct 2024 10:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qH/+s6tf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9721F9ECE
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Oct 2024 10:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729851026; cv=none; b=cFOatZ789u75xYQDz7qR7eyk/JXAyz2AMf5cS4Bw91kGjOEN3VeyDJdtjItu1kNeoHmejgMtfi1k7olCxgoepXMkvTUrW4y9HsapjBcUy2Bf/+y0doP2Giz2R6DzzRyXb8tQnYMzKiLyTLCuSU7y2/sdCsBSNHHqEoGQKnuElKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729851026; c=relaxed/simple;
	bh=BcUSsZor6Y+e9i6KTKg/+TBNKWTorP0LawQ7p/8Z4dw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=IZ5KZbxkBPVqm24ZFFuyQhpnDBiZW4lj6hFu4rvesL7vR6lduWzeKDWeYO0wVn1EER6zM2JhNqIsJVjXawMwgi5YMZeWW4X7qS2L476hdJ3Nf2d7qj3dzxZVy6Z1kHV//VPkVhW8MuDqRZ257ItPpfMGOedV79njZAIZHh5Jkdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qH/+s6tf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB078C4CEC3
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Oct 2024 10:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729851025;
	bh=BcUSsZor6Y+e9i6KTKg/+TBNKWTorP0LawQ7p/8Z4dw=;
	h=Subject:From:Date:To:From;
	b=qH/+s6tfarZ/nfdBisK2kAiaJ2XKhH03KcjT+GWsGRc/G+ZS4BCvFLg8B+nmm+yLZ
	 oT9rGd+BW3q0qEZqI7vsefsGU1ZduId/GcMlh8cI5JVO5wZcOFeIpR/VW4HLRhuhSK
	 /FffiPq9iuUiDlV8JfR4HP14r1zxxVvvTHuOUEBTylilrvuUeYSCP5Qam1SH9CrvCA
	 Yeges0TLrrn7J5hv6lYT9WTzBVPVET9x7OaT3h3x8EgV1lhjBsG0wnM9yKzbB+Utkn
	 ExEh0ISkYG4ZqGg2Osz5Gm8ZEINIdf2r3LKMY+TRp2XCINpf53FXS8Ch8pSVATU3Eg
	 hN9LtcNhshFfw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B62243809A8A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Oct 2024 10:10:33 +0000 (UTC)
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
 <172985103220.2855305.188195043521764372.git-patchwork-summary@kernel.org>
Date: Fri, 25 Oct 2024 10:10:32 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [v2] arm64: dts: renesas: r9a09g057: Add OPP table
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=896814
  Lore link: https://lore.kernel.org/r/20241008164935.335043-1-prabhakar.mahadev-lad.rj@bp.renesas.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



