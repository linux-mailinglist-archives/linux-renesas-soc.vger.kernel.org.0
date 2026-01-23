Return-Path: <linux-renesas-soc+bounces-27367-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OplO4z9c2mf0gAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27367-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Jan 2026 00:00:29 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E7B7B52B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Jan 2026 00:00:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3FBBE300D6A0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 23:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5251535957;
	Fri, 23 Jan 2026 23:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XV/+6cLt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DED2D5C7A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 23:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769209226; cv=none; b=L8TNaqoSMM9s2JlvVHrTzBb7twbWu6HSDKray6ANQ2daP8Nvkr9DaFxIH0eW7l5smARWSI4XMI9zsTFyS2K2tYM5yV2ao6IB0QfHjn4MSUmiMStZli5vPiLuI4+cAyixLMgDkB/zcpwcYBHMlQnlaFQKQMVG8tMn1kzK1LcUkvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769209226; c=relaxed/simple;
	bh=d4had5SJ6UU947wWnPxCbKq5o/uVBE9OQgdVKZb1HiM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bcBDxZPlf/OMu0WYGnw7hWvOF6vP4ZYNQjneUtcCxjy2KmHbmXHyZpwDo41SuWs9Ouwsq0d3F6QgdXvRjcNuX7gqSbUbR0Q/2sGLrM43ns0tNja73qjUhbeCogrQkLwJMRHfRABtU5s2TgLtZlzY8P+RXj/HtfmAXvupS9FtHss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XV/+6cLt; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47ee07570deso20787785e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 15:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769209223; x=1769814023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=As37iQpL3zu91gYcoRq3jQn9d3CPwOGsKIH2tX0HSIU=;
        b=XV/+6cLtgdVGFodHHYxVbqttKZKnI5G04f8eBtI602jEF1msQRdnxfNZVQ4zua9Ct5
         nsbszjMHsrl02nWlC2D2ZUBtGL0em/NOhf4bcywfkxl0F6b6xdvuE1lzKoprCUGAoXDC
         b5IWaQip6+JUNlCU787oH/x2j2YBQfe/jKF3YW7NQaAjZlNGOlAIn0L0691TkYKs8O+X
         WNRDTMe2hlbs8IjJ0xxjG+dS0xDamC+VDa4RlZD2r7X8f9hHPhanSmFaDX/44Psa5529
         3/ZRdXdmmXHBDasGevEtBaJ+7uJLvsQ1fI/XukOmp+IhGAGnipCo19VmxPWT64n5HcxI
         3kog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769209223; x=1769814023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=As37iQpL3zu91gYcoRq3jQn9d3CPwOGsKIH2tX0HSIU=;
        b=HrpsFvzny+KicDQGEYqoUhh75nIf1TttXHraUgK/tD5fI7gj72PMqz1chV4W1ckTSw
         g+2/K+M16XEKqtFJlgxHFlGTYyGLbQgCb6z1PIKLj3NJJHE40FP1FMqppwHcCR4PEIaG
         CQOAb3y/559FqVi9tmSWyzJUDcbatqElcKxLTfvj8uxToOs2WQ0YISBUQVKj7U/tlP2E
         5NmXvIGx2HVVQMLqXB/3xa8cwPqNTwsGSL+RS7raTWLupDuPzCUDQyblNCFF7zXYvTip
         pEdeyGh17oM5zJ885KxUaVsaInImKXnJfYXM9kfDJR581UG5n+yv7/gFx6FRRez7VNdn
         KclQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUcimR0lCRkyhthI128XCgJLOHWIp6OoNVCQVtJQVLmdMopvoWlGsvTB+Nh2wx7fqTMaczC/Wiiin6AD+zoAA0lQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6TFW6QT9SL81rL6TpN2RUaV6ciLvu9N1KRPGqWqlXfQZow12v
	6JiuzJ0Jekd3LPaE4QfCOMZzbHJnE5LapTMmY1McuaLyba1ibQLS+1ii
X-Gm-Gg: AZuq6aJFV3RDtFpYZ/9hi+C4nG5xi+xafIKDQn0e6PcP5i6uCMKlVI2QFVnn7F5kfR5
	lKlEDiGRTVP4uWoi3GKv/3Nw3TmBXvm33H8tx+NM4E1QYZ66wUwW9LkMPstUYjdHh+JwkESkNcJ
	0WpU5leYeJq9Ng9B99Vn9dtmcUse4cp2Ay7P3sSxy2rX38Dvx5MZkXw1RbFnYk16CyiYY34VwGU
	8laKwKquPiGjkR0UJWs8dpG932yPxArxfzXBQGfTkr6ldP/6NOVQ1zbVpRgTEJHkgLcXr2fxcw6
	AaMT5RqeFqK9lIU5EXjrEecdM853RnNjhJc50JDBE2XDYwrPOxWk+IWFdKuioxi1jtV8pf05AgQ
	UR0LfODrAOoBoVreDYblMaSEPn58A4MTSe7W+LVgy8lAzTPyew7VsmQw2O2PTJiY/amTKctNsZY
	GaKiGo/yGPYAeSIdU1Y7NxKP5kstooKB/FdgMpibZPSARosexogQXolOmx/PoJVL2cwcl+vG7Tc
	q2/vBczL8KRQdaczbOKGX1l
X-Received: by 2002:a05:600c:608a:b0:47a:814c:ee95 with SMTP id 5b1f17b1804b1-4804c959aa2mr72966345e9.12.1769209222655;
        Fri, 23 Jan 2026 15:00:22 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:bccf:b3b1:e288:4e83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470cc278sm157142665e9.12.2026.01.23.15.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 15:00:21 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/4] arm64: dts: renesas: Fix SD0 failures on RZ/{T2H, N2H} and RZ/V2H
Date: Fri, 23 Jan 2026 22:59:53 +0000
Message-ID: <20260123225957.1007089-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	TAGGED_FROM(0.00)[bounces-27367-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 60E7B7B52B
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

During testing of SD card functionality on RZ/{T2H, N2H} and RZ/V2H evk
boards, it was observed that the SD card initialization was failing for
UHS-I cards. While investigating the issue on RZ/G3L smarc board it was
found that 12ms ramp delay is required for SD0 power regulator to ensure
proper initialization of UHS-I cards. Similarly, while investigating the
SD0 initialization issue on RZ/{T2H, N2H} and RZ/V2H evk boards, it was
found that a ramp delay of 21ms is required for SD0 power regulator to
ensure proper initialization of UHS-I cards.

This patch series adds the required ramp delay for SD0 power regulator on
RZ/{T2H, N2H} and RZ/V2H evk boards. Additionally, it clarifies the SD0
power jumper settings in the respective dts files for RZ/{T2H, N2H} evk
boards.

Cheers,
Prabhakar

Lad Prabhakar (4):
  arm64: dts: renesas: rzt2h-n2h-evk: Add ramp delay for SD0 card
    regulator
  arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Clarify SD0 power jumpers
  arm64: dts: renesas: r9a09g087m44-rzn2h-evk: Clarify SD0 power jumper
    setup
  arm64: dts: renesas: rzv2-evk-cn15-sd: Add ramp delay for SD0
    regulator

 arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts | 9 ++++++---
 arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts | 6 ++++--
 arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi  | 1 +
 arch/arm64/boot/dts/renesas/rzv2-evk-cn15-sd.dtso      | 1 +
 4 files changed, 12 insertions(+), 5 deletions(-)

-- 
2.52.0


