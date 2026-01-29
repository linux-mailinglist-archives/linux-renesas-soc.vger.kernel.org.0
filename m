Return-Path: <linux-renesas-soc+bounces-27593-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAZpAJM0e2mGCQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27593-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 11:21:07 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB09EAE8BE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 11:21:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45272306EC8A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 10:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86D0233D4E9;
	Thu, 29 Jan 2026 10:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZLyk8DX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AB233DEC4
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 10:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769681818; cv=none; b=GkV3kOdXfQuvfK6ysdLx2dyIZiNR/SIsxVuWsjQOwQmguc1p24pIzYeCxSJJVSGeumXJfeutVp6NMEYYzRIvhBzs+zfzXEq6lcW9JfAHdDY9CBltGx47jKNoEg8RJusOoGfED6gubf613vJyOgbCoXJE45n4b/1A5KJAFoXxyxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769681818; c=relaxed/simple;
	bh=9736Q1c5UPkbPCgTxA+3Cri6nfDIyGp2aLifbmZ9cpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NB/zTi3KN9vPU6lNG5tbmtSyE7cRbcU/wn/MvVd56DdPnHNZV1Mrn48BHDimVrS7FPCeRCoevAqRcju8Hi1FI1WvD4Ymsx9EdGvuskIW16qzVNmvl/MKRiG0vlBGdBGMyhhpCYZIFWp6kv02LMtENr6jRgGuc5CspbQFwv4lmls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZLyk8DX; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4801ea9bafdso3254985e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 02:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769681814; x=1770286614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNHC7BZwLEWIAkvOqNMf9oTfVeweCY3nyHbRwQRrLe0=;
        b=SZLyk8DX9IO/nGI0mmse6ZDGG46hiT9WDd9A4mbXEfxu3sjBUdRmstuWQj1WR+csgn
         g+HsMXoYpMNdMTVLxMJk/A5nsBUv5hwu+Prsghzr25Y7sKz5TAyASnPL0y+4mmifM6QY
         GIEkhSJbwoKfly55uIB14E9cKu7XnDtjCgwUYFZDHmmQxRPVB4KI+qOwGUVzqJ5u5907
         6iuvlA0/NtjJHFDyEo1K4hePachJBuo5q3a+yefPi1htJMTPoiw4i1QVsdZWvHXjHgPU
         MtD9ri4KdMWujWYsygoBulT5Rail6W/eA62M9nNFr0L+z+1TMGpnP4Q/oBqBBsaITpBF
         Y6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769681814; x=1770286614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pNHC7BZwLEWIAkvOqNMf9oTfVeweCY3nyHbRwQRrLe0=;
        b=GODcgWXexVKh13avYt3W1Sxp8jWgyHkk63qpU1AiEO9wY5Uo4KzMg9Vaz7cJprWdvl
         Bq7Y5MvI82Ct8YdyHdV7Y8B9OYkR7Qf2WPUJtOSuk1FIo7vKRfw2UMdDTNOUNpJjg1nD
         5majHD2EIYEW01fIjb9ByYvg1KhfO6k3QGN6ERYTPeNiMJpraX6xNKw+PNkFcFAO40eU
         U0riX9hPgenwlDdRXRDvasaw7BvQRC9AKzHmTme0YfMGgvF67/msxtiMw10LJo2SVWGI
         HodRvpvGo3TifSSdErv+cLPWlTwHWx6EHWVko93sli2O1VoIstY3jAYY7VQvFkGIT3Kh
         CBmg==
X-Gm-Message-State: AOJu0YyqVsVHlA0NPqCjLp2UpBC8ZOvhSR7OWZM1nX5lX6euQWNqqefV
	RfKY1p0FdjW8AGAPmDOTcxhkgz+tYJGfmT8iA4wup37Cg2QP+I8ANcBF
X-Gm-Gg: AZuq6aLjIayqCTx+43TOypwzGMpZroYs3DAjKmbsM+qgCfmsmbIz4V2REQKfmIAWCTP
	m6VaMTyyIsHfcNuzxu0x2H5bcBnz8zs9iiU97rRZeYMTu6GbLanuyI0I5WsbALvfuRaRMVH9CGw
	fUFHbU1mN7Nza1xh2rcR0pW9kp8PjfDfM5GlF2OJLg/BFMQS/LG0k/QQq2rOqW70w+LS6LNyopi
	MN5V/WeLrJQ6NBFLKFmE2AfZP1lgA3XHfSgdjDzlSMB98OL1CqbSWoeZo4CrHsa2mFtC377+03b
	1N662F/AkYEiUvnl+/Ci5iaC81v3AYUl7AH7Zvm4ak6YWRqZjhl89rCr2f2bso4sJJhJ3pRh+UT
	25NtUHA85g0KcRYUKbAp7PDa+pBNWIAht/BYGwdUteK7EDRhoQx2ALqB3LknC3zJiyOa6OWQpke
	4zceCNmG15lDe/6Gbr
X-Received: by 2002:a05:600c:c0dc:b0:480:4ae2:def1 with SMTP id 5b1f17b1804b1-4806c00c0e0mr86656865e9.13.1769681813615;
        Thu, 29 Jan 2026 02:16:53 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm178642065e9.2.2026.01.29.02.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:16:53 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: biju.das.au@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH RESEND 5/9] pinctrl: renesas: rzg2l: Add OEN support for RZ/G3L
Date: Thu, 29 Jan 2026 10:16:40 +0000
Message-ID: <03791e2cdc6b2da9a791b4a66b46b13d7c252bad.1769681553.git.biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
References: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27593-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,glider.be,kernel.org,gmail.com,baylibre.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: AB09EAE8BE
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for configuring the ETH_MODE register on the RZ/G3L SoC to
enable output-enable control for specific pins. On this SoC, certain
pins such as P{B,E}1_ISO need to support switching between input and
output modes depending on the PHY interface mode (e.g., RMII vs RGMII).
This functionality maps to the 'output-enable' property in the device
tree and requires explicit control via the ETH_MODE register.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index cf7f9c2e37f8..5e3e56e32cea 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -1198,6 +1198,23 @@ static int rzg2l_write_oen(struct rzg2l_pinctrl *pctrl, unsigned int _pin, u8 oe
 	return 0;
 }
 
+static int rzg3l_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
+{
+	u64 *pin_data = pctrl->desc.pins[_pin].drv_data;
+	u8 port, pin;
+
+	if (*pin_data & RZG2L_SINGLE_PIN)
+		return -EINVAL;
+
+	pin = RZG2L_PIN_ID_TO_PIN(_pin);
+	if (pin != pctrl->data->hwcfg->oen_max_pin)
+		return -EINVAL;
+
+	port = RZG2L_PIN_ID_TO_PORT(_pin);
+
+	return (port == pctrl->data->hwcfg->oen_max_port) ? 1 : 0;
+}
+
 static int rzg3s_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
 {
 	u64 *pin_data = pctrl->desc.pins[_pin].drv_data;
-- 
2.43.0


