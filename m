Return-Path: <linux-renesas-soc+bounces-30584-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKczMtR5ymnk9AUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30584-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 15:25:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EF135BE75
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 15:25:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 32D543008D37
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 13:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA0B3D523B;
	Mon, 30 Mar 2026 13:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2eHvAuY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB223D3480
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 13:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774877036; cv=none; b=rB6p7pqkBVnPK1DMdmLXu4Z4g3wbSs+PEonj2flzwbMrOsWdrIxunEH9d/7stOzDw9qBIWbAvhNYzt54gOAvdWHZ/KPbLl4rSzRkuAL0tY8OPUlL/yiKhuKPzmxAbj8EnbTyxU8ojsW6W9AhNNjPFuh2oYMaMywI9M0qb1vl0LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774877036; c=relaxed/simple;
	bh=/vArxv8Iu1hIiC0JFEUFIvov3OvtxfueqgaiTFlSbWI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=it9I/uz8Jxjzk6P55xwqyKPMz/75sn2cCRcP3fvEvTTyr0xviXeRNio6XUXsPxU3I2ZV1+1CR9jiMulTPtKIDKXcGI+Fdnzv2sIJ1jdpogvg3AByiaZlZDPzjpbA2p0Lrhxy/TaEzzLSgwijuB+cHep0cl+qBo76ctjt7O3sy8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R2eHvAuY; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43cf5d14d6eso1402299f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 06:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774877032; x=1775481832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E2V6slcMaf2PvdRJBKeuviXzRYISWoLZtYB3+x33gQ8=;
        b=R2eHvAuYcmBU5U4UOeKl2alfww9smTc9xp+jtcarD/ToXz9ReefSo2rOSlVev9tTbS
         qFasKLzPakCQcoxeqYH5EUs93TkxIzl7WaISxORN1EfQpALwegPPk07MCuv0Uo9An+6Z
         iEbyZupiL2TQUHk3WuF1dKsyO+eyMQ+9mYfk5GvYztcdo9qJvgG8mrD2D1Y/hJf8PkbK
         A5xF/64ZcUZUP/7fPVXyEkwV2sURvd0eipWEgxsdAAssZfjnIUVwgw9dy6pBYorVCGLk
         S6DanqJiWCceE8+1FK2Lwq3lWHZqeALLB8yT7E4W6CEMjFkxBMXrSJAQJeyfQGEpv0Ca
         Rxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774877032; x=1775481832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2V6slcMaf2PvdRJBKeuviXzRYISWoLZtYB3+x33gQ8=;
        b=RmZV1UL7G5Jauo0dO4MVsT1irXV6FN1Dsjm2KYwpd41GvQCZhdx/c1CEG7QR4Nubav
         K32HK3Fuzj1kAxhkbQz/6Fl02QL8O1+jYA3gkrEGzM+aacEgFcWxfDY+le5Cnio0E4nw
         7YAMhZpYZg1hZ0fYD0NS6ui+OfQTaW94JUwsUavTgsRtaqePpobpbVzVP+xdoBi8FoCa
         JvWaZfyeC78u1sTTi03jYwpSPpQbF7SInoFRHR5FOt8bsgpx0imsIqANCRtuQZZtCblK
         kmr4gotqFNpZG30a/Ep1GW3sV6aJGF5oYHaLfQZMJdUC3zoShfEh02jsS+0FUynBxl4a
         Xblg==
X-Forwarded-Encrypted: i=1; AJvYcCXH8BZBCBCvh5L8JDzWaLlD2VyEpJ2TPoEiPMSlvSMfIqGO+bcx24G2kBPloklMQpYl8VdG14UezaW1BpucOihm/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ0u9ZxKqnuMf9H5CYuY1MWmAKxpyGp2KSVrlsmDi84t6VzYm2
	W4Ng5WEjv4B4WEvmsIZ9p7alBvKbOeo6TC9I13v8f1H1A+5T5HmZRBZxBmRifg==
X-Gm-Gg: ATEYQzxlQzwIOPearT3Ok7US4bFtRSkopHh9x2lpNS/CEdcoufLgx7CjWpWJ3RAJ/08
	+dOpqFn2nYlo5NK5qTV+RPGlyaGSGOAweTYs5qrJoWocpKpBSar0ZX5PMGg6bPIhbAtfGWc2KKw
	T8NehX3x+lhPWF1Btlb8q5XzLHJCj3yLctUr/QVbV3Vea7hbhrQxG2RL0rDWPL3vSSwTwAaaihX
	rrRhsvGIRiFO8X1sqO/Vt1rYYX7cX2SX3y5y35VnhvovQHUGSNndnkllsn9rmLJWxJRlyyEivyf
	rpT3X5DnSFkqYrkMHYLK5p1BXdYUTVg0t+0HDRdQiVfKy7xqboi9jVxr9YyElxhBPxE7eNLoHr1
	SUAVrALdek4OqU8oOKI7y5V5HwlmJ2Dw3H3LqFbh6IomVjStxAlP0CeCuVnC8pe726jz4TlNIMy
	HZnxAjwj4VI/B26undBV29TW0esJgHJA==
X-Received: by 2002:a05:6000:290b:b0:43c:f976:b8de with SMTP id ffacd0b85a97d-43cf976b9famr9542201f8f.20.1774877031672;
        Mon, 30 Mar 2026 06:23:51 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:e60:2c8a:54bb:d692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e2628sm20825906f8f.6.2026.03.30.06.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 06:23:51 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/5] clk: renesas: r9a08g046: Add {GPIO,CA55,WDT,SCIF,I2C} clk/resets
Date: Mon, 30 Mar 2026 14:23:37 +0100
Message-ID: <20260330132349.149391-1-biju.das.jz@bp.renesas.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-30584-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D0EF135BE75
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,

This patch series adds support for {GPIO,CA55,WDT,SCIF,I2C} clk/resets for
RZ/G3L SoC.

This patch series is depend upon [1]
[1] https://lore.kernel.org/all/20260326110648.29389-1-biju.das.jz@bp.renesas.com/

Biju Das (5):
  clk: renesas: r9a08g046: Add GPIO clocks/resets
  clk: renesas: r9a08g046: Add CA55 core clocks
  clk: renesas: r9a08g046: Add WDT clocks/reset
  clk: renesas: r9a08g046: Add SCIF{1..5} clocks/reset
  clk: renesas: r9a08g046: Add I2C clocks/reset

 drivers/clk/renesas/r9a08g046-cpg.c | 69 +++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

-- 
2.43.0


