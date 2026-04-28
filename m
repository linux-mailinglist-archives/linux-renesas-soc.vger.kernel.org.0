Return-Path: <linux-renesas-soc+bounces-31690-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Ja1MFNi8GkRSwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31690-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 09:31:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 698C647EE80
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 09:31:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EB407301ED19
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 07:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE7B401A2E;
	Tue, 28 Apr 2026 07:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PnOFI3Xn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9A7401A2A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 07:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777360849; cv=none; b=KEvSuU/sl8jigG4SimKpiVQkl9l7n2N9o9T4yzYTyy2gneiBTzLao5lftVrCVe26JLGkDBROc640C5U0HaQtnyAXQXqtRqqeoS30hfff31J4+VBnO33mFvcfEg0Fh8Tz2PI7o7Od55CChzT3HLly2CpqxvidvE/DQu6QWdSSqzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777360849; c=relaxed/simple;
	bh=ll9+QhSKCVAyVn23QJYiuhJ7Bzl+VFz4FS2ZyAm1+uw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=Mp7wPEMco/VyJKqaHjMi0CXxgBGnEs8G4yRv2TtBn7hJQrw4RSMLUHtpa8OJHAJxqYQ/vPm92VYeagYllUvMzpDYx4OyZja2yTuFrnPVNCwtj5hwqN4T1Ssu0ipqj5i2G04YJFME+iL06bXxB+trt2Tez5+7ZItLamrDrd958ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PnOFI3Xn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FEE6C2BCB6
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 07:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777360848;
	bh=ll9+QhSKCVAyVn23QJYiuhJ7Bzl+VFz4FS2ZyAm1+uw=;
	h=Subject:From:Date:To:From;
	b=PnOFI3XnXuSpmBCIuLBaZYJy7ELYJtsXPiImILJLQr7659ffmVsmxVLyne4RtycNu
	 3XQWO1BFl5KAylZh8qGGP194v0It9skM9M23OsYP9oMpbSoFXE5OA8J5vW7hFODQWq
	 bGvOH6Rj23yU52ZQrKIisGNmaOUTZ8V4lUd39n2I6sc71/EJ4AEo11+FzJRa4wUWlN
	 HyAINyde+jI6B5scqPBxDiuBVsMj6/+lHiCbJecZAEa2RKjoPbN44uqmd6adRk1996
	 Y8pu31/ryyqg95EU8rDrJ+6zvQrbmTy15N2xLpdr9LLwjGM+5aNwh5Q2kE/uAAPk9f
	 zASZN06PpkexA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 426073930001
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 07:20:06 +0000 (UTC)
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
 <177736080477.298314.7030869990014823326.git-patchwork-summary@kernel.org>
Date: Tue, 28 Apr 2026 07:20:04 +0000
To: linux-renesas-soc@vger.kernel.org
X-Rspamd-Queue-Id: 698C647EE80
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-31690-lists,linux-renesas-soc=lfdr.de,linux-renesas-soc];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Add Renesas RZ/G3L PINCONTROL support
  Submitter: Biju <biju.das.au@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1067896
  Lore link: https://lore.kernel.org/r/20260317101627.174491-1-biju.das.jz@bp.renesas.com
    Patches: [v3,1/8] dt-bindings: pinctrl: renesas: Document reset-names
             [v3,3/8] arm64: dts: renesas: Add reset-names for RZ/G2L and RZ/V2H family SoCs


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



