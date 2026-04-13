Return-Path: <linux-renesas-soc+bounces-31244-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EkNEzY13Wl9agkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31244-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 20:25:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C93563F1F9A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 20:25:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C2BA303098A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 18:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E40936073E;
	Mon, 13 Apr 2026 18:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4EDElcR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3A135BDDC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 18:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776104709; cv=none; b=pTS+teAhPbK6ykyHZMR9xm7n9hxLSmGIGRLeuLQ0CDvLdr6QKWJlXkH6rSWvd6G+fghf5aiWW8SsDer37tybBc+9j4ekWujeR5T0Hvx1UnuEi8pJI6LhSu0CHH4apjih3CIhElQbWPHtXdpPa3xap5v7GRqx+tLTYJiRhwEDB64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776104709; c=relaxed/simple;
	bh=1O3P9uAmh1fmqGR3+o2H3nKp9pPvyNNnodCkQGOTg3U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cks1MThouuoUK+RMMrKJTnDhGS/i/bqKtr/XYnnc+CBLg8f+ONl5sNHgHDnCR+5SHrgHErEphX8MBZlGiT89YVXkZcTPHuP5MvGI4pEKHdKB9vVft705WkHdbp1DJvsfcQBk6CxqEiGiwC5vjxQAUxTIglk38mlBFMlddjWemao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4EDElcR; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488afb0427eso59243955e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 11:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776104706; x=1776709506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v/sbVWUBqo6dyulLhzj4y8bSGCYgaLaAODnsQiIDy+o=;
        b=Y4EDElcRd4aaevR3655If4/KBO48TXBCsVwcRLr7voLYmRGQcnxagdQXT3vd3j4KKI
         K8KGyqXp267GbHmGNe6fg797vVULfRWyrOlaSzlkFvpForM6UjjVATCKRPmWXP5dHG/3
         W1gUkMN5IOfS0bsrR6xPd5RW1qGwgxBctsRXJqQzZxGJpWmeTzv8Gs4ZEIPIHbArWaZa
         /O7JypEtSnfLU7r2K+SbD4sUX2LOVFQ9xIOsUGo1RNR+3XSV9G0zKWjBLfGFqq3DCOB6
         Y92wbkwhP7Y4QUc/UkNyygXt4cNAFcrhR/CyX97EAZN1BDQZwuhOJv2pH6EZJUo70GXQ
         pLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776104706; x=1776709506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/sbVWUBqo6dyulLhzj4y8bSGCYgaLaAODnsQiIDy+o=;
        b=GKH0c7Cs6lqPkakbyqqx5Bkd5G5wHRJrvGnCo5uG766gC1Y7BxQhF+5wxpcCXBzBlA
         wCah4aYw5aHA2gr0513AUKn5SRIcMqZLDZtUrR9DCJHXQNAvpdWWgpne809bTO6JCq7R
         M7RgUTUtaFJFdf0W2HJ7EjgxQK3xaCxd1kwm5AfnGOrsPlOS9TNQWTpLGjh2VL6B3qy/
         xSvI92V/vBPwieNkUIo7ss7KMyyu+poIZQSZEEu2C+nxpZjXz/kSjGuNkxWcQ01UK4ne
         s7Xpisx9dlzM6G6Ws9j80hbFZR32mhEcoboGQmZ8oMhyw7VZx5dsxz/ZN24ucWvBHSLF
         5w+A==
X-Gm-Message-State: AOJu0YwllvF+iyjGPq5HoME2CesqtDkTnwSobGZ6yOn93fziCRS3EUwO
	LKFhdkvWxLpe3ZHnBhHNGYG7QzU7fmBp7GYiZPnPYR3yD+aCZD4LJrTc
X-Gm-Gg: AeBDiesDTYIRlkD1+b5JoTK1T0yblNJInlkOj/hiDuOXXvlz4VWVMY80q0z7oObpZRj
	5SBQBzCGiVB77zbhzK8PFA1fXRBKdoVoApCgT2Xf+kW5S1xtwE2wvBYkKyC3Sw4dtnMLiNBnGIG
	w/p4CwFYK4Y+Jn+Oh/ZwVy+Y352DsmhXAPKBthrdGlfclGo5qMZo7TZyrbf92IP5IYsckxl5F3M
	h3RURLOW0WIsTQCg6qCJ6Nc11Zrb4vQ6VmkbvAlDwpumpbc8uN/R007GY6NC9u8xBjjiq5e90RS
	sGAHP6hQRXp1ymCLnsS+5r0xazwoU2j3a1LxLtYdOb/Xw5VeiudwbpXvBFi6TYyHeDBzQFOZ5pF
	/GDGipRewXMjPPeZDSk1OnYsbgHFZujYNLVN0D20nRggsKv0WcaTEtJV9EoStVn2u1FvibmMk5Z
	KYtOOu2NUBy9ePiXEg98dzC06x1LQxKedSelfauM0JRlhn3ZJbo4kNJNzn4nq4+6oLO8m6IP7/m
	x0FoKYwZpyq6kuALQ5+ARhDBBOPFwgr5AbNoe6nGWijCVY=
X-Received: by 2002:a05:600c:c117:b0:487:4eb:d125 with SMTP id 5b1f17b1804b1-488d67e370bmr135180195e9.9.1776104706057;
        Mon, 13 Apr 2026 11:25:06 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:8060:3087:2ea2:f494])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5b56d1asm301175695e9.15.2026.04.13.11.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 11:25:05 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/5] pinctrl: renesas: rzg2l: Fix PM register caching
Date: Mon, 13 Apr 2026 19:24:50 +0100
Message-ID: <20260413182456.811543-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31244-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: C93563F1F9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series addresses several issues with the PM register caching
implementation in the Renesas RZ/G2L pinctrl driver. The changes include:
- Fixing SMT register caching to account for the split SMT registers on
  RZ/V2H(P).
- Adding caching for the SR (Slew Rate) registers during PM suspend/resume.
- Handling the IOLH configuration for RZ/V2H(P) in the PM cache setup.
- Adding caching for the NOD (N-ch Open Drain) registers during PM
  suspend/resume.
- Ensuring that PUPD registers for dedicated pins on RZ/V2H(P) are included
  in the PM cache.

v1->v2:
- Patches 1, 3, 4, and 5 are new.
- Patch 2 has been updated to include a dedicated cache for SR registers
  as pointed by sashiko.dev.

Cheers,
Prabhakar

Lad Prabhakar (5):
  pinctrl: renesas: rzg2l: Fix SMT register cache handling
  pinctrl: renesas: rzg2l: Add SR register cache for PM suspend/resume
  pinctrl: renesas: rzg2l: Handle RZ/V2H(P) IOLH configuration in PM
    cache
  pinctrl: renesas: rzg2l: Add NOD register cache for PM suspend/resume
  pinctrl: renesas: rzg2l: Handle PUPD for RZ/V2H(P) dedicated pins in
    PM

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 113 +++++++++++++++++++++---
 1 file changed, 102 insertions(+), 11 deletions(-)

-- 
2.53.0


