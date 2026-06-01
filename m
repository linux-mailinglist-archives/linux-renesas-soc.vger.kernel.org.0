Return-Path: <linux-renesas-soc+bounces-33390-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gP3zKbE+HWq8XgkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33390-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Jun 2026 10:11:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 414E361B4A1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Jun 2026 10:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 73E0030059B1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jun 2026 08:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F28233ADAD;
	Mon,  1 Jun 2026 08:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IGi3xte9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A762113D51E
	for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Jun 2026 08:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780301487; cv=none; b=abQ7zuPGU+Aapx7qid7BkOiZKLEfp+NBauvOWY34AsHQ2FG6luYbhA/9mr9u/mikZtFi8YK9ZPQeBYNdY02Jw+m9F0taMIt1NXBscFgy+QF8ADQLGBLgBc+b3rimGbkfPlHzdg9Cb76Vpx6ha+2NlWEqBz1m4x1bFTzUoG/urjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780301487; c=relaxed/simple;
	bh=gjCWidh9nz0ZUZuVIpwkWGRXs5Fprh33MLIMV/rlx9A=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=QFRFnxYKX7dwDuYWkLWlYdR+Me/g+Z8KZHfMifh9pvifXgMp7QgnWVbamIu3X0L8zpzdHWsyshLHgnPbHDppDKGrlHhEXfnsZQR8UxRe+mPVLgrEug1iNtoxbWXWRsTqnB6L8vpyTQjvATnumd0L/jePCvbSrWD1IzTTpOitFus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IGi3xte9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5276F1F00898
	for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Jun 2026 08:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780301486;
	bh=IDHbhsLchsiwZheYToz9Lh/WmvUDn/U/qx0gurCZ+8c=;
	h=Subject:From:Date:To;
	b=IGi3xte9WfAgFabCy46chpgXSQkqRENUasNajOy8CvndRaNt+x4HrgPtxe9tByc6T
	 EZXWIC3ORMsqqilqBu6dy3lmQoAwLQCF0zs43tuR5bTBqKH3Varz6a+jCGBFd4Y4W0
	 gO143EcD7vS1HyGoMFmgLB0qlVMGpjnr74HgKOsBIpUmu89GPhj7PAM5Cs+Exd0JEb
	 XOKe+EfW172ADKo/HUi+q0cEJ3dkm5WHINjXfrHSBKGw01833cT3GMf/dnBEI/JhBA
	 QNGStIQrX8yUlY6qYK18XF0Rs9Z/TTetC51VQgdpiIkKL8r5aDgNf+rUNTfl+NPu2x
	 J254LSiXLlRIQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1C8073811976
	for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Jun 2026 08:11:30 +0000 (UTC)
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
 <178030148855.3550240.7282223676938845863.git-patchwork-summary@kernel.org>
Date: Mon, 01 Jun 2026 08:11:28 +0000
To: linux-renesas-soc@vger.kernel.org
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-33390-lists,linux-renesas-soc=lfdr.de,linux-renesas-soc];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 414E361B4A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: Revert "media: renesas: vsp1: brx: Fix format propagation"
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Hans Verkuil <hverkuil+cisco@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1085562
  Lore link: https://lore.kernel.org/r/20260425215037.3557213-1-laurent.pinchart+renesas@ideasonboard.com

Series: media: renesas: vsp1: Fix display pipeline regression
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Hans Verkuil <hverkuil+cisco@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1090708
  Lore link: https://lore.kernel.org/r/20260506215650.1897177-1-laurent.pinchart+renesas@ideasonboard.com
    Patches: [v2,1/2] Revert "media: renesas: vsp1: Initialize format on all pads"
             [v2,2/2] Revert "media: renesas: vsp1: brx: Fix format propagation"


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



