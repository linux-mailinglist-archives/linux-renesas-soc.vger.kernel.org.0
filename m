Return-Path: <linux-renesas-soc+bounces-32076-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KJaBYDn+Wl1FAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32076-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 14:50:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF914CDEAB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 14:50:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 116DF30AB6C3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 12:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E543B43C059;
	Tue,  5 May 2026 12:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZsgfeJ5j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F0A43636A
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 12:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777984634; cv=none; b=HecZvXebc00fAVo/E+OGppjW5stidsJ3trd7sEW1nPy7b0B3Anyn1TWi/ePbqo8Xr/SRzFwLiH4a9mOFrR8uYeLa/znImI8Nt23jx9qiOMDiglNcQMATTi6Gnfr+Ws5UTmXGpl2H0UnomtltEkA6876nnWw6TuQWjDU+MHzdhXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777984634; c=relaxed/simple;
	bh=fXYtnePBRLtV+M4SHHrrefJnYJ79aRxHuZxbqdakfzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MM/H6x+SBVUJHXuyA+TWmDBvrOmw+CAQaDCUgql6cEWomdWiNSw04XX5KT2WiQQ+yyGTRQ7JLnxkbpis5Bh//zvWYbZNPjC9X8aXbB/6Bvr1PAiMXE41KT1z8XRYFhBGaBdSCpcGkpPIcFK4dwAU3MF4BtV1xZiV6qanX56X9do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZsgfeJ5j; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488b0046078so44722995e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 05:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777984632; x=1778589432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sKnGr22K/Ed7RFCo6QissygXi05auc89BmYlf72LcYQ=;
        b=ZsgfeJ5jGI/yhISdBSH1TWDgJFLomKXfyba5DrDehUzJkhTsPGd6RABMbRZEJEN5Ts
         tICbFaAdiErnN25B05J1Wl62U4MYT5r5Nm0x0qhvstvLuYXFysLHNRTsBPmHwj89KmIj
         5chKY+aWKlZCDia59v9roenVFJX6+6qrAzub8a1cLkcFNDw+nBBeIDf7oGe1rzUS/mIp
         I6uomdejjeb375EB4MTQ6jv40FbyygNWuEdr9mqwo9s1mYPRCldL2t9AksECrxmuZ4bb
         xO/VXl82zR7LsxeaWUZa/KULMnQFROrwZBaZKHZYvhVkR7rmrDnIJiTVu2DsnZVelOre
         9fRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777984632; x=1778589432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sKnGr22K/Ed7RFCo6QissygXi05auc89BmYlf72LcYQ=;
        b=Vg6mKhgch1tH2M9gqeKDdTkYKovRSBlNQp4gvDol0yaAYcIVkGUx20HqaIIafgcLZx
         PgtRjHvxslTmuvCe1Lifw5ly7xKn5CpOrgdoTeQ8fG0zufvmyXJGVzGKl9ZV+K5sp3RH
         vMXz7oHJXDlXbEGs5aMBcs2rouJfpyvAglOOP4cb0BSiCgfg8CKcDC+0guUOZTtm1MYJ
         ae/HYnc236LuZQ7TQUw8mMdSXR7GERDoQY7D7nL3SIAl1v43qRRAO6BlZysq925Uky9u
         KeJWzoccD4dxAcVd8DdRwfUp8BQrFWivMzS1agJqyoeosVjpCHKHdpeTUXwbbh6ETZA1
         EXig==
X-Forwarded-Encrypted: i=1; AFNElJ/pFCVYI0jHxKI3thUe8ZYUJ5S0IgZjRo3kpVER9291jj/rNJr/ftijNiPxrBT8w6TMG/SUepAVg+2Klg2vjAmuNw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9CXOCLjaLzcZ+WVeNEifaJlmRkZxHMoc1nOzxiDtOWOW8qkSe
	kvQ7A0BCO84l++F4E3g7OG5HYrW1FN8n8Wyxd+swxpfYE9XeCbYJLyWC
X-Gm-Gg: AeBDieueTJmdCQPi8mNb/mpoOH2dQ58GIfalFnYL/hJ7NTuPPLP7iZU13L2j6VSth70
	SedOwhoCNLuHaWAE48l6gljBrs7wK1baHxVasYGGN2YTLNVCyrClOmhBIcybWdl07VImAB4p/9l
	nO4QCQPPueLj44zWlXEwVt+B0KqHPzaUS436PEwzT+tIba215xOaYNVqgOO7GGQhKswydaV+NX2
	FAyfUpnokFJlhDag+6MbekX8AWQxan+8mDfVQjEHwAlSq3kGYPHWVeXkg95DyR39wVQATD12xiA
	qhitXPQ08OVFx2tvTDF92ozs1QGa2YQQlRS93KPh4HaHPEvTYUn8/D6jDLsiknbJt3yIA5x0aIZ
	Fk7R+07byO8OXgMJcMfYX73yP1J9GXrxEjL59m2y0YVF1UuCWs6/woxgE8hBmiZVQJoaEmhPPta
	v3+FEzUIjXGUAdTQkimQj9h028nyVPhtM4iTCrjiXd9AILzv3tbifpMiV8590=
X-Received: by 2002:a05:600c:698d:b0:489:ad:7b5b with SMTP id 5b1f17b1804b1-48a9866e8a5mr231113835e9.24.1777984631419;
        Tue, 05 May 2026 05:37:11 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1da3:f63c:84a5:197e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960902sm4703780f8f.28.2026.05.05.05.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:37:11 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/5] Add audio support for RZ/G3L SMARC EVK
Date: Tue,  5 May 2026 13:36:58 +0100
Message-ID: <20260505123708.134069-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1BF914CDEAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32076-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,

This patch series aims to add audio support for the RZ/G3L SMARC EVK
platform using the SSIF-2 interface. PDM/SPDIF support is planned for a
later date.

DMA device nodes have been added to the SoC DTSI so that SSI can use DMA.
SSI0 signals are connected to the DA7212 audio codec on the RZ/G3L SMARC
EVK. These signals are muxed with SD2 signals and are enabled through
the SYS.4 switch on the RZ/G3L SMARC SoM board. The audio clocks and MCK
are provided by the 5P35023B Versa Clock generator.

This patch series depend up on [1] and [2]
[1] https://lore.kernel.org/all/20260505071544.8965-1-biju.das.jz@bp.renesas.com/
[2] https://lore.kernel.org/all/20260505070206.7932-1-biju.das.jz@bp.renesas.com/

Biju Das (5):
  arm64: dts: renesas: r9a08g046: Add DMAC node
  arm64: dts: renesas: r9a08g046: Add SSI support
  arm64: dts: renesas: r9a08g046: Add audio clock nodes
  arm64: dts: renesas: rzg3l-smarc-som: Enable versa clock generator
  arm64: dts: renesas: r9a08g046l48-smarc: Enable audio

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 127 ++++++++++++++++++
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  72 ++++++++++
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     |  42 ++++++
 3 files changed, 241 insertions(+)

-- 
2.43.0


