Return-Path: <linux-renesas-soc+bounces-34895-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8hbFC+57Tmq+NgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34895-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 18:33:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B98B7728C22
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 18:33:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=g6OcfKIu;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34895-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34895-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2EE4F3004D15
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 16:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47EA443440D;
	Wed,  8 Jul 2026 16:33:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D823E432BC1
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jul 2026 16:33:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783528396; cv=none; b=eUSLytFqc0heOvz1yMtH9yFIcU/qBvxrqjseM3YZBoeRFGn1Qbd47qJovZJQxwlgW4Vrzo5ueGwC64ryGLn+FgPGNDpmjvg5Qiv7rVXuAU0OLtxWAhV4xhwm8U6laNsVRX2wmXoN4tPEtuH1FY8xfjCcKDH0WGkwExhz0ZhhP0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783528396; c=relaxed/simple;
	bh=62mslteZhIKHAWAAXWoeCiNpK+rmttXRRahA7/bf/Ss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K4KK1ZMtCeIaWpzy2PdfaCfizPtuomXquZkgzkQcCiP2Yi1pr/FExx2eX+YXbL8s7pzCIBJp4AxOvvqDktgJV30Fo1VNryH3zfbHP6eu+bmH2is6ebOrxg0G1ptttTwaHfI0ms+9BqV3VGFLzxj7aoQkkKUxjbpl3pfezcYQu2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g6OcfKIu; arc=none smtp.client-ip=209.85.221.47
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47d70879764so664528f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Jul 2026 09:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783528393; x=1784133193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ta7U2T72D7YYjRgGX/nLZ9LJda6iOq9oicgwZdyzAQo=;
        b=g6OcfKIuJ7L5EDWtVxMv4dAffNDnG8+aAeJcVXjmHGaqgXXc/Vvx/B/Awxvbyyq1fu
         vgPAyLVz/QU0hApXqdZUQkHEXOW5e9c3E37G0uGEVXzYw2xjKu/oVYdX+nNNutdEEfGc
         mzqq4GMuUXFbws/O9SpgGhXgtoN1tACGOzjRz+TPBYatlqhCVhCNT/bZFYFok8ds6ome
         SRIKnc6s2ImYRJMlc+LVsy8OSv6yb7wwD9ELs/9mWtOSqX+hg74ih5eO4nCQ5yoT1TZ7
         00C+sFwIXoIIscLNnxS9/u9gp6/M0X8wJ2OH/HZOtlmW8Bh+h1xh+mSRhczvvjmdLY7r
         k44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783528393; x=1784133193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ta7U2T72D7YYjRgGX/nLZ9LJda6iOq9oicgwZdyzAQo=;
        b=X5SnYcmJ367SFli/t8n4f7AFMEKovCmndIX6hQVLcsBp1ErqO299QVQ5eLZr8BrQCa
         +59+JG2HDXPaAx63PJrBXbSDtySTa45OLgl6s12xiW8lp6qO4KvbCluseTkQFB6qa/U8
         P3b1lJUnpYySTYbnfKc1bJRwIipzt39Ne+Bz0U1ZR3bbwqKeuks+ek45j0mYEhMyH3US
         7Ig4stgPgCQUY9+ABwY+7xyomhy5XphAdk/aR0IrW2LHh4ucqAbc8l+Y08yWVEiWb4pa
         xr0oo+lPZAxcVVViygm8FIm4PvkAZmWwohclPoT6kLcZ21Ke5T4iS2BiODzNnvtchTAB
         /QYg==
X-Gm-Message-State: AOJu0Yx2atGHWIpRnetbHmBC5BNY6PrsOhkJFuh4+K8YZgJxTOgJPA5W
	OfBwo9CTpk6fFATKYsKwcIotVoiPa8ncMlHfN83iBzvKHcl4PClXJpTs
X-Gm-Gg: AfdE7cmgezXBMMTjrzzKWpRTVmlbP1zSIhDwnrHRFvpU2crSC/NMr+1942EeJlm4s+P
	fHHu6YQe22FR7PCE6pydQPOMcpeIGE78h/G7NUTZPBojSPpY6ZQHYQg20i1brlNM3yyKIbtxTgc
	7iTqI5kvf4GJPGhseT5ugh9kAIoWEH5m6eCJr/hYc7UbUJkLuyjxbHK2HeL9QhEZaWx6VYcmWtG
	D4QaeckM3wgZ0GvgNFf40JepWsF/GnU1ks+z/WU69JI+qCodhmZX47gx6kRCMooErZg06wFjETg
	vYukf9kIuxMn5H6ubQKSHw3m/xFMQJ4wo4IwoUs5cWGFju/1is63r+XVfwtwYA/ewZ4XZI+EU0X
	+rXsRjxnE9m4A4n+WZexnLCNM/prcZ4NGVzw5vtuQxwABMEMAU7F60YV+HFn5GQ+zQcB9jE56qu
	StSV2FBEpVN+HcrlgM8LRYs8YTB9kB+F/7kmdYs2TXIvevHLwAz/xby0eSrnb/JI7bJ6SWruT+Y
	Er4ItGvPeOFkAYkza4IsqNIkIRMzFO7x9sljw==
X-Received: by 2002:a05:6000:2911:b0:46f:9d18:bd3c with SMTP id ffacd0b85a97d-47df07a959bmr3978720f8f.12.1783528393111;
        Wed, 08 Jul 2026 09:33:13 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca98:2759:6fb2:4aa7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm40184167f8f.30.2026.07.08.09.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 09:33:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/2] Add PCIe support to RZ/V2H SoC and EVK
Date: Wed,  8 Jul 2026 17:33:09 +0100
Message-ID: <20260708163311.222176-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34895-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:mid,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B98B7728C22

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds PCIe support to the Renesas RZ/V2H SoC and enables
PCIe on the RZ/V2H EVK. The first patch adds the necessary device tree
nodes for the PCIe controller, while the second patch enables the PCIe
slot on the RZ/V2H EVK.

v1->v2:
- Formatted the ranges property so that the new line entries are aligned.
- Corrected the flag values for dma-ranges property for pcie0/1 nodes.
- Renamed the node name from pcie to pcie0.

v1: https://lore.kernel.org/all/20260602204707.1920839-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Note, the driver and binding patches have landed in linux-next.

Cheers,
Prabhakar

Lad Prabhakar (2):
  arm64: dts: renesas: r9a09g057: Add PCIe nodes
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable PCIe

 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    | 140 ++++++++++++++++++
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  18 +++
 2 files changed, 158 insertions(+)

-- 
2.54.0


