Return-Path: <linux-renesas-soc+bounces-29908-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yM4OIzoHvGkArgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29908-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 15:24:58 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F582CCBAC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 15:24:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C868321B646
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 14:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 718FC35DA6B;
	Thu, 19 Mar 2026 14:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNqMXb1l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8150C33A717
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 14:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773929723; cv=none; b=fHiluVZhJiDUF5nBgqXL+ib4wtrqAoHhNiRo/nXa37bm8R8lIAA+wgjmgDp2j2RR0Nyi17BYSQftOA/NxPmGz+jnswGEegWbrcwBs5DWf2iM8m0uRPosAGGT4UX3s1HG2e4OZCEt5ftMTMus6La8PaEsCmMJd+sUKio8lZucZnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773929723; c=relaxed/simple;
	bh=5OWbKo0bnPPX/uAkzghoRyxLyG5BO+fqwknUdYaJO3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u90ylajQMNkX1a0r1MCccJqiO54tgavVBo+788VHbm7rzu+Ol7hcOc6amZf+VNylY3F2IzN44ik1H2occ7AVc2mEr5w/suYOBYFcwhMvEF7pQSiLCVOFnvgKwT9bD3jpG4UN0ELFwSrKENzwiyiLvj5ySnBKuKfmN3cVDTYUphA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PNqMXb1l; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43b44c0bcdbso650583f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 07:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773929720; x=1774534520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIv35/KzrQ2qam4V8o0AJp6SBCk+vFfEGwItpEITTHI=;
        b=PNqMXb1lW/v7S0QnMu+kb8ykT4hqA9farpomtHy8Mpu18MFnpg/QQXWqmFIOrT3GEk
         lgTQmeLaXnq5Vl31JvrVoxN//d7jDqDDym0sV63ONLp8gO0FP+fHXy1kT2ANS6urZfs3
         5VxDIw0vOYLmEDp8bFtHONMdab3LcBWK5udUu8Abd4hXzCVpY7q3THYtO2wF3uWyUM/P
         denrVkhnvBem1kOzHgsEvMpY/Wmogd6rLisrenXti06tnGO60LRA2voC4PdnJy+1KZS7
         b5tciylZlxyf+x+fsx2I69x2sz9bU7PIAf8VeqITeRzprAz17VNXLrIJW73PgcdXp9JF
         Z+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773929720; x=1774534520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gIv35/KzrQ2qam4V8o0AJp6SBCk+vFfEGwItpEITTHI=;
        b=BzYV+t3xVnLL3TlPCJ9lS/mYZqwWcmrS7cAcxkg++FXw1J8tMdIwoRJQMYikIepZhL
         u4HFL5Sg1BMcXY0B+KVN54uZRp2jaGYMR/PWKLPAlRzE73ygixKahhakxfi7ijWmtv5A
         g/w3RsMXylha09PODp2xZWjRmor9scWKymMeaRpN649EQ1po5Yq80qvTwnU3TOnWwPxR
         c0BgobKnFF0gfXL8U5JSksvUrWBY9HG3fWopwktWzd8A5WyO6+lwUhSUQgjGAmeALP2c
         42QRn/B55S3VFIgSa9yan+AYcH87/GoafHIA/GUuQ9mNj3J8jwk+ORGpYuRDhiGuUeGz
         3X5A==
X-Gm-Message-State: AOJu0YyS0RgCfz9D74s6YBIBtu6BwnFpdMHkR7AYhFivUupArAzT+ior
	P9IfVwarzVQIMHr1RQeKtyh5yZXHbTvu7Mqdzgqzmd9HHWZjuZz7c2tw
X-Gm-Gg: ATEYQzzF5mzLf0l5wCcbvui5P0eQZwtaaZo2RUrBtjaOnTpPqhuaS7t85XKYKymZ3kU
	ukFWN6jFs2QCMh/9D1D1acPJlNoDIGka/GzM0lBs/z1+HxRfhio7Fk9uZjrSMpIDHF5kG14iF+W
	A1l+NJgx9u4bEmLHXs7J5VJ6Aka7ajxtNN+qvpOrTobiY1ByTY4271ri1dMUgftO+TfnsuDR8Th
	o6oWUYEk6Jgqjis9mq7E60N+0ojD/Mdu5dGQDfbbRYPc4IWoEmfAd/Vd5u8QBWy+vHJCRKt/0PF
	KlCRaSoIXdx37dAmpJN3lFr9jGZMGGxj5udg+4nzc9JJi4CeDpX4h8vC2/qLCfTM1ZdTJota/KG
	e8J4kciNaWqY2zfq+D77K+scTYhQcsH3+geDSuKSqSq1695H2VNPUMI8R/fsDCNzXPV3zW4P0+E
	b9QOzws5ikz4zFxwTgv/h4iP5YW9ETzMCw2E6e4ydYgAQaUTsQNMt6uE0WOY/Ij7B44aiv8GymY
	k9dG4enXTUWLQ4XRL0lRb4hMwYskOnmuZ705znGW6nIe1U=
X-Received: by 2002:a05:6000:22c7:b0:439:b886:20d3 with SMTP id ffacd0b85a97d-43b527a714dmr13516886f8f.15.1773929719654;
        Thu, 19 Mar 2026 07:15:19 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:f7c0:c444:6359:4c21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184957bsm17824618f8f.5.2026.03.19.07.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 07:15:19 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/2] pinctrl: renesas: rzt2h: Add pin configuration support
Date: Thu, 19 Mar 2026 14:15:15 +0000
Message-ID: <20260319141515.2053556-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319141515.2053556-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260319141515.2053556-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	TAGGED_FROM(0.00)[bounces-29908-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.954];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 31F582CCBAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add pin configuration support for the Renesas RZ/T2H SoC. The RZ/T2H SoC
allows configuring several electrical characteristics through the DRCTLm
(I/O Buffer Function Switching) registers. These registers control bias
configuration, Schmitt trigger input, output slew rate, and drive
strength.

Implement pinconf_ops to allow reading and updating these properties
through the generic pin configuration framework. The implementation
supports bias-disable, bias-pull-up, bias-pull-down,
input-schmitt-enable, slew-rate, and drive-strength-microamp.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Updated commit description
- Dropped 32 bit reg access for DRCTLm registers
- Switched using to guard for locking in rzt2h_pinctrl_drctl_rmwq
  helper function
- Dropped using RENESAS_RZT2H_PIN_CONFIG_DRIVE_STRENGTH instead
  switched to using the standard PIN_CONFIG_DRIVE_STRENGTH_UA
---
 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 259 ++++++++++++++++++++++++
 1 file changed, 259 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzt2h.c b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
index 5927744c7a96..6e60d1bb0c8b 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
@@ -7,6 +7,7 @@
  * Copyright (C) 2025 Renesas Electronics Corporation.
  */
 
+#include <linux/array_size.h>
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/bits.h>
@@ -43,6 +44,7 @@
 #define PMC(m)		(0x400 + (m))
 #define PFC(m)		(0x600 + 8 * (m))
 #define PIN(m)		(0x800 + (m))
+#define DRCTL(n)	(0xa00 + 8 * (n))
 #define RSELP(m)	(0xc00 + (m))
 
 #define PM_MASK			GENMASK(1, 0)
@@ -54,6 +56,16 @@
 #define PFC_PIN_MASK(pin)	(PFC_MASK << ((pin) * 8))
 #define PFC_FUNC_INTERRUPT	0
 
+#define DRCTL_PIN_SHIFT(pin)	((pin) << 3)
+#define DRCTL_DRV_PIN_MASK(pin)	(GENMASK_ULL(1, 0) << DRCTL_PIN_SHIFT(pin))
+#define DRCTL_PUD_PIN_MASK(pin)	(GENMASK_ULL(3, 2) << DRCTL_PIN_SHIFT(pin))
+#define DRCTL_SMT_PIN_MASK(pin)	(BIT_ULL(4) << DRCTL_PIN_SHIFT(pin))
+#define DRCTL_SR_PIN_MASK(pin)	(BIT_ULL(5) << DRCTL_PIN_SHIFT(pin))
+
+#define DRCTL_PUD_NONE		0
+#define DRCTL_PUD_PULL_UP	1
+#define DRCTL_PUD_PULL_DOWN	2
+
 /*
  * Use 16 lower bits [15:0] for pin identifier
  * Use 8 higher bits [23:16] for pin mux function
@@ -91,6 +103,8 @@ struct rzt2h_pinctrl {
 	atomic_t			wakeup_path;
 };
 
+static const unsigned int rzt2h_drive_strength_ua[] = { 2500, 5000, 9000, 11800 };
+
 #define RZT2H_GET_BASE(pctrl, port) \
 	((port) > RZT2H_MAX_SAFETY_PORTS ? (pctrl)->base0 : (pctrl)->base1)
 
@@ -110,6 +124,37 @@ RZT2H_PINCTRL_REG_ACCESS(b, u8)
 RZT2H_PINCTRL_REG_ACCESS(w, u16)
 RZT2H_PINCTRL_REG_ACCESS(q, u64)
 
+static int rzt2h_drive_strength_ua_to_idx(unsigned int ua)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(rzt2h_drive_strength_ua); i++) {
+		if (rzt2h_drive_strength_ua[i] == ua)
+			return i;
+	}
+
+	return -EINVAL;
+}
+
+static int rzt2h_drive_strength_idx_to_ua(unsigned int idx)
+{
+	if (idx >= ARRAY_SIZE(rzt2h_drive_strength_ua))
+		return -EINVAL;
+
+	return rzt2h_drive_strength_ua[idx];
+}
+
+static void rzt2h_pinctrl_drctl_rmwq(struct rzt2h_pinctrl *pctrl,
+				     u32 port, u64 mask, u64 val)
+{
+	u32 offset = DRCTL(port);
+	u64 drctl;
+
+	guard(raw_spinlock_irqsave)(&pctrl->lock);
+	drctl = rzt2h_pinctrl_readq(pctrl, port, offset) & ~mask;
+	rzt2h_pinctrl_writeq(pctrl, port, drctl | val, offset);
+}
+
 static int rzt2h_validate_pin(struct rzt2h_pinctrl *pctrl, unsigned int offset)
 {
 	u8 port = RZT2H_PIN_ID_TO_PORT(offset);
@@ -443,6 +488,210 @@ static int rzt2h_dt_node_to_map(struct pinctrl_dev *pctldev,
 	return ret;
 }
 
+static int rzt2h_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
+				     unsigned int pin,
+				     unsigned long *config)
+{
+	struct rzt2h_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	u32 port, param = pinconf_to_config_param(*config);
+	unsigned int arg;
+	u8 port_pin;
+	u64 drctl;
+	int ret;
+
+	ret = rzt2h_validate_pin(pctrl, pin);
+	if (ret)
+		return ret;
+
+	port = RZT2H_PIN_ID_TO_PORT(pin);
+	port_pin = RZT2H_PIN_ID_TO_PIN(pin);
+
+	switch (param) {
+	case PIN_CONFIG_SLEW_RATE:
+		drctl = rzt2h_pinctrl_readq(pctrl, port, DRCTL(port));
+		arg = field_get(DRCTL_SR_PIN_MASK(port_pin), drctl);
+		break;
+
+	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_BIAS_PULL_UP:
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		drctl = rzt2h_pinctrl_readq(pctrl, port, DRCTL(port));
+		arg = field_get(DRCTL_PUD_PIN_MASK(port_pin), drctl);
+		/* for PIN_CONFIG_BIAS_PULL_UP/DOWN when enabled we just return 1 */
+		switch (arg) {
+		case DRCTL_PUD_NONE:
+			if (param != PIN_CONFIG_BIAS_DISABLE)
+				return -EINVAL;
+			break;
+		case DRCTL_PUD_PULL_UP:
+			if (param != PIN_CONFIG_BIAS_PULL_UP)
+				return -EINVAL;
+			arg = 1;
+			break;
+		case DRCTL_PUD_PULL_DOWN:
+			if (param != PIN_CONFIG_BIAS_PULL_DOWN)
+				return -EINVAL;
+			arg = 1;
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
+
+	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+		drctl = rzt2h_pinctrl_readq(pctrl, port, DRCTL(port));
+		arg = field_get(DRCTL_SMT_PIN_MASK(port_pin), drctl);
+		if (!arg)
+			return -EINVAL;
+		break;
+
+	case PIN_CONFIG_DRIVE_STRENGTH_UA: {
+		int idx_drv;
+
+		drctl = rzt2h_pinctrl_readq(pctrl, port, DRCTL(port));
+		arg = field_get(DRCTL_DRV_PIN_MASK(port_pin), drctl);
+		idx_drv = rzt2h_drive_strength_idx_to_ua(arg);
+		if (idx_drv < 0)
+			return idx_drv;
+		arg = idx_drv;
+		break;
+	}
+
+	default:
+		return -ENOTSUPP;
+	}
+
+	*config = pinconf_to_config_packed(param, arg);
+	return 0;
+}
+
+static int rzt2h_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
+				     unsigned int pin,
+				     unsigned long *configs,
+				     unsigned int num_configs)
+{
+	struct rzt2h_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	unsigned int i;
+	u8 port_pin;
+	int ret;
+
+	ret = rzt2h_validate_pin(pctrl, pin);
+	if (ret)
+		return ret;
+
+	port_pin = RZT2H_PIN_ID_TO_PIN(pin);
+
+	for (i = 0; i < num_configs; i++) {
+		u32 arg = pinconf_to_config_argument(configs[i]);
+		u32 param = pinconf_to_config_param(configs[i]);
+		u64 mask, val;
+
+		switch (param) {
+		case PIN_CONFIG_SLEW_RATE:
+			mask = DRCTL_SR_PIN_MASK(port_pin);
+			val = field_prep(mask, !!arg);
+			break;
+
+		case PIN_CONFIG_BIAS_DISABLE:
+		case PIN_CONFIG_BIAS_PULL_UP:
+		case PIN_CONFIG_BIAS_PULL_DOWN: {
+			u32 bias;
+
+			switch (param) {
+			case PIN_CONFIG_BIAS_DISABLE:
+				bias = DRCTL_PUD_NONE;
+				break;
+			case PIN_CONFIG_BIAS_PULL_UP:
+				bias = DRCTL_PUD_PULL_UP;
+				break;
+			case PIN_CONFIG_BIAS_PULL_DOWN:
+				bias = DRCTL_PUD_PULL_DOWN;
+				break;
+			}
+
+			mask = DRCTL_PUD_PIN_MASK(port_pin);
+			val = field_prep(mask, bias);
+			break;
+		}
+
+		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+			mask = DRCTL_SMT_PIN_MASK(port_pin);
+			val = field_prep(mask, !!arg);
+			break;
+
+		case PIN_CONFIG_DRIVE_STRENGTH_UA: {
+			int drv_idx;
+
+			drv_idx = rzt2h_drive_strength_ua_to_idx(arg);
+			if (drv_idx < 0)
+				return drv_idx;
+
+			mask = DRCTL_DRV_PIN_MASK(port_pin);
+			val = field_prep(mask, drv_idx);
+			break;
+		}
+
+		default:
+			return -ENOTSUPP;
+		}
+
+		rzt2h_pinctrl_drctl_rmwq(pctrl, RZT2H_PIN_ID_TO_PORT(pin), mask, val);
+	}
+
+	return 0;
+}
+
+static int rzt2h_pinctrl_pinconf_group_get(struct pinctrl_dev *pctldev,
+					   unsigned int group,
+					   unsigned long *config)
+{
+	unsigned long prev_config = 0;
+	const unsigned int *pins;
+	unsigned int i, npins;
+	int ret;
+
+	ret = pinctrl_generic_get_group_pins(pctldev, group, &pins, &npins);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < npins; i++) {
+		ret = rzt2h_pinctrl_pinconf_get(pctldev, pins[i], config);
+		if (ret)
+			return ret;
+
+		/* Check config matches previous pins */
+		if (i && prev_config != *config)
+			return -ENOTSUPP;
+
+		prev_config = *config;
+	}
+
+	return 0;
+}
+
+static int rzt2h_pinctrl_pinconf_group_set(struct pinctrl_dev *pctldev,
+					   unsigned int group,
+					   unsigned long *configs,
+					   unsigned int num_configs)
+{
+	const unsigned int *pins;
+	unsigned int i, npins;
+	int ret;
+
+	ret = pinctrl_generic_get_group_pins(pctldev, group, &pins, &npins);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < npins; i++) {
+		ret = rzt2h_pinctrl_pinconf_set(pctldev, pins[i], configs,
+						num_configs);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static const struct pinctrl_ops rzt2h_pinctrl_pctlops = {
 	.get_groups_count = pinctrl_generic_get_group_count,
 	.get_group_name = pinctrl_generic_get_group_name,
@@ -459,6 +708,15 @@ static const struct pinmux_ops rzt2h_pinctrl_pmxops = {
 	.strict = true,
 };
 
+static const struct pinconf_ops rzt2h_pinctrl_confops = {
+	.is_generic = true,
+	.pin_config_get = rzt2h_pinctrl_pinconf_get,
+	.pin_config_set = rzt2h_pinctrl_pinconf_set,
+	.pin_config_group_set = rzt2h_pinctrl_pinconf_group_set,
+	.pin_config_group_get = rzt2h_pinctrl_pinconf_group_get,
+	.pin_config_config_dbg_show = pinconf_generic_dump_config,
+};
+
 static int rzt2h_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
 	struct rzt2h_pinctrl *pctrl = gpiochip_get_data(chip);
@@ -890,6 +1148,7 @@ static int rzt2h_pinctrl_register(struct rzt2h_pinctrl *pctrl)
 	desc->npins = pctrl->data->n_port_pins;
 	desc->pctlops = &rzt2h_pinctrl_pctlops;
 	desc->pmxops = &rzt2h_pinctrl_pmxops;
+	desc->confops = &rzt2h_pinctrl_confops;
 	desc->owner = THIS_MODULE;
 
 	pins = devm_kcalloc(dev, desc->npins, sizeof(*pins), GFP_KERNEL);
-- 
2.53.0


