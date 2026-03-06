Return-Path: <linux-renesas-soc+bounces-28931-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BO+KlK4qmkiVwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28931-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 12:19:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B06A021F8E9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 12:19:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DE61C3007AEC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 11:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03F6635C184;
	Fri,  6 Mar 2026 11:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jlxhHXd/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A525035F160
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Mar 2026 11:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772795981; cv=none; b=dy96eTFT+0+VcnbAl066sqhqBY737W72098cd7m45Jp32wSRih1Qzl177OL8IluiBaPj4V7qKMt4DInFxzGkzYqn03Ub3glg/qg3eYgerCdJqQETcs8F7nAVFNM/4stSC2QOalcNi/S4aMS1wfwByh8MaqChoMUGtwaSrthujCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772795981; c=relaxed/simple;
	bh=IhHBDjBNblh3SGioE59ahxJ5i5rETskes7udyfMIjwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SmaeLMK11fkEmbl8KNvIQ4YgFWgyQGH09/WS30LHm4j5BYDHDxyfk1nD7J7xf0LbkAzYj4067cklXIRIrhzrmy7sPs9cLWQWXC4Dt4JhFFWKh1yaCBvwJ9AWV6EC1BpLEiuDlnOzo5bHVfm/T9OovTUjRgtzq3cEEUWzg/pD8h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jlxhHXd/; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-824b05d2786so7477133b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 03:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772795980; x=1773400780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X0jykUN0/tKr1Iorg3HvmMPc1TMCQY6y1V9ModxJUJY=;
        b=jlxhHXd/NGrSQ1nvRmh1oSOT7gotHVvdSYCloX//S0jbrAsnoz873qynDx3PzwI8rZ
         aDtTzT1TZ+7Npl7NeA7K80LDZdafOFQ4r00oBtsrT/55VYcTE72ct267O2E/kK0e+tFd
         MydLm/G2CLy4oEsMptYhCC+Qwm+cvfvk2zdg/TaI4/0assv8dPPyu0WSdnTJvO/148vM
         Bi0dobeBMJ6ElqtQDhc6/XgRt6B1gJtl+hZ4gFUnPbUFcz4yEO0ZEQzq2BbkhEtxDSK4
         zsxWZgMN18H2Tbk8mDDeBaFLlPT/BZoIc9ZL46OqZcDS2Jqv9zQ0aLf5Uwf5dlIRy8P4
         zkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772795980; x=1773400780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X0jykUN0/tKr1Iorg3HvmMPc1TMCQY6y1V9ModxJUJY=;
        b=C/UkqJu2J7HuGcKJ5enTuYrb2JYKIdgjQ+FYzav5cZxgg04c++WQl4AwvDK9MD/AKT
         ECTYxHkyciuNadX2xf9MfcinCMAvBIkbJil7zfvOBbB5LoLy8TxLBIUGYgPb+n0MeTed
         GGeuweI9KMK9kajpTWc65NTGAQVeE1u7JUAAe7Ed1cd3vSO+ky+9PUQ9Ny+fX8r0SXH+
         ar0bTzR+hhzQ8I+SmXGdjWxf+0zSdN5VZt4qT2q7lAnLLeuEeIaFQOaSAxVainJ0ZIck
         DPzPpCRAzmNZXHjDBZFDfmPiUW2Sdjpmt+eMF3H2KQKvtH91zY4GXxtBsnep4nfsr1mP
         8lUw==
X-Forwarded-Encrypted: i=1; AJvYcCXG1HSeHlnuWcEiA3g3RAc2mj1gRNUq52+kp7cr4oXazikBTV1vNrww2mksvpPHdX3J11iNej8rl/3OhhRCsrDs6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzppbGCk6p1fzPz/X7rIn8A9dSXYWD1ScsX8fs9P8BedUwG0Lsf
	e912O0rzHCTZhLRdZNyO4IqjElE2ImdvfVKwqJUn9SS42MDpXVT2pm+4
X-Gm-Gg: ATEYQzyVxoubVI2d5K5Pk8HqU+7/SIZ4ucKToYRPUFJRSscYmwjWAKbSkhZWJh3eskz
	2wbYL6cW7m8bT271VxQQ7143qfSnElOSA9KTTb5nUnxBV3PZBN97TBV67knMlxXuBpjyXcgERRq
	z9/dsqFP2c4eIf2uZOqQLWva33h9Dm2uF97DLn1lB2Aet1cErJyHXY2gqm13Ix3W/DiTeEJtPm0
	FY/XKrFetprX1ZBG13CnONXMXBkSZqugZpcsvR5r/neqC2WuRADbeZZJWxEpgJRuZdbywwAR/qR
	XzrUejJav9xAZ9ppsCKwiSXfjMq7ko4/KhqffOOPAKoserMLgozVVHML6vgzJlggPig6EIDznRY
	9rI3uiTEmDpfKHStSX3FAhDssvssmE+VIt60SCTRqToq6Jymp8jDqATeL1ioC8mfBxYj6J9HeLe
	RcmXfN1GWFKUEFWzwuV1+Y0nPYZbyKSVouuVr9O8V5w0e8bfeAORV54mtlIA==
X-Received: by 2002:a05:6a00:1c84:b0:827:343a:a1ef with SMTP id d2e1a72fcca58-829a30c2008mr1778823b3a.52.1772795980067;
        Fri, 06 Mar 2026 03:19:40 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4636cfbsm1475973b3a.13.2026.03.06.03.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 03:19:39 -0800 (PST)
From: phucduc.bui@gmail.com
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jeff LaBundy <jeff@labundy.com>,
	Bastian Hecht <hechtb@gmail.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 0/3] Input: st1232 - add system wakeup support
Date: Fri,  6 Mar 2026 18:19:09 +0700
Message-ID: <20260306111912.58388-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306104025.43970-1-phucduc.bui@gmail.com>
References: <20260306104025.43970-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B06A021F8E9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28931-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,sang-engineering.com,labundy.com,wolfvision.net,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This patch series adds system wakeup support for the ST1232 touchscreen
controller.

During development it was observed that the device did not expose the
"power/wakeup" sysfs attribute, preventing it from being configured as
a wakeup source for system suspend.

To address this, the Devicetree node for the touchscreen is updated to
include the "wakeup-source" property, and the st1232 driver is extended
to initialize the device wakeup capability and report wakeup events
to the PM core.

Testing

The changes were tested on the
Armadillo800EVA board based on the Renesas R8A7740 SoC.

The system successfully resumes from suspend when the LCD panel is
touched.

Due to the interrupt hierarchy on this platform, the parent interrupt
controller (GIC, IRQ 24) is recorded as the primary source that wakes
the SoC, followed by the device interrupt (IRQ 35).

Example kernel log during wakeup:

PM: suspend-to-idle
PM: Triggering wakeup from IRQ 24
PM: Triggering wakeup from IRQ 35

Verified functionality

* The "power/wakeup" sysfs attribute is present for the device.
* The system resumes correctly from 'mem' and 'freeze' states when the
  touchscreen is touched.

Changes in v3:
* Patch 3: Removed debug dev_info() log messages for a cleaner
  production-ready implementation.
* No changes to Patch 1 and Patch 2.

Changes in v2
* Drop description for wakeup-source property as suggested by
  Krzysztof Kozlowski.
* Updated commit messages for clarity.
* Added driver-side wakeup handling in st1232.c.

Patch series

1. dt-bindings: input: touchscreen: st1232: document wakeup-source
2. arm: dts: r8a7740: armadillo800eva: add wakeup-source to st1232
3. Input: st1232: add wakeup support

This series depends on the following patch which has been
submitted but not yet merged:

drm: shmobile: Fix blank screen after resume when LCDC is stopped
Link: https://lore.kernel.org/all/20260226054035.30330-1-phucduc.bui@gmail.com/

Feedback and review are welcome.


bui duc phuc (3):
  dt-bindings: input: touchscreen: sitronix,st1232: Add wakeup-source
  arm: dts: renesas: r8a7740-armadillo800eva: Add wakeup-source to
    st1232
  input: touchscreen: st1232: add system wakeup support

 .../input/touchscreen/sitronix,st1232.yaml    |  4 ++++
 .../dts/renesas/r8a7740-armadillo800eva.dts   |  1 +
 drivers/input/touchscreen/st1232.c            | 22 ++++++++++++++-----
 3 files changed, 21 insertions(+), 6 deletions(-)

-- 
2.43.0


