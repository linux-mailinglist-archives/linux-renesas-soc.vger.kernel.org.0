Return-Path: <linux-renesas-soc+bounces-26109-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 24793CDCF89
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 18:53:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C61A30492A8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 17:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF46A329E51;
	Wed, 24 Dec 2025 17:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MxSccDkV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED4C328B55
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 17:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766598741; cv=none; b=ghkXVXgM+c+GUvpB+P8NiQ+BtxN/vGDIT1VA77d7vh9kwAqIQphLF5cpuanzmTlJET1OpTCVZe2pH8YV0xlHgqUaHPCprYLk4ueqr7tQ74SFf73ixvFAb/4kii8LC40QLB0KBOU+c+pH470/KEATUsdxXql3K6FLOwBiwicXlL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766598741; c=relaxed/simple;
	bh=eT+9QgCFPZlap63qnp3orXT7fSowMWjsilOcxggP40A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EcY8NDt+cHn8AwhAU19bm9nOoz1ABrsV86zDiRCBxfefYTBZX3eNuxFTrJIsmOjIx+hrQtEr9rbPOEM4UJV8b3Mcdwo3QLZdVQYIXnVhg3wW+xWE2QJewN6yn3KxeaZeY1y4vrhNdTno2YQokKwBkqe/RO7l4IaSmCHPOXlbqS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MxSccDkV; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47d3ffa6720so4506805e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 09:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766598738; x=1767203538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m0OaNkMXVXZZ6oeYQY6wBKIQ8q3WHAsulgnB8VJrqL4=;
        b=MxSccDkVw+uUTCWVSQ+7l2ZEjGLE1uvX5R7v8tBLsYNbf9N4wzC0LNZDk7AtyVS4+G
         SYO2QY6gpCrZ8QcC8QeD2YpvAQL4dBq0+uURK02DyywpYqmZAVbu6x85Wk7PmHXCMC76
         arUy6ifTpLZt3t6/6c6oQ6DJJ2cy7QUuY6Tk5pDiius5ku6aFSrA3iV1nkhzGgOsYdyx
         bi0vNhu9WCATtSAOUL0KQMCzw/trkeQmrA0cy2pfxTV9hLLlvZ602D2bb52Bg0ANxDgQ
         KaVraNwWl+SrUuornw65TAIjrOfeohzc+71aYuDH7pvQ0mrUZUT71ffmN/yFLTKwezCq
         83og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766598738; x=1767203538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0OaNkMXVXZZ6oeYQY6wBKIQ8q3WHAsulgnB8VJrqL4=;
        b=ZltXtXESrUsFL3JfhN7p2QS/Cr3Cmn/UcTNdc1GymgKdz+4PZKRduEpQObMmHiYkRu
         Tm6tSckCkDth8scLY24mJY5xf37iJre0mVwsUK3INiuMF1ZsSopXw6MgFtYxkvY4pT2d
         m+ytf0WZ7uMvC94bE++2N7v9K/Mxv8LF8oa0fEHHx13+QTY9NUgIyH8WuVm2swW+tq7K
         W5byKF2YhLQDiTbTlTxHspE98UN/qi/MTpW74n53Mdoo6IK2Gj4JxYwMd5gDNNwBLuzf
         CGFMChnUnd55rHqNmK8dWg0E/5wAOE7vYqINp1RwMQTyIhGSj4a2TzueZhjnL2XltBs+
         Wwpw==
X-Forwarded-Encrypted: i=1; AJvYcCWpitW42bjGbIsdUYd6/OFmat6jf7mrHwgrO5dVQiuwoG7cvSDLs+0MA5hEmcB9clhujrvQNaAGzbiJLqbCoyyf1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLEmxKj9Z9GiAdD0U+03FtwG3lZCA7swphoIA7BdiKFSczq1uw
	QkEHTf4K//m0NpIfMcH34QjUAKvv1aAtbdcbaKu/N4ZSLQocnGJnq/O3
X-Gm-Gg: AY/fxX44YFS/SAA8q1jQ6KNJ6PWnAJt4ExGgYeTe0MOOuUqpg2tSobgaUkY5hP6VM1I
	zVzcnQHx1gBg/VzkyNtK096kISZG3UT1luBrqSXDTuIi1SVUOtDHXBwd2ASh5lw6+O2K+aNsbng
	nj/gZaLmnyFwUjVzvyI8Hb6ZXz4xXMSNP9C1WANfdKwlMDvrjM7t8SZUmdPD+EWvYq1Av2wJ07N
	mJJrVoQND/c3hHrWIaHm9ZCB3qhNlRIxahf9c5v124HIfmyckauOEGkqCuNNYHsSuI8XG/waj9a
	3R9pAwESppmijGZTXKZZb8Pd3krAd43kHjV/7Rl/Rah+4okzvGhwxjXNrCXAMVVmNnr2vNZ+Vor
	BfRXJCQhC9BSLuq9E/HOT+hJ9vXOFJ8V1f4C/4DgOouKocWibij9h9zbiZhnjp3XhweIVmsea/l
	xid6Eg7slzz5vly6Ex/lFmJN2RnA62sXwAajVtDItQ1Ne/i0LE1WAVS29YamIaftGYhge2aAVVQ
	IM+qQsBgHyI3vyzj2CTYkSp
X-Google-Smtp-Source: AGHT+IFZOrpXp56epHL1X98t6DOAYK7zBQxfI82+mtrgAuJOrnS/IYyJJfXjnl/8TTCjWQu2PNtUVw==
X-Received: by 2002:a05:600c:4e46:b0:47d:3ffa:5f03 with SMTP id 5b1f17b1804b1-47d3ffa6713mr25858045e9.21.1766598738149;
        Wed, 24 Dec 2025 09:52:18 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:3371:7b65:aaf4:d2e4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a4651bsm140167935e9.7.2025.12.24.09.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 09:52:17 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/6] Add CANFD support for Renesas R9A09G056/057/077/087 SoCs
Date: Wed, 24 Dec 2025 17:51:58 +0000
Message-ID: <20251224175204.3400062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This series of patches adds support for the CANFD controller on the
Renesas RZ/V2H(P) (R9A09G057), RZ/V2N (R9A09G056), RZ/T2H (R9A09G077),
and RZ/N2H (R9A09G087) SoCs. It includes the addition of CANFD nodes in
the respective SoC DTSI files, as well as enabling the CANFD controller
on the RZ/T2H and RZ/N2H evaluation kits. For RZ/V2H(P) and RZ/V2N, the
CANFD controller can be used on the PMOD connector using an external
CAN transceiver.

Note,
1] This patch series applies on top of the series [0]
2] The CANFD DT binding and driver changes have been posted separately [1].

[0] https://lore.kernel.org/all/20251222164238.156985-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
[1] https://lore.kernel.org/all/20251224173324.3393675-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (6):
  arm64: dts: renesas: r9a09g077: Add CANFD node
  arm64: dts: renesas: r9a09g087: Add CANFD node
  arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Enable CANFD
  arm64: dts: renesas: r9a09g087m44-rzn2h-evk: Enable CANFD
  arm64: dts: renesas: r9a09g056: Add CANFD node
  arm64: dts: renesas: r9a09g057: Add CANFD node

 arch/arm64/boot/dts/renesas/r9a09g056.dtsi    | 60 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    | 60 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi    | 31 ++++++++++
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 21 +++++++
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi    | 31 ++++++++++
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 29 +++++++++
 6 files changed, 232 insertions(+)

-- 
2.52.0


