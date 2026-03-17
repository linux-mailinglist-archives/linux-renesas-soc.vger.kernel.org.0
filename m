Return-Path: <linux-renesas-soc+bounces-29665-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAB9F8azuWnJMQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29665-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 21:04:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA03A2B1F88
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 21:04:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1899301584B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 20:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2EEE1F1513;
	Tue, 17 Mar 2026 20:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rWXIJDpq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9738F2E63C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 20:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773777859; cv=none; b=XXAkVPy42mJWZaebyaTu0jH3zqTkQQ7QbjbevaSRXvTCCM5Zlz9QBoSCcaENDZMR83kxwGLoIZYNPw+mbq9g21+hZdm5Rd8zJsylb7znt9yxTeTvjPUHZRIfkocVKlCz+RzJQRSIngWqlxqNXPSGiVxbBKME5i6A22Y1hht0/C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773777859; c=relaxed/simple;
	bh=hnCEjxEoyCRc6YRnLqjmPsAGg18o4fGe1jTNrnPpxMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aJwD2rvTLuy08b0AGZeSVMWEOGwuvIAFPSL8IqaGvjUcKZ0Qsifqsh5kRhkBX+6cTwF0xQxOK3j1w/w8VxovQLGadYP1t8KFH+YoK3ijaRBVy6gr8xEXnD/mG3GVY3qmPHx8wiDgS7ndqLMY4EADxYXytlxa8hcegT0k3C2v2CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rWXIJDpq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3753298A;
	Tue, 17 Mar 2026 21:03:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773777783;
	bh=hnCEjxEoyCRc6YRnLqjmPsAGg18o4fGe1jTNrnPpxMo=;
	h=From:To:Cc:Subject:Date:From;
	b=rWXIJDpqsnujvlkJK1ckBDwTYxhnW23KKLtOQEznmx/eegrIaB6ic8cPOn28eT7Dm
	 Htv2+oDLKC84FSA0WXXk/N1MWcAMuwZ2B87d7h5eVF/RsNd28Toh6FixQwKvmNS0DD
	 EllvPvSrGSibWH5ieeaOSy+s1uxXmYchhVjNq4ac=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [vsp-tests] [PATCH 0/2] Miscellaneous fixes
Date: Tue, 17 Mar 2026 22:04:11 +0200
Message-ID: <20260317200413.433722-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-29665-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EA03A2B1F88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

This small series fixes two issues with the vsp-tests. Patch 1/2 is a
small cleanup, while patch 2/2 fixes tests with newer versions of
ImageMagick.

Laurent Pinchart (2):
  vsp-lib: Drop unused variable
  vsp-lib: Support newer versions of ImageMagick

 scripts/vsp-lib.sh | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)


base-commit: f1327dc9a2cfaf3577ca30334e161e5e35ef5651
-- 
Regards,

Laurent Pinchart


