Return-Path: <linux-renesas-soc+bounces-12214-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 836AFA141A9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jan 2025 19:24:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44A0D188AEA7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jan 2025 18:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD9C923F27D;
	Thu, 16 Jan 2025 18:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="YeUU7cNt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B742361D3
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jan 2025 18:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737051794; cv=none; b=Z1RTTAz/pNlV1bCt/1JjE8olyowcfq18dQGkJ3oCmycp1/bfP8Pgkkj1RC2qZrVHOA74dKFBGJ7EuQB/4QjVmeNr3LKqEcvp46YuEGt7cRf/iDtzgHVk49naA67TKCs8aqF2IKEP2gQUaREk29R0ZGrxYuKU9/73oHN/oJ1xGFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737051794; c=relaxed/simple;
	bh=+JZn/ww1FY/kTAFer89gJaTpDgTvbKcrRyepTGJVP18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iVciyhshjFCFzhQlBCyS385w09eHkQ5Aw8c3NGrIokWugYLaDA/PsrRtxxDbtpJzTZXKQ+wAFMfP2Y2O4Nh+Xj3SdvSjYOhenqyTvkPBB5LBLMYsNzYVVwx+riCVJwci3msE8kNeZ+0deRyTExWiDiTKscYBV13qo3dX6oVxtkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=YeUU7cNt; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-385e1fcb0e1so685979f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jan 2025 10:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1737051790; x=1737656590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmtKKaWRtLl2vifGgcWTXPqXE2lcLz7qOiG2GbtoKk4=;
        b=YeUU7cNtxyYGjobOoDN8dw1YAkZTfwMsyPu+JSlpT4eS5qcxDlxUymNWWDfZNwD+7U
         CmZR2k0Y6pColT9i8J5vUsNobVwqxCzUgd+8aARt6VeH6R7tPNfiHvX2Lr/vnxV6lVPk
         +nPrWIWQJApJqPMsLtymLbeTFbIjjfp6jllbGHshBwEK56cRVOyxtmHMZBty4ZgFWVK6
         XNhdWJgem5+EC4EbeFgx0Vos6SLMpBf0xcMMy2tsFatfb/5BKxyg0isCBbYSM3TzVglB
         f3kSNGav4gDWgEdBmBim4CtPvAzWLeGq/CvxdW7+MGOqGb6hY1AfqwIJ5UeqIwgeF3AQ
         yg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737051790; x=1737656590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jmtKKaWRtLl2vifGgcWTXPqXE2lcLz7qOiG2GbtoKk4=;
        b=XxxergnO2lUJhA9fbITHQQ1lEJmLmTvZ4hpYdgRtQ0M6V04E7EyjX8k8jQXxEmX1bU
         Qb8KTtwRFmdb6+niuDuC70+jEdH/SRhKURbHdc/td+oVRT4CH5vakNh+w4itcyIMwX7q
         D7mnSy0whXQuaIxAcZlUxFzqSlEjJzMmBmljlGz8cL/4+b/KbY9FB8/jVoph3ywBaly7
         Bp6A28F7myPa2vRVJU2zmhH5QBboSw/kPvcnxJcEV9kA9gcDD0leAdjA+XlwG3NmBS4l
         7WoXLWlC6I80lUn6P9aVl78oLazR80jy56xwiakTSUc4VQa+SMa60ik+JnBtp17Swz35
         QQGw==
X-Forwarded-Encrypted: i=1; AJvYcCW1KeEpVQct6HLIMeS8iodFKsxfnGjyJr2eNXbWM5VbwhU4o5TBGMQ9R2MzlZ6ilBwoCJ1xv619MLaFtN5PA7G7Ow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3vcUKUiNPbHL6RgizB/rHjBEMsB2dTozsN9snUQ9h3VNPMxRU
	FlV5nUZdkwRimqWmqjhVwDaYn3CuB8C0ojXvoe4R65XOLjcdgnCsEavuuhUCQqI=
X-Gm-Gg: ASbGncvHaplHhYrSrMxEJuS/P6fL+vRtOThNSHV+i9mfsfaw/Rc0iPFob25GQZrb1n6
	oYe1uzccZMNpC4SMZCo8OZwU3dioq3mTGtJfucDhU4HKxt5eZ0UAjPs0CvyXImL+h2f+dv68j0d
	wzkYsQYjh8amLuiH8QLPvzQ2jmyrVnnKkEZyv8w2p3nuQdhVZ4HVR/I9tqjCdSXmEubgGKZADL5
	0e7UsXzGxPbu9DpkjZRYgNrZOsFpXNLxWtB03OCV+t8RkPpkzGQ0ilQV2WM4/9c/FN+lHbDjgAG
	cPfD/4Bdnh0=
X-Google-Smtp-Source: AGHT+IHTCLzWRVHhlR7lW8GYQyylUAfvSBIe2YvKqor2RF/6OYe8hunZYeSsvJPm4KC/0CLZzX9ROQ==
X-Received: by 2002:a05:6000:184d:b0:38b:ef22:d8ba with SMTP id ffacd0b85a97d-38bef22da4emr3656439f8f.44.1737051789820;
        Thu, 16 Jan 2025 10:23:09 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322a838sm495942f8f.48.2025.01.16.10.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 10:23:08 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	geert+renesas@glider.be,
	wsa+renesas@sang-engineering.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	ysato@users.sourceforge.jp,
	ulrich.hecht+renesas@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH 5/5] serial: sh-sci: Increment the runtime usage counter for the earlycon device
Date: Thu, 16 Jan 2025 20:22:49 +0200
Message-ID: <20250116182249.3828577-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250116182249.3828577-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250116182249.3828577-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

In the sh-sci driver, serial ports are mapped to the sci_ports[] array,
with earlycon mapped at index zero.

The uart_add_one_port() function eventually calls __device_attach(),
which, in turn, calls pm_request_idle(). The identified code path is as
follows:

uart_add_one_port() ->
  serial_ctrl_register_port() ->
    serial_core_register_port() ->
      serial_core_port_device_add() ->
        serial_base_port_add() ->
          device_add() ->
            bus_probe_device() ->
              device_initial_probe() ->
                __device_attach() ->
                  // ...
                  if (dev->p->dead) {
                    // ...
                  } else if (dev->driver) {
                    // ...
                  } else {
                    // ...
                    pm_request_idle(dev);
                    // ...
                  }

The earlycon device clocks are enabled by the bootloader. However, the
pm_request_idle() call in __device_attach() disables the SCI port clocks
while earlycon is still active.

The earlycon write function, serial_console_write(), calls
sci_poll_put_char() via serial_console_putchar(). If the SCI port clocks
are disabled, writing to earlycon may sometimes cause the SR.TDFE bit to
remain unset indefinitely, causing the while loop in sci_poll_put_char()
to never exit. On single-core SoCs, this can result in the system being
blocked during boot when this issue occurs.

To resolve this, increment the runtime PM usage counter for the earlycon
SCI device before registering the UART port.

Fixes: 0b0cced19ab1 ("serial: sh-sci: Add CONFIG_SERIAL_EARLYCON support")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes since RFT:
- used spaced instead of tabs in the call trace from patch description
- moved the comment in the code block started by
  if (sci_uart_earlycon && sci_ports[0].port.mapbase == sci_res->start)
- still kept the sci_ports[0].port.mapbase == sci_res->start check
  as I haven't manage to find a better way

 drivers/tty/serial/sh-sci.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index e64d59888ecd..b1ea48f38248 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3436,6 +3436,22 @@ static int sci_probe_single(struct platform_device *dev,
 	}
 
 	if (sci_uart_earlycon && sci_ports[0].port.mapbase == sci_res->start) {
+		/*
+		 * In case:
+		 * - this is the earlycon port (mapped on index 0 in sci_ports[]) and
+		 * - it now maps to an alias other than zero and
+		 * - the earlycon is still alive (e.g., "earlycon keep_bootcon" is
+		 *   available in bootargs)
+		 *
+		 * we need to avoid disabling clocks and PM domains through the runtime
+		 * PM APIs called in __device_attach(). For this, increment the runtime
+		 * PM reference counter (the clocks and PM domains were already enabled
+		 * by the bootloader). Otherwise the earlycon may access the HW when it
+		 * has no clocks enabled leading to failures (infinite loop in
+		 * sci_poll_put_char()).
+		 */
+		pm_runtime_get_noresume(&dev->dev);
+
 		/*
 		 * Skip cleanup the sci_port[0] in early_console_exit(), this
 		 * port is the same as the earlycon one.
-- 
2.43.0


