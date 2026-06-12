Return-Path: <linux-renesas-soc+bounces-33931-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3B/0KA0ZLGp0LQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33931-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 16:34:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 303BD67A3B0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 16:34:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=VXMvSqVo;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33931-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33931-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A71BE323078F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 14:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681D1392828;
	Fri, 12 Jun 2026 14:30:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DE238C401
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 14:30:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781274659; cv=none; b=i+klfNqlQbVH2cqymGOi4V1CPY36sG53eOWa4vUwp5k2N6Lj4bqA+PjF2WL0gqWVaJ5lA2ZTjSe3vdR26juSHA/iRSjh7GyY1KG6Z6iXtvFSPDEzMULw4DBlAJWwSo87jTObnk8hsuZ0NVVv+KrEzLzU3dAz5bEmyGD8qJPcYAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781274659; c=relaxed/simple;
	bh=9u0qkt10mcZ4gqTOzg+71Mww3TgstlmH/HToUutPjwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GVeVjVsd2+qy9UBNbQGYFJyXTzG4zovxyluXlAjJoD4UEq3G+1RJBbXeL6jUso6vkQGuJLoyKg7mAV8NWDvF4t8wYiA+rvZwitAO150syTjDb0dft3zROTXm4vYz+9r16W4YGD6dDmhiNcuY5OWFV8B1Z3kuV64wturhC54f/Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXMvSqVo; arc=none smtp.client-ip=209.85.221.44
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so799234f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 07:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781274656; x=1781879456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0q6swqpmj1gdmjuEahHAszzsDYa5aqXIYuOcaTUhixU=;
        b=VXMvSqVoSmju82sp6xwOb1NHISITsHxaOFxF6wsVwo8haeyViZy4BH+FlN8ekBF6AF
         7H7x8lqcqxqxAp7Q1lkqnGE735kdRxdfHSn/cHxb1Jes/uUfppbvDucsMIWPjJSF6bsl
         Y4+y/yyg+zCwVhrMewIKK7sSc4ZJKRyr8OSiRI5fu5sxyNj7abyPT+6EsSCy90JWyK7c
         EpwYnuCIVQzdp4aXS9vi9+hY4eoXpvB0v/Px6EbzDaFvsDUkv5RWGPVMudUjKzuuUs5B
         +4iaq0D0ZGdv4JToVTWJGibn1LDMEWsSw6dbn6k/GMCihRKaB0bJbUPl5fUR6JVt2/WF
         vQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274656; x=1781879456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0q6swqpmj1gdmjuEahHAszzsDYa5aqXIYuOcaTUhixU=;
        b=ZFXHemGLToedfnXQY0s9oFVbrggK4Lz7IELoFLeN4wKnV/xOw0WTwUTkuXMdF6DjAO
         O3jZra3Z5mrD9fUHQPOZPwZEzWZoizkK5EqlOeZEBDAUs1lm1JkCugtHjJVaKpUSEE/b
         d4r93cHBcu2S2G1r5WCq9AkEXdDYmNF7CTf0TFHHaypuS712PrkSP3QvdWasGbiErIr1
         M49xvAVOCR2lC5FwL+cVtzheIVA1+wD+uasxPnT4d8YeNEdh7tF6L/197mwkD/2sgR+l
         l9AJXopZepAGjmsGaQEpv2+eKYMdqIUO2Ck1zZyzX8Xu2IiSyJ1KNcQFME90H3BguHbO
         5+sg==
X-Forwarded-Encrypted: i=1; AFNElJ/9Swy9eIUIC6tOt2vJ4/Ril+YLnHtNM0MHBX1BIhruCbQ9sZJowSQSlzwCltIxnwofdjU8gl6hEpDuBV92zimUTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXMxAQ3DnVtHAt5163j1s8eXFRx3eczcjICgtA6Cy2CSshmM1m
	rcK2v0WxW7USjbzhPK2vUDS9o/KesQNFsFDSHEOv7Q3Ps5OWHFss7dfnz89/vQ==
X-Gm-Gg: Acq92OGezTzjb1DIp46y12a03KwJjWmGQu7ZlBILJ+w/EVH1ur50AKGHXwx81JhlxFm
	fvVGgHZZyc9afejwDLzQ8lzoMgDkk37mWEWis8cJtWgd1kuF6HWFBSyOn4LakrTJ/TiQ1Qoqv1F
	laSIEzDNxLHZCJxxOsYeMZ011KQ1qUWFN3BbrEKdm05IvRmb46oY4GurkjMn/v7qpNr3Z2I4pUY
	yctHEMQlv+wAciMiZ3CNNcQ372PQQrdR4eDsJHuPRMXL2CKMtcSaV2sYVC3n7EsVv55FsCXbUp0
	HWMwAs7MEOaoOuFN/QaM32+Gk9Kx3CUKyB0Ngj3CkOsErSk8FYoj5geJhgDeJf12DaV+/qSJCQj
	tu+3BqAs+UvFl4yAxiv7/kguVyWm8E3oQRTEmeugR6QkYwHJJF/mO//QmSh8LExlkP5DJ54Gnv4
	EYUCv9Sky8RsIVlJ+aAWEmfxqP6lbxjrChFWV3riqdsSKuYCbw
X-Received: by 2002:a05:6000:43c5:20b0:460:e2e:6e25 with SMTP id ffacd0b85a97d-4606db9a6d4mr3898635f8f.21.1781274656357;
        Fri, 12 Jun 2026 07:30:56 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:c72c:50c4:8b28:9a3a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c3782sm5850016f8f.25.2026.06.12.07.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:30:56 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 05/11] reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
Date: Fri, 12 Jun 2026 15:30:33 +0100
Message-ID: <20260612143048.317907-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
References: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[renesas.com:server fail,tor.lore.kernel.org:server fail,bp.renesas.com:server fail,vger.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-33931-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:p.zabel@pengutronix.de,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_TO(0.00)[pengutronix.de,glider.be,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 303BD67A3B0

From: Biju Das <biju.das.jz@bp.renesas.com>

Add the renesas,r9a08g046-usbphy-ctrl compatible string to the OF match
table for the RZ/G3L (r9a08g046) SoC, using a dedicated rzg3l_info
struct with pwr_rdy set, similar to RZ/G3S. The RZ/G3L SoC has 2 OTG
controllers compared to one on RZ/G3S, so it uses a separate
rzg3l-usb-vbus-regulator driver to handle the additional VBUSEN control
for port 2.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index 1c4c8aae0e80..734255258b69 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -120,9 +120,15 @@ static const struct rzg2l_usbphy_ctrl_info rzg3s_info = {
 	.pwrrdy = true,
 };
 
+static const struct rzg2l_usbphy_ctrl_info rzg3l_info = {
+	.regulator_driver_name = "rzg3l-usb-vbus-regulator",
+	.pwrrdy = true,
+};
+
 static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] = {
 	{ .compatible = "renesas,rzg2l-usbphy-ctrl", .data = &rzg2l_info },
 	{ .compatible = "renesas,r9a08g045-usbphy-ctrl", .data = &rzg3s_info },
+	{ .compatible = "renesas,r9a08g046-usbphy-ctrl", .data = &rzg3l_info },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_usbphy_ctrl_match_table);
-- 
2.43.0


