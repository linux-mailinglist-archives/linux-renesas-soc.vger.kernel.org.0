Return-Path: <linux-renesas-soc+bounces-30902-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFxSBq3N02lpmQcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30902-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Apr 2026 17:13:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB773A49F8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Apr 2026 17:13:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E127304C13C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Apr 2026 15:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C5B3876CC;
	Mon,  6 Apr 2026 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jmVNkwOw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFD43876B5;
	Mon,  6 Apr 2026 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775488215; cv=none; b=On02uZARCOVXlffb5HadS4cFa1TRVjW3m9250Hm8ba+Gi1nYOhnshnJz12BbzI+kwcFm4lfnBZAbDkTNtztYq5Muar5Z4SlFLMSy+jqrIP3wZXhX+KgP3GDNTJTDOHWIC5vw9EFiSXuK1zkJZrtkUIkcrTZIYoaJ3aNBD/zt9Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775488215; c=relaxed/simple;
	bh=a9H95euzRHSCYqHgPIKYZyOiiucO5jELRBgLVxoXIgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gdZ2v+bzW4ghcnc3dGk7ej+p8Iz88zG8cQp0gpTI6LaClwj5WclqZ1vPFF3yaiiEPT5iFfJd4G6YwwZsJNt1q3nM6AETV1n1oi0b4OrliBjCZ28TOrCQRy10WJj3Y488GY4MRSgndSARGSk1TJ4Ck3+mwy1VlLnu/3Vr7D6bXhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jmVNkwOw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C639C19421;
	Mon,  6 Apr 2026 15:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775488215;
	bh=a9H95euzRHSCYqHgPIKYZyOiiucO5jELRBgLVxoXIgY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jmVNkwOw+0XuK/ojHgJRLspSi+3NXHnHEburM0NaEpodNfnuxkTWDJwSt5ZYktbdJ
	 M2xPOY28+tgaCCm7Ihfc4jbCZtdgtQ9JOHnLkH5rNPYQW5hW2dkr9vHnfyebPFNUHs
	 W6Wj1Tf1S7Hrjju2x7LX5TfEUdbhW/Y6/Q2QJHBrydqhKKpd3dNvxuThHvYfoCY93P
	 BSai2ZaNnw6ZPeNoGtO56uwPmIj4QaxdZm0x6GC3QDEgsayK05jaOXo10QoJJvz+ab
	 bVf/BRpyDx2T1PZskdjPd32Y0w3dl+r4ve5sfPTC1gg+vGB/URkRHnY/jGCYaQ3kmc
	 eSzwGSDUUTUJA==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH 0/2] hwspinlock: remove platform_data from subsystem
Date: Mon,  6 Apr 2026 10:10:04 -0500
Message-ID: <177548820152.2290739.409993519549727146.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401071141.4718-1-wsa+renesas@sang-engineering.com>
References: <20260401071141.4718-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30902-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8CB773A49F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 01 Apr 2026 09:11:38 +0200, Wolfram Sang wrote:
> This series removes the use of platform_data from the hwspinlock
> subsystem. First, the last user is removed because it turned out to be
> obsolete. Then, platform_data support is removed from the header.
> 
> This has been in a larger refactoring series before. But this
> refactoring turns out to be a rabbit hole where more and more fixes are
> needed before I can do the actual refactoring.
> 
> [...]

Applied, thanks!

[1/2] hwspinlock: u8500: delete driver
      commit: 392035c8b88b0198721e3b273f0a19ec2150710f
[2/2] hwspinlock: remove now unused pdata from header file
      commit: ad5fd5aeb65a4426635cf55ef06c96e60a66e648

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

