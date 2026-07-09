Return-Path: <linux-renesas-soc+bounces-34924-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2Nc1AVhdT2oFfQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34924-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 10:35:36 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AE64172E5A0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 10:35:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=k+easeGJ;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34924-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34924-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1855630448AD
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 08:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C19163F12F4;
	Thu,  9 Jul 2026 08:31:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD7A3F076F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 08:31:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585874; cv=none; b=SVczvl66rp0pcXiCOeuIbda0A9KCRJp7q8ZkSh2IkMrelMDJYCh7WX3JvHWlWlShDV4kXaikSHST3cf+7X/Axni9mPt4bWFJlIAE0Ow5M5hCkymGMTUHN0x5VM5es5Jrhm/UPe1hb/61Ve6nitKVbeY3DVwSynxMAuogJSCwEmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585874; c=relaxed/simple;
	bh=EyfGsBeLTad/LsR6Gbm7axzQ+wrtPOfcuvqtWCP3BdA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V1T8EL2hCZ3xZCG/IpRIl7PQlCx1DsqNmvWntwcnK3BCwXMMmiHChx0H6CtLd7gr9vZz9f/hPgnmBGh1nG/2OT2Yn9ObNysN/J5UTaMlXRqblwGpNgfbvhVGuidLhLabF2VMyATI0gxfvEwbBBX+Z0u5qEOmLPaVT8KMlex3FHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k+easeGJ; arc=none smtp.client-ip=209.85.221.53
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4728c12ba97so831418f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 01:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783585871; x=1784190671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zwKLW3e8sifoWMe13SzALnUW9Xz9XuHOuNauXNIlqAg=;
        b=k+easeGJd6OPqrirLilvRzhsFmzCxnJFIECh+In3f7IARtdx3/9Zzq+ZIDveCuLGkx
         AANtXciUR+xHyQNAJSfPOXm1E/4BqRaCTP1A6v0AhBECQt5fhGqWfAdjSO8BHeGZ6jDp
         D0EgGTgzj13JLTEkQRYKSvffsXlu+nLfGRckdoTbdr3kO94s1AJdaJsSYonWkwB+HG92
         gbcDthEA9u6RPOzWuVsi2hjTTZKv+jG9NXN0mYFbyCG4tTHS5bw/tlEvyiRZ8WIImtU+
         1UpS/tcGrK3UOJs6CI+HDGVpGW1ZRv0HpnPI3hrtt5VBVEzWFkvGm4RI47qnUxyxUuyT
         pYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783585871; x=1784190671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zwKLW3e8sifoWMe13SzALnUW9Xz9XuHOuNauXNIlqAg=;
        b=qSKNiivHCkTDC3/WLijwfe+iv93r+ATvxsGf6NYjulvFsQ7HChO5S85mcW1xNu4oJl
         ZCCQYj7Tp1qgW8qvIVtiGpUu8NWwJMfVeZOOqswKj9xon98KGS4tnSqgiRK+lAT+iAlY
         1dE8Oku1KSqtDSj/LItwkyt/mJt6UGXpAJ2KS0A3YiCkV2pEZX4WFIXcpRy2icj1uUUb
         LV96lFt3lGvHE83Yhgff7f8usRrxB5KYkrxxeVWjQSl60l7FfdVxbHwsf3ZywxT5aSw/
         j42DxNVVbNybYmVf659KdMJzM0Ub+udSFiQ2PWyKgjmb7zBRXXl/oRfg/3ZiNzHFMgMI
         HGDg==
X-Forwarded-Encrypted: i=1; AHgh+RpWXCIBz3SObaV5GF1OhnFFZCgUN8/GTYeqYxFLDnjCSCCesVj42l5pE2EfwKRl56e5FzeIwMJFbdXKJnjKh8qGLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOieY3KKhO2m0ArOU+1Wt486MrT3W0njgM12KobuwN/UeP6O3D
	FoAubqaLTFt+3gnP/WW9ICbtdZlEPtr/59LgXdDXP6SJpGnhSjYK8inV
X-Gm-Gg: AfdE7cn75R8EMpexBiR3xbCgE1e9xzDCbVGaYFe6qj+PZMjBLOpmvW1icoFa79cyRFH
	nVlqCoPpx7I/+TVEKTvNIKx3yMVsTo5AqXZzVyT8XGrsLS5UVTEHCG1JDCxDVkmdUlPNpVjQ+1u
	9os77QuqggOPBgSeyqVybvGQ9xbiYEjWR5yofJX+Iq1ox516WftGyr4sW8Ie2AfXNLpudWx4t2X
	JRqIXSbMnJ+eRCM90j7HHhkid10DD1jSk1pfAhQZT9wWzgEjtfHOCLnktUfh0sAIWCD3waU51vP
	amSMFSlnGlePjivh4RvvGobSDMw7WYg3mtboRQSONkqBrEHQO61asYoWki6QgLcCdCAMR7JtcWb
	Pbds1+exdYUbmGTkA6LV1FvCZWFQE+ntkjLNl0ZfP+6af0bLtxviQJOWDaIKvhqXpbLl8QQhMnE
	oyvo0j/A73ysTI544kxhT6
X-Received: by 2002:a05:6000:2583:b0:472:55a:ef9b with SMTP id ffacd0b85a97d-47df072dfd8mr6559434f8f.8.1783585871101;
        Thu, 09 Jul 2026 01:31:11 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8fb6:1d85:3dc1:42ab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d780csm50316543f8f.11.2026.07.09.01.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:31:10 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 0/9] Add RZ/G3L USB2.0 host support
Date: Thu,  9 Jul 2026 09:30:53 +0100
Message-ID: <20260709083108.108370-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34924-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:p.zabel@pengutronix.de,m:vkoul@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:neil.armstrong@linaro.org,m:yoshihiro.shimoda.uh@renesas.com,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[pengutronix.de,kernel.org,glider.be,baylibre.com,gmail.com];
	FREEMAIL_CC(0.00)[bp.renesas.com,linaro.org,renesas.com,lists.infradead.org,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,vger.kernel.org:from_smtp,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE64172E5A0

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,

This patch series aims to add USB2.0 host support for the RZ/G3L SMARC
EVK. The RZ/G3L USB PHY block is similar to RZ/G3S, but each port
has an OTG controller, unlike RZ/G3S, which has an OTG controller only on
port 1. This series migrates regulator driver to use id-table so there
is hard dependency between reset driver and regulator driver.

Merge strategy:
  An Ack/Rb tag from Regulator Maintainer for patch#4.
  Patch #1,#2,#3,#4 - Reset subsystem
  Patch #5,#6,#7 - PHY subsystem
  Patch #8,#9 - Renesas SoC

v3->v4:
 * Updated cover letter with merge strategy
 * Reorder the phy binding patch for easy merging.
 * Updated the commit description for patch #2,#3, #4.
 * Moved the handling of regulator_driver_name to patch #3
   in preparation for id_table match.
 * Migrated to id_table match using driver_name and reduced the length
   < 24.
 * Dropped rzg3l specific platform driver.
 * Dropped the tag for regulator driver,
 * Added id_table handling by introducing a common probe().
v2->v3:
 * Replaced items->enum in reset controller bindings.
 * Collected the tag for reset binding patch.
 * Dropped clock patch as it is accepted.
v1->v2:
 * Dropped patch#6(Introduce helper for regulator registration)
 * Passing pointer to an array of regulators to make it scalable.
 * Dropped regulator1-vbus and added a regulators group node.
 * Updated commit description for patch#1,#4,#6,#7,#8,#9 and #10.
 * Added enum instead of const in the compatible section.
 * Updated schema check.
 * Collected tag for PHY binding patch.
   in the regulator driver.
 * Added regulators group node and its children in SoC dtsi.

Biju Das (9):
  dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support
  reset: rzg2l-usbphy-ctrl: Introduce info struct for match data
  reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
  regulator: renesas-usb-vbus-regulator: Add RZ/G3L VBUS regulator
    support
  dt-bindings: phy: renesas,usb2-phy: Document RZ/G3L PHY bindings
  phy: renesas: phy-rcar-gen3-usb2: Add RZ/G3L support
  phy: renesas: phy-rcar-gen3-usb2: Fix devm action registration for
    disabled VBUS regulator
  arm64: dts: renesas: r9a08g046: Add USB2.0 device nodes
  arm64: dts: renesas: r9a08g046l48-smarc: Add USB2.0 support

 .../bindings/phy/renesas,usb2-phy.yaml        |   2 +
 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      |  48 +++++++-
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 105 ++++++++++++++++++
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  49 ++++++++
 drivers/phy/renesas/phy-rcar-gen3-usb2.c      |  20 ++--
 .../regulator/renesas-usb-vbus-regulator.c    |  74 +++++++++++-
 drivers/reset/reset-rzg2l-usbphy-ctrl.c       |  44 +++++---
 7 files changed, 316 insertions(+), 26 deletions(-)

-- 
2.43.0


