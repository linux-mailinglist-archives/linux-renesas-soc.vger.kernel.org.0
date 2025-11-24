Return-Path: <linux-renesas-soc+bounces-25055-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id AECC6C7FE0C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 11:28:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2F163344590
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 10:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56EC2F6187;
	Mon, 24 Nov 2025 10:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MheuiPfE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DA0273D81
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 10:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763980124; cv=none; b=naxmdVkc9IjypjR7zFiuLVYEpgYF6gAjrxGBKa9EjNxpisjL0aQ9iWr2SlAqvmar3Uf8teT4hVDx0fwM8ovf+vu1sv3IeMY8zXWFcRitBgAixaFzuNay8Vm5n0g18KtOr/ZhuuA8S9GCH38pV+5L+UtGUsUm29VMMhGdaeZ60gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763980124; c=relaxed/simple;
	bh=j4rwErbxJOiJsCwmFf+d9lQ0jswuGsKgmWflYiRUTsY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z0Sg0zvOvr+Kp5PfEydlUCb7dzGcWmQSCMGS7kqcA9k1nP+J2TiymnrS5uxNOm8XVMlNlSelACAY20ucTpQ8d1VwFb1aE9b9V+jvLQ7wFr/gRELIsLJraaZjt2RVFL6fN1VdhIEN5OT4Z4OMJw+WiKJQ0udaMmshmr0ThzupiLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MheuiPfE; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so34850275e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 02:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763980121; x=1764584921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0kZESSMjx7bZ19ysbgJ2mB3r2+zOEjXj5Dnyebd1MHY=;
        b=MheuiPfEbvlKm7qrKt+VLAbFCXXNPn/oclslroF/UVxp+DUlAK4pPRFYKUfH+vf8Wv
         fqTgxHD/7xOZduYsHHWaipNdCARcnmGGewjo29MMs5Z0eqnqimazvPzPIp8bbWnylOWn
         z73XHm0yOawUczgNMqTt0TKBR+DgTvdpMBYIeC3Sp5Wvg6/ru5ZjX2VdD4ecAYR5DA3r
         q2oIeBOxM4zg6ekOE2c3tFSJv8+5rcZrXcm/ehDWhJrgXfnoUCs2W7tVSHbU+OqyY8p0
         oA3LVM1O8tRTt+bk8WXwp080t6vyLneyp72rXYYzYLTAf7GpHTegDFQal18KYgIpRsr6
         /kvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763980121; x=1764584921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0kZESSMjx7bZ19ysbgJ2mB3r2+zOEjXj5Dnyebd1MHY=;
        b=cA7QQg135wDETPFEeQW6Z3sTJ8wy0b8uAw1e9HX7pm2gCSwLEeIf7nvl/2wzxdW8FF
         wpBAccxtLhl0EkYx0epx+pM8Xwjn+yrAHtvaZox2gNKvAHGbQsnoKvyDgunUJ4SE/p8X
         /zGTbohi8K4/eSMBCqguXIGnoH1rC5MUnP6gXb/I5mCrmrHauPwIpEXhpN7HwNpbDlHe
         S4NDmS936nYETQ1P+6fSbgB0uBhhiR0SBIc2Dkvi6RDceh9cFwC3v4VU+qZkX1tdoqOu
         RVHY4NS0kUqG+2wfUD1CeJ0dk7/2TugVe/JZtVj7t6lR5NKns9Bi15+CQoNw54IS78ok
         5krA==
X-Forwarded-Encrypted: i=1; AJvYcCWz6IkCDrGpPdT0UTnw1aT8UoCeLok5S0GY6B8PErzsnMN8wwbvXt5mZL0G9EmihLT3StHaHUJpJdKGHQyyHPD1uw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHdBrMmP4xJQF4dvAeWvEBT+lUdWjNA3FlO2yh2L/bZ2t1MR9s
	DNefDFcyRvs6z+svJ5oqHQgyf4gHZDlNaUoUAf+vjgwfaRVSi2U0UKiI
X-Gm-Gg: ASbGncuE4CCk6TioUkYSWYWxk1ykUz02Z7vjJBHdyaSxd+UUM5KB3sqZ0J06Kiu5uRO
	ZiaYhz4ZNDdHirePVMkMC/qdXTdi52GbTL2GsTD5YGkfefoRhVMRqcbg/iuYGyuwF8vna9rE6Kh
	QqE0mbc1xrgmgSJu9rtMwdpjOilwqXrLsgs6psVJNS44AtjMgbBuFl/tUWfxPDGooLYtZb/LRYw
	ClpvEVNKMem6Zx85R0Rp8BZLvCOUqcwvV2HngVhsHZH+xHYaTS9viuBN1SSTZNEfn5yNyIXuV3X
	LgMETqTDht0vS33yD5440fb7c4edeuWr1+6S9tzs5fR8pwSu0g7RSjDsXANB57xU5ACOksSijn+
	NdS6MueGXY0SNdtx8Z/6r3qNKZ70LKr9s0fgTSH2tJ3Esd67rv/VvsBjH92vLnxNBI2SqADOp13
	X6EozUxy+F6eCuNw6SqJnMGO8QYzCZGR9jke8cC7cjTkW7rKyHAM7Ww5S/EKillXy1S2NLwxtcW
	p0r/sO8GG1KmaoiuVwt
X-Google-Smtp-Source: AGHT+IEkVMjYc+aYX8MhoJu3ku3Lk7tOMt1MU99zR2akdYgJ9ebzXI+fp/bpsfamRmhEM63Vfrak3g==
X-Received: by 2002:a05:600c:450f:b0:477:af8d:203a with SMTP id 5b1f17b1804b1-477c01f04bcmr105850895e9.27.1763980120393;
        Mon, 24 Nov 2025 02:28:40 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf1df334sm186753945e9.3.2025.11.24.02.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 02:28:40 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-can@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 0/7] Add R-Car CAN-FD suspend/resume support
Date: Mon, 24 Nov 2025 10:28:25 +0000
Message-ID: <20251124102837.106973-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi all,

This patch series adds proper suspend/resume support to the Renesas
R-Car CAN-FD controller driver, after the customary cleanups and fixes.
It aims to fix CAN-FD operation after resume from s2ram on systems where
PSCI powers down the SoC.

This patch series has been tested on RZ/G3E SMARC EVK and RZ/G2L SMARC
EVK.

This patch series depend upon [1]
[1] https://lore.kernel.org/all/20251123112326.128448-1-biju.das.jz@bp.renesas.com/

v2->v3:
 * Updated commit header and description for patch#3
 * Collected tags.
v1->v2:
 * Added logs from RZ/G3E
 * Collected tags.
 * Moved enabling of RAM clk from probe().
 * Added RAM clk handling in rcar_canfd_global_{,de}init().
 * Fixed the typo in error path of rcar_canfd_resume().

Logs from RZ/G3E:
root@smarc-rzg3e:~# /canfd_t_003_all.sh
 [INFO] Testing can0<->can1 with bitrate 1000000 and dbitrate 4000000
 [INFO] Bringing down can0 can1
 [INFO] Bringing up can0 can1
 [INFO] Testing can1 as producer and can0 as consumer
[  541.705921] can: controller area network core
[  541.710369] NET: Registered PF_CAN protocol family
[  541.753974] can: raw protocol
 [INFO] Testing can0 as producer and can1 as consumer
 [INFO] Testing can0<->can1 with bitrate 500000 and dbitrate 2000000
 [INFO] Bringing down can0 can1
 [INFO] Bringing up can0 can1
 [INFO] Testing can1 as producer and can0 as consumer
 [INFO] Testing can0 as producer and can1 as consumer
 [INFO] Testing can0<->can1 with bitrate 250000 and dbitrate 1000000
 [INFO] Bringing down can0 can1
 [INFO] Bringing up can0 can1
 [INFO] Testing can1 as producer and can0 as consumer
 [INFO] Testing can0 as producer and can1 as consumer

EXIT|PASS|canfd_t_003.sh|[00:00:25] ||

bind/unbind
----------
[  566.821475] rcar_canfd 12440000.can: can_clk rate is 80000000
[  566.828076] rcar_canfd 12440000.can: device registered (channel 1)
[  566.834361] rcar_canfd 12440000.can: can_clk rate is 80000000
[  566.841842] rcar_canfd 12440000.can: device registered (channel 4)
[  566.848093] rcar_canfd 12440000.can: global operational state (canfd clk, fd mode)
 [INFO] Testing can0<->can1 with bitrate 1000000 and dbitrate 4000000
 [INFO] Bringing down can0 can1
 [INFO] Bringing up can0 can1
 [INFO] Testing can1 as producer and can0 as consumer
 [INFO] Testing can0 as producer and can1 as consumer
 [INFO] Testing can0<->can1 with bitrate 500000 and dbitrate 2000000
 [INFO] Bringing down can0 can1
 [INFO] Bringing up can0 can1
 [INFO] Testing can1 as producer and can0 as consumer
 [INFO] Testing can0 as producer and can1 as consumer
 [INFO] Testing can0<->can1 with bitrate 250000 and dbitrate 1000000
 [INFO] Bringing down can0 can1
 [INFO] Bringing up can0 can1
 [INFO] Testing can1 as producer and can0 as consumer
 [INFO] Testing can0 as producer and can1 as consumer

EXIT|PASS|canfd_t_003.sh|[00:00:25] ||

s2idle
-----
[  592.182479] PM: suspend entry (s2idle)
[  592.187031] Filesystems sync: 0.000 seconds
[  592.193221] Freezing user space processes
[  592.199425] Freezing user space processes completed (elapsed 0.002 seconds)
[  592.206450] OOM killer disabled.
[  592.209843] Freezing remaining freezable tasks
[  592.215775] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
[  592.223247] printk: Suspending console(s) (use no_console_suspend to debug)
[  592.260524] sd 0:0:0:0: [sda] Synchronizing SCSI cache
[  592.322759] renesas-gbeth 15c30000.ethernet end0: Link is Down
[  596.070955] dwmac4: Master AXI performs any burst length
[  596.072307] renesas-gbeth 15c30000.ethernet end0: No Safety Features support found
[  596.072376] renesas-gbeth 15c30000.ethernet end0: IEEE 1588-2008 Advanced Timestamp supported
[  596.077470] renesas-gbeth 15c30000.ethernet end0: configuring for phy/rgmii-id link mode
[  596.087503] dwmac4: Master AXI performs any burst length
[  596.088817] renesas-gbeth 15c40000.ethernet end1: No Safety Features support found
[  596.088881] renesas-gbeth 15c40000.ethernet end1: IEEE 1588-2008 Advanced Timestamp supported
[  596.093997] renesas-gbeth 15c40000.ethernet end1: configuring for phy/rgmii-id link mode
[  596.141986] usb usb1: root hub lost power or was reset
[  596.142031] usb usb2: root hub lost power or was reset
[  598.304525] usb 2-1: reset SuperSpeed Plus Gen 2x1 USB device number 2 using xhci-renesas-hcd
[  598.414846] OOM killer enabled.
[  598.418002] Restarting tasks: Starting
[  598.422518] Restarting tasks: Done
[  598.425999] random: crng reseeded on system resumption
[  598.431248] PM: suspend exit
[  598.661875] renesas-gbeth 15c30000.ethernet end0: Link is Up - 1Gbps/Full - flow control rx/tx
 [INFO] Testing can0<->can1 with bitrate 1000000 and dbitrate 4000000
 [INFO] Bringing down can0 can1
 [INFO] Bringing up can0 can1
 [INFO] Testing can1 as producer and can0 as consumer
 [INFO] Testing can0 as producer and can1 as consumer
 [INFO] Testing can0<->can1 with bitrate 500000 and dbitrate 2000000
 [INFO] Bringing down can0 can1
 [INFO] Bringing up can0 can1
 [INFO] Testing can1 as producer and can0 as consumer
 [INFO] Testing can0 as producer and can1 as consumer
 [INFO] Testing can0<->can1 with bitrate 250000 and dbitrate 1000000
 [INFO] Bringing down can0 can1
 [INFO] Bringing up can0 can1
 [INFO] Testing can1 as producer and can0 as consumer
 [INFO] Testing can0 as producer and can1 as consumer

EXIT|PASS|canfd_t_003.sh|[00:00:25] ||

str
---
[  624.898952] PM: suspend entry (deep)
[  624.903619] Filesystems sync: 0.000 seconds
[  624.908715] Freezing user space processes
[  624.914609] Freezing user space processes completed (elapsed 0.001 seconds)
[  624.921599] OOM killer disabled.
[  624.924862] Freezing remaining freezable tasks
[  624.930642] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
[  624.938059] printk: Suspending console(s) (use no_console_suspend to debug)
NOTICE:  BL2: v2.10.5(release):2.10.5/rz_soc_dev-169-g1410189b0
NOTICE:  BL2: Built : 12:53:12, Jul 15 2025
NOTICE:  BL2: SYS_LSI_MODE: 0x13e06
NOTICE:  BL2: SYS_LSI_DEVID: 0x8679447
NOTICE:  BL2: SYS_LSI_PRR: 0x0
NOTICE:  BL2: Booting BL31
[  624.984425] sd 0:0:0:0: [sda] Synchronizing SCSI cache
[  625.036962] renesas-gbeth 15c30000.ethernet end0: Link is Down
[  625.050909] Disabling non-boot CPUs ...
[  625.055800] psci: CPU3 killed (polled 0 ms)
[  625.062476] psci: CPU2 killed (polled 0 ms)
[  625.068380] psci: CPU1 killed (polled 4 ms)
[  625.073342] Enabling non-boot CPUs ...
[  625.073551] Detected VIPT I-cache on CPU1
[  625.073598] GICv3: CPU1: found redistributor 100 region 0:0x0000000014960000
[  625.073635] CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
[  625.074465] CPU1 is up
[  625.074565] Detected VIPT I-cache on CPU2
[  625.074587] GICv3: CPU2: found redistributor 200 region 0:0x0000000014980000
[  625.074609] CPU2: Booted secondary processor 0x0000000200 [0x412fd050]
[  625.075179] CPU2 is up
[  625.075276] Detected VIPT I-cache on CPU3
[  625.075299] GICv3: CPU3: found redistributor 300 region 0:0x00000000149a0000
[  625.075320] CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
[  625.076021] CPU3 is up
[  625.092153] dwmac4: Master AXI performs any burst length
[  625.093058] renesas-gbeth 15c30000.ethernet end0: No Safety Features support found
[  625.093078] renesas-gbeth 15c30000.ethernet end0: IEEE 1588-2008 Advanced Timestamp supported
[  625.096594] renesas-gbeth 15c30000.ethernet end0: configuring for phy/rgmii-id link mode
[  625.114030] dwmac4: Master AXI performs any burst length
[  625.114926] renesas-gbeth 15c40000.ethernet end1: No Safety Features support found
[  625.114942] renesas-gbeth 15c40000.ethernet end1: IEEE 1588-2008 Advanced Timestamp supported
[  625.118528] renesas-gbeth 15c40000.ethernet end1: configuring for phy/rgmii-id link mode
[  625.165208] usb usb1: root hub lost power or was reset
[  625.165216] usb usb2: root hub lost power or was reset
[  627.324220] usb 2-1: reset SuperSpeed Plus Gen 2x1 USB device number 2 using xhci-renesas-hcd
[  627.511216] OOM killer enabled.
[  627.514354] Restarting tasks: Starting
[  627.518782] Restarting tasks: Done
[  627.522274] random: crng reseeded on system resumption
[  627.527525] PM: suspend exit
[  627.788377] renesas-gbeth 15c30000.ethernet end0: Link is Up - 1Gbps/Full - flow control rx/tx
 [INFO] Testing can0<->can1 with bitrate 1000000 and dbitrate 4000000
 [INFO] Bringing down can0 can1
 [INFO] Bringing up can0 can1
 [INFO] Testing can1 as producer and can0 as consumer
 [INFO] Testing can0 as producer and can1 as consumer
 [INFO] Testing can0<->can1 with bitrate 500000 and dbitrate 2000000
 [INFO] Bringing down can0 can1
 [INFO] Bringing up can0 can1
 [INFO] Testing can1 as producer and can0 as consumer
 [INFO] Testing can0 as producer and can1 as consumer
 [INFO] Testing can0<->can1 with bitrate 250000 and dbitrate 1000000
 [INFO] Bringing down can0 can1
 [INFO] Bringing up can0 can1
 [INFO] Testing can1 as producer and can0 as consumer
 [INFO] Testing can0 as producer and can1 as consumer

EXIT|PASS|canfd_t_003.sh|[00:00:25] ||


Biju Das (1):
  can: rcar_canfd: Move enabling of RAM clk from probe()

Geert Uytterhoeven (6):
  can: rcar_canfd: Invert reset assert order
  can: rcar_canfd: Invert global vs. channel teardown
  can: rcar_canfd: Extract rcar_canfd_global_{,de}init()
  can: rcar_canfd: Invert CAN clock and close_candev() order
  can: rcar_canfd: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
  can: rcar_canfd: Add suspend/resume support

 drivers/net/can/rcar/rcar_canfd.c | 246 ++++++++++++++++++++----------
 1 file changed, 168 insertions(+), 78 deletions(-)

-- 
2.43.0


