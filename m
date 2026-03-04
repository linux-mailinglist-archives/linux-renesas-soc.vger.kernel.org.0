Return-Path: <linux-renesas-soc+bounces-28767-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHcIOEY4qGkTqgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28767-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 14:48:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DA8200ACB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 14:48:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 355CE3019C8C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 13:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2717D3176EE;
	Wed,  4 Mar 2026 13:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYlPmvp/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B02817B50F
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 13:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772632131; cv=none; b=nUs2527Wh+iD8YL+9bjAjwXl0X8CMaRcUmHxJ3CJuVF08bBRENHqauaJJ2nM7eKrrEjbXeBL81/iQtXHrTKGiKHTs1WVv/SyCGVZIBszfHVdowkyt9Ssr9kEA6TrDVsInn0veh0gsR12EuNcz995lbnLwGRYn5hDp42h70pTG6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772632131; c=relaxed/simple;
	bh=NVdzfzBkmPseuBIdayKfFKORaRzIIApVVeRYXxVyG2I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r5i/zhlk6L2BIRXLEE1xE6ptZPQLV0YCAarsdt4LYl6ZHXepitZHX1Tf4s+WzoNMWmJhG7VKVYv2L9XBarMFHULa26PZhjmAvZQp2yGrNS3uEehkhWRB3dw2lEdyKnJad+SGtBT1E2Um7Iwfcp68lEO+S5uporXfLKZLYDi/dXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYlPmvp/; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439b9b1900bso2359971f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 05:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772632128; x=1773236928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C9MyPO/rsrk8DBKCUnJACWD6uK5SDdcOqlz033Neykg=;
        b=XYlPmvp/l6/bBEhkplE7b//j6zbXcZTAapU5jza7pFHO1aVXllbEPgzsQV8e91CqKu
         4nv1dPZ1iQkqmBjq+qEAL3FJw1byS/hcbfRlraD3SLk3Wg1qVXPvizOIj+CUW+RVxKOk
         7dVxrx8A+EfuJoG3LLkg0x4YcdiJa+iRIAmR8mSU6WogAasVYZ0Ikbk+K8KLQFQY5HAg
         lsLdMWtaohzQMORquy/EcSj4sxRbX4azL4rvoAGDMfsnskilaeF/OXltWWR0tNOn8Pjg
         a2lUJbQDNlbSXxoQoFmAvCxFFH5Dx4i94FL6rdyFNNArIwBpW5zfQgRKRp0YKXRV1/Ll
         boiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772632128; x=1773236928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C9MyPO/rsrk8DBKCUnJACWD6uK5SDdcOqlz033Neykg=;
        b=DmG7iRcwweSoy4MvbR1MYx4EHf5Y93p+0HhIE+obe/V/Zwg8yi7wV2hHJmlmF6vj6l
         NOa1+6EyJngjEF2NPKVNRHOT7Ui603shy6u3ZOADkRWq2Ysm03b/haUYyqrC/MH5nZlT
         fqkBusfrDqfTDQgWKA3jAXOQqXc6tQORW2k2SY+ycHsHi7WXKAWri2FuibzWFkOzhs7s
         am8LQiHiPsTut9+SEBwvLb0jW0/AiiDXkg3pUHNF4ktk7mpHLi282/pR5qDCx2ys0tnG
         d0qRFXiKPRTW/kSw6K5xzHZBS0Nzgb0Xvey7obti8UA6c2o2Qp4JBqRc0btzQw8FemR1
         omLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyOsuqBmVp86kCT8UpZS6Y0szBoU/13POAJWKYskPLx5+NQ5oS/2toObliQep45mXSCX+yEDRlM+uWJJCbwNKRfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9sN1C2vekxyKQTnYhVhlNhpAqzNOTKcNkApuwNJ6VSnX0BCvI
	XqKKDfgaoJ/0x6Dda25gkNuH1CTXxY9ibDkJMnMg5GT2jrFFfxuRmOU7
X-Gm-Gg: ATEYQzyRukHCg+89CBuXDnQM/70EPeYTzQy+zWJB0iqv3KKBlzgPpoG5iLhA8+fYeWT
	0AZUjvG0L+9uI3c1r8hlQsdt0cJIeLVECnAv2Q/dPdoV7w0tiXdAnAJR1C02Z5/nuMgJby/icux
	Pq/M6Sx+0EPN4gKu+nEnPaIumpNhbcJGiiPqIBvs8JyOhQ4XiZAYr9WkubpKWKJ/jB2dIptywBA
	AIOtRXiLguYHNxF+KkwXoBy7+1nRKn2qhfvhG7BX3NOdtNmoPnAnfLnINhFydF0iNNrhErbKvnE
	bun9nJvL4j+5IbDClwvEEOssA9rqo/5SrmTP7wUdZcShR/Pk1E34qKvmLA2K2q/Esy1AGrn5LFd
	khsRF0dAdha+rRTLAEe6YgswdHprzTszKTQQrGzt1aRhUu+xmRMBRBQ05NMXsaRGp31+313sWVx
	g+uTk3m7+z/rrNfSfK7Qq260rzZOpkHnI=
X-Received: by 2002:a05:6000:1885:b0:439:be43:61d6 with SMTP id ffacd0b85a97d-439c800fdfemr3927375f8f.48.1772632127417;
        Wed, 04 Mar 2026 05:48:47 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:de3f:f927:40ff:12a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439c65e0b23sm7105229f8f.32.2026.03.04.05.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:48:47 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Price <steven.price@arm.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/4] Add RZ/G3L GFX support
Date: Wed,  4 Mar 2026 13:48:35 +0000
Message-ID: <20260304134845.267030-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 53DA8200ACB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28767-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,lists.freedesktop.org,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,arm.com,collabora.com,linux.intel.com,kernel.org,suse.de,glider.be];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

The Renesas RZ/G3L SoC includes the Arm Mali-G31 GPU as a 3D Graphics
Engine (GE3D). The Arm Mali-G31 GPU is a graphics acceleration platform
that is based on open standards. It supports 2D graphics, 3D graphics, and
General Purpose computing on GPU (GPGPU). Add the binding and driver
support for suspend/resume functionality along with some improvements in
panfrost driver.

Biju Das (4):
  dt-bindings: gpu: mali-bifrost: Add compatible for RZ/G3L SoC
  drm/panfrost: Drop redundant optional clock checks in runtime PM
  drm/panfrost: Add bus_ace optional clock support for RZ/G2L
  drm/panfrost: Add GPU_PM_RT support for RZ/G3L SoC

 .../bindings/gpu/arm,mali-bifrost.yaml        |  2 ++
 drivers/gpu/drm/panfrost/panfrost_device.c    | 36 ++++++++++++++-----
 drivers/gpu/drm/panfrost/panfrost_device.h    |  1 +
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  1 +
 4 files changed, 32 insertions(+), 8 deletions(-)

-- 
2.43.0


