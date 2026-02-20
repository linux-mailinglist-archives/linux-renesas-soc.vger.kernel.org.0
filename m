Return-Path: <linux-renesas-soc+bounces-28338-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEMAO87fl2n99gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28338-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 05:15:10 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8C71649E2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 05:15:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2F5633017DE4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 04:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD297331229;
	Fri, 20 Feb 2026 04:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I2F7Jzbu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1AF307AC7
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Feb 2026 04:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771560659; cv=none; b=ohL86wLSd6LUUvc+qbFBl0rAtK/Rrofaqgb3CLJz/U7eHqcyIzZhJ+9sJrwALXwOA9wDEOOupwvctVW4x5Ol6RXodzn4VnvZlU9ShuhwMFJlswzmoNGGjXlJLV7dZwfVgzGtBttSV5mq8cKbHO0dSqDEJpZdwncVMAcf+5vjyvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771560659; c=relaxed/simple;
	bh=e81cs+ofMYR4DC6LCww6mSPUC6CG5uHTZadCxmdJ2d0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=hSuUWWN2nT/Yvfa4F9MNvWqKfjAt+M/2awkfWQ1iBxbvYiLIDJINjS1qRRpqg2sajl/NR0NoYKrhs7FiTwU0kqTFXNYfiNT52HDGvkWhy0xNHlumBzJu6ZEJ9sccc66Uv0Ux8og8oDUTfdgOeJtJynMlemeyHhpCQrl+rwVCnS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I2F7Jzbu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25FC1C2BC87;
	Fri, 20 Feb 2026 04:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771560659;
	bh=e81cs+ofMYR4DC6LCww6mSPUC6CG5uHTZadCxmdJ2d0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=I2F7JzbuoLInhmc1ni+lBsI7Pvr/4MVFMnHll797K223oeGLE4dDCnUsu+cbuTWmg
	 79WYG3153kffMrIdPnr+erIa/9/E4lC+D6Kg/8dKGkB5Vs+XO3BrCOxQ+vToDZK4EI
	 0PfDd50chIkbRqUOaHlS8uA5KK6vvOdtoYjsBBFdYax0cYcMhNcyeT/PRgrZKyRFbr
	 RtOE7qh80PIo5d7b5xSt6wEO/6f/g7C0IA9fJFZACYouX7QJaNtg2yTFWFtzXYVASJ
	 BciRFyVHwGWYA3jSAhKvL6ZYDW98G5kakrdG0ED2Fdz81RjjSTuZKHd6WZHTc3nMC2
	 gIhlCfRjyskZw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9F473809A88;
	Fri, 20 Feb 2026 04:11:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] riscv: dts: renesas: r9a07g043f: Move interrupt-parent
 to
 top node
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177156066728.189817.4895026991119169845.git-patchwork-notify@kernel.org>
Date: Fri, 20 Feb 2026 04:11:07 +0000
References: 
 <97d3d70e42832f4ffa3888bec792b692a7ab700f.1767719409.git.geert+renesas@glider.be>
In-Reply-To: 
 <97d3d70e42832f4ffa3888bec792b692a7ab700f.1767719409.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-riscv@lists.infradead.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
 magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28338-lists,linux-renesas-soc=lfdr.de,linux-riscv];
	FREEMAIL_CC(0.00)[lists.infradead.org,bp.renesas.com,gmail.com,vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Queue-Id: 8F8C71649E2
X-Rspamd-Action: no action

Hello:

This patch was applied to riscv/linux.git (fixes)
by Geert Uytterhoeven <geert+renesas@glider.be>:

On Tue,  6 Jan 2026 18:14:01 +0100 you wrote:
> Move the "interrupt-parent = <&plic>" property from the soc node to the
> top node, for consistency with
> arch/arm64/boot/dts/renesas/r9a07g043u.dtsi.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in renesas-devel for v6.20.
> 
> [...]

Here is the summary with links:
  - [v2] riscv: dts: renesas: r9a07g043f: Move interrupt-parent to top node
    https://git.kernel.org/riscv/c/0c3644ac3f8d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



