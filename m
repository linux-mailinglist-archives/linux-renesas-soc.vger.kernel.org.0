Return-Path: <linux-renesas-soc+bounces-32853-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLBULQZ8DWoXyAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32853-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 11:16:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 582C958A85B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 11:16:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A20253009144
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 09:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D423BE163;
	Wed, 20 May 2026 09:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGtsgmpJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0173BD64D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 09:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779268611; cv=none; b=mTshxwxoiVAzPHvnenYvHrrrrc3rrbQXCBh2/q66dOOlg+O0LS14CRK34MXnv1WqGGQrrdbnacSmhRzFkJH6HEe+Y+QmghKKbrDX6dxYL5XdLSbltmKOyKOli9V20Q4hz0bSLAxRL7JxD9xi1trb4QlGt3QaEeGxhpYb7NaAVE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779268611; c=relaxed/simple;
	bh=IOr9JFAYkK0D1GYYFaktBsHjla5a2OoBdt+TfXAJ2QA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LRcUdwbj5zup6pBIlD5L+qhwfq9clS7jlE7wvC1JO3I/TmaXJPVUuZwwbPgtm4WpsJP1r3Cw5DP845nMss0Pas08Cq9NZZRs062OcCDw62AZ8GsjkXl0PYSUS9ehLnje1xEL/LtOFSL3BkZjCWvFwpFuQnXazBRNoeE0Wu3DPuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGtsgmpJ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d7e23defbso2534870f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 02:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779268608; x=1779873408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nbhwFmtr4akbt5wCUcFxq3oA7aB27CG9nkAIDB9UvGw=;
        b=KGtsgmpJn2VO0Wb0YJ3rqmJnVbtXj9k8n+thRN3CvjcSGdZQ5wiTUWNAtLwp9buklE
         0CB6gNIhUYTROvatU/b6pSC6UxZyGGWvAaWPMVTpWs62Gm6ax/O6DeEMnGecHZRaRS+M
         dNJxHfZdV7nZhmgBjyLXM6sApmJZQJ9GyFIeJGKB0xp0K3lEdcwZF/+3WqdwMbsSgn8E
         j0iSIfj5w+lvIkqqMGL6pgoHMU+zAXa9VlqHYyidRykhA0n1K6MdRHxYBTStBJj2kBTB
         nFgI1oO8kK77WHO9yE4J5dw8uFs2g6Gfvu6xS4+jMQJZCIriVgk+vc13zumpcohLe1JU
         c/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268608; x=1779873408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbhwFmtr4akbt5wCUcFxq3oA7aB27CG9nkAIDB9UvGw=;
        b=Au1PkZ0YV5jT0yY+VB+pQF0j6Je7UJz2oe/ZRtMgn8YpnfNwJ2LtKZO9qxYoc5wRlL
         tB+d8m/gOffOewAmeaU7ASs3C+NIAkeRwXofgjWF5tSTCOEmVoqPFtlRgGU9YjlB+FBm
         0r3SJ1oWV3bEm1NePQfe99V4A9YYu3XCCRONhzIrotL8URVwYZ+e0NyNRqRod2JSPRu2
         WgpZ8hr4Zb7I5ACrjd5u3GYjH2J2fiOdp6lgH/Vp82QsPOZO+SgJhBY+1lxKCEsReEfy
         bKT9ae5nXMO731FnMdE6CPLONiKla7WP0w8sbPXe3MMTVKrWOyN7zo3KAoSoo60MCi34
         4G3Q==
X-Forwarded-Encrypted: i=1; AFNElJ9fqwDm/vHRqI0roii9+TCBx0p/Vd3aQVBNONrYcvj+V4rfUPJqdyDjldHId+bje8mTfsJRmJprv3sucVDIhYUf+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQaFl88Mr1tv3PjZpwl2xNXrWipjeLXoRZ1qgBxHh5Skesvnje
	vYzcUEoKqMXmRkTQPwW1I0vx8icR44iixhrxUKlP8LRfucKY58tfgetQ
X-Gm-Gg: Acq92OGxOcEFgC23IQ5HPktGtA6ekdWIdBvuDwPCXg9ri2db54O+yjywkCbKrMyLBoZ
	1u/I9B9NroQd0bVvjedjfMo/aSpGLB8f5fH8gciMIlpWXMlFXOKqI+zNWwMQeolwACerEj+kNl/
	DYEQQpMnBwWDTUjzFp6xbHJAgEUZvcgZ3ZMaZZVAiSBSk9DHyIpUExgLIyXKiPQWwolRyQbApPp
	u2BR89JsLApX5By/xcjzBN/9LQHpF5C8Q6qUYZrEW1usKx/AnLW0I6rj9nfgkDGTZ5ezwm4phkz
	Hqa3DDFoN0PUj45ljJoNoTy1Nb2QlqiG1vakP3J3Vh581wlMa7wyQWOS+hMUFKGbCQy3xF5k0Hz
	wkcisa5egcj7r28fowzthxpx6WhmWEecgQmx0+z1GpjyivqkPpPlAZLgK3b8HDPy3unPqK3HtaD
	Al9w+7A2vFaB/KD0IF7FFTCSORgKUk7IPDI0ZTCdu3ASyC0qJF9nLgVFyPGjPVWnQeBILdsSaeX
	NthyLUhENHCOg7km+6vPdOUuCr3zbDJAEnYdckJrrYf7nK9
X-Received: by 2002:a05:6000:4007:b0:456:ba09:3e64 with SMTP id ffacd0b85a97d-45e5c5b3669mr36536376f8f.1.1779268607316;
        Wed, 20 May 2026 02:16:47 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:dcb8:81c1:dc9e:cd68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e767d0bsm50751059f8f.3.2026.05.20.02.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:16:47 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] thermal: renesas: rzg3e: Drop stale syscon documentation
Date: Wed, 20 May 2026 10:16:38 +0100
Message-ID: <20260520091638.68370-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32853-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 582C958A85B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Remove the stale kernel-doc description line for the 'syscon' member
from struct rzg3e_thermal_priv.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/thermal/renesas/rzg3e_thermal.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/thermal/renesas/rzg3e_thermal.c b/drivers/thermal/renesas/rzg3e_thermal.c
index f0e29fe633db..086bd3da10e1 100644
--- a/drivers/thermal/renesas/rzg3e_thermal.c
+++ b/drivers/thermal/renesas/rzg3e_thermal.c
@@ -87,7 +87,6 @@ struct rzg3e_thermal_info {
  * struct rzg3e_thermal_priv - RZ/G3E TSU private data
  * @base: TSU register base
  * @dev: device pointer
- * @syscon: regmap for calibration values
  * @zone: thermal zone device
  * @rstc: reset control
  * @info: chip type specific information
-- 
2.54.0


