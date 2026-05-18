Return-Path: <linux-renesas-soc+bounces-32750-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCjXCz7MCmqf8AQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32750-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 10:22:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6F05689D0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 10:22:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 291AE3006D79
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 08:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A339D3E00BF;
	Mon, 18 May 2026 08:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UB/gTJ+q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9C53B7B79
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 08:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779092021; cv=none; b=Z5MMn6cqTPsNtrqR/XbHjwY3VckmNmesJubb2s+jCLaG8WyX3Oo/dUhkgJ+x28PyoCpN7vNXanpvn5xcj9CitqWHkszdUPAMmyId65QlZe9qAQDN52lWz/bQMKeeAGTKUYifBCUl7vzGqEJN80E0ydZYAnSm2NLhJ6Zzf0FUcNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779092021; c=relaxed/simple;
	bh=ClBw+PZ0ldyBl2hwKSuBlN4jYbjU8Fs7MP5m0kjjRDI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uOGKzDfUiuxBK9QQmTKD6lLkgiU7E5JRZ/ka4rBYRl8Mfx6eKJQ0Eklaah3KtRvVXdGTppNoGyIOxVbJ4JHFPz7eIWkomG5vECZKeCsnWNC8fyMWhPxxn0b93vY9BgM20NmkcdT1SqLZ5AyJHLITiDTI/nCKHLB0F/dJUVU/gZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UB/gTJ+q; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c70c112cb61so1599727a12.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 01:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779092020; x=1779696820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TtmjcFudJHdbwgaOw1dq0xgX0ESp0DVFqApr/5XXiuc=;
        b=UB/gTJ+qtpymcwIrKFxteLaC2npQPfELcM08XPDrgjFokxkI+j67qChYaEx6R2Pu50
         BX9DhfOSmD6kDafoZhigd0/wKK8AnozP2ir68ujPw49T7438qLYFitmiPVfaUz1DDVgX
         8nKWy1OydrIT483TJscvg+mXyqpIc4ozmz6uRmhy8tcDrvJB+3drYhnalhDgMCgJPuQj
         iQrAuM2hVuGavNpsn5C40enF1mGXyyKh5r0dRpjcGREcC8i+jltnJMwfS8nt3gDQA4jb
         GPfB0AINBAhvd4Aj2OL9/Hmq1Lr0PtCZgY8uqkEOrua0vGl9zsRGILkudz9KQxVZ7ezo
         8tJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779092020; x=1779696820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtmjcFudJHdbwgaOw1dq0xgX0ESp0DVFqApr/5XXiuc=;
        b=h1ljKZjYnrXhgSUWaUg8K/mxbQm/1s8SxEBePd80xPJTlJ7uo2X3vEIjb4Zm3btttd
         BKRAISrzwIncaXNtFD0R1Ma8cpLLyPQVRQdwpcXIlJhy2j4d95NgdUQDCB4FlJCtyLbQ
         saGRRO50/VNQPJJWeWakQgbiQdSRTUVq7wMIZ5d51j2TbP2YUGRuRHGdgnqyOBoSLG0i
         hQgY7WxWn1WcL4CPOrjjvqzSAaaU1SCiA+MCaSb5q7vQJJvG9KCzhsnTjL3kDkteLS/5
         UUIaLoJCFlpNA16CVQrBV2rcNgJQIJWz/vcWfwsIHkU/FVpBpVkQYWIAvX0oAk3VEIob
         oUgw==
X-Forwarded-Encrypted: i=1; AFNElJ8p3u31uUsdHQd7e8tL8WDjyxhA54jVdAKMyl59LC8GvE9GvhoSl0XNvoHvPEqaRdqbA/Yzo+ZsUmJq6/ExZMS23w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo8BtuBuidDE0boI7+E0+a5aretGAKxTZZxt7k2pj22SC22vzT
	TstWAOhK+o8ev1x622V++QpTlYXHtgHG646DmvZJHBQAoJRhsHWxeh33
X-Gm-Gg: Acq92OGQ03QoYBYysYoIll2aCU8uNvdSePKbmoIAMd2L3NqbH68gwm7gf3Fj5OkoGk7
	N3w8fwV2BJVA7OHV1D5pkV7cn5MVNEi8iiCZ9Dk+oyMQO5xTIqo1DuGg6CVYFx9sKbnEIPybA1V
	pwa5C5TaRkz/Ex/fJSs17oCUq22Ox4ezDv6m14SMiGv/E1l895koKl5jgCQoiJrLLfFr38aXnVa
	IPEqBESoflaK16kq3qB6bI45GaiP0GTR82mIHv+Zn8xgr37cinFjC+w9XqM3J2Qqstjz7Uyj1j7
	2HY4CCv4CSWFYtOES3FQ4TDH2BS111nZ0VDEEjbJ7YEON1Zh0T00AIVyk1es4B8kOiNruyXqZI6
	Hcv9SlYO/FauGVBR+AJVfbqbb28W6qnX2W+NEGaEvLGAesEgC8Kn2zR/vs2/vqOsFLJApJlEEp0
	Vx3dU+Xg6lC7WEUMEveHMzGyR1eocundcyxgjqaJ368yKuW0Ka9auWGXdgoihJ2EYZ2bL36zF7b
	j7zzfGRLOIA+c5H3fMXRPOm
X-Received: by 2002:a05:6a20:7294:b0:398:9d5f:e093 with SMTP id adf61e73a8af0-3b22e75954bmr15671941637.19.1779092019769;
        Mon, 18 May 2026 01:13:39 -0700 (PDT)
Received: from open.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb100706sm12749462a12.17.2026.05.18.01.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 01:13:39 -0700 (PDT)
From: Neil Cheng <neilcheng0417@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Neil Cheng <neilcheng0417@gmail.com>
Subject: [PATCH 0/2] Add Meta Rainiera6 BMC support
Date: Mon, 18 May 2026 16:13:23 +0800
Message-Id: <cover.1779088499.git.neilcheng0417@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2F6F05689D0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.ozlabs.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-32750-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,jms.id.au,codeconstruct.com.au,glider.be,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neilcheng0417@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add initial device tree support for the Meta Rainiera6 platform.

This series adds:
- Meta Rainiera6 compatible entry
- Rainiera6 BMC DTS

The DTS has been validated with:
- make dtbs
- make dt_binding_check
- make CHECK_DTBS=y

Neil Cheng (2):
  dt-bindings: arm: aspeed: Add Meta Rainiera6 board
  ARM: dts: aspeed: rainiera6: Add Meta Rainiera6 BMC

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-facebook-rainiera6.dts  | 1012 +++++++++++++++++
 3 files changed, 1014 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dts

-- 
2.25.1


