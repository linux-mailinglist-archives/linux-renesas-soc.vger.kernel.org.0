Return-Path: <linux-renesas-soc+bounces-10914-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1FA9E3F06
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 17:02:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9145F16668B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 16:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E5C72139B1;
	Wed,  4 Dec 2024 15:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="bGXbu7bS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1698E2144A5
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Dec 2024 15:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733327899; cv=none; b=rzdq2/xd4N92kuObkmBdk8txNsyfLIj3nuVFIJcXPoUm5RcPHXNViyM3KPrNO1x1xLR/vw5RHtHoW82nvxVNzCdnLj2aJ9T9fNicKFFlTB62h+tSTGDGBhsv1tWjNgGOjW4iEPzOTxf3EXFFbA7krurxOKzsLKHbloKVZh/+wM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733327899; c=relaxed/simple;
	bh=vVMilANw4305qRJE+mP/zriYLgYpMDHwTKIWeVMIaYg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oXNt5F/is9eb+Tv8Wv1ZaWR6JPMI64IoOjjlaZ60IThf6HaZvWYsOaIkk+siDR7+h3CLlst4poRYgNr7wkVwND+7ToHCbnAevq5Qj5lWj3ixnp2HF6T1eh8EDXWSisx1VPl4nonCiTA7fj+8IbEwFog9gFVXc9exH5xnqxP5sqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=bGXbu7bS; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4349fb56260so61302705e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Dec 2024 07:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733327894; x=1733932694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rCa75btXGR+JBvjWE4MSNe0BWB1SJNgQ2NyGvR5jDOE=;
        b=bGXbu7bSGx3NmZRiGhOywXh+x6fwEJfAIvm+sEnm08v3fJSBxAspKs2djyH3GkPCSp
         /Qn+bkl8439rPKphEfZvmnxMoF4+D3faRNOPN/4Ukg4gkOv+81v5+1Fraq/GR1hbfM42
         1dxWlCN4jq9o0oQQznsPWqfBtTb3nDJJ0rqNYYAhWWcArFWeWgPK8oHF2JB22EAjYy27
         sC5VKq0YWjnZe444QmxtNU+08VC3BjctfM+zrQoQcbsawJzgT3T8Cpr3ok3BYXQnTHtJ
         XSkperLmNNtBsLai8vA8rIjDRBg8PyT2lzTBFKOrteewKbt5MYMIdHFR40t+HMWbV7OW
         9oqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733327894; x=1733932694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rCa75btXGR+JBvjWE4MSNe0BWB1SJNgQ2NyGvR5jDOE=;
        b=GyQmuvanTIsAQuYYqTpCURbLHJGmhm0DMuyVKfdnoLQWi/26QGy5xpYj0oF9ZZhJ8M
         p1ESB2C8tDo0yMM/VTfrOq+nMuWOL5c1GXcrN1TAOxXAgMbOhBHUDHynQVLIHZxVCNBx
         vA+G/gAoeS4h/m+60c7NCqD8TNb+r9PHWiZ1lr5VKRFTDM589Edmfzp5XZ6FMCnrhJZO
         F4BcYyw9KcJY2fA1Sridx1R6wrqsDCtSbkdOdb7UknyXfR6ejaewtW2lHxppNp5wBUXo
         iKec0y+FEio7YSAcApQT7au0yOcMZvT99RSrq4HTz4PaB5YM31exqa/2Qc6k4v8bv7M9
         YT6g==
X-Forwarded-Encrypted: i=1; AJvYcCXnzAWnJ0oAuc2uHIwISi5YoHjxovWony8l8dlP4q1FlCbrxzu/CwTgeo0eHeels86pKW4LEChUD/OEG5+lcKFTXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyja/9AAZ3hXmI09DhS29Ul5COOWMKFcdsY63xgOPUZbfUoE2aU
	a4h1ZwdiYjELqUZsP+yQkALAs2gzRLolJMWBo84uqbNC3YaYY/Zy3xg3wUeWP5U=
X-Gm-Gg: ASbGncur/xh0jbDLaqYYfoBptoFibKuxsQbjYe8/p0KstQ7gIHJ1ct1bQgekDRjG7nu
	4p6Nd6+u0pWNScfdK2FZtgCrnaabAXgVnsSqW3G1o9pMNM4mnGCtKH4D+A53TkO1PYdoh3lzySH
	BE8/nB01q8iuqp+C0ebgiITl0M+zNwRHkgTDVLqEPsIcPBGl+NZBEfsvUzZppkVKE45OV+2h6o9
	sFoNUi/76vHZG94L2qcJpuCMZEKoLPaTaaqaOMej9Nj9iSFmznXJzxO83c8+LphBhhVGFi7Qsmj
	H+fx
X-Google-Smtp-Source: AGHT+IEhS9vjmVrzP9oYWIqvMT/vBgUQO27+Wg3FLUUWaMq97U4rJ5LeXOih8bwGbMJrzOhbenEGqQ==
X-Received: by 2002:a05:600c:524d:b0:431:5aea:95f with SMTP id 5b1f17b1804b1-434d09ce368mr64118675e9.16.1733327894161;
        Wed, 04 Dec 2024 07:58:14 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52b5677sm29043695e9.37.2024.12.04.07.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 07:58:13 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	wsa+renesas@sang-engineering.com,
	geert+renesas@glider.be,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lethal@linux-sh.org,
	g.liakhovetski@gmx.de,
	groeck@chromium.org,
	mka@chromium.org,
	ulrich.hecht+renesas@gmail.com,
	ysato@users.sourceforge.jp
Cc: claudiu.beznea@tuxon.dev,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH RFT 0/6] serial: sh-sci: Fixes for earlycon and keep_bootcon
Date: Wed,  4 Dec 2024 17:58:00 +0200
Message-Id: <20241204155806.3781200-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

This series adds fixes for earlycon and keep_bootcon on sh-sci driver.

Patch 1/6 was initially part of [1], then posted as standalone
fix at [2].

Patch 5/6 was integrated but then reverted as issues were identified
after that with it as standalone patch.

I added it in this series to keep all the sh-sci
fixes in the same place. All these fixes are prerequisites for the
Renesas RZ/G3S SCI support.

Series was tested on the boards with the following device trees binaries:
- r8a7742-iwg21d-q7.dtb
- r8a7743-iwg20d-q7.dtb
- r8a7745-iwg22d-sodimm.dtb
- r8a77470-iwg23s-sbc.dtb
- r8a774a1-hihope-rzg2m-ex.dtb
- r8a774b1-hihope-rzg2n-ex.dtb
- r8a774e1-hihope-rzg2h-ex.dtb
- r9a07g043u11-smarc.dtb
- r9a07g044c2-smarc.dtb
- r9a07g044l2-smarc.dtb
- r9a07g054l2-smarc.dtb
- r9a08g045s33-smarc.dtb
- r9a08g045s33-smarc-pmod.dtb (not integrated in the latest kernel tree,
  but the device tree was posted at [3])

in the following scenarios:

1/ "earlycon keep_bootcon" were present in bootargs
2/ only "earlycon" was present in bootargs
3/ none of the "earlycon" or "earlycon keep_bootcon" were present in
   bootargs

1, 2, 3 were tested also with renesas_defconfig on
r9a08g045s33-smarc-pmod.dtb.

Please give it a try on your devices as well.

Thank you,
Claudiu Beznea

[1] https://lore.kernel.org/all/20241115134401.3893008-1-claudiu.beznea.uj@bp.renesas.com/
[2] https://lore.kernel.org/all/20241125115856.513642-1-claudiu.beznea.uj@bp.renesas.com/
[3] https://lore.kernel.org/all/20241115134401.3893008-9-claudiu.beznea.uj@bp.renesas.com/

Claudiu Beznea (6):
  serial: sh-sci: Check if TX data was written to device in .tx_empty()
  serial: sh-sci: Drop __initdata macro for port_cfg
  serial: sh-sci: Move runtime PM enable to sci_probe_single()
  serial: sh-sci: Do not probe the serial port if its slot in
    sci_ports[] is in use
  serial: sh-sci: Clean sci_ports[0] after at earlycon exit
  serial: sh-sci: Increment the runtime usage counter for the earlycon
    device

 drivers/tty/serial/sh-sci.c | 121 ++++++++++++++++++++++++++++++------
 1 file changed, 102 insertions(+), 19 deletions(-)

-- 
2.39.2


