Return-Path: <linux-renesas-soc+bounces-25385-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EFBC943E9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 17:44:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 92F19342263
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 16:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD8563126C7;
	Sat, 29 Nov 2025 16:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FaGc2Ion"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FC23112D0
	for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 16:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764434623; cv=none; b=b3IVllRkny5pZbUuL+UtFF0kipgYcaMe0Fmri+IM5TNrGk05HwZerk8T3Y2dx2zi0asrsAJVybsv8HxHMKeyN8AJzGCwfoNZSiu05a8Fph8JAqWsKIROye/6rzV/Akr3XnhrmELJY17nfWNeAr4N4Se/BsX+ZHDYTzHYfK6dFSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764434623; c=relaxed/simple;
	bh=p1WYEv6A1wFU0XW9CE8LVYfeNV+9/VBPGL1bg8wroOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YwmUMZwYgCsFthWp4FqH4FlazmqclVIJHMqnYTEL4U30r6Ecdoj88TJ9xQotRMk3RmJThFyVTI9fHQU7LhCwsF5C9NrRLiGOmgJK81LuIj6/ag3U+wf6lsQYTCVFxOrL02Ip/w3JTP5frj0Hv+ontH2vciALjtBZS4P9eyfHRTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FaGc2Ion; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47755de027eso18037885e9.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 08:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764434617; x=1765039417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sV/phN61ONyLTDZca1RG2tB5jror9Wjo3bt6PCNvA8w=;
        b=FaGc2IonMgOC3NKAyIFg5urqx4KR7cT1xrVEwhJZwXpEBOKeUKzvA20tx440D/yH4F
         wvTIMyT8B+L5FPTXc13JwBtO2iIL/63tsbP7yKRB9qYE3JpjDezarIWC0py3TgtJToor
         dTED++0iGF9MiTTxIFmtJGPjbIifFaaWs0XKA16ru0WZYYQInKR/mmDUvphz3yVmhCRK
         eScIf+VWMfejWyCAq1Hha82jBr864n1Yzm79vP3wGW4FOacE+g9ibnBasSSCfk0ANqhW
         gYC3CxhnW7Wl6dcLXITCnTpeHnsm/Qv4ThmhJaNkFcc1t0QhefWeFlZC2QXOfYRxFFCC
         Lh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764434617; x=1765039417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sV/phN61ONyLTDZca1RG2tB5jror9Wjo3bt6PCNvA8w=;
        b=wuds/Xs26Vpmppn8DlNl50EHcOzLGfObFTVBfhwVs3dHHsVY392QdSl9KR0zx8nn1y
         78sE8bpo5OIKsa+TGftr82R0wpjtuS6CMYcf6oP1dWsMMCN8ouAsV2kQwmFx4+fpXf5L
         b5qC8UrWrVaunN7gG3zaibS8vcyxOhm2e0WmzzXx4Z/o3GXuHlXnmjXw9deRpGJVcgYv
         v6PXKs7OX+NhzH7aXKQUayTA3ojGLljjFz0ldyCSUaSK0gXn6S4EdhZ0Z2F5RTnWXlcM
         nQbDkf7o99tz+NUdHJj25NSFGRf5awneHNCQpSMFs3stoj9BlOAftmsFkMFPaMFnoHO3
         cqWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIGS8cxyySrdzZe/ElnsTmqcKGdIAxsPoElREbCZWjQmRSLBKwRDtpf2p/KhGyAE9FbLQgHNqCYOKZD+ab++SnVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ+r5CAyBWB9xOJTlcKEQz7kRYPT1oqzgPFkpEO8/ffWThvQ9B
	ZtAO9Bp71gVGuiLJu5fA27vSgbHQY+bSB8qCwQ/Xx1NxGGji9n2zqfK9
X-Gm-Gg: ASbGncty9eVGS1bBZillVJWZtT+TQH8zucXIrQv/iiEgYS9SjhKzcCNpPjY3gVBIGx/
	PUoILLMaiql1UuigVfGghukurmciqGed5sDXMEMoAjp8yYABBVjNgxMt+VxlYXRfsMxBidwcFCo
	6vz5hbvP9invij4lsiZ5RQ48kJUCiFOirxZ5tPZ/6B5nqjxeDDdzGwRkHDPV934BWZZNW+RhpQU
	axK59GVMnY6g+vLCENI8YeTJhbt5k8C/7TLuQx3/wA5lwafCIfcXFQ2/3ytVFGlk627s838uwMS
	wkutlRk/NWKmIzkTdbR4Unn7LsaV05sC0+GEKz1kJ/g+0k2eN0hIXGKjlAvgrSEWpnx3xcPa+Fo
	iiVmquV+tAXSEdSNZyq6E7on7z44ih9hnXxYnCflDlu2oifomqzV4GUztjvpmykw8j6YcI4vc6j
	Ii1ydyRJXhyW3wsdmeQ6XE28GG3ihni5+TLNqMajQsQ1e+pYwcwaOQyLTi556x48FiIIaE3wViG
	gxWSCR/F+TN6fxa
X-Google-Smtp-Source: AGHT+IGzNOuP5I+gYgfGj36btSZCyfRIbYTuTX4epxDNVcEZ+n3U8KnYkaRTC3aJ8GzwGl3RatIGvg==
X-Received: by 2002:a05:600c:4e8c:b0:477:8b77:155e with SMTP id 5b1f17b1804b1-47904af05b5mr211140525e9.15.1764434616629;
        Sat, 29 Nov 2025 08:43:36 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca4078csm15970060f8f.29.2025.11.29.08.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 08:43:36 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v5 12/17] serial: sh-sci: Add RSCI_PORT_SCIF32 port ID
Date: Sat, 29 Nov 2025 16:43:08 +0000
Message-ID: <20251129164325.209213-13-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251129164325.209213-1-biju.das.jz@bp.renesas.com>
References: <20251129164325.209213-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3E RSCI IP has 32-stage FIFO compared to 16-stage FIFO on RZ/T2H.
Add RSCI_PORT_SCIF32 port ID to differentiate it from RZ/T2H RSCI and
update sci_is_rsci_type() and sci_is_fifo_type()

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change.
v3->v4:
 * Dropped enum RSCI_PORT_SCI
 * Replaced the enum RSCI_PORT_SCIF->RSCI_PORT_SCIF32
 * Moved rx_trigger update to later patch.
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 drivers/tty/serial/sh-sci-common.h | 1 +
 drivers/tty/serial/sh-sci.c        | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sh-sci-common.h b/drivers/tty/serial/sh-sci-common.h
index 1b9480c7f4cb..abcd5bcc7c36 100644
--- a/drivers/tty/serial/sh-sci-common.h
+++ b/drivers/tty/serial/sh-sci-common.h
@@ -8,6 +8,7 @@
 /* Private port IDs */
 enum SCI_PORT_TYPE {
 	RSCI_PORT_SCIF16 = BIT(7) | 0,
+	RSCI_PORT_SCIF32 = BIT(7) | 1,
 };
 
 enum SCI_CLKS {
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 624ef41701f2..a63370f22574 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1184,7 +1184,7 @@ static int sci_handle_errors(struct uart_port *port)
 
 static bool sci_is_rsci_type(u8 type)
 {
-	return (type == RSCI_PORT_SCIF16);
+	return (type == RSCI_PORT_SCIF16 || type == RSCI_PORT_SCIF32);
 }
 
 static int sci_handle_fifo_overrun(struct uart_port *port)
-- 
2.43.0


