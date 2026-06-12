Return-Path: <linux-renesas-soc+bounces-33935-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nFzGFakYLGpOLQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33935-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 16:33:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5444267A346
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 16:33:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=SbdMcVWj;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33935-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33935-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0D4CD3016B2B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 14:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACEF93D5247;
	Fri, 12 Jun 2026 14:31:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DE63BB117
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 14:31:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781274663; cv=none; b=lXEeZsJH9qJto6aWkovGGJsIKVvJnLwTQIUbj/xGGnIEc+bEpySfSkR5SwafbNd4cD5owSbX4uq0KQfSoBD76Sbgk/y8fxuKQPdWuIA3soH80ZGhQnB087HQvpBQpx50LZKXvw76siGDMd/RENq1XsqYJ0cRjhH+7rpBBFshMzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781274663; c=relaxed/simple;
	bh=72eGwrRmAN9yFzSvXWaIpYv0xF7W3qLJnLdq9nhGBns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PxENJBCzr0m0t12bmZ0yM9RnRwuhXMjDMos15qO/VQ2HXl9K/peGrXE/3/aNlji4Btz3OqGsrV9r949d/Ym25aLnYC3jm3YDRZWqy+/nXB0ztNNDTLCk2SOjgEOqliw0dzvIWWHltZxCiY6i4RPf86oyMpqNG8tNp2LcVN2Gek0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SbdMcVWj; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso9015305e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 07:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781274661; x=1781879461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cMdyexsnk9vzJ+WoVc+Ut0/kOTtTWH91CWtJGBzMv6s=;
        b=SbdMcVWj9+kZDcA2sOE9uTk7WbG8aF1dApHrQpecw4vjWwdEXJEoTaLpOZTFJwOCRm
         MahmipgW8cWSlf1zmqP0DiBKj67dmb++Ys8OYLTn73p6f+/pxsL/i7D0a9hUu/zAid8m
         nk9Pm531un3pW0t1Y3T51JNJ9JgswiEVvYtKOV4Jz3WRtuAaJqMVQJFqmTUtW+hNkmFZ
         7he9V/FgMBWJOi7v8mDVWu2fmHt/BTLLDuQkFieQqzNur5IzRHWy4CYHcsUsQZ/jC5lJ
         ECZro3F0fjmTCP9UOt375FoXaoqO53Rhp17sjLm8ta/jTFs/W075THMtbpAzo5EK3xEx
         /RmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274661; x=1781879461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cMdyexsnk9vzJ+WoVc+Ut0/kOTtTWH91CWtJGBzMv6s=;
        b=qkExAP+5uPcu2tiC3qY1AabSrG7xbvmbhU54D+0o/klKr5wtMxKEyhcH3GLNeEIehT
         YLXJjvmn+LdmxJhnzxjNgDR1l3HjpnkK4v7/cAz+bzKiRgPhH5Lzp09iWZZ5ACSisCxK
         EQSpnuw6RiSbOaxhtu1w8of+C0GqBk0p/tq6+Vs35nkT7NlibVoW+tVPhADhc1b9bd/X
         0SivSm5FL1A9TicZL/LjQ1YUCIT1EA9OR5hwZPi2iDMHjwvguS4Nd68omyMf9Yljo9XM
         nzy02B8RCVzn7V7bBAAY4Nyxz0cXDFvuSRaRIlbF3pOB0xz/OMZ57iqWkJGXQ9a6iZN1
         ppIg==
X-Forwarded-Encrypted: i=1; AFNElJ/UEO+Lq0uQparsnWb3ehKAC0wnCxo9XdWeBKXvynI3ccHSWSeGKXsN367ShH/NtjFYC5Pp/QLlrrbSSrbGSTZ43g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAnHhgjzn6ZY+wHqc2gWM3nv374IQdecTs3qdVNr6hjkxngK52
	BPMPeIy9F+fK3GCA1b/pU9k24rARhRcnMZZOeK/MJpwlrn+5qyC5VR60
X-Gm-Gg: Acq92OErObQf+Oe2bbhQMBVTB0zEo4SDoQ+IXpsLZ2G/lKxFZuOtDm/H3oc3uuK4AZ3
	fbzKEi3RtnDY9iGaz5QqdXjT2utcbUSMsrqDKaWrnBYlErwro174eSoaMBgsOBVAVSneuZMAgXV
	gizJTr/cr772xDCZu9kRvX287WatrOTCZDgxXlIHPYSwifaAHTF2YBV5GjdvjJtjUvaa+QydyqG
	J0IghcEFgDRMD5k3K5iuTHoWuRqb5Ng24fu2GEBPSazUnhvA0vUajkMwfQ1tJMAvubK1p2B50JV
	B9xT5wpxTHkn+WqDBC8htani0qU6SanV67yIg38Biu+jTjGaTCUHLHVL6s8mQXQ1HdTUWR/T+If
	tKUjQvc4nPK/lKGpZ89vTXHLnHSnzl0Dtsn+iJ82zMa0WewvbC3dTSLjExmaQLoWVFFRYNtdWp2
	0aC7zlTsXmRhfCAeQv8IgBXcZ4ABgYzZoqZ/9Yacp/g12c7k+C
X-Received: by 2002:a05:600c:3586:b0:490:c024:2ec8 with SMTP id 5b1f17b1804b1-490ec339ec0mr49640985e9.0.1781274659660;
        Fri, 12 Jun 2026 07:30:59 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:c72c:50c4:8b28:9a3a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c3782sm5850016f8f.25.2026.06.12.07.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:30:59 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 09/11] phy: renesas: phy-rcar-gen3-usb2: Fix devm action registration for disabled VBUS regulator
Date: Fri, 12 Jun 2026 15:30:37 +0100
Message-ID: <20260612143048.317907-10-biju.das.jz@bp.renesas.com>
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
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33935-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:yoshihiro.shimoda.uh@renesas.com,m:vkoul@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:neil.armstrong@linaro.org,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,glider.be,gmail.com];
	FREEMAIL_CC(0.00)[bp.renesas.com,linaro.org,pengutronix.de,vger.kernel.org,lists.infradead.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5444267A346

From: Biju Das <biju.das.jz@bp.renesas.com>

devm_regulator_get_exclusive() initialises the regulator with
enable_count = 1, requiring the consumer to disable it before release.

Previously, the devm disable action was only registered when the
regulator was explicitly enabled, causing the cleanup path to skip
decrementing enable_count on device removal when the regulator was
left disabled.

Fix this by always registering the devm disable action when the regulator
is enabled (checked via regulator_is_enabled()), covering both the
explicitly-enabled case and the initial state set by
devm_regulator_get_exclusive().

This fixes WARN_ON enable count during regulator release.

Fixes: 24843404efe4 ("phy: renesas: phy-rcar-gen3-usb2: Control VBUS for RZ/G2L SoCs")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index d06fb52ed5f1..ef38c3b365d4 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -905,15 +905,17 @@ static int rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(struct rcar_ge
 	if (IS_ERR(channel->vbus))
 		return PTR_ERR(channel->vbus);
 
-	if (!enable)
-		return 0;
+	if (enable) {
+		ret = regulator_enable(channel->vbus);
+		if (ret)
+			return ret;
+	}
 
-	ret = regulator_enable(channel->vbus);
-	if (ret)
-		return ret;
+	if (regulator_is_enabled(channel->vbus))
+		return devm_add_action_or_reset(dev, rcar_gen3_phy_usb2_vbus_disable_action,
+						channel->vbus);
 
-	return devm_add_action_or_reset(dev, rcar_gen3_phy_usb2_vbus_disable_action,
-					channel->vbus);
+	return 0;
 }
 
 static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *channel)
-- 
2.43.0


