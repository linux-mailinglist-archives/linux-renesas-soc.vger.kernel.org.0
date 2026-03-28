Return-Path: <linux-renesas-soc+bounces-30539-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAD4N/zzx2lMfQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30539-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 16:30:04 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D58134EE37
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 16:30:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E6A030107E2
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 15:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9CE346E58;
	Sat, 28 Mar 2026 15:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YqwBz/i5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED96334C1B
	for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Mar 2026 15:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774711801; cv=none; b=jKyZ6trwKHJ9gCy1ZXrGi21AJDz0PqxKAgYtUB2YYsl81kWiU+l7cnGdkt5GcDyNeoL6HrFUn4EofwXKlqyC8z3IjcTeth1gDQUEF1Aek6uDwufNc4TU57itJCnIqPsVVPtvyBseLDqNJk5PgzlGLzsPLd2l9Ev0e+5nht68Jb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774711801; c=relaxed/simple;
	bh=aPmpfFpggnZ7yh+fNy8bK/Rco8BtGKmejVmvEZpM/zo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uc7/eFwqSccddwUdjMdtrK9hUQz+sh2Teq5/yYat5o4YsvDA5wFMYnOy1U+7+cXxwsVSfbA19Iw2VWktjgD0sRyST06z5p7t76pwHVeFdqttVLADh3Qz2NbI0eS0feYk1JkoNufcItiMONQw6yZUevMU2r72FAwCsTnb3SkfyLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YqwBz/i5; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-66b32fd9f26so2105658a12.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Mar 2026 08:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774711799; x=1775316599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sKTzUyCJVefkIQog5iRQn1oimRCi8Kk7F9aJbK64clc=;
        b=YqwBz/i5YxyY4cKLeLi0lS97Zht9BEPf62e5j6+a/Y3h1obWux7SSIimd2/ZRFUPAD
         MGleMdaz72kynVXXrQgwEklyeVvlgt2sCE6c5LyzrJZwWKwpsZVhz81zo+8pFe84t7TN
         iLYweMdTLekl/vlr91St6pyU+2ZLShBs9i+RB2KfJAM5dpJ+jWgiviWJPVdu04Puyw4q
         5pj2nOjy9ZDqQ1uu9FguuC4fsV9c/FwOXN/ABbfpey2Jf364EgcIWz3a3NFjw1OGifru
         7CV9z6Q3v9KvYa4eimfvuUHpz9vmFKpupMrzZLNghwWuSCgOuA267MvevsQHfjBGwjQ1
         71Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774711799; x=1775316599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sKTzUyCJVefkIQog5iRQn1oimRCi8Kk7F9aJbK64clc=;
        b=E0boOtZcfiN1u9wOA7JbQM+QuNUmVz95JYZw1TH1h255ozVQjJq3e+WA7SfoeqvENS
         Ads+r3xfGhD49u1KZ6hpRlNOaQGKMbWAiX60r8ba5KNogjM5usthLl1Hz7nw2Z2nJf8W
         gfw9iO2bsXEKHffoFezubFcFhpYv6sCYkjOHQwBD1rxRs57xmLrqskFpXWmDgK+Qg+oY
         XMSrLhvpsF7Btiib+JpMrnRe5HKBA+X/6MImh99/EMMeW2q1EtrruSs1Yycz9o3jh7kW
         7iRkTJtv4Div361pl/VyenaXgqEcYM2Qv3JdIPlorx1Ln1p5P9nTLhZoZLthulLHaY94
         TH6A==
X-Forwarded-Encrypted: i=1; AJvYcCUyT1a/ItDabq188FM0TLFlgvpEogpY1FdfCQFMTlU0Y8zsGqbNpfbwPQr2pGuIE1fFjAeMgd8dgC2ZlGRu7DDjng==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYRUTMwIKieAHIp/wLBLYXgZi1RCUz//cPFBq2USkyX9c3SuQW
	0v7eYdzs8cjNAtGP9MvMq9ac38mfHA5ixK//9rtF2vuhm1YEChUs1N2IzKkKS/4Tx6c=
X-Gm-Gg: ATEYQzxI4AnVIUdV5jlCyM0DlcDE65E2j1KdifF6rpK6qPnZ9YZDZe2rJNKltDXTDO/
	kWyRP4JQtfFYIpTmwrwI3dnIiKy+flAMKybDkNqWmNXcbUhJv7bAIMv8Ub6NL65pIEcw/Hx9tV6
	J90B4HresVqHm5d05gFukFBbf0sqxcHZq5VXmrGiylHDlH+2OTzgM87FiAYrLYO0yL+pirmaciT
	ncPLeFrqtz5mxeE8385/jhaY9XGDX4O77eDqV984Xw4U8qz96ZnK44CrLdwhrGfL0X4KqAt5Cwr
	DutH1opHPmYmTAUjrRIfnKEKwSE4UciWMja1djPjdOCZS4BIGFhhpyas/9wRUX4fELd3XXcC7H1
	1BXQotFU/uT4OEyCCBQPjkoFtvysiOs5mEiALuyJAawrkZU3wnStehDrv9m/wjF+lc6kqhmnKy9
	pttnBaPBXtuIGZb1Yk+ez/r5o7LBJVwmgzfLLNzUzChd9h5e5Qknz/bZjftp/CetOHKAcqdiBGl
	m/2BjfjGIYRd2sSGSyF5Ohv7zdECnkelDieASNLlQrY54w=
X-Received: by 2002:a05:6000:3109:b0:43c:a352:c34f with SMTP id ffacd0b85a97d-43ca352c69cmr6097729f8f.7.1774704567550;
        Sat, 28 Mar 2026 06:29:27 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:e1de:7c03:e16f:8136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e265fsm5369110f8f.1.2026.03.28.06.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 06:29:27 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/2] media: ov5645: Implement frame descriptor reporting and convert to CCI register access helpers
Date: Sat, 28 Mar 2026 13:29:00 +0000
Message-ID: <20260328132902.776757-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-30539-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 3D58134EE37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series implements the .get_frame_desc() subdev operation for the
OV5645 camera sensor driver to report information about streams to the
connected CSI-2 receiver. This is required to let the CSI-2 receiver
driver know about virtual channels and data types for each stream.

The series also converts the OV5645 driver to use CCI register access
helpers, which simplifies the code and improves error handling.

v1->v2
- Fixed selecting V4L2_CCI_I2C config option for the OV5645 driver.
- Fixed checkpatch warnings limiting to 80 characters per line.

Note
- patch 1/2 was origally part of series [0], patches 1-7 from series
  [0] have been already merged.
- patches apply on top of media/next commit-id 2c8fe1f14240

[0] https://lore.kernel.org/all/20241018153230.235647-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  media: i2c: ov5645: Report streams using frame descriptors
  media: i2c: ov5645: Convert to CCI register access helpers

 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/ov5645.c | 934 ++++++++++++++++++-------------------
 2 files changed, 462 insertions(+), 473 deletions(-)

-- 
2.53.0


