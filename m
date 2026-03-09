Return-Path: <linux-renesas-soc+bounces-29053-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GYoNCWRrmk7GQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29053-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 10:21:41 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8243A236120
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 10:21:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5C8773020FC6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Mar 2026 09:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 454A037998F;
	Mon,  9 Mar 2026 09:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KfYlMrKb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208B03793CD
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Mar 2026 09:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773048094; cv=none; b=OS/X34j2vURcggD5uNlINUrBdt8qDHslosLgKcsQg5/+PesDG5SmSCW65vnqrVgbJ6L0b9Cp7d3S6RNfyncRtzSk09puuTNwXf0/+tHW7tQGRi5aPmJDOmdwQbXViCNW7GteMfRg0R44Hj13R19ZXF+CSzAxYw4WxeskInC9LWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773048094; c=relaxed/simple;
	bh=jL6L8PEbmbb46SaL+s8ZeColQ2e6Ev9OL9GVH0Kv0mo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=E/hKlalf9fBzyj0eYyjsp0870AhYn9TiRS66Sq9lN8W+scYQ0m8QIEHQiXtt/UhepTEqcnfVtEZcmh+qFIuQpbpM9xZh1GbGUZPyd3iOzydtv2kLsBGE97BXfEGsydcnPhNSC47+QqmF/k4GcX9OKFY6+U0d30LgkIiqXret3ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KfYlMrKb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C72B6C2BCB2
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Mar 2026 09:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773048093;
	bh=jL6L8PEbmbb46SaL+s8ZeColQ2e6Ev9OL9GVH0Kv0mo=;
	h=Subject:From:Date:To:From;
	b=KfYlMrKbHRLdP2RdTcS2L38jqiJbC5alGT42TNWbbSCAQw5pcyBPES/i/DLA9bhDZ
	 5kz0rOhi4rt0ECePho6QCqxVY3IcOWYka8ZxjXHB+8r5f7QsPIKMvbheauohv8aiJm
	 earpTpR3IAd8ubf7bwrRPnTT8UgSAA9BC1oH6sdcO5v2u5/J2rFM8U0QW+dw//xFDg
	 aEYy7Qn0yRB32sqv9G8Ofzu5I3Hpub1F3rgZMY1A/A1ji7P89snJ5OP7EVk3m3+C23
	 IJFgOlLv1A2gga4+5/CnxygbtvL9g6+IeyDqvBlpQX5NKp+HtaY+Ha1TWx8qtq2N2k
	 9d09KG26E9NbQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7FAB33808200
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Mar 2026 09:21:32 +0000 (UTC)
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
 <177304809111.1123993.5135564454698984194.git-patchwork-summary@kernel.org>
Date: Mon, 09 Mar 2026 09:21:31 +0000
To: linux-renesas-soc@vger.kernel.org
X-Rspamd-Queue-Id: 8243A236120
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-29053-lists,linux-renesas-soc=lfdr.de,linux-renesas-soc];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.984];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Action: no action

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [v7] drm: renesas: rz-du: mipi_dsi: Set DSI divider
  Submitter: Chris Brandt <chris.brandt@renesas.com>
  Committer: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1058721
  Lore link: https://lore.kernel.org/r/20260227015216.2721504-1-chris.brandt@renesas.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



