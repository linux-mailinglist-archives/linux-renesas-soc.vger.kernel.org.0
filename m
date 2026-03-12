Return-Path: <linux-renesas-soc+bounces-29262-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMwdCgZ5sml/MwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29262-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 09:27:50 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7871526EE7E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 09:27:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 028BE303EC12
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 08:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B25374193;
	Thu, 12 Mar 2026 08:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+ISZxFu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7BB35836A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Mar 2026 08:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773304036; cv=none; b=gJb9Khq1lkvHhq64/03gzMvTcjY1EsR8gKRKBIX8p/osB9CyeeaFgfsGTZZoa/ewdTpUDRAxKLKwQHYDhOvhgQ4MMpYMV0sNlH2HFycYKunT/U70UxvX23L8A8vSR54AKs2m4ugfFloU6nPhp0Xw6d7nQT6F8+9J6fDKkUV0a/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773304036; c=relaxed/simple;
	bh=2s7KJHfCNTkqHvJe31CzyIYb79Txh6AnisrHsWvUMn4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WQRyfpRjUAROiJirRKaYSakXF6JIZNMI/OPSdDLtvOPkiG7Qz7ILitToOkIVVMJI7MamO0TNqhhl4Q1GsXzWkwNHfm6qY/7I3QGqcPeLv/aoPMcvteuJOn4nhBXEUh9Jq4+vRpjoJtjlTYcPtx/v9A6Gl2V+1qW6Oz6j9XF3b6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+ISZxFu; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48540355459so6069395e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Mar 2026 01:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773304033; x=1773908833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QdLoYf8XGVgA51ppjmyMKkwFN1LFowzvdfEVBXq+KOA=;
        b=Z+ISZxFuksn6zEhqdGu1YVw1nApjXkOw8MTk9TN321ECzzAjDEiTV0vC3jsZvrew4m
         uWQEzUTa6YaXixQG/Ab9SQviONhaCL2GCoUh21Z6l78adqCHYwoC/gEm5VcepafPgSHn
         Walgx4oZjxjodTzNjdOQYOfzJpJbF7oWLncC9rhMNegF3PTR/TtIqXJQ404qn2fzFhqT
         kt6Pplb4LUjILOX7wfaRI7vcufm6p9TmHWcsRqtdkfywZfLakHVTTNQsfWLkwCzOrmTg
         WVHRJXNpzR/Dbrve7H7N4yIaGS7AZC1SO6IPjqQbu1Oh3NliHftCoG/NquqPfqBDokVl
         anDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773304033; x=1773908833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QdLoYf8XGVgA51ppjmyMKkwFN1LFowzvdfEVBXq+KOA=;
        b=xUx7Ju1ua4Yl03M0pDwymZtz7Ost22r2oy05E0Nq5XiWGp91g0EsM5t9/fmwePYHhs
         J7c1uuMj89Eygb99jDarq2ONJwSl0Yq4hhb16a/bxzjrZBWWnyEyXxytGSQGmDbNZTp6
         jhjE5gJdCsSe1ZC+rg5DLvtGGbJHRHNB0aGlRhb9c0G1WfF/tTMO4bf0MslKgidXjk5q
         WAba7THNVAVDBKOnSDyekuFnEoDxTW8fmtQ2LiIBckl+Y4zk9YpQCVow4TWHL0Fb4hJS
         C8CWiNIjQvNY/wb2ZhLxFSFLqigJ0Jw66ViyxPXBTuPThYb3Lk1afW+AjKppvt4oaGvw
         ZKZA==
X-Forwarded-Encrypted: i=1; AJvYcCU9xDNZeyFmIMB9hZKWEzckxpQy03ypqXbLv2Y0Hv5SwyJ10RwoIuu/u/lHWv2vm/AXj08H9hsoJ3YXdqwjaOZ+Bg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOeqg3nsvfKq4lmlXcWIxv3qzHqYqWs909H7AbjlQX834cy9gl
	i/KYDK+KSlJJpFni6FQMt67j5NzuClFBA7suM3MrlwcML6i2EJ9Q3id+
X-Gm-Gg: ATEYQzw3LC286AdXxHg+jPJ6c1f/rufOQMaHfhxgb6sOkZJHIESq5P8dccjJgu8IiDD
	btz/k8NBXtCNNShxjcsuJDHXXM2sFjWH9PZ0GcXOVjan2b2Mpp/gBj/IDE2CY7RfUsRGnFUCPUW
	TRgKEWK+hmGQVAhZzzNbmfjy4S3ndXGmsAdS599fZLeoWZV3voD6eNAUMQjzhPAcHWoI4+BaYXk
	vI/kyXWyn0613Ts829YfpvVPgptLc41RyIO0aWI490xA/iEzzK4GvBpDWakVXUsGVj40PBm2/ZT
	j/KCVtpp+K6UEngOwZ+Y9sm6GcLH7uaBn5S0V3WAlx7YzxA7mmEFg8G+mNDiLXfWw5MAoA8JeI7
	0FdnPILf6IMdQgppnX9P/kmWcBWWF5FydLBP0So0KkTHk7NH3x9+ExsFw3VSRlt6MsoVTVhDegx
	Exk03y9LEPDbUTr4vgKN6DGajtJatf9AZ93J+Xk4mL/8c33BY=
X-Received: by 2002:a05:600c:4e43:b0:485:3fd1:992c with SMTP id 5b1f17b1804b1-4854b0a6a05mr83785605e9.1.1773304032389;
        Thu, 12 Mar 2026 01:27:12 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:775:4d0d:d776:157e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854a2eea84sm65925065e9.1.2026.03.12.01.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 01:27:12 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/2] Add support for RZ/G3L RSCI
Date: Thu, 12 Mar 2026 08:26:57 +0000
Message-ID: <20260312082708.98835-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29262-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7871526EE7E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for RZ/G3L RSCI. The RSCI IP found on the RZ/G3L SoC is
similar to RZ/G3E, but it has 3 clocks (2 module clocks + 1 external
clock) instead of 6 clocks (5 module clocks + 1 external clock) on the
RZ/G3E. Both RZ/G3L and RZ/G3E have a 32-bit FIFO, but RZ/G3L has a
single TCLK with internal dividers, whereas the RZ/G3E has explicit
clocks for TCLK and its dividers. Add a new port type
RSCI_PORT_SCIF32_SINGLE_TCLK to handle this clock difference.

Biju Das (2):
  dt-bindings: serial: renesas,rsci: Document RZ/G3L SoC
  serial: sh-sci: Add support for RZ/G3L RSCI

 .../bindings/serial/renesas,rsci.yaml         | 26 +++++++++++++++++++
 drivers/tty/serial/rsci.c                     | 13 ++++++++++
 drivers/tty/serial/rsci.h                     |  1 +
 drivers/tty/serial/sh-sci-common.h            |  1 +
 drivers/tty/serial/sh-sci.c                   | 14 +++++++---
 5 files changed, 52 insertions(+), 3 deletions(-)

-- 
2.43.0


