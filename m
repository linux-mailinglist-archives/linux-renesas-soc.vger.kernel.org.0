Return-Path: <linux-renesas-soc+bounces-27310-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGFhOA1fcmnbjAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27310-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 18:31:57 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6706B583
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 18:31:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD9C9302B4A6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 17:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D493783A8;
	Thu, 22 Jan 2026 17:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CzfjNByW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577EB3A1A45;
	Thu, 22 Jan 2026 17:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769101200; cv=none; b=XfwioONR9VofqwaYKMwWMUK+ob02Hh2bWWwHuacivFJLbwts3TQpXNbYRZqv3jhSEXQWoWaTKZET5ByKL6WsiCY0BqBe8678GNf0LPfoLb7uTC1GIqz+vQjaFAnAINyE2I8XCS9pQC/qqqDsZyWLhvGPRGXye7a0IVkJ6+Fi/0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769101200; c=relaxed/simple;
	bh=XP3btCdfZ18H84BPvTQijTYLXkXA2fMO98F8VgchIOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MNgqplam+1Kz+Jzt/jdnPI8zYVgzOylh7UOJJ3jVdA1zKTYydosVsGo2d5sKe965MscEnVxjZgu29ICq/DQ4oBGzrdvRBXs2JCYGtjGSRIKxKh2sQZ1k/JqOTKUq/5nkSPV46aKfolPDceq62bute2RcvkojpEBXfdfnY+FH9Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CzfjNByW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC8E4C19423;
	Thu, 22 Jan 2026 16:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769101199;
	bh=XP3btCdfZ18H84BPvTQijTYLXkXA2fMO98F8VgchIOQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CzfjNByWkqZNWarc97P1of6ulVVMxbVA/TgAr1EUL/UA3sAWJZXfm5ATHgrcGhh4C
	 o3RD7/pgYiOact5D3MlLRiRG+EwE4AObbmeEz85hsP6ChoIwzIsAiNdaHJCS6wmWAh
	 E4Q7hePj2AEHx6XkHkp5ZqxbUCbIhBXgiPSHiOgAmdhkMRan4A20Y8J1MT5ov81XZF
	 rpzwHOL4sckepaVDxw08M1PCWrs6jdhWdo6UbcvVDztaGl0KmYwEHEHeWocqXpzUPI
	 KPr776MBBB+QfF2nHn/vZc/gKekFtUz4PlFtJ5TvaACtw9Xjm72wQqH0qcYqJ5moYa
	 6P8FN8iETPbiw==
From: Will Deacon <will@kernel.org>
To: Lifeng Zheng <zhenglifeng1@huawei.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: topology: Do not warn on missing AMU in cpuhp_topology_online()
Date: Thu, 22 Jan 2026 16:59:41 +0000
Message-ID: <176908072212.2053791.7954554866629671060.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <a8dbf49bfa44a6809fa4f34b918516847dc14460.1768466986.git.geert+renesas@glider.be>
References: <a8dbf49bfa44a6809fa4f34b918516847dc14460.1768466986.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27310-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[will@kernel.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm64.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2F6706B583
X-Rspamd-Action: no action

On Thu, 15 Jan 2026 09:51:45 +0100, Geert Uytterhoeven wrote:
> When CONFIG_CPUMASK_OFFSTACK is not enabled, and resuming from s2ram on
> Renesas R-Car H3 (big.LITTLE 4x Cortex-A57 + 4x Cortex-A53), during
> enabling of the first little core, a warning message is printed:
> 
>     AMU: CPU[4] doesn't support AMU counters
> 
> This confuses users, as during boot amu_fie_setup() does not print such
> a message, unless debugging is enabled (freq_counters_valid() prints
> "CPU%d: counters are not supported.\n" at debug level in that case).
> 
> [...]

Applied to arm64 (for-next/cpufreq), thanks!

[1/1] arm64: topology: Do not warn on missing AMU in cpuhp_topology_online()
      https://git.kernel.org/arm64/c/747d5b6735ca

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

