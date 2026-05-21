Return-Path: <linux-renesas-soc+bounces-32889-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDg2GqGUDmqtAQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32889-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 07:14:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B605059EF69
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 07:14:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C98D3044713
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 05:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA253335BBB;
	Thu, 21 May 2026 05:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ao51JG6S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D203358D6
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 May 2026 05:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779340422; cv=none; b=bL+oT0/mt3pYCFDFZwYziEAEMdCK8CxOF7WDI0TiCiAyb+EqAaOAapl6NnHfDVps2w/J9eyZx7Ssidlj5MV44CPpVv+RE3Jp0Zue2AVjG5gjOFErYTMTr4Pgv7+JmOP7cIfp0ZpnfXgtrysA+4SfxGo2VSw4Tkkje9zwDzmIDXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779340422; c=relaxed/simple;
	bh=gGj3bx1qE3wnIKHp+6qyWe35fzxuLt4vuc4uZ4QLGkI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sW396oXJ9Eci0kVx+uqpGRrG0l1GVvVK+l/e2fWNSk8GRWQPuAe85YRdfnsA9Zsma5d+0erE/UoQXj3aJLiMHJUSdp7S4pC4RUoJp/ZiRSDaeEFrKR/g20HwHIlw7Kt10yWSjW6Py2OhgDD5dLuS/IPM6pz+KWyrY4B7q88D7kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ao51JG6S; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-303dbfbec77so5960705eec.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 22:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779340421; x=1779945221; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bnS66HRPMnJiuE1UMjp+LGMM6n3gYPvVDfnlD++FnrY=;
        b=ao51JG6S9WL9RcalrUA1ffhp0uzhjnaouLPW92MFWPq0svcNcbXcfXG4mxgq1x3ObK
         9nal6g2hBTFh4OOrUTbv16TcyES1uogbHx9sxW93vyc56C8FgyRowiQDVQZ0zVPY69Rw
         Bv063RkRAXFvXT2LR1F7pJZyNNrNiyjdK2OKc5c80kNB62bFuHPv58Z399ry7bqsmzJz
         X7rxNL4KvFbqZUmX0Kv8til2I/6A/IUfuTkmX7HblwzkKfvCxutBRCxSumCf07vHCm5h
         NqlhW82OrXof1Sw6tk1cEND5ctosdvyKLrNV0dexRfbXjm51nVIbTcCOG/GcdEmADLFI
         VRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779340421; x=1779945221;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnS66HRPMnJiuE1UMjp+LGMM6n3gYPvVDfnlD++FnrY=;
        b=TnP3ibywK4MrcRlFZurgwnFuuwLUJKdbqXxvugHwvYSVj8ev/v79plcNL6zOrmmE/D
         qC7IEU4W29dnPLoGPnbEKYbcp4LoSy8dWE2UwDFbYE97wmE2jboBAlG0xuDWlFuxDjBI
         6qD68wu27F7N3dwKVK10NA59YFX9s1psfaVC4IuRRcaPtgXOrzcoqda8niVKDpm/knFg
         mxTEecifxmeWPtbQ/j8mgCeEPdvUkv2W1rTc9R7DR59L6HCY0+khYBGXqziR93wLhmPQ
         uam/2Eov+qoqrd0nP6EcGmBHDrPSagHJkkOItjPaSg7zj8Cq8urA9vLf2ZT4mnGN6dWU
         D+rw==
X-Forwarded-Encrypted: i=1; AFNElJ9CuNHD3IXrOyq32RtcIPb38oDvdpxvDzBWtl59eUh3bl6WgSJ9V1l47HHXSRf2WLYc7o6uW6tBWun4CPcZUyQlRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJYwvlEuIE2ZYEMEVmbR3qbz43on5mlF+qitg/bWJNjOFTmuqY
	4ycEPcCsi6Sl3vCDWETmE6g10NA2rVTzUfren2ji455SDqQEiwVg2B9nyDSreA==
X-Gm-Gg: Acq92OEFB1hPt729mLi7Pm6GlboN4ZJk04pmx9q265zHuTBP7okude+sj6GnNljIf8L
	xfN2gTrXp9ImY7GtoHz6uVDO+uJ6H0hzT9OU+TT3UlkgrmimoheSo5lTyyAtmW9ZbdXqgWEbMkX
	htz5lC3uBXdG9EwCQVPxdj39yiZxt3oY1zk9VDnE7ObkH/pjbAhKlkx9Kjc+k3iKX63Z3B5xkGs
	bB9yqpFO9VHddTC8kxLFNQ7VCxUUNEmN3j7lrj1NXw9qowj1F+6gblJECHPXEHB80qcvWueeG9R
	GWhQDqDgYvVOT642Mg/gSQnkDsmiMU/yG85QbiePFS4WY4LEt2kLE2s2YD7k5ObymZ6mJBzBI1D
	mTR8kyIPkdte0Lcs9+7xzNhMcsXRP6CD6x8jRIsSqZB3EsIzzpzS//6YkCzAmVfu3d5seZrAYET
	ZqQADT0iov4mk/AH8deU72PZKYJMIFkpOxiGLuWZr9rOdES9xWwNdaHLYwmyU6Rv+dAPXkeFHEF
	hJM9zkUMvNXONpDPivj3lmc
X-Received: by 2002:a05:693c:300d:b0:2df:71f0:e5b3 with SMTP id 5a478bee46e88-3042f9716camr847573eec.20.1779340420662;
        Wed, 20 May 2026 22:13:40 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d457:597:d576:1eb8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-135e5c0a918sm6231360c88.14.2026.05.20.22.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 22:13:39 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 0/5] rsk7203: switch to using static device property,
 drop legacy gpio API
Date: Wed, 20 May 2026 22:13:16 -0700
Message-Id: <20260520-rsk7203-properties-v2-0-465f3308021b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGyUDmoC/x3MSw6DIBRA0a00jEuCiJ921H00HQA+BC2fAtVG4
 95LHJ7BvTtKEA0kdL/sKMJikvGugF4vSGruRsBmKEaU0JbUFcExzR0lNQ7RB4i5tLinQlFZUXH
 rG1TCEEGZ3zl9vopV9BZnHYGfq2nNgw+Z50151lkRrJ1WrfXkmBVrC3NgY/Y+SN7xTUh4+8d3y
 Rtb6cibj0PH8QeJ8BEPtgAAAA==
X-Change-ID: 20260310-rsk7203-properties-82bf2c12b985
To: Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Arnd Bergmann <arnd@kernel.org>, linux-sh@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16-dev-6911d
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32889-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B605059EF69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series of patches converts rsk7203 to use static device properties
for its devices, including gpio-keys and gpio-leds, and removing
dependency on legacy gpio API (in favor of gpiod API).

To configure pin functions the board is switched to use gpio-hogs, as
doing full conversion to pinmux is too challenging without access to
hardware.

v2:
- Added a patch to isolate the function gpiochip from the parent fwnode
  to prevent ambiguous property lookups
- Added a patch attaching a software node to the main PFC gpiochip device
- Adjusted the board setup to use the PFC's software node for LEDs and
  GPIO keys instead of creating a standalone node
- Added support to sh-pfc for configuring the secondary "function"
  gpiochip via a "functions" child software node.
- Converted board pin configuration from legacy gpio_request() to GPIO
  hogs, using postcore_initcall to ensure nodes are available during
  driver probe.

v1:

http://lore.kernel.org/r/jwtdoptatzfo47mbpmmjwhhhjn4mbw6ekp4gtoopca7azbcelo@uvtz4w2ga5qn

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (5):
      pinctrl: renesas: gpio: isolate function gpiochip from parent fwnode
      sh: pfc: attach software node to the GPIO chip
      sh: mach-rsk: rsk7203: use static device properties for LEDs and GPIO buttons
      pinctrl: renesas: gpio: support software nodes for function GPIOs
      sh: mach-rsk: rsk7203: convert pin configuration to using software nodes

 arch/sh/boards/mach-rsk/devices-rsk7203.c | 282 ++++++++++++++++++++++--------
 arch/sh/include/cpu-common/cpu/pfc.h      |   3 +
 arch/sh/kernel/cpu/pfc.c                  |  20 ++-
 drivers/pinctrl/renesas/gpio.c            |  28 +++
 4 files changed, 254 insertions(+), 79 deletions(-)
---
base-commit: 6a50ba100ace43f43c87384367eb2d2605fcc16c
change-id: 20260310-rsk7203-properties-82bf2c12b985

Thanks.

-- 
Dmitry


