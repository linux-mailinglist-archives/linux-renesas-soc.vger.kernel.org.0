Return-Path: <linux-renesas-soc+bounces-33302-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IO7jMFhVGGoQjQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33302-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 16:46:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2707F5F3E9B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 16:46:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC95930071C1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 14:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FE79379973;
	Thu, 28 May 2026 14:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DNeGeyTB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB84C3E8688
	for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 14:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779979207; cv=none; b=QFxSQBZGbwpmNblKeYh/2/6hJ5FOKxni4S7fJrJnwzq5eBIopOeBZJm+i9kKuT863reUpaFbxeqCwZaZvvodZYWTphFtGUyUmyd4nlhGdtCTn+1pMl9JYjRKOMT1+nwcEMkJpLkLP+aLbmO3CGHrORrGgTOUe8ZhTNDS57X4QdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779979207; c=relaxed/simple;
	bh=f3bEWBUTLQKgTx2jV2tOiskJ2NPeuBF3jyzl1YWN6k4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=eEVquarYVThi/L7MRoKWZmuM/jbN1XicrvlEcJ5xtq6rzMjcIgh/WVRFwW61h7AGADKM4ehIsps6lktoaHSfseDxGcyMKyj4kfFQgwrq28XhgCfLVmzq8wSbzn3vwTXOww2kr4XJLrJ7G7+z2K2Lh/eMaTihAjY9DQ+b+w9a4JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DNeGeyTB; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC8D1F000E9
	for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 14:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779979205;
	bh=/IR7CH2C2ib3xJGXlrJoP4J8/XYZqthLyn9rDDXZyAI=;
	h=Subject:From:Date:To;
	b=DNeGeyTB+PxNs5Ud0avLZo0DzExGDiQLtoXBAjU7Y3w0RkWytRaBrtoN/0GDcUkG0
	 q36vTc9lJEhtOVnf2dkAuPlFXdVN8cNXPHoOpVXd9d6rVSz7LxBtmcGi+1J7tus7a8
	 SCfMETHZytXFIzM0R32OXBrOu4t0J+a3PegOwlrHcKhMg7XCW/dkDAJJmSR0lEZs35
	 QdeoOQ/xxbmBI5r4AcHnt7IDf+MWvGuL8CJ1O/03Yn6CRpLDO2FHdxaSfpRJuNJA7P
	 iK+Y8RbynbEpRO70TWCrGAWYJQF0nNKkwoWYARbbs8ux8qvvaDqVeTtN3GQlgFLOYW
	 WERq1s85Km02A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1C5AE381195E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 14:40:11 +0000 (UTC)
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
 <177997920963.955660.16832810337624430526.git-patchwork-summary@kernel.org>
Date: Thu, 28 May 2026 14:40:09 +0000
To: linux-renesas-soc@vger.kernel.org
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-33302-lists,linux-renesas-soc=lfdr.de,linux-renesas-soc];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 2707F5F3E9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [v2] arm64: dts: renesas: rzt2h-n2h-evk: Configure eMMC/SDHI pins
  Submitter: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1095012
  Lore link: https://lore.kernel.org/r/20260514210220.7616-1-fabrizio.castro.jz@renesas.com

Series: arm64: renesas: r8a78000-ironhide: enable SCMI
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1097129
  Lore link: https://lore.kernel.org/r/20260519074702.3308-4-wsa+renesas@sang-engineering.com
    Patches: [v2,1/2] arm64: renesas: r8a78000: add MFIS, MFIS SCP and transport nodes
             [v2,2/2] arm64: renesas: r8a78000-ironhide: enable to use SCMI

Series: Add xSPI support for RZT2H, RZN2H SoCs
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1101258
  Lore link: https://lore.kernel.org/r/20260526204045.3481604-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/3] arm64: dts: renesas: r9a09g077: Add xSPI nodes
             [2/3] arm64: dts: renesas: r9a09g087: Add xSPI nodes

Patch: arm64: dts: renesas: rzg3e-smarc-som: Sort pinmux entries and fix blank line
  Submitter: Biju <biju.das.au@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1099950
  Lore link: https://lore.kernel.org/r/20260524092016.46346-1-biju.das.jz@bp.renesas.com

Patch: arm64: dts: renesas: r8a78000: Add PSCI node
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1094503
  Lore link: https://lore.kernel.org/r/20260513225037.49803-1-marek.vasut+renesas@mailbox.org

Patch: [v2] arm64: dts: renesas: r8a78000: Fix GIC-720AE View 1 Redistributor description
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1094781
  Lore link: https://lore.kernel.org/r/20260514125328.20954-1-marek.vasut+renesas@mailbox.org

Series: Add RZ/G3L SMARC EVK support for SCIF, I2C and GPIO keys
  Submitter: Biju <biju.das.au@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1089639
  Lore link: https://lore.kernel.org/r/20260505070206.7932-1-biju.das.jz@bp.renesas.com
    Patches: [1/4] arm64: dts: renesas: r9a08g046: Add scif{1..5} device nodes
             [2/4] arm64: dts: renesas: r9a08g046: Add i2c{0..3} device nodes


Total patches: 10

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



