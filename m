Return-Path: <linux-renesas-soc+bounces-29763-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uN/yM+OVumnSXgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29763-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 13:09:07 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D141A2BB3F8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 13:09:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DFCC83007227
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 12:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8AA23BFE40;
	Wed, 18 Mar 2026 12:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMg72c7R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330C7364EB7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 12:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773835741; cv=none; b=ZRzA4gMo0Jz+jLekeooM+ENrYD2NhGlbR8G1TU1E2uQ0Hd672udxc9bJ7P95uP5R0W45yWAuwdxlwgPI0c6qOvXAwWjDdq9f05kxpMA5tMM87XgajKeBAu0h6MStLqsgZogCfK7K+rlW8Zie+c19J0HTOiv3AfsQlZxDVC+i4rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773835741; c=relaxed/simple;
	bh=aAWt7VYzPoGSrTJU2K36MAClMxVanxRb/oPHtl5G7eQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iatYJF1JgvWVqYFeig+qPomjET/MRbNx6631BZ3wbeb8VNLtRxi2l4hybMOMQyuOscn8PkqYP6x/jmJCztQN11WkOFONvw8zrhVTYZ6SUXoiD8J0p40hO5mUalIdeOS1RucKeqNS+vNPfxzkpbqn3im+7xOhT956+0V5t2rH4IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMg72c7R; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-485445e80bdso58733035e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 05:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773835737; x=1774440537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ip0XvcrRqBEl17ArFEDSUIiy5E+VxrcsCWGZzdOjJ/M=;
        b=jMg72c7RS3ILJ9y4QkfNJ3h4vK7BgPAccWyjo7CSFoKIN/UvoXJ/PHRPJ+kzFrHqCX
         DAc7sTsrj15Yu+5/xXVA/ZwwRGl/CvPm1D62Ee4Xe006RvByhLTWGjgee6SQMxVCUUX7
         1+gJ4l068fVThKerbFCfuJl8EodynkKaafxNJi5I5W1kzRdE6XgbrlMFs8mVCeW5M4gL
         5OoJsDbVZtVg8urgLJNKNrPaFCXZbQWkaCjo/F1IHaTthts3td4aROz5ffOmGKYWtg6x
         Ps842aDYCoQw4rF571KypMuPkfFx2HA3zRsdqLpq3wUPwxtvmv2u89l8LTEO/5R17e9B
         AYqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773835737; x=1774440537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ip0XvcrRqBEl17ArFEDSUIiy5E+VxrcsCWGZzdOjJ/M=;
        b=sgphOcBFi5q4HgpaGeOE0qb2JgCoDEbG4IBjKqeqICV7khcYicfBWZHCTumiN66QIi
         EZCMWYUhq5VS+WWq+t4xvDcd7oBMPTQY9BOFN544TcnNiJ/UeM6BnWXh/Z+04vFf6BIf
         5N9DGSOPwdI59TIBFWzuI7aQPW+4mg2Q22BEVgFHI5QnxQZeb2sfW7nM8hXj0ygtVsPP
         wPVOgFWAvz+jH7ZLzK8eVWSL4UGwRiobF937DmpYuy8MuhFloBPdrcpY5zNslpEmf1rB
         4zXLCD7vnasOyU+ZcRHXjGhdn8G0mw4zfYK0USXeURj9GYSiLnEf24jIZQFENtaCbO6Q
         YxpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbA9/Oc5EVztyLAYM6u/eq2nRjuAMsf1BP23JFqv7VxDjZeRBwPXAzjxMSkMFFsEUV5YpCw3ZYxJCXBVUwiyeeBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9c8zVqGjK+JQczDV0RalNp+MKu3lZEgDZoqd4QPDkSLbuPdt9
	rAReEqoQndpx9LfqWGkwJj073Yhk5w6iShusDbD5IUhXlQehtlzyu70F
X-Gm-Gg: ATEYQzysPPvw04Ac4I6QVcapYAznhIAHXSxpMPXfehuQ3VwX+YWMUeHWQYLk3ThaxP0
	7imiw7itAgzsqL92NORImJVpD9yzdUlkQTlkM5OHY+y1v1GLT2z7Muqf2D0tPxhtZWX9x6Djw9F
	KbTl+LILj/ngQSXWrKpTMPFP90+s57SMiofnh4cCcMz9Daz+zFO8TRKdlRMmAf6tJ+tFIcrfR4W
	w8xfFOZgR0haPuyp9rVUSQy9oGoea30cFV2SPkCV/G9EVqSs/7E25THttbeml1EWfhkC9IfbLrp
	7v02hWfFad5CX6XG/xugLvLoEaHtsJmkUb1mbJ+gh5/9sUl45QMfh+QbeMwkE8lHVv+VQSTk+1v
	bvKKsfs+1Jn/sbQACz9MOiVJ3V6H8ypQqfsyy4J7UXXMG6YR5VvRJQsxb5jlQLp2gdZzkHJQ6Bn
	lW5SCkapbEzJRbqIfKaz11bfCO0pjBycUM0yYpTgj0IgDZmjTg
X-Received: by 2002:a05:600c:8b2e:b0:485:2a4b:7bc3 with SMTP id 5b1f17b1804b1-486f4440fb2mr48324745e9.4.1773835737273;
        Wed, 18 Mar 2026 05:08:57 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:d643:4385:f93a:2085])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184b948sm6636567f8f.2.2026.03.18.05.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 05:08:56 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] reset: rzg2l-usbphy-ctrl: Fix malformed MODULE_AUTHOR string
Date: Wed, 18 Mar 2026 12:08:52 +0000
Message-ID: <20260318120854.226783-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29763-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: D141A2BB3F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Fix a malformed MODULE_AUTHOR macro in the RZ/G2L USBPHY control driver
where the author's name and opening angle bracket were missing, leaving
only the email address with a stray closing >. Correct it to the standard
Name <email> format.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index 05dd9b4a02df..fd75d9601a3b 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -350,4 +350,4 @@ module_platform_driver(rzg2l_usbphy_ctrl_driver);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Renesas RZ/G2L USBPHY Control");
-MODULE_AUTHOR("biju.das.jz@bp.renesas.com>");
+MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
-- 
2.43.0


