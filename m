Return-Path: <linux-renesas-soc+bounces-28618-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HEHKqVXpWlR9wUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28618-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 10:25:57 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5551D5860
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 10:25:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C690F3006153
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2026 09:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E57238947E;
	Mon,  2 Mar 2026 09:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B5kweSW/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5BD38CFEE
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Mar 2026 09:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772443288; cv=none; b=Z26qjqph6/vn49oP3fMzTEAdDtLzvPEGL/dCRB/YOdABA49PmvgW0xf1HPmeRSHOaYYwZn2FIwKB+BLJSy6giEjAGN7/sDVN9RP98P8jFru1HJvdJqN7nfJ9ej8tHfMWU/7cF7JY5a99aMeGofNFwjeiAOampXNfOQ8Vgqfu7sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772443288; c=relaxed/simple;
	bh=tnLDaY0pXxlfRmilCA9AKwrSLz6+Fr5x9iJ1xtEuD/I=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=fWHAYv32DwM6+bcpHZA9OCxmTAKBhYfS4NlkepMNtghhzuSN7qkQe+F3nCziXL/k1qomWbZAOtbCptrj8hHUZ6d4QYTaLld+15KQt6N/YWldSd0pg90LjXN4kj1jVgeyHzNDyygarVrTkQt1kynY9D9W78gBDE2cOf4ZFkQQ3OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B5kweSW/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED4B2C19423
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Mar 2026 09:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772443288;
	bh=tnLDaY0pXxlfRmilCA9AKwrSLz6+Fr5x9iJ1xtEuD/I=;
	h=Subject:From:Date:To:From;
	b=B5kweSW/tB8Iz3bjW9UDg+g9qfRkLnqmB+NlBaqj9tqOW5u1LumYT8UzU7z2rYMoB
	 Il3giozQGyrWptYeE3CJPl5qNLIjAuMP8snl4Xh9cJz6K/M2ImeOBslpLiLH1FhvMz
	 TdywUjnBe/jTkBv1mBbqQt/d/giGw22MvoTaqyio7VtA8GdNnIsITS3+BdzcnKzRKd
	 p06W1Fb5Hej3apwq8ejU7L3MOLCSwe7KV2lXVxSS6IFNRxl2O+4LBirDEiSCgOXv+j
	 xe3pCIWSyvGd/DNl8OPig6SllqhmohU1m4BoRzsCLjs/4ZXwnWh3ezhZQKhLz9vX3s
	 5ApsbU8+vacuw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4291539308D1
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Mar 2026 09:21:31 +0000 (UTC)
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
 <177244328976.3984952.15156240802124492964.git-patchwork-summary@kernel.org>
Date: Mon, 02 Mar 2026 09:21:29 +0000
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
	TAGGED_FROM(0.00)[bounces-28618-lists,linux-renesas-soc=lfdr.de,linux-renesas-soc];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: EB5551D5860
X-Rspamd-Action: no action

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Add DMA support for RZ/T2H RSPI
  Submitter: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1048269
  Lore link: https://lore.kernel.org/r/20260128215132.1353381-1-cosmin-gabriel.tanislav.xa@renesas.com
    Patches: [v3,1/3] dt-bindings: spi: renesas,rzv2h-rspi: allow multiple DMAs
             [v3,2/3] arm64: dts: renesas: r9a09g077: wire up DMA support for SPI
             [v3,3/3] arm64: dts: renesas: r9a09g087: wire up DMA support for SPI


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



