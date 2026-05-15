Return-Path: <linux-renesas-soc+bounces-32671-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCfbAn3yBmohpQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32671-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 12:16:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7334454D268
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 12:16:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 916D0300AC28
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 09:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 141D83B992E;
	Fri, 15 May 2026 09:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KAuN32gr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E533E40629F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 09:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778838662; cv=none; b=reCmGxKsdL4KYK2F+mo9akBccndHXAMNtjHsgMqhJHATfBcoJzAEqRc1qb2hs5Fp/9tIw+J0ub2rEiK9BWEcf5aOivwDarsFodOfW83cRlK3fwlJWgAuyOMxuj4D5CcfQqCusPV3Yq/zr8MicQNqgo55RwaIXBMt4RzWEp7tZfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778838662; c=relaxed/simple;
	bh=IS8J3j9R1bJSe7O8GfE9pZsQArQI6ZYpN9ls8tTeJUw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=cGP0Ftuk7ypfs6lU3pFX0Raz0ZWzNnJ31b8x7qzgitBW3l5JeJu/0lhYnEmOKOrKEp3qQZvnU1R9av/0RBA6HuYhmAadEupsABteOSVHNcsnzX4+s2AORoQxXvTwFzcriBZSekciEYtuX4hWmhdoBXKVvtT3nkjm/T9z11JW6ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KAuN32gr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8132FC2BCB0
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 09:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778838661;
	bh=IS8J3j9R1bJSe7O8GfE9pZsQArQI6ZYpN9ls8tTeJUw=;
	h=Subject:From:Date:To:From;
	b=KAuN32grU/0XzQ305+Ib39cWiVSeI9idnhkCSpnkynopE0ZuZm2UiozSQH3lID92g
	 ch7Cy5Y4IxIMrXfsOtS1NuTqtYogRauKQYHYqi3J5ydl7HM7X33MRuxpmvg6x9FXb0
	 K3wM2PgHD0rFRVWcQX9Ft0c0MSA04ptL8oGSRR4+mHCRaX5Itm+KAHN2bmxDhPz9np
	 0eOqKpP1bSb7Kaf3jcL9/yEEc0grvaGjCdkHd1vOlVzndCS5UrY72x9xQp9Lv/vaOM
	 Wv/jcEvTp/OP+EbIlckH5ljo1X0N3eW0J7f5UYodcM+HqDx44fy1Hyb2nz6pFe2vvo
	 UwwfvGRVagxZA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 055BC392EE08
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 09:50:07 +0000 (UTC)
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
 <177883860557.301785.9061811891062217785.git-patchwork-summary@kernel.org>
Date: Fri, 15 May 2026 09:50:05 +0000
To: linux-renesas-soc@vger.kernel.org
X-Rspamd-Queue-Id: 7334454D268
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-32671-lists,linux-renesas-soc=lfdr.de,linux-renesas-soc];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Describe coresight on R-Mobile APE6
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1088840
  Lore link: https://lore.kernel.org/r/20260502185557.93061-1-marek.vasut+renesas@mailbox.org
    Patches: [1/4] dt-bindings: clock: renesas,cpg-clocks: Document ZT/ZTR trace clock on R-Mobile APE6
             [3/4] ARM: dts: renesas: r8a73a4: Add ZT/ZTR trace clock on R-Mobile APE6
             [4/4] ARM: dts: renesas: r8a73a4: Describe coresight on R-Mobile APE6


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



