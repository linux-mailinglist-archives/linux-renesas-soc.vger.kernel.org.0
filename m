Return-Path: <linux-renesas-soc+bounces-25387-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDB2C94428
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 17:46:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B320D4E6C41
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 16:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E2530F930;
	Sat, 29 Nov 2025 16:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KAnNwCcQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEED130F804
	for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 16:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764434624; cv=none; b=An6u0WKAWJfE6hoTBK4BZHS0KxOw7zp+EXOWEVLbO8VKhVgmvUrYqQfl/XwApHEtwXUm5rNdWeH+/bn2ORx5ViUqlZKW9RHqJrgq4rLpLOTydJbaU/FS5E0SZt0R1EgTkpiRABHGK4mE4hBNeSdM9MqLw1sNrZ5ASo+DBZ/j61M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764434624; c=relaxed/simple;
	bh=/VhQgLJMpPMzLmxjLuTth3GX0qTQ4NK8zuL+H9jKxEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GXXNBRCKDCPlgzStsEPWGA+PvvvJ+d3p5c7Fb9cZQC423bNeeAe3rtUlrZIMjBsnF3kraFqAvkeSAtcW8NlM9i40fZZJIFDLpGXeoSJuAt2MOfqYigrF/c6ESFFKp2/vI5FoEYMrW5fJ652Rx8/epG6VoBeXLV6uQ0xkiY7k4Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KAnNwCcQ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42e2e40582eso9574f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 08:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764434619; x=1765039419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YS50Cy4Ut/5ecqUXNaAW6S0vgr2UtXtcJfHQtbcbph4=;
        b=KAnNwCcQIGsj8ZMBzy312IM/dUJsx18l0X7v0y40JlI/oyDjaqe1D+un+mwOpgSmX/
         fTonHCQJQlGTeV/eKSey9r5R6WLnvQVqczc8Ao34WEXuzcsqe18kUdaq7L/iHKndvFYn
         inVDJxg5TpHWmAa5FgnXiZOKmkvEmqlaNrZ9SOYvdo+DkuPI+NH+EEukT82BHfqW8mRM
         QN2SaQ5l3xiwf2XViO04Dk1B3hKdx1rJUJDjP42/Rl9DQsW+YjL6EdxwIdSvpUeJLXTk
         NYNfIFyCnoXUoD33Vi0M9ltJEstDyK1BelqY3qq/DiekQCLDg/rMKVWC8/WbMkr+eXxr
         V2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764434619; x=1765039419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YS50Cy4Ut/5ecqUXNaAW6S0vgr2UtXtcJfHQtbcbph4=;
        b=G1fIW3lktozNZSugowWEpQNP54kxrETUtGzRd85WMpC3m+L9h/QT+wfz/8zWI+tY8A
         0L9nOA1Lw/KQn4evMR+1QmfI61xZ8gg40KDEEYVsPbqQA5Ig9GcEGWOwnx548QoLmYWB
         682gTk1rPouf7kVrSMB5XL3fU2HSFLSl+/XbY+PdLeblHkkI2tScAFOrgBs/WDN4IqAw
         bSDJLYXnWphrScGXEbT99g5c+GJiRNhBAZlZLE0WlCXYV42Z1xzXNmKDlws9GDwU1hLs
         23KslHMGEGFgSn9glm5quegLGbN2ythPtvtvoCdQzHDsTZ36nGtVwaNWEUgEhhnkINMV
         XsLw==
X-Forwarded-Encrypted: i=1; AJvYcCWqH/57/tHl3rr/Iz75fwxLIbxpJVHAeCtMYa0aTvQWOz0XVao5zeNTFBhXLM72XbO6b5wQh4KosT6aV337Ftdoiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4KClwBw08YEjTFZ7qaEhTlWm9GS3N2JI96d1UtuzULpY7V1v0
	N0bEcu7eQiXY+kZfYKy35pVAkBVeWs4bwHBuNNsxBQ6ulj7i7dUOO6iz
X-Gm-Gg: ASbGncs10xrpHsr88RxuvAUkvcaC6JVfe2znHm41DJM324u5KwacyzIBVXcGl2BfEae
	JdoURwdPcaRvJZZ18Via+KGVZWa4m3L1V5Mo7yRnHeud4KnLdG50TvuN8o5yjyuT6xtcml/9VPH
	xi5o5ktoUEAQGMY0nah7dxsUi/OFMDDnAlarUmMp7p2xYzd5gOnfrm/eP3GhRbxAFN90lQ5g/nt
	UqiWJOVPWyOG6J7/mKvC/S8oJp6AO48aDVd06oPNzsNg3bcRewWDleP3u+dZm1fVf+Fix9FWJJb
	QoHsc9XKTMsluVZBeoHYkva8rfbwJUZFJ/7f5n+SHd/XdOLrXYwjL9vuI5VYPbeTu7UcienZhmn
	INq5pZ4T2t5rdOoNYW4W3KdFSBxXR4Njw0DVtMXwb4xv96bsy5fT8evMtTnnLfDV0fRIEa158E1
	XiZpmzuW76at3NeEpUAzJOEeAyqZVREZDL9FQy6HFZFa33OjkPVamYRC4W6jvkdpc5cYvs4e/AX
	O9I8d4fO1SRzscU
X-Google-Smtp-Source: AGHT+IGtcglIGEJuZOJgiEHpEFPiXP0MXwG22ukvfQSWaguRoQU3I4nsMoTkBgR1jTz+wuybAyT6jQ==
X-Received: by 2002:a05:6000:1886:b0:42b:3867:b3a7 with SMTP id ffacd0b85a97d-42e0f1d59d1mr18468516f8f.8.1764434619380;
        Sat, 29 Nov 2025 08:43:39 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca4078csm15970060f8f.29.2025.11.29.08.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 08:43:38 -0800 (PST)
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
Subject: [PATCH v5 16/17] serial: rsci: Rename early_console data, port_params and callback() names
Date: Sat, 29 Nov 2025 16:43:12 +0000
Message-ID: <20251129164325.209213-17-biju.das.jz@bp.renesas.com>
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

Rename rsci_early_console_setup()->rsci_rzt2h_early_console_setup(),
the early_console data of_sci_rsci_data->of_rsci_rzt2h_data and the
port_params rsci_port_params->rsci_rzt2h_port_params to support RZ/G3E
RSCI that uses different data and callback().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * Update commit header and description.
 * Renamed rsci_port_params->rsci_rzt2h_port_params.
v4:
 * New patch.
---
 drivers/tty/serial/rsci.c   | 14 +++++++-------
 drivers/tty/serial/rsci.h   |  2 +-
 drivers/tty/serial/sh-sci.c |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
index 7f4cb04daeeb..70ff81fdc027 100644
--- a/drivers/tty/serial/rsci.c
+++ b/drivers/tty/serial/rsci.c
@@ -419,7 +419,7 @@ static const struct sci_port_params_bits rsci_port_param_bits = {
 	.poll_sent_bits = CSR_TDRE | CSR_TEND,
 };
 
-static const struct sci_port_params rsci_port_params = {
+static const struct sci_port_params rsci_rzt2h_port_params = {
 	.fifosize = 16,
 	.overrun_reg = CSR,
 	.overrun_mask = CSR_ORER,
@@ -461,22 +461,22 @@ static const struct sci_port_ops rsci_port_ops = {
 	.shutdown_complete	= rsci_shutdown_complete,
 };
 
-struct sci_of_data of_sci_rsci_data = {
+struct sci_of_data of_rsci_rzt2h_data = {
 	.type = RSCI_PORT_SCIF16,
 	.ops = &rsci_port_ops,
 	.uart_ops = &rsci_uart_ops,
-	.params = &rsci_port_params,
+	.params = &rsci_rzt2h_port_params,
 };
 
 #ifdef CONFIG_SERIAL_SH_SCI_EARLYCON
 
-static int __init rsci_early_console_setup(struct earlycon_device *device,
-					   const char *opt)
+static int __init rsci_rzt2h_early_console_setup(struct earlycon_device *device,
+						 const char *opt)
 {
-	return scix_early_console_setup(device, &of_sci_rsci_data);
+	return scix_early_console_setup(device, &of_rsci_rzt2h_data);
 }
 
-OF_EARLYCON_DECLARE(rsci, "renesas,r9a09g077-rsci", rsci_early_console_setup);
+OF_EARLYCON_DECLARE(rsci, "renesas,r9a09g077-rsci", rsci_rzt2h_early_console_setup);
 
 #endif /* CONFIG_SERIAL_SH_SCI_EARLYCON */
 
diff --git a/drivers/tty/serial/rsci.h b/drivers/tty/serial/rsci.h
index 2af3f28b465a..9547148e8bd1 100644
--- a/drivers/tty/serial/rsci.h
+++ b/drivers/tty/serial/rsci.h
@@ -5,6 +5,6 @@
 
 #include "sh-sci-common.h"
 
-extern struct sci_of_data of_sci_rsci_data;
+extern struct sci_of_data of_rsci_rzt2h_data;
 
 #endif /* __RSCI_H__ */
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 8f3314b258d6..677293115f1e 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3664,7 +3664,7 @@ static const struct of_device_id of_sci_match[] __maybe_unused = {
 #ifdef CONFIG_SERIAL_RSCI
 	{
 		.compatible = "renesas,r9a09g077-rsci",
-		.data = &of_sci_rsci_data,
+		.data = &of_rsci_rzt2h_data,
 	},
 #endif	/* CONFIG_SERIAL_RSCI */
 	/* Family-specific types */
-- 
2.43.0


