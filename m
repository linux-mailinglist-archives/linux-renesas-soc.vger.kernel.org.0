Return-Path: <linux-renesas-soc+bounces-29667-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCGIENizuWnJMQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29667-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 21:04:40 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 375392B1F96
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 21:04:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B0D233015EFA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 20:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8252E63C;
	Tue, 17 Mar 2026 20:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WElaSIBO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261D21DFF0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 20:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773777862; cv=none; b=dIkxdCzWMy+F1uEAnKDjNHtxB4a9pIjlPS8WKauJWYHlt5MyeQkW8aVhiY5KS/4PGVemSue+bKTLgcgPIaZdMSnfwfznkuSp/OiFZv0YNwfCV1Y1JbnPp3afCfn7B9M/swuj1dpGI7lDYXStOTqzG/7PaSJGjYvNWr1F6ZPeWAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773777862; c=relaxed/simple;
	bh=1vRPdQFygE5ok/e6Qt+SgoCObWK80VgIS/FChldQNTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gAGXJTHZ8738vGeItZ4HNhbujmG2ziTgrmCZRVLw0mDwFOd3kQwwWYJf1L3oHZCXKUvSWimqOQh/MGzAdvc9EJETrFWjSd5whAO1UwMiDvf/mGZ1JLZJQoBzYyNxNKVyqB0O8bwIlGu6YTkuDlWHxj0PyJcziT4In9tD9OCtO40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WElaSIBO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0A28D8CC;
	Tue, 17 Mar 2026 21:03:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773777786;
	bh=1vRPdQFygE5ok/e6Qt+SgoCObWK80VgIS/FChldQNTo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WElaSIBOXgRpSPcKFcqnjylK+OJENHrhcUwCNy2w/A32IsITJmQ+KOepKuuF+K/ng
	 h2Rjy7Q9QfKiMzf3zM/tPe9dcgQ/S63sgTNaJk30k7PTuEL3cFKfiqwITj7CKROVP1
	 mB7CLar21TT+XyEzW6w1AtaPH+JMRVVVUk3BJ4Ak=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [vsp-tests] [PATCH 2/2] vsp-lib: Support newer versions of ImageMagick
Date: Tue, 17 Mar 2026 22:04:13 +0200
Message-ID: <20260317200413.433722-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260317200413.433722-1-laurent.pinchart@ideasonboard.com>
References: <20260317200413.433722-1-laurent.pinchart@ideasonboard.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-29667-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 375392B1F96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The ImageMagick compare tool has changed the output format of the
absolute error metric. It now prints, in addition to the absolute error,
the error divided by the number of pixels. This causes failures in the
output parsing code. Fix it.

A careful reader could notice that the script divides the absolute error
by the number of pixels, essentially duplicating the calculation done by
ImageMagick. We could instead use the scaled value output by the compare
tool, but we would lose support for older versions of ImageMagick.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 scripts/vsp-lib.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
index 2cabb9b96cde..c8f21c60741c 100755
--- a/scripts/vsp-lib.sh
+++ b/scripts/vsp-lib.sh
@@ -264,7 +264,7 @@ compare_frame_fuzzy() {
 	raw2rgbpnm -f $fmt -s $size $img_a $ppm_a > /dev/null
 	raw2rgbpnm -f $fmt -s $size $img_b $ppm_b > /dev/null
 
-	local ae=$(compare -metric ae $ppm_a $ppm_b /dev/null 2>&1)
+	local ae=$(compare -metric ae $ppm_a $ppm_b /dev/null 2>&1 | sed 's/ (.*//')
 	local mae=$(compare -metric mae $ppm_a $ppm_b /dev/null 2>&1 | sed 's/.*(\(.*\))/\1/')
 
 	rm $ppm_a
-- 
Regards,

Laurent Pinchart


