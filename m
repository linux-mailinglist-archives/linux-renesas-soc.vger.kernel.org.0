Return-Path: <linux-renesas-soc+bounces-29051-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDoINq2OrmnVGAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29051-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 10:11:09 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF5A235EEB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 10:11:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E72A7300B10C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Mar 2026 09:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881FD376BCE;
	Mon,  9 Mar 2026 09:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WDo8xpt3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C3C37647F;
	Mon,  9 Mar 2026 09:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773047467; cv=none; b=KFsDt7ZvvAJr8wnrz4VIB+n8f5uu1rlNdeiCjPzPthXY+4fzWBWgOzriPEIWnJwJe92jrBG41ANqDqY6hCZ7oFnYuT5yVwYd5gWEvtSfSTLYrPiLSPpLVA6gNqHAE1/0LcbSJr9CLxou3XCEu4C/h3bvsqM7/WVoYxqd7uXpUvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773047467; c=relaxed/simple;
	bh=WLv9qqLZ/btidVarDfm4uY8aB7MnPY0EpCVnateUiGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QSvKQJTSJHgpwQtzuyJW+foNpQF7aPE5FA02M4rA0LoroS2QTDVZfjIXq4qIRUVad8fgXNMJbpDiDNmLjji7KIMxIXyPw0GNa0J7lYSkewfy9wC3uDxzQ2tleQUPsbd4cRXDdiZIeR2JX2DtMoQHb1vHGKlZQZJVRjwtS7VWpg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WDo8xpt3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 118DDC4CEF7;
	Mon,  9 Mar 2026 09:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773047467;
	bh=WLv9qqLZ/btidVarDfm4uY8aB7MnPY0EpCVnateUiGc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WDo8xpt36yqSDDveDKlkl4R/SIZL/veYsmg35mJAhMPg7YRldiExyNtinsj/PPTly
	 VSmcZPI3Z9MCCGSd6qNfxh5TOA1jpadFRYEAVDc+7dr7pUnpCKq3NjqO5Z4KySEP/e
	 3L6xA7wkCB/bGFOAWOsTLeAlOQ905MRZDf3T4zVXPHF9Fs+4ic5fmghXgOLuS83rzo
	 qCoD3K2nUiyb5kwDk3gQ54/DlPP4X/LmsMaGIVjibq6eOkJifQ69gzPez2ZWjqn20H
	 Lm1MH1llAmrHZlm9qPfSOMG+WiNdVOVtFRWmO6DpIGJtAv4mpZ5ISYoMiw5VHbUcwU
	 4FJa/iKytuUjA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org,
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: firmware: arm,scmi: Document arm,no-completion-irq property
Date: Mon,  9 Mar 2026 09:10:59 +0000
Message-ID: <177304738934.1267831.4681471282641940772.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260117010241.186685-1-marek.vasut+renesas@mailbox.org>
References: <20260117010241.186685-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3AF5A235EEB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29051-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.970];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sudeep.holla@kernel.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Sat, 17 Jan 2026 02:02:28 +0100, Marek Vasut wrote:
> Document new property arm,no-completion-irq . This optional property
> is intended for hardware that does not generate completion interrupts
> and can be used to unconditionally enable forced polling mode of
> operation.
> 
> With this property set, such implementations which do not generate
> interrupts can be interacted with, until they are fixed to generate
> interrupts properly.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/2] dt-bindings: firmware: arm,scmi: Document arm,no-completion-irq property
      https://git.kernel.org/sudeep.holla/c/0c5453bf8437
[2/2] firmware: arm_scmi: Implement arm,no-completion-irq property
      https://git.kernel.org/sudeep.holla/c/d8283ac2c8fb
--
Regards,
Sudeep


