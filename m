Return-Path: <linux-renesas-soc+bounces-28210-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id FGHRJxeakWnlkAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28210-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Feb 2026 11:04:07 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF06413E712
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Feb 2026 11:04:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 386CD300EFBA
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Feb 2026 10:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0BEA2C21FF;
	Sun, 15 Feb 2026 10:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="q1nimjL/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from forward101a.mail.yandex.net (forward101a.mail.yandex.net [178.154.239.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57AD2BDC13;
	Sun, 15 Feb 2026 10:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771149844; cv=none; b=T+NaaicxEai16tka7iaRAjaVde2Ue0uuGsDB6FRXsg4C/vlUBBHxkp8ySeyqtKEjBC1k7e1hIDYw82G+aUaBzt89doMyEKq2qsQiqXKrQcFXDpOYVZ2xfThhIAxRYCfNGqfgQ7ycwhJHhKPxXRl2uhPp/4lGwMxayenWz9V15hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771149844; c=relaxed/simple;
	bh=3hJJxaRxYSXZUNalVOutj/SDXawkK9g3BxWPhqXl3RI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KyCw9e+8SWXzwSj/3YEtow7af7L5SwyzgNywBcATV+53+Er7m4eZk9RSACdpERJAulJN1z8M3mnPsx6HOKJcfgOeLfkR6UOsYNwuKCyQdD4DGu4hgfpu0rtjeuM1PhU0IXvboC87ZfdFTqBb1p6Z8rQwo1cQAif75VMwOJtShZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=q1nimjL/; arc=none smtp.client-ip=178.154.239.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Received: from mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net [IPv6:2a02:6b8:c1f:582e:0:640:200:0])
	by forward101a.mail.yandex.net (Yandex) with ESMTPS id 5A24980C19;
	Sun, 15 Feb 2026 13:03:59 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id j3UBeWUGPiE0-174KJIOk;
	Sun, 15 Feb 2026 13:03:58 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1771149838;
	bh=vPqxk7KVVtQmsF2BOK6gxnUI8JHbF2ALIsBifbaph3M=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=q1nimjL/BPdZqnufns3McNE6iQnXN7+v63gm0oU7nS5uRvsSAUpAJVgByuFGO5Wiw
	 s0YYOsvGar6OJU/pBfAmkETYn3VCMvd7G3oIzV64798raCjU/es31qU/IiYJZowF5g
	 iqePcaYl8A4pXlQGvOqcvaL2mgdmWMhQ4kExrLpE=
Authentication-Results: mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Cc: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v1 1/2] arm64: dts: add missing sram-supply to mali gpu nodes
Date: Sun, 15 Feb 2026 13:02:50 +0300
Message-ID: <20260215100302.136719-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[onurozkan.dev,reject];
	R_DKIM_ALLOW(-0.20)[onurozkan.dev:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28210-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,sholland.org,samsung.com,collabora.com,glider.be,sntech.de,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[work@onurozkan.dev,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[onurozkan.dev:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,onurozkan.dev:mid,onurozkan.dev:dkim,onurozkan.dev:email,0.0.0.0:email,0.0.0.1:email]
X-Rspamd-Queue-Id: AF06413E712
X-Rspamd-Action: no action

Some arm64 Mali GPU DT nodes define mali-supply but
are missing sram-supply.

As discussed in [1], sram-supply should be explicitly
defined for all relevant compatibles. If there is no
separate SRAM rail, it can reference the same regulator
as mali-supply.

This change adds the missing sram-supply properties to
affected DT files. This aligns DTs with expected regulator
modeling and avoids relying on implicit fallback behavior.

[1]: https://lore.kernel.org/all/20260213155937.6af75786@nimda/

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts          | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dts               | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts          | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts           | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi            | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts             | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi               | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi   | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts     | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts           | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h618-longan-module-3h.dtsi  | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts    | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts     | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts  | 1 +
 .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts      | 1 +
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts          | 1 +
 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts           | 1 +
 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts          | 1 +
 arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts        | 1 +
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi            | 1 +
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts                  | 1 +
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts                      | 1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi                   | 1 +
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts                  | 1 +
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi                 | 1 +
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi                  | 1 +
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi                 | 1 +
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi                  | 1 +
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts                      | 1 +
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi            | 1 +
 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi         | 1 +
 arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi            | 1 +
 arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts    | 1 +
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts            | 1 +
 arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts              | 1 +
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts           | 1 +
 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts           | 1 +
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi                 | 1 +
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi                | 1 +
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi                 | 1 +
 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi                     | 1 +
 arch/arm64/boot/dts/rockchip/px30-evb.dts                        | 1 +
 arch/arm64/boot/dts/rockchip/px30-firefly-jd4-core.dtsi          | 1 +
 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi                    | 1 +
 arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dts                  | 1 +
 arch/arm64/boot/dts/rockchip/rk3326-anbernic-rg351m.dtsi         | 1 +
 arch/arm64/boot/dts/rockchip/rk3326-gameforce-chi.dts            | 1 +
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go.dtsi               | 1 +
 arch/arm64/boot/dts/rockchip/rk3328-a1.dts                       | 1 +
 arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi                     | 1 +
 arch/arm64/boot/dts/rockchip/rk3328-rock64.dts                   | 1 +
 arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts                | 1 +
 arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts                  | 1 +
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts                  | 1 +
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi                     | 1 +
 arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts               | 1 +
 arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dtsi             | 1 +
 arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts                | 1 +
 arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi                 | 1 +
 arch/arm64/boot/dts/rockchip/rk3399-orangepi.dts                 | 1 +
 arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts             | 1 +
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts            | 1 +
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi                    | 1 +
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi                  | 1 +
 arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts             | 1 +
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi               | 1 +
 arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi                 | 1 +
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi               | 1 +
 arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi                | 1 +
 arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts             | 1 +
 arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts             | 1 +
 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts               | 1 +
 arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi                  | 1 +
 arch/arm64/boot/dts/rockchip/rk3566-anbernic-rgxx3.dtsi          | 1 +
 arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi         | 1 +
 arch/arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dts               | 1 +
 arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dts               | 1 +
 arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dts               | 1 +
 arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dts               | 1 +
 arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b.dtsi             | 1 +
 arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi                | 1 +
 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dtsi         | 1 +
 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dts             | 1 +
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts               | 1 +
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts               | 1 +
 arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3.dtsi               | 1 +
 arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi            | 1 +
 arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts                   | 1 +
 arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dts                  | 1 +
 arch/arm64/boot/dts/rockchip/rk3566-soquartz.dtsi                | 1 +
 arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts         | 1 +
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts               | 1 +
 arch/arm64/boot/dts/rockchip/rk3568-easepi-r1.dts                | 1 +
 arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts                 | 1 +
 arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r66s.dtsi          | 1 +
 arch/arm64/boot/dts/rockchip/rk3568-hinlink-opc.dtsi             | 1 +
 arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dts               | 1 +
 arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dts                   | 1 +
 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtsi              | 1 +
 arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts                | 1 +
 arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts               | 1 +
 arch/arm64/boot/dts/rockchip/rk3568-qnap-tsx33.dtsi              | 1 +
 arch/arm64/boot/dts/rockchip/rk3568-radxa-cm3i.dtsi              | 1 +
 arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dts                   | 1 +
 arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dts                  | 1 +
 arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts                  | 1 +
 arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5.dts           | 1 +
 arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts        | 1 +
 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts             | 1 +
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts                 | 1 +
 arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi        | 1 +
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts                | 1 +
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts              | 1 +
 arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts                   | 1 +
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts                  | 1 +
 arch/arm64/boot/dts/rockchip/rk3588-armsom-lm7.dtsi              | 1 +
 arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts             | 1 +
 arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi              | 1 +
 arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts              | 1 +
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts                   | 1 +
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi               | 1 +
 arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dts                 | 1 +
 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi              | 1 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts               | 1 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi          | 1 +
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi                   | 1 +
 arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi              | 1 +
 arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts               | 1 +
 arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts           | 1 +
 arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts         | 1 +
 arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts            | 1 +
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi              | 1 +
 arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts               | 1 +
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi             | 1 +
 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts                  | 1 +
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts                 | 1 +
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts                 | 1 +
 137 files changed, 137 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts b/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts
index 7906b79c0389..c2fde0f12e32 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts
@@ -81,6 +81,7 @@ &ehci0 {
 
 &gpu {
 	mali-supply = <&reg_dcdc1>;
+	sram-supply = <&reg_dcdc1>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dts b/arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dts
index b2275eb3d55b..25d68ad4c2fb 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dts
@@ -76,6 +76,7 @@ &ehci3 {
 
 &gpu {
 	mali-supply = <&reg_dcdcc>;
+	sram-supply = <&reg_dcdcc>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
index 2c64d834a2c4..d7b556eab5ad 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
@@ -106,6 +106,7 @@ &emac {
 
 &gpu {
 	mali-supply = <&reg_dcdcc>;
+	sram-supply = <&reg_dcdcc>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
index dc7381c944c9..069487d372c5 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
@@ -115,6 +115,7 @@ &ehci3 {
 
 &gpu {
 	mali-supply = <&reg_dcdcc>;
+	sram-supply = <&reg_dcdcc>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
index e34dbb992021..b77ef2c7dc7c 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
@@ -78,6 +78,7 @@ &ehci3 {
 
 &gpu {
 	mali-supply = <&reg_dcdcc>;
+	sram-supply = <&reg_dcdcc>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
index fa7a765ee828..fd880a2a01fb 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
@@ -110,6 +110,7 @@ &emac {
 
 &gpu {
 	mali-supply = <&reg_dcdcc>;
+	sram-supply = <&reg_dcdcc>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
index bb7de37c0d58..e9d386d967ab 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
@@ -106,6 +106,7 @@ &ehci3 {
 
 &gpu {
 	mali-supply = <&reg_vdd_cpu_gpu>;
+	sram-supply = <&reg_vdd_cpu_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi
index bebfeb2a337a..b5493da7e0d9 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi
@@ -69,6 +69,7 @@ &cpu0 {
 
 &gpu {
 	mali-supply = <&reg_dcdc1>;
+	sram-supply = <&reg_dcdc1>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
index f2e3300e078a..a1d79994f5c8 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
@@ -26,6 +26,7 @@ &emac0 {
 
 &gpu {
 	mali-supply = <&reg_dcdcc>;
+	sram-supply = <&reg_dcdcc>;
 };
 
 &mmc0 {
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts
index 085f3e4e8eaa..9ecb5fb2b3fd 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts
@@ -52,6 +52,7 @@ &ehci2 {
 
 &gpu {
 	mali-supply = <&reg_dcdcc>;
+	sram-supply = <&reg_dcdcc>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-longan-module-3h.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h618-longan-module-3h.dtsi
index 3f416d129b72..f2d5ac3d742e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-longan-module-3h.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-longan-module-3h.dtsi
@@ -12,6 +12,7 @@ &cpu0 {
 
 &gpu {
 	mali-supply = <&reg_dcdc1>;
+	sram-supply = <&reg_dcdc1>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
index b340bbcb710d..c838d9a96b03 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
@@ -71,6 +71,7 @@ &ehci1 {
 
 &gpu {
 	mali-supply = <&reg_dcdc1>;
+	sram-supply = <&reg_dcdc1>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
index c51d4d9120de..1eb6f9812ddb 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
@@ -29,6 +29,7 @@ &ext_rgmii_phy {
 
 &gpu {
 	mali-supply = <&reg_dcdc1>;
+	sram-supply = <&reg_dcdc1>;
 };
 
 &mmc0 {
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
index efe0faa252f5..ccbb9861733f 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
@@ -71,6 +71,7 @@ &ehci1 {
 
 &gpu {
 	mali-supply = <&reg_dcdc1>;
+	sram-supply = <&reg_dcdc1>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
index 1a750c5f6fac..9258e44c74f9 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
@@ -202,6 +202,7 @@ &ehci0 {
 
 &gpu {
 	mali-supply = <&reg_dcdc2>;
+	sram-supply = <&reg_dcdc2>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
index bfdf1728cd14..e15520b6ac60 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
@@ -98,6 +98,7 @@ &gmac1 {
 
 &gpu {
 	mali-supply = <&reg_dcdc2>;
+	sram-supply = <&reg_dcdc2>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index a96927fbdadd..57965327dee4 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -56,6 +56,7 @@ &ehci1 {
 
 &gpu {
 	mali-supply = <&reg_dcdc2>;
+	sram-supply = <&reg_dcdc2>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 054d0357c139..9c44af6aafe7 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -96,6 +96,7 @@ &gmac1 {
 
 &gpu {
 	mali-supply = <&reg_dcdc2>;
+	sram-supply = <&reg_dcdc2>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
index 9e6b21cf293e..db518f9de9e7 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
@@ -116,6 +116,7 @@ &gmac1 {
 
 &gpu {
 	mali-supply = <&reg_dcdc2>;
+	sram-supply = <&reg_dcdc2>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index a1fb354dea9f..aba7f7325d8c 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -356,6 +356,7 @@ &dsi {
 
 &gpu {
 	mali-supply = <&buck6_reg>;
+	sram-supply = <&buck6_reg>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
index 1f2eddcebdd9..2c449636dacc 100644
--- a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
@@ -61,6 +61,7 @@ &fin_pll {
 
 &gpu {
 	mali-supply = <&buck6_reg>;
+	sram-supply = <&buck6_reg>;
 };
 
 &serial_2 {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
index f04baea5d6cb..4b32f7c86e58 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
@@ -53,6 +53,7 @@ &auxadc {
 
 &gpu {
 	mali-supply = <&mt6358_vgpu_reg>;
+	sram-supply = <&mt6358_vgpu_reg>;
 };
 
 &i2c0 {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 4b87d4940c8c..a26765e82925 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -260,6 +260,7 @@ &gic {
 
 &gpu {
 	mali-supply = <&mt6358_vgpu_reg>;
+	sram-supply = <&mt6358_vgpu_reg>;
 };
 
 &i2c0 {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index f60ef3e53a09..3bf54ac3a32b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -83,6 +83,7 @@ &auxadc {
 
 &gpu {
 	mali-supply = <&mt6358_vgpu_reg>;
+	sram-supply = <&mt6358_vgpu_reg>;
 };
 
 &i2c0 {
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
index ff20376a44d7..6b2393d1c09e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -379,6 +379,7 @@ &gic {
 
 &gpu {
 	mali-supply = <&mt6366_vgpu_reg>;
+	sram-supply = <&mt6366_vgpu_reg>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index 7fedbacdac44..331d3f874081 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -416,6 +416,7 @@ dptx_out: endpoint {
 
 &gpu {
 	mali-supply = <&mt6359_vproc2_buck_reg>;
+	sram-supply = <&mt6359_vproc2_buck_reg>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 0b4664f044a1..38dc45a95db7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -301,6 +301,7 @@ &gic {
 
 &gpu {
 	mali-supply = <&mt6315_7_vbuck1>;
+	sram-supply = <&mt6315_7_vbuck1>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index b3761b80cac7..54ce2a420eee 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -490,6 +490,7 @@ &gic {
 &gpu {
 	status = "okay";
 	mali-supply = <&mt6315_7_vbuck1>;
+	sram-supply = <&mt6315_7_vbuck1>;
 };
 
 &i2c0 {
diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index b5dd5ef9fa11..67bc6c35cf59 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -286,6 +286,7 @@ eth_phy: ethernet-phy@0 {
 
 &gpu {
 	mali-supply = <&mt6357_vcore_reg>;
+	sram-supply = <&mt6357_vcore_reg>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index a2cdecd2b903..4c3d83bd9a83 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -334,6 +334,7 @@ &gamma0_out {
 
 &gpu {
 	mali-supply = <&mt6359_vproc2_buck_reg>;
+	sram-supply = <&mt6359_vproc2_buck_reg>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
index 888248a75e93..1c4c668ee979 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
@@ -507,6 +507,7 @@ &scp_c0 {
 
 &gpu {
 	mali-supply = <&mt6359_vproc2_buck_reg>;
+	sram-supply = <&mt6359_vproc2_buck_reg>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
index 2b7167804e71..ed7125c6cb38 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
@@ -319,6 +319,7 @@ &gamma0_out {
 
 &gpu {
 	mali-supply = <&mt6315_7_vbuck1>;
+	sram-supply = <&mt6315_7_vbuck1>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
index d16f545cbbb2..5096305f9415 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
@@ -289,6 +289,7 @@ ethernet_phy0: ethernet-phy@1 {
 &gpu {
 	status = "okay";
 	mali-supply = <&mt6315_7_vbuck1>;
+	sram-supply = <&mt6315_7_vbuck1>;
 };
 
 /* CSI1/CSI2 connector */
diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index d32f973f5e05..2a2a32bf4ece 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -267,6 +267,7 @@ rgmii_phy: ethernet-phy@1 {
 
 &gpu {
 	mali-supply = <&mt6315_7_vbuck1>;
+	sram-supply = <&mt6315_7_vbuck1>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts b/arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts
index 3267e7b75b58..6b7cadb92cdb 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts
+++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts
@@ -145,6 +145,7 @@ &extal_clk {
 
 &gpu {
 	mali-supply = <&reg_1p1v>;
+	sram-supply = <&reg_1p1v>;
 };
 
 &i2c0 {
diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
index 066e66b5d51a..04bb0b23b17b 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -112,6 +112,7 @@ &eth1 {
 &gpu {
 	status = "okay";
 	mali-supply = <&reg_0p8v>;
+	sram-supply = <&reg_0p8v>;
 };
 
 &hsusb {
diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 445fce156f73..69390bbd448a 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -137,6 +137,7 @@ &eth1 {
 &gpu {
 	status = "okay";
 	mali-supply = <&reg_0p8v>;
+	sram-supply = <&reg_0p8v>;
 };
 
 &hsusb {
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
index d511e152d7c6..6231ce279fda 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
@@ -151,6 +151,7 @@ &extal_clk {
 
 &gpu {
 	mali-supply = <&reg_1p1v>;
+	sram-supply = <&reg_1p1v>;
 };
 
 &i2c3 {
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
index 3e8909a872e3..b975b9a684d6 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
@@ -104,6 +104,7 @@ &extal_clk {
 
 &gpu {
 	mali-supply = <&reg_1p1v>;
+	sram-supply = <&reg_1p1v>;
 };
 
 &i2c2 {
diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index 7faa44510d98..43fc4d7f8386 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -100,6 +100,7 @@ &eth1 {
 &gpu {
 	status = "okay";
 	mali-supply = <&reg_vdd0p8v_others>;
+	sram-supply = <&reg_vdd0p8v_others>;
 };
 
 &i2c2 {
diff --git a/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi b/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
index b7e669d8ba4d..fd4f1caeaedb 100644
--- a/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
@@ -142,6 +142,7 @@ &gmac {
 
 &gpu {
 	mali-supply = <&vdd_log>;
+	sram-supply = <&vdd_log>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/px30-evb.dts b/arch/arm64/boot/dts/rockchip/px30-evb.dts
index 85d1642eb9be..8885a4433cea 100644
--- a/arch/arm64/boot/dts/rockchip/px30-evb.dts
+++ b/arch/arm64/boot/dts/rockchip/px30-evb.dts
@@ -178,6 +178,7 @@ &gmac {
 
 &gpu {
 	mali-supply = <&vdd_log>;
+	sram-supply = <&vdd_log>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/px30-firefly-jd4-core.dtsi b/arch/arm64/boot/dts/rockchip/px30-firefly-jd4-core.dtsi
index 1ad0e52a64ab..532f4adf0a25 100644
--- a/arch/arm64/boot/dts/rockchip/px30-firefly-jd4-core.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-firefly-jd4-core.dtsi
@@ -57,6 +57,7 @@ &emmc {
 
 &gpu {
 	mali-supply = <&vdd_log>;
+	sram-supply = <&vdd_log>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi b/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
index 192791993f05..710a85065836 100644
--- a/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
@@ -163,6 +163,7 @@ &emmc {
 
 &gpu {
 	mali-supply = <&vdd_log>;
+	sram-supply = <&vdd_log>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dts b/arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dts
index 3566c14850c6..8d6b743443c0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dts
@@ -191,6 +191,7 @@ &gmac2phy {
 
 &gpu {
 	mali-supply = <&vdd_log>;
+	sram-supply = <&vdd_log>;
 };
 
 &hdmi {
diff --git a/arch/arm64/boot/dts/rockchip/rk3326-anbernic-rg351m.dtsi b/arch/arm64/boot/dts/rockchip/rk3326-anbernic-rg351m.dtsi
index 54395a40b087..cd9843c9d335 100644
--- a/arch/arm64/boot/dts/rockchip/rk3326-anbernic-rg351m.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3326-anbernic-rg351m.dtsi
@@ -151,6 +151,7 @@ &dsi_dphy {
 
 &gpu {
 	mali-supply = <&vdd_logic>;
+	sram-supply = <&vdd_logic>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3326-gameforce-chi.dts b/arch/arm64/boot/dts/rockchip/rk3326-gameforce-chi.dts
index 4d306085646c..6706fa04e64d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3326-gameforce-chi.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3326-gameforce-chi.dts
@@ -358,6 +358,7 @@ &dsi_dphy {
 
 &gpu {
 	mali-supply = <&vdd_logic>;
+	sram-supply = <&vdd_logic>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go.dtsi b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go.dtsi
index bf4554eff47d..457840a78f03 100644
--- a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go.dtsi
@@ -254,6 +254,7 @@ &dsi_dphy {
 
 &gpu {
 	mali-supply = <&vdd_logic>;
+	sram-supply = <&vdd_logic>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3328-a1.dts b/arch/arm64/boot/dts/rockchip/rk3328-a1.dts
index 30bdb38f0727..73786851f77a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-a1.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-a1.dts
@@ -149,6 +149,7 @@ rtl8211f: ethernet-phy@0 {
 
 &gpu {
 	mali-supply = <&vdd_logic>;
+	sram-supply = <&vdd_logic>;
 };
 
 &hdmi {
diff --git a/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi b/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
index 7d62a3e96b19..bc7f14ef4fb6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
@@ -169,6 +169,7 @@ &gmac2io {
 
 &gpu {
 	mali-supply = <&vdd_logic>;
+	sram-supply = <&vdd_logic>;
 };
 
 &hdmi {
diff --git a/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts b/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
index 592fd8ca21df..d5aba8b49d81 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
@@ -154,6 +154,7 @@ &gmac2io {
 
 &gpu {
 	mali-supply = <&vdd_logic>;
+	sram-supply = <&vdd_logic>;
 };
 
 &hdmi {
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts b/arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts
index b90bf26b58be..b1a59f24a9f8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts
@@ -289,6 +289,7 @@ &gmac {
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts b/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
index 70aee1ab904c..8d738d0509fd 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
@@ -61,6 +61,7 @@ &emmc_phy {
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
index 0568dfa140b3..b088d3dac2e9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
@@ -301,6 +301,7 @@ &gmac {
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
index 7eca1da78cff..8f2e36ac3667 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
@@ -406,6 +406,7 @@ &emmc_phy {
 
 &gpu {
 	mali-supply = <&ppvar_gpu>;
+	sram-supply = <&ppvar_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts b/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
index 352c8efb37e0..1405298cefb4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
@@ -189,6 +189,7 @@ &gmac {
 &gpu {
 	status = "okay";
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 };
 
 &hdmi {
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dtsi
index 880c24084952..96ceda94784f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dtsi
@@ -252,6 +252,7 @@ &gmac {
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts b/arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts
index 2cdc2013c320..b4b51bea48d1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts
@@ -158,6 +158,7 @@ &gmac {
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi
index c8eb5481f43d..c2dc4ecefd88 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi
@@ -202,6 +202,7 @@ rtl8211e: ethernet-phy@1 {
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-orangepi.dts b/arch/arm64/boot/dts/rockchip/rk3399-orangepi.dts
index 2ddd4da15597..0c810ed8f95b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-orangepi.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-orangepi.dts
@@ -235,6 +235,7 @@ rtl8211e: ethernet-phy@1 {
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
index 810ab6ff4e67..7248010f8a74 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
@@ -418,6 +418,7 @@ &emmc_phy {
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index 5de964d369b0..bdf58a267ede 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -243,6 +243,7 @@ &emmc_phy {
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
index 8299e9d10c7c..cb6a0c5c61e6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
@@ -177,6 +177,7 @@ &gmac {
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi
index fc9279627ef6..0a8555992b61 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi
@@ -267,6 +267,7 @@ &gmac {
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts b/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts
index 6d52e3723a4e..8b1057a96887 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts
@@ -187,6 +187,7 @@ &gmac {
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi
index 046dbe329017..0726617629ff 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi
@@ -214,6 +214,7 @@ &gmac {
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
index 7b1086682d11..9f41cfc0319a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
@@ -123,6 +123,7 @@ &emmc_phy {
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi
index 8b72ae6449c9..530a9d2f0205 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi
@@ -319,6 +319,7 @@ &hdmi_sound {
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi
index e5c4addb4837..474e8bdce8f9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi
@@ -206,6 +206,7 @@ &gmac {
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts b/arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts
index 6e21579365a5..4116983b9fa1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts
@@ -261,6 +261,7 @@ &gmac1 {
 
 &gpu {
 	mali-supply = <&vdd_logic>;
+	sram-supply = <&vdd_logic>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
index 9f683033c5f3..3f2584610ce7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
@@ -221,6 +221,7 @@ &gmac1 {
 
 &gpu {
 	mali-supply = <&vdd_logic>;
+	sram-supply = <&vdd_logic>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
index b32452756155..51ab95e2d3bb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
@@ -204,6 +204,7 @@ &gmac1 {
 
 &gpu {
 	mali-supply = <&vdd_logic>;
+	sram-supply = <&vdd_logic>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi b/arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi
index aedc7ee9ee46..b984b228b7e4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi
@@ -184,6 +184,7 @@ &cpu3 {
 
 &gpu {
 	mali-supply = <&vdd_logic>;
+	sram-supply = <&vdd_logic>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rgxx3.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rgxx3.dtsi
index 645db9d3d297..669959e87085 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rgxx3.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rgxx3.dtsi
@@ -223,6 +223,7 @@ &cpu3 {
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
index b6cf03a7ba66..9bef8d87123c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
@@ -280,6 +280,7 @@ rgmii_phy0: phy@0 {
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dts b/arch/arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dts
index ed65d3120444..95db6314e47e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dts
@@ -187,6 +187,7 @@ &cpu3 {
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dts b/arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dts
index ddf84c2a19cf..583d6ac9ff42 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dts
@@ -143,6 +143,7 @@ &cpu3 {
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dts b/arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dts
index fb1f65c86883..56f107e6711c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dts
@@ -154,6 +154,7 @@ &gmac1m0_rgmii_clk_level2
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dts b/arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dts
index 33bc5249d729..59eb930dce7d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dts
@@ -193,6 +193,7 @@ &gmac1m1_rgmii_bus
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b.dtsi
index e2f0ccc6dbe7..5ab2d51e7a31 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b.dtsi
@@ -169,6 +169,7 @@ &gmac1m0_rgmii_bus
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi
index 08bf40de17ea..c39105aa1e3c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi
@@ -311,6 +311,7 @@ &dsi_dphy0 {
 
 &gpu {
 	mali-supply = <&vdd_gpu_npu>;
+	sram-supply = <&vdd_gpu_npu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dtsi
index bd332714a023..9d5d265c9962 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dtsi
@@ -382,6 +382,7 @@ &dsi_dphy0 {
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dts b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dts
index e274f7bf9dfb..a4936f7be31b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dts
@@ -416,6 +416,7 @@ mipi_in_panel: endpoint {
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts b/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
index a9021c524afb..742f59a79419 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
@@ -294,6 +294,7 @@ &gmac1m0_clkinout
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts b/arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts
index f8cf03380636..db9c7b3c13df 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts
@@ -201,6 +201,7 @@ &gmac1m1_clkinout
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3.dtsi
index 8453f06c261c..669f82a03d08 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3.dtsi
@@ -95,6 +95,7 @@ &cpu3 {
 
 &gpu {
 	mali-supply = <&vdd_gpu_npu>;
+	sram-supply = <&vdd_gpu_npu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi
index 1ee5d96a46a1..070e396ec2f5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi
@@ -179,6 +179,7 @@ &gpio4 {
 
 &gpu {
 	mali-supply = <&vdd_gpu_npu>;
+	sram-supply = <&vdd_gpu_npu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts b/arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts
index 7e499064e035..f91a0862910d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts
@@ -196,6 +196,7 @@ &gmac1m0_clkinout
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dts b/arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dts
index 80ac40555e02..56b16d0c6a1b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dts
@@ -205,6 +205,7 @@ &gmac1m1_rgmii_bus
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-soquartz.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-soquartz.dtsi
index 6b9aa0e1ad21..9ab51f4eb3bd 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-soquartz.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-soquartz.dtsi
@@ -159,6 +159,7 @@ nextrst-hog {
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts b/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts
index 4db00489be40..83acf407a688 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts
@@ -300,6 +300,7 @@ &gmac1m1_rgmii_clk
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
index 4d3ebe50b90b..3dbec5b58cd5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
@@ -255,6 +255,7 @@ &gmac1m1_rgmii_clk
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-easepi-r1.dts b/arch/arm64/boot/dts/rockchip/rk3568-easepi-r1.dts
index 12225b631eb6..39b92d1841b3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-easepi-r1.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-easepi-r1.dts
@@ -193,6 +193,7 @@ &gmac1m1_rgmii_clk
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
index b01f952b640e..0381d04fe78e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
@@ -268,6 +268,7 @@ &gmac1m1_rgmii_clk
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r66s.dtsi b/arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r66s.dtsi
index b0ac1e58a352..52400401342b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r66s.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r66s.dtsi
@@ -121,6 +121,7 @@ &display_subsystem {
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-hinlink-opc.dtsi b/arch/arm64/boot/dts/rockchip/rk3568-hinlink-opc.dtsi
index 14f3839ca091..55b920fa0dad 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-hinlink-opc.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3568-hinlink-opc.dtsi
@@ -180,6 +180,7 @@ &cpu3 {
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dts b/arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dts
index a7fe5655a85d..5c97849e6b9d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dts
@@ -166,6 +166,7 @@ &cpu3 {
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dts b/arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dts
index b1f185a58902..0f124b4ac2d4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dts
@@ -149,6 +149,7 @@ &gmac1m1_clkinout
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtsi b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtsi
index e3f44ea4eabe..9e38fdda6eda 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtsi
@@ -177,6 +177,7 @@ &cpu3 {
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts b/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
index 442a2bc43ba8..99922399141f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
@@ -216,6 +216,7 @@ &gmac0_rgmii_clk
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 58c1052ba8ef..7195272544aa 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -285,6 +285,7 @@ &gmac1m1_rgmii_clk
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-qnap-tsx33.dtsi b/arch/arm64/boot/dts/rockchip/rk3568-qnap-tsx33.dtsi
index f009275c72c8..d641c801a5e0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-qnap-tsx33.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3568-qnap-tsx33.dtsi
@@ -189,6 +189,7 @@ map3 {
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-radxa-cm3i.dtsi b/arch/arm64/boot/dts/rockchip/rk3568-radxa-cm3i.dtsi
index 729e38b9f620..6bdb6aecc095 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-radxa-cm3i.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3568-radxa-cm3i.dtsi
@@ -110,6 +110,7 @@ &cpu3 {
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dts b/arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dts
index 60faa0c80cd7..cd0da40060bb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dts
@@ -219,6 +219,7 @@ &gmac1m1_rgmii_bus
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dts
index 44cfdfeed668..cbcaeeb4a760 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dts
@@ -274,6 +274,7 @@ &gmac1m1_clkinout
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
index 3d0c1ccfaa79..de4616977bcc 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
@@ -216,6 +216,7 @@ &gmac1m1_rgmii_bus
 
 &gpu {
 	mali-supply = <&vdd_gpu>;
+	sram-supply = <&vdd_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5.dts b/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5.dts
index bb33fabae16e..578d45c2f49c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5.dts
@@ -146,6 +146,7 @@ &cpu3 {
 
 &gpu {
 	mali-supply = <&vcc0v9_gpu>;
+	sram-supply = <&vcc0v9_gpu>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts b/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
index b19f9b6be6bf..83c6a0be7a15 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
@@ -274,6 +274,7 @@ &eth1m0_rgmii_clk
 
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
+	sram-supply = <&vdd_gpu_s0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index 3386084f6318..3d4799f3ec85 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -308,6 +308,7 @@ &eth1m0_rgmii_clk
 
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
+	sram-supply = <&vdd_gpu_s0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
index db8fef7a4f1b..e8b4a324c094 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
@@ -296,6 +296,7 @@ &eth1m0_rgmii_bus
 
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
+	sram-supply = <&vdd_gpu_s0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
index 9187012d6fa4..d4342986e285 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
@@ -227,6 +227,7 @@ &cpu_l3 {
 
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
+	sram-supply = <&vdd_gpu_s0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
index bb2cc2814b83..984cbbe39c8f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
@@ -307,6 +307,7 @@ &gmac1 {
 
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
+	sram-supply = <&vdd_gpu_s0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
index 31fbefaeceab..173082610cb6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
@@ -236,6 +236,7 @@ &cpu_l3 {
 
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
+	sram-supply = <&vdd_gpu_s0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts b/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts
index d0ab1d1e0e11..f436d7bc3c5a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts
@@ -263,6 +263,7 @@ &cpu_b3 {
 
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
+	sram-supply = <&vdd_gpu_s0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
index 7023dc326d0e..dd3647414b7d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
@@ -285,6 +285,7 @@ &eth0m0_rgmii_bus
 
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
+	sram-supply = <&vdd_gpu_s0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-armsom-lm7.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-armsom-lm7.dtsi
index e44125e9a8fb..aa8ff9c35b5b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-armsom-lm7.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-armsom-lm7.dtsi
@@ -71,6 +71,7 @@ &cpu_l3 {
 
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
+	sram-supply = <&vdd_gpu_s0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts b/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
index 39197ee19837..2398c7ebde96 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
@@ -173,6 +173,7 @@ &cpu_l3 {
 
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
+	sram-supply = <&vdd_gpu_s0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi
index b07543315f87..2407709e9dd5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi
@@ -138,6 +138,7 @@ &gmac0_rgmii_clk
 
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
+	sram-supply = <&vdd_gpu_s0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts b/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
index 73d8ce4fde2b..7b3f81cb8e23 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
@@ -206,6 +206,7 @@ &cpu_l3 {
 
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
+	sram-supply = <&vdd_gpu_s0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
index 176925d0a1a8..4057303f2e94 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
@@ -282,6 +282,7 @@ mdot2e-w-disable2-n-hog {
 
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
+	sram-supply = <&vdd_gpu_s0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index fafeabe9adf9..5f524009345b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -348,6 +348,7 @@ &gpio4 {
 
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
+	sram-supply = <&vdd_gpu_s0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dts b/arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dts
index fbe1d5c06d90..003e08b00d03 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dts
@@ -200,6 +200,7 @@ &gmac1_rgmii_clk
 
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
+	sram-supply = <&vdd_gpu_s0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
index 3bceee948458..3515f3b84600 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
@@ -215,6 +215,7 @@ &cpu_l3 {
 
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
+	sram-supply = <&vdd_gpu_s0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
index 172aeabba72a..e46e28c557ca 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
@@ -324,6 +324,7 @@ dp1_out_con: endpoint {
 
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
+	sram-supply = <&vdd_gpu_s0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
index b3e76ad2d869..95e57637e8af 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
@@ -179,6 +179,7 @@ &cpu_l3 {
 
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
+	sram-supply = <&vdd_gpu_s0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
index 365c1d958f2d..da2b2ebfd22c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
@@ -151,6 +151,7 @@ &eth0_pins
 
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
+	sram-supply = <&vdd_gpu_s0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
index 6daea8961fdd..0bdf12d80dc9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
@@ -118,6 +118,7 @@ &gmac1_rgmii_clk
 
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
+	sram-supply = <&vdd_gpu_s0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts b/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
index 189444d20779..19d5717a6fa2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
@@ -247,6 +247,7 @@ dp0_out_con: endpoint {
 
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
+	sram-supply = <&vdd_gpu_s0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts b/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
index 21eb003198fe..b9b1b6c154ae 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
@@ -495,6 +495,7 @@ dsi0_out_panel: endpoint {
 
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
+	sram-supply = <&vdd_gpu_s0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts b/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
index 174d299cc6bb..f79747ff7204 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
@@ -273,6 +273,7 @@ &gpio4 {
 
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
+	sram-supply = <&vdd_gpu_s0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts b/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
index 2c22abaf40a8..2d1019555e77 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
@@ -190,6 +190,7 @@ &combphy2_psu {
 
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
+	sram-supply = <&vdd_gpu_s0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index 1b6a59f7cabc..8d37af811904 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -232,6 +232,7 @@ &gmac1_rgmii_clk
 
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
+	sram-supply = <&vdd_gpu_s0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts b/arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts
index a72063c55140..034c47a6d2b2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts
@@ -245,6 +245,7 @@ &gmac1_rgmii_bus
 
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
+	sram-supply = <&vdd_gpu_s0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
index dafad29f9854..981f1c826e80 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
@@ -177,6 +177,7 @@ &gmac1_rgmii_clk
 
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
+	sram-supply = <&vdd_gpu_s0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts b/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
index 7e179862da6e..ddee29658fa6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
@@ -220,6 +220,7 @@ &gmac1_rgmii_clk
 
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
+	sram-supply = <&vdd_gpu_s0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts
index 045a853d39ec..3a45cba725d1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts
@@ -187,6 +187,7 @@ &cpu_l3 {
 
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
+	sram-supply = <&vdd_gpu_s0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
index b837c4e08cec..cf4ac6b2254b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
@@ -254,6 +254,7 @@ &gmac1_rgmii_bus
 
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
+	sram-supply = <&vdd_gpu_s0>;
 	status = "okay";
 };
 
-- 
2.51.2


