Return-Path: <linux-renesas-soc+bounces-28744-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFg4Av/jp2mrlAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28744-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 08:49:19 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 680AA1FBD32
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 08:49:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 01139300B3F0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 07:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9984438837C;
	Wed,  4 Mar 2026 07:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acbyI5vR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3CE38736C
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 07:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772610553; cv=none; b=oQo9N5fUw1vcgkLLbDZOWyeYfsrSUgqrS4TW7LbfimoVwMbvh6IZJ5D4OxoO9g8R/wIpuEIcusYYik7bnusL4wa47QXoTO+3i+UIaXuA2A9RvrfZ3WQPDTGQfMAVu0Z95FLyP8RSP+SG2cheZ8Vby7jANBRYJAl2nTsHhiaAKoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772610553; c=relaxed/simple;
	bh=e7lPtmTMcvTguLmDjO9LEHGP6/1tdEJTOrt+13Anzmc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JmcP6YNVXyA2choxcWuksEWgfneChYIGI9wpTbPpFHW/iQUvrnol8y3OpKReaBQ1aXIK4AD9PR3RY/IsMJ0hJrURRctoULkhBSo+7sHiWCNwZEDbSIp+pnL1tsfzf2rCnbhlDbyHUbxZ81Doofd427J51OxstwRQsttC44l9LFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=acbyI5vR; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-483703e4b08so61442015e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Mar 2026 23:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772610549; x=1773215349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zvknzicABFsHxu76HaZco8fpkXU2BWcqQfyY9njxdw8=;
        b=acbyI5vRnrWPprPO5VvNxDLXFOz61E/hjQM2oPSmDX2uq1syV6+UIqoaH23xMHc/ix
         ldW6Sdkd3F5w8bIf3OBroj7NioNFOIU7O/HYatnOTrBqGZ50dI2YyL9M672wppP7GcBj
         urCBB+X+MmyvqbrUi/T78Nl9Ul0beW98Ncpe8nUUSXTA8o97aT4q63Z30sNJiVyitBt5
         r+cL8942RsjS4Xt0pV2Ms5IdLtzRqjuhoW8i3ru+jkq3JKtJdPzp5isRkXKmz4921mjP
         va/OY5yW8vT89PBalLYaZlw5+bhglnHct1QANe+RMwH8p8aRy7e3Te+JkML7g6+rMW/j
         yhTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772610549; x=1773215349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvknzicABFsHxu76HaZco8fpkXU2BWcqQfyY9njxdw8=;
        b=HwzPX8psbjIwEgm7/UBNOjnZUbrdje9VZnHyX0Y+tYn+KR1GFCfJotu/QbQv9TAyEc
         UsxlyjW6fPAGlNrhVwxcssGik+bI57BfFWUKdopQEzrEg+ZzcTEjubTBGSk583uKszHD
         7zvrjBts09JksERhme6I0VK4phYbIRuoN+0u1MJUXG86Vq+OztO1wgFU1CAM7tY9Wjnw
         trafkTp5UQV6Cix2gfxLTm6KvJl/lQ+NlJWiNynrLnfryAMY2gMGYrWkqfrbWgiaik0H
         HyK51DvxRO3wlDNeYfF/wj14fyxf/AoYI/6zSLKxPaQeXT+PfTn4XvA59WgxKxHJxS3M
         0d3A==
X-Forwarded-Encrypted: i=1; AJvYcCXOv10sSLAbgUWriPgfAQFMZYBRXUSrnfSOeJDWSlD6YnZ4zmDGSpAR7/Eq6OxePUkc1pwTYeRqScMakI249OWnxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeRDu6yqUTNWKLHwM6qw86Xk2wnkemsL6YZMS+Vz1ElNpIqF2u
	rHuvzJC/dm0xrDL1nqrRIGLOGY+66FhXNV+qM8QraVn7ZsmLSKTHQuzV
X-Gm-Gg: ATEYQzwDNlt49affmP/JbzpaOgLjuXYWZh8BZvfDkDWcACYuOalNx2W8M0okX9idRvZ
	2KFkbiFWapwY+YmVxSBAq5XJAp/X3ciKh4PfqcAXQ8wW8qpgndex0k2TEwmvMkM/E8YGF9VVStA
	Fzg6e44tpPN1ytPYJA54w2N6mZtMAR+cygPPdYIoSHQsprbkl54V04D24FoWVEs6NWyzkUScpew
	KbHNYn0fwggr+ATTEO/YE4QfpY8jHTP85KjvvNJDpdd/QEUunTveYSURQYmvJyeBCC4U82YPVmy
	JY4FVgJO6XH89mh497BnD7d038+RY6Q7hcNevQa2nMRK4N81dVKaudAkRrZML/ABYAH5j2uFs7l
	J0evc1Fn4Cri6eTtC7qZfjRo6iDhwEgxfgryouWQVIXZRJBJXmAiWlYhT0UR5lWSQCzNRBL0tr7
	w/oUk9Lf+ofP1R4j0LownDy90/PQd26I0=
X-Received: by 2002:a05:600c:648a:b0:483:6fe3:bb49 with SMTP id 5b1f17b1804b1-4851370354dmr94872985e9.0.1772610548917;
        Tue, 03 Mar 2026 23:49:08 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:de3f:f927:40ff:12a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c75a25dsm39957572f8f.21.2026.03.03.23.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 23:49:08 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-spi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/2] Add Renesas RZ/G3L RSPI support
Date: Wed,  4 Mar 2026 07:49:00 +0000
Message-ID: <20260304074907.9697-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 680AA1FBD32
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28744-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,glider.be,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

This patch series adds binding and driver support for RSPI IP found on the
RZ/G3L SoC. The RSPI is compatible with RZ/V2H RSPI, but has 2 clocks
compared to 3 on RZ/V2H.

Biju Das (2):
  dt-bindings: spi: renesas,rzv2h-rspi: Document RZ/G3L SoC
  spi: rzv2h-rspi: Add support for RZ/G3L (R9A08G046)

 .../bindings/spi/renesas,rzv2h-rspi.yaml      | 26 +++++++++++++++++++
 drivers/spi/spi-rzv2h-rspi.c                  |  8 ++++++
 2 files changed, 34 insertions(+)

-- 
2.43.0


