Return-Path: <linux-renesas-soc+bounces-30360-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IByXBB1FxWkU8wQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30360-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 15:39:25 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C497336E8B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 15:39:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6226B30BD3EE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 14:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702113FE666;
	Thu, 26 Mar 2026 14:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhFA4leo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5739031195C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 14:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774534888; cv=none; b=Lw0lMoi2x2ApHRMv5qYRnV4NGu0hgiCPrEcssmEf+D6Fwp5h3Omsso+m+mR3LdsWWjvjP+3wiswFrpDG8ECGvTRDF6MwoE9ST3A5bHrgzroK0ANBCb8AHAyT0mDivPJkh5iIKdo2kj2+4PDzrV+1Gj6fSW4Qi9mmeLkjJn8WHVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774534888; c=relaxed/simple;
	bh=YdxtXRzbUon0Suip1nolQokx3sF78WXUYC/qaFRrDdY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YVoc2nQey7qX3FGY72YXUz3zQRpd7ilT8bbUf40zHgZ8+NCSPCDh9uqH1d+xokCq7GO5U7VJxnHoijqWvflkVykl96c3Sds925ziJUVUiwID7Dr48SujukDPDBnozIFQ7hN5A34j6Qzs0EzLBvExerysI65u2pE2CRBK1nhvPlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XhFA4leo; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-483487335c2so12003505e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 07:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774534879; x=1775139679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B0l5I1F9moM5sQoUu/0GoT+VcNa3iSU5TZJUAB/qPwo=;
        b=XhFA4leoPkIQSeV+O35yxt/KXACqYBmUSHz7WqYhDSe4z6aTHiARt5ELOJiFAuB/Fu
         3c5z5SDhUbHwqFMWYnmNpq6/ylYqfL6Otl1l1pFiAAU+uLQctog3EMxNIBfWSz1gcH/0
         FFEgkQkgwuW/YR7upMoME1MxGa3EyXqMHCCgG5OE7KDqR6/z7bxLG6SU8sBnz8Viigfj
         7DxeYLk/Ooi/x5wu+PI0n41Eb+AjUG+DgErvSQRV+z3zt76Oigb1+9IC/FL6dgjs9k3z
         O9XaNx9X0knvTGh6He5hJMnZMRLnkrWzoIVo+l+Y5GsMj/icSZQTdYinTSzZ4sn8TEGm
         Rdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774534879; x=1775139679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0l5I1F9moM5sQoUu/0GoT+VcNa3iSU5TZJUAB/qPwo=;
        b=EzR8qEpTgMjtli4X4jg8l/ZegcVJ6cXrhuSDJ9VfRvwq9DU8QUJsGQFB5sfXChIE2o
         pzYaT4I2yE896UifeB8wlZO1016Ajqnyo/v8KmuvEq1oGU/IIGoZNjmEGgs6N9ZrWiGV
         y4uBnLTrbYVO0ciKuHJA/diMDKQTmb5N8HhOZiww92XPxQzGgM9RmLA1omS9zjsQ210I
         8d8suJAu6y1lgCTKjSGXwAEgFwkhz3iI2ZLisiA1JLSSnT3AAvPTAEjjaW7SlEFdYw21
         9HDZNmJ2vcCW9tQov+6dLq48sTlemTRKChM5sND5CX0yk0ZfQglcds0EEnSpPvb9YB8e
         kx0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUpMC2JkVioYvJql6w06vjJB5s9MXVHgFTPiHGJRAV9dxpTTiBYo9ZLFlQC5E1s2a4vhFaIxR6hSsveTtVY/2PDFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMa6AJf8THH4gtP+gmUKgNI6PfOJAkOsE6VmFePwNbIo+bqYWj
	Jz23qcMJr+BVtmyS+iq2Wx0zu/3NqWWEwwcRJ9YSW9Lnw2ONpJnHq4zS
X-Gm-Gg: ATEYQzxYfjrCzKnVJGNoCAgXEZAvczHpnr5CpH9aoyqQEXYGfWg9a+kbK4ryiAGb1kE
	j2lTX62ajqJ7ZyehIi86ll4k1LM15fTC24b+criJi8EN/HgD9QPLNv2tVQ4F4HAKgvTA5WELn4y
	363qECoY6z3AacH27zyUe/aCjRXaA1Ouli8kPloe8DIWRsIwpg/wHCkSfFAdXlqsAT1ZZRfldoY
	jyXWcBA1jMZDsVyw0shD3bCu1Zz6oo6ZI0UEkoIAqcGaCN/2gVPBmeGiqLw+3STMIkhtXdHXB8r
	6wrpFRt35Mtr9I7MDdv7Bgh1MK+HnNaJ+ZMaT05TQO3KBhOC7X/BAlRALRDgWhMisiDl9xkwx6u
	LTnNE+RwHNn9MPJFJpfn3w9Oxv7Fe2mrw06N898H3kE0mgQ5ye2kM7AYl/hyRqNgXHbUx1y9uJ+
	ko9sUy2r4SHEwUvh3+uhlq97ZBh9INoTbRWhLFsLgkEfOKw13RMjCpSRPbF1p6k0SaUAf64AwSJ
	v79rVuzKTZxvd4NSQF5Qxv22PEg7blxoxpJOQ==
X-Received: by 2002:a05:600c:8b2a:b0:485:2a85:e5ec with SMTP id 5b1f17b1804b1-48715fc36aemr112442945e9.2.1774534878663;
        Thu, 26 Mar 2026 07:21:18 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:516a:f94c:8d31:fabd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c65989sm63574445e9.2.2026.03.26.07.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:21:18 -0700 (PDT)
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
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] media: ov5645: Implement frame descriptor reporting and convert to CCI register access helpers
Date: Thu, 26 Mar 2026 14:21:05 +0000
Message-ID: <20260326142107.297811-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-30360-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 2C497336E8B
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

Note
- patch 1/2 was origally part of series [0], patches 1-7 from series
  [0] have been already merged.
- patches apply on top of media/next commit-id 0e2c4117c351

[0] https://lore.kernel.org/all/20241018153230.235647-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  media: i2c: ov5645: Report streams using frame descriptors
  media: i2c: ov5645: Convert to CCI register access helpers

 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/ov5645.c | 928 ++++++++++++++++++-------------------
 2 files changed, 456 insertions(+), 473 deletions(-)

-- 
2.53.0


