Return-Path: <linux-renesas-soc+bounces-27423-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOqOBNNLd2msdwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27423-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 12:11:15 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F95087837
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 12:11:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21B12300821D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 11:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E0C329E4B;
	Mon, 26 Jan 2026 11:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qN112zrv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD20238C15
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 11:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769425872; cv=none; b=H1hPEumoZHWAky8bJI4qKUGrZnE7fkdFpQcZRFLR0l92IYMpo8SWulDxiWV7vcc8KLEt19xtVHly9eeSew50zOd6+jMT+QN9Wp6xDwPnb9KWmatS4mAGwAHZQ7EX+zVefecfRpLyINIGLZvaBB5DVSaq6YAebfOsG0Yw47X0iOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769425872; c=relaxed/simple;
	bh=6olpEduC8fbUTKM8LAOU7uPyVbj1Da5OOdStGWvYpbE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=D0pF+yu6kN1bJMjDWRzgIHiNEKkIIMbsAF9DDn8T9AEsFbur/x+VWC/XI7l6rJ1l8h4J5On9HjhKKx4kyIjO6E5hwTqTyMeTYGce2OeqpaPlE2ySjbGn997/ggNSihl5Nh7s1u96hBAEdPtzUl0Dld6At55Ebb5cC79p2EqS64Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qN112zrv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28197C116C6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 11:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769425872;
	bh=6olpEduC8fbUTKM8LAOU7uPyVbj1Da5OOdStGWvYpbE=;
	h=Subject:From:Date:To:From;
	b=qN112zrvk8IIW1sX4LgFdGi2HyySGtUxN5J/x2zzoevLiOo+K0CmlnOcXOHyMZ0Ys
	 MkcxPI3qHBmgTL5l5KngczJKCs28xJNZLmO0d3qt7xZF5MabPkdKIxfeRumVRpgDZb
	 h/GxNiWhq1cKKNNj/c0D947ml9gMfR9yhNubYs+om/5SCnTpnW7/coi18YnUonE5e/
	 ousM98BswItZF5j4VsywhUcPVAFchL/ekjCdZ4Umpe7rvSUq5IqRVOWQ90FQFyHm0z
	 kJMUOxVBW7S+kApPu48afoyrygdGjcCtELo0ybL7FShgAZn4qQO3fa89CgkHRNKtPc
	 wpnb1NqCndX7Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id CB9B33809A83
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 11:11:07 +0000 (UTC)
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
 <176942586647.4174347.10888926427940375640.git-patchwork-summary@kernel.org>
Date: Mon, 26 Jan 2026 11:11:06 +0000
To: linux-renesas-soc@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-27423-lists,linux-renesas-soc=lfdr.de,linux-renesas-soc];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,huawei.com:email]
X-Rspamd-Queue-Id: 5F95087837
X-Rspamd-Action: no action

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: riscv: Fix missing select CACHEMAINT_FOR_DMA
  Submitter: Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Committer: Paul Walmsley <pjw@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1032045
  Lore link: https://lore.kernel.org/r/20251210160047.201379-1-Jonathan.Cameron@huawei.com
    Patches: [1/2] riscv: ERRATA_STARFIVE_JH7100: Fix missing dependency on new CONFIG_CACHEMAINT_FOR_DMA


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



