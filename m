Return-Path: <linux-renesas-soc+bounces-29583-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPg/GgcruWmVtQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29583-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 11:20:55 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0093E2A7C34
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 11:20:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 182F730699AE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 10:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1F653A5421;
	Tue, 17 Mar 2026 10:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bt8f7Jel"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BA034EF07
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 10:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773742594; cv=none; b=bs604w/6SG9+J6Cb58SKtFigMbHaqto6fiudTydqnj98JWytsek/nv/AIlpWl1fnyjC/wuEwSXhnExD/V1LauPM84U/fRFohaJcTebmgmpRhU9bNYzaWeRJrY0B0uwEbwxmR0/w00QBuje+a99jyN2XLLVHzGKxh/kNgMEjsQWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773742594; c=relaxed/simple;
	bh=ABn9Ni57R0ZkpGLX2ZIwE8vOk53v0f5Zak751TrF5w8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LQL8Q7GhaClC2r+HTNc9CuAeh5cqWY4/2eajoKs3w9axKA4zVRDyoSCD8UTI4Zh6wDe2O2AJ12YdRpFXDt+tlP9GCxzpfF9zYd5nX+iKQwlRVhBEhLESeOjUpBR09i5EuMmDJl+kvApbJEPwdL9ZUNe2ng/blYy4dEp1Z1UcJf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bt8f7Jel; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso49399215e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 03:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773742590; x=1774347390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oxpIVyCSKVrX2DiLGUQhb5TMOZpG4m6V2TbsqVVpj04=;
        b=Bt8f7JeljAb+cWcPNtxImOJ9/dmJjqgIF5JVMEXx+dz3VU7/h4oPprOGZXEzB6nWtN
         IhnCIrTVELTYstyYJRzJAuSoW2wEqDgj4TG8ME9fzK8EcCPm6OmW2j/O9EXviRkm+bPB
         MG83lytosBI6+mZuqR+oXHBI0hVMjTqfoYtI0n3qhNixxMhSgKYvY+tfP1FWWaN3/D7N
         xHPLgBp4NMoOYpA+TB1ohksEwc6zQA0/ayJq84ce2KuSuZyCL9UTAZEWrTQza0C/LErD
         EuQAUeo7ZRSiN+//luaux8Y4pu49fgHZM5yevQziRCdM9soFZCcBIWgoozBnY0D4taMA
         l4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773742590; x=1774347390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxpIVyCSKVrX2DiLGUQhb5TMOZpG4m6V2TbsqVVpj04=;
        b=NAhWlafUofOYLlQF3MAhzAg4qbiLPOv4UsGtQQjcHOnTWjDrmlFNW3nP8qGEoPlf9I
         ka8lqc9aRxAY2aY/TdfCy3xagMSe7B/ikv/aVonfsyUDMnRRZMIpAIPQNR2mWxR0vj2E
         UQP2ujoBUfB2lAqxHRkTQNlKcKKcF4eTgZVlGMae1wS3fd2IncCiujsaWpJeTdFOFWw+
         o83wD6J1aiZvCKQXDQRBro6ezogjY/EHC5z8SkL63fdRDP+uCrJ53wMcvXx8hXF7gbDq
         p1ghn9vsZGf04lP+qJAV1EEXS7OIZEMknY193NJVDcQVWAFFJj1tBxTYlglZIiY5eR9X
         XBow==
X-Forwarded-Encrypted: i=1; AJvYcCX9RIHSk77mhz8VIy0vXaLQulk8KB+4ObjMhGViNajXjmyMhXl24uKHzlULGpVLit58UEydBtC9Fu4OQ0KXq+ElFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfYSiiUJAXmOxt8H0HVUCOBSDwKwNWitw48E3Incj+MpgHAuBh
	Sn89qA6kU7Bbvj+A1/TwRdLxy6UeAuvediyyX4tmgCM7kDBanQR1x3Nk
X-Gm-Gg: ATEYQzw94FpK1ZMHgdHN5YWIwI5+oXs4xGz8FtHi0g+rbqk1N1iZgptwi+ZFgpy6RNn
	czFX3DlzrAG0jfqR+MvhbaoZp+VdOr0/FqVeJhsITyD2LvkKDJx5u4Iguta+Nj9avOJhNZRqvd1
	VtkYpAuEBOrLQdH42MqFlOXzA/GqpNAO95UhjnZPoDJyQBJ0mdOvsbwkIeJiUhvsRpCh/kkjTS8
	G7aXlFm5FTLcL6Fc9iSnrKSWZUyRPbD0iuIAv++C+n5dUMPlbv9WTgRli7p3Og+DtMImDmHiU7d
	cAcQTsaHyLSEzyP35WGSLl4f6GXmT+smJJ5WCbx/ijTZRMStgQpmrrj9RusctSm6263PHaDHdfv
	uS5Yrk5kkWccFZRy1/8rh1eUlKcaWFgOsjRixoJechI4O4FF5PWPKEgivfWd+ZWSKSSytcLZdbH
	C/fCPjPI5V7ETgt2/v6bjIqRfDVCMIuxdMRBoWPzBUQJHGO3BRlWrla1tUtow=
X-Received: by 2002:a05:600c:a15:b0:485:34a2:919e with SMTP id 5b1f17b1804b1-48556710fd5mr284691515e9.33.1773742590244;
        Tue, 17 Mar 2026 03:16:30 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e16b:fc56:e220:9aa9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eaee510sm53903275e9.14.2026.03.17.03.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 03:16:29 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 0/8] Add Renesas RZ/G3L PINCONTROL support
Date: Tue, 17 Mar 2026 10:16:13 +0000
Message-ID: <20260317101627.174491-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29583-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 0093E2A7C34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,

This patch series aims to add basic pin-control support for the Renesas
RZ/G3L SoC. The RZ/G3L pinctrl has an OTHER_POC register compared to other
SoCs for setting the IO domain voltage for AWO, ISO, and WDT.

Document the bindings for the RZ/G3L SoC and add pinctrl definitions in
the driver. Some IPs need to set the register IPCONT_SEL_CLONECH in SYSC
to control the clone channel of the IP. Document the reset-names, as all
SoCs have multiple resets.

v2->v3:
 * Dropped clk, pincontrol device node and pincontrol support for SCIF0
   and GBETH nodes from this series. Will add this later.
 * Documented renesas,clonech property for controlling clone channel
   control register located on SYSC IP block on RZ/G3L SoC.
 * Retained the tag as it is similar change for RZ/G3E thermal bindings.
 * Updated r9a08g046_gpio_configs[] by replacing the typo AWO->ISO.
 * Added PIN_CFG_PUPD to RZG3L_MPXED_ETH_PIN_FUNCS macro
 * Replaced RZG2L_MPXED_COMMON_PIN_FUNCS->RZG3L_MPXED_PIN_FUNCS in 
   RZG3L_MPXED_PIN_FUNCS_POC macro for setting power source for pins.
 * Added clone channel control support in the driver
v1->v2:
 * Split DTSI patches from bindings
 * Fix typo maxItems->minItems in bindings
 * Collected the tag

Biju Das (8):
  dt-bindings: pinctrl: renesas: Document reset-names
  dt-bindings: pinctrl: renesas: Document RZ/G3L SoC
  arm64: dts: renesas: Add reset-names for RZ/G2L and RZ/V2H family SoCs
  pinctrl: renesas: rzg2l: Add support for selecting power source for
    {WDT,AWO,ISO}
  pinctrl: renesas: rzg2l: Add OEN support for RZ/G3L
  pinctrl: renesas: rzg2l: Add support for RZ/G3L SoC
  pinctrl: renesas: rzg2l: Simplify rzg2l_pinctrl_set_mux()
  pinctrl: renesas: rzg2l: Add support for clone channel control

 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |  35 ++
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    |   1 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 514 +++++++++++++++++-
 .../pinctrl/renesas,r9a08g046-pinctrl.h       |  39 ++
 10 files changed, 588 insertions(+), 7 deletions(-)
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h

-- 
2.43.0


