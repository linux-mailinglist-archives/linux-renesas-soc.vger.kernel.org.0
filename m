Return-Path: <linux-renesas-soc+bounces-35110-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AePYAfniVGrfgQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35110-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:07:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A33874B47C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:07:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tuxon.dev header.s=google header.b=OUrRVOj4;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35110-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35110-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 54A0A301DD25
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 13:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A42414DE4;
	Mon, 13 Jul 2026 13:05:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2FB414DEB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 13:05:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947953; cv=none; b=NXVYFQtKQwvsjoC1pVLW7yawLoOLUeqeVwWUOoq4hb+uBoWjymPuCGjRbJ8ao5KBHEo2KL3UEgmqng1asosx6Wra8dFTkxZG19TG1DtJHmecsqt38wNW/yavDNtZDOFviH8nuN1uwctAIKdvckhTohAYvsD+0hAcrUCYjE81QJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947953; c=relaxed/simple;
	bh=p196QWUMYQjjTN37HyQupOqU34902zn0bWSKJh7c2SU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OyIsP7CDnCrEgMNSaLvHxFF5HP7f4o92vrpBMrTeUMYR2hDuQets3nlPsK/Qdf28M03UngMxwZwJX07RvcUOi11a8utAmkDKyNM8fAkumAI/tAchN+15fMJ9Dz9TRLhoFZrYO0ZtsAvOLuzlDwxWXzV8wBKYWgsPrphvZ1VUNkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OUrRVOj4; arc=none smtp.client-ip=209.85.221.47
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso1873775f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 06:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947949; x=1784552749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JqLCAjsIWRR//h7ecqS4cqAoQh9bNc2JNsvLanYeLME=;
        b=OUrRVOj4hnBsswZEGGzTHunm/InntZQEQC388ITIOd3aw0LoG1SaLT+gvQaaebezNo
         wJOHuXoUYUB1uMNya85sD23sP6J3XKrvOjbGWrmXBIq+Ie9tWpwm3aPDG2g7nZ1BtvZp
         rNGyce/eToF1bhASmwDjFq8pLfynK3fyeclPfyN8vLE3Z4XaXiOctn1BO2zeLDklYRS6
         +9rvNKs/KgJ3UBn9Hq9Sfb50oWzLRB2SixLIAePBmTLKO4CYjmn9z9Bg7aMnYYIQSSkM
         O804PPurUZtbrc4G547XC01BbG2cwAiaQYbATlJ5M+h9u5jnz5FvKF8ikLFbT//XVLl8
         LWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947949; x=1784552749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JqLCAjsIWRR//h7ecqS4cqAoQh9bNc2JNsvLanYeLME=;
        b=WsgnGBc1S8TsVOylsnzEM+PZTpE+lk8GWWVjoDjXLfBvfK/QSzATYfEvit/3lco2bV
         vr8J3caxkXtfiRf1za8DYq2oUjspk8lrbu24adHd+LIUf2v32OZwney6mMA286+UNWqd
         SefohVPH+2Iqa3w+r0VBTYv6y3H8I5BC+txyteA4hEzJNfMomjSUwSoCa8iKtgcrrafD
         3jSCbQbyeN7pptYf3hxPHZgC4Wcdlj9Ba77nhDTe3dLS+19QUhHvwHsTDLb1+7xyjRBE
         VhXPC8EJV2MUGGKPmd43oLvIZ92GPlB0uoD6VxpzCyPArTC5347NDMJlROly3uDpXfsU
         a/ig==
X-Forwarded-Encrypted: i=1; AHgh+Rp0b/0Me2YjMZE0WRBFARRhkC0SJdbtqybYCHlq0yoaIKBxoH1sGQtIAV3m2aWK/u8MjMCdYxddZDDv2dYJQtbPsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQSnEz25mDASkNsuym3Gw8ss0daWmuE2L7cWD3SlmnyCkeksgR
	xYKJxX0RlD0j0LMyGtZcep/X21fkefKn7nOQvaLw3FaO7MMosHCMZqCXF1UDW1odAh0=
X-Gm-Gg: AfdE7ckjr3KrbDZJ0aji+rKaxNzrGzzUY+rsTYCR8Hbk680q1wBEwPwPnr/2uznTpIU
	NbOaMgMbw24kLPcPWuItgzgej4yzgtm5lZ+hHf1cBCGl13k+s5adgNknWndlLUii9ml5iUkzNbI
	UhZHZ1cLUcr9aZFfCb/wKEqnxXlKmMBeJhUDMfr0EAZzMvSq1mCbRIa+1jZ5KVJs6NXyWCRZTOw
	dmlu1pedA4DTo8+O0MYj1KwScHQMioNiMvOc8x63W0FiVtwi13aNYbnH8K5G30QMiNFO7raiBLI
	4EFXOoEQe+eVLaLTMWvyjqNRM6BfjvUU3UuC+XO/OJ09Mk7j7WxT5EARsWWzUYyq9/bDYWLeRLd
	JZ0bGqVxATHEykxXgXAZ3wmqu9VC1waksk4tMqzBm4K7ZdGeb/jLSF7mlOhNk+ME7bAJiCieOSo
	YUqGDh79RLSFAudSWuiIUJgYJxSNLoID1qZ8qE47lnSqYAYYa2BBRZ3Y8DtnGX9BK8TU8VwcI=
X-Received: by 2002:a5d:588b:0:b0:474:4525:eb32 with SMTP id ffacd0b85a97d-47f2dc7d451mr10839033f8f.11.1783947949241;
        Mon, 13 Jul 2026 06:05:49 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:05:48 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
To: wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 00/17] i3c: renesas: Suspend to RAM with power loss and runtime PM
Date: Mon, 13 Jul 2026 16:05:28 +0300
Message-ID: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-35110-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:tommaso.merciai.xr@bp.renesas.com,m:alexandre.belloni@bootlin.com,m:Frank.Li@nxp.com,m:p.zabel@pengutronix.de,m:claudiu.beznea@tuxon.dev,m:linux-i3c@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[tuxon.dev];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,tuxon.dev:from_mime,tuxon.dev:dkim,tuxon.dev:mid,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A33874B47C

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

This series adjusts the suspend to RAM code to handle cases where power
to the connected devices is lost during suspend to RAM. The fixes
included in this series are required for that support.

Along with suspend to RAM support, runtime PM support is also added.
Cleanup patches were included to prepare for clean runtime PM support.

Thank you,
Claudiu

Changes in v5:
- in patch 1 introduced renesas_i3c_irqs_mask_and_clear_locked()
  similar to what was present in v4 in patch
  "i3c: renesas: Add runtime PM support" but without locking; use the
  same function to mask all the interrupts and cleanup the status
  flag in case interrupts are triggered after the transfer completion
  timed out
- introduce patch "i3c: renesas: Fix out-of-bounds access for newdevs mask"
  to avoid failures when there are no I3C devices connected on the
  bus at probe
- patch "i3c: renesas: Perform Dynamic Address Assignment on resume"
  was restored to the v1 variant; kept it simple to fix the
  suspend/resume for the moment

Changes in v4:
- dropped patch "i3c: renesas: Do not attach devices if xfer failed"
- fixed the swap in renesas_i3c_group_devs_in_slots() for i3c->addr[]
  renesas_i3c_irqs_mask_and_clear();
- in patch 16/16 renamed renesas_i3c_abort_xfer() from v3 to
	
Changes in v3:
- re-based on top of series [1] to be able to use
  i3c_master_reattach_i3c_dev_locked()
- used i3c_master_reattach_i3c_dev_locked() on patch
  "i3c: renesas: Perform Dynamic Address Assignment on resume" along with
  grouping the I2C and I3C devices in the driver slot
- collected tags

Changes in v2:
- dropped patch "i3c: renesas: Use the divider 128"
- adjusted the patches title and description where requested in the
  review process
- adjusted the DAA procedure after resume to still properly re-configure
  the controller in case the bus was full before a suspend
- added patch "i3c: renesas: Do not attach devices if xfer failed"
- collected tags

Claudiu Beznea (17):
  i3c: renesas: Check that the transfer is valid before accessing it
  i3c: renesas: Restore STDBR and EXTBR registers on resume
  i3c: renesas: Follow the reset deassert order used in probe
  i3c: renesas: Reconfigure the DATBAS register on re-attach
  i3c: renesas: Reset the controller on resume
  i3c: renesas: Perform Dynamic Address Assignment on resume
  i3c: renesas: Clean DATBAS register on detach
  i3c: renesas: Fix out-of-bounds access for newdevs mask
  i3c: renesas: Use reset_control_bulk_{assert, deassert}()
  i3c: renesas: Return immediately if there is no transfer
  i3c: renesas: Follow a unified pattern for transfer and command
    initialization
  i3c: renesas: Drop the explicit memset() call
  i3c: renesas: Update HW registers after SW computations are done
  i3c: renesas: Organize structures to avoid unnecessary padding
  i3c: renesas: Use the "dev_name:irq_name" format for the interrupt
    name
  i3c: renesas: Drop unnecessary tab
  i3c: renesas: Add runtime PM support

 drivers/i3c/master/renesas-i3c.c | 375 +++++++++++++++++++++----------
 1 file changed, 261 insertions(+), 114 deletions(-)

-- 
2.43.0


