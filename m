Return-Path: <linux-renesas-soc+bounces-31624-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UM3+BqQ662nRJwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31624-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 11:40:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA0945C582
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 11:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B4C3B3002B24
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 09:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585C937CD55;
	Fri, 24 Apr 2026 09:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L2LQH6B5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359743890EE
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 09:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777023648; cv=none; b=L9K/tLDcDEDKTa5P7NTeD5ARK08ye7cOYmANxevqWXvfapQ6z2fS9XbzCcpArFL2NybfTInXDtdiOeXyBT0MElUlz21GOtSXlejKOu+g16TQLbukcsKXRrJk9gJDvSBRyuLcTfdPXcD+WW3QiTmnFy2xx02GAy1429+372QIzmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777023648; c=relaxed/simple;
	bh=UBu+xi6giX10QQr3hNxxNVZ2/1e9ICX7OBIV9NKVxzk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=lltqFDDzbxHAFJN3uSH7HKEge6FGp0iFG15DvsFN4IswytrqSCDe1HaFPLokT4X3HBzGYE1w+aoY9ggi+mEf5yS2RqE3+3WkvFGjq4q/T8OKSxXqhpyke3nfZX8/HJNyy2TovIyx8ryWgHWCezfa59l3ORjinbw7FWBe5EMXNfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L2LQH6B5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE395C19425
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 09:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777023647;
	bh=UBu+xi6giX10QQr3hNxxNVZ2/1e9ICX7OBIV9NKVxzk=;
	h=Subject:From:Date:To:From;
	b=L2LQH6B5wyQvosEY2OVFL2AHdTUn0GhmzzwQTgXc+46qhk/BJHrnRLweiElIRu8Ip
	 hnHh1xHPdsc0nQkplNtExRvjQpWdvjm7ZRR2E+uoTMAJzpKen/N3tcSh0lpdAF39Sw
	 EAQM4sZTtw2fWzbaZa0Q5PT5nC0jV65+vOKWPG05QB9UVHPdVwmsoYSp8RpCVT6nrB
	 SPpL5u6rrk5D17P+qS3tjGS41SCqh1jlRmNEhd4x6/YWNiugK++eerf1x3UdBZdXL8
	 NqxmwgITbraBre+e15XxSQNtYQKXXfULfozTRooldsgssqQ/vGcs1qDv00kQqGclNG
	 UMmYEPm99vF2Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BC4763811960
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 09:40:09 +0000 (UTC)
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
 <177702360833.1034154.4365236532543214969.git-patchwork-summary@kernel.org>
Date: Fri, 24 Apr 2026 09:40:08 +0000
To: linux-renesas-soc@vger.kernel.org
X-Rspamd-Queue-Id: AFA0945C582
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-31624-lists,linux-renesas-soc=lfdr.de,linux-renesas-soc];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,glider.be:email]

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [PATCH/RFT] arm64: dts: renesas: r8a78000: Fix SCIF brg_int clocks
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1039068
  Lore link: https://lore.kernel.org/r/459d360a8332f92b3766b30814e7e1c76169aaf7.1767719254.git.geert+renesas@glider.be

Series: arm64: dts: renesas: Add missing #mux-state-cells to usb2phy-reset nodes
  Submitter: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1078252
  Lore link: https://lore.kernel.org/r/cover.1775575276.git.tommaso.merciai.xr@bp.renesas.com
    Patches: [1/2] arm64: dts: renesas: r9a09g057: Add #mux-state-cells to usb2{0,1}phyrst
             [2/2] arm64: dts: renesas: r9a09g056: Add #mux-state-cells to usb20phyrst


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



