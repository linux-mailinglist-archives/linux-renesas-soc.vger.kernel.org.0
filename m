Return-Path: <linux-renesas-soc+bounces-2424-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7567E84CA78
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 13:10:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A879C1C21222
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 12:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA5015BAC1;
	Wed,  7 Feb 2024 12:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="bu2JbaTN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CDF5B67F
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Feb 2024 12:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707307674; cv=none; b=Z+kT5iQmA0lPcXhrS2DExU+4imbIB9qj2iPXXbe7cmVM6HtKRBisXiTBBv0SCVgRD/BQtBh42e/v1CR6Whur2lmb2rfuig2iPIeZy1BE1KjBvUimcJUM4OlNPusr4Pqygni9m7+e1pi7SwrIOQVQDdc5ci2FKCvptH20EzRo0Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707307674; c=relaxed/simple;
	bh=SxlMICegmXdUBxQVVBm2FzksqEV77QNPyRMJh6d+Tbs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=blbO+a7/n3IMFiFRhvkArZOgMNA6i79JMXGIVJfzX+LK5hCECOEU4DNr5gF9ZwQ16HPDxiQ5GifjNAu+EvfyO3tRGD8kC0pLljo6IoY1RT3T+m5oOClU1DoKWHLq+90xPbNmzxc/XsOCqGaINm1zGpWOL2GGhNOkK+9UW/J18mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=bu2JbaTN; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33929364bdaso366992f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Feb 2024 04:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707307671; x=1707912471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cFc6eloGSwMPUDaRE6k+RTqrzneAql26eIJ4/C1a2lU=;
        b=bu2JbaTNXUCq6Nzbt+NZiWf69R8cNzBNPzVYnS6W+lDdtgNpc57eIrxD6t1K7fnSS+
         K93EGpajV6is81m0Q0jCATl5rc4fwgpRqoQbOa6Ivxec+ElK6FZuLOw7sAy0Jc8jFffD
         Iev1+o76mH+LGshekaDhVskMNAInvTeq0nlgsjsaaR5h6uB9iRr4DLBn9zIBzvOm7UOG
         QHQDTWr+dXWQzFSFrOwXxi5SzQ2jAkaMHm1nOmL0E3lvi2sEZ5unnG+K464832cDsAMD
         u5lrfZRluYydCngdt8xxHPOniS8881CB6VWyMC653lT9bIv1uSxlF778P2TxysjB/D8j
         f1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707307671; x=1707912471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cFc6eloGSwMPUDaRE6k+RTqrzneAql26eIJ4/C1a2lU=;
        b=HLHgCkVcqWj4oHV6eq4InmprDiyvd+W1cjGCNXQcuaAXr6IgucLrg9KqBTE7wBgYZn
         iAhz2qyraNpUqc6LlsSL69mtT+mpPv+NbsL5jAI2vNsi/FdKXIbOQHnlFkMi9xc4kfm8
         ZjMekVSwal3uXKvsDkoZSn+0+d/rrGLJP3lTF1TNNtXYUj5/Wi7yWXY8WiTNY6bJW/Op
         CMVuediGLE6sp61Z7Bs4ERXRc1wihFBrh6xytcyjCVxIpkSHJI70bxWL2Vy/IhjLDQZ+
         mdoE81lKVlVZiTGh4bhLzee9188lU6IbRTUyMMnSr1dmwNMHuCOHCUK9+s2KlDKef5ms
         WttQ==
X-Gm-Message-State: AOJu0Yx6RnJ7JiAuAHOndZWRBAfRWPAsSoJfmd9iKBk2l1G+Dk175QGH
	tV172/c3oXrtgzjBVyalGCiRDIlGDAp6FLkRVPLjVum6HQAe4CO7nxadQhecA3A=
X-Google-Smtp-Source: AGHT+IHYuDU8bFZ0W1OL+/OOZDpOCn53HYr4vDa7Ay4yaE5N25fQ3SXc1BUZqSPmjMCtmirdIIrHug==
X-Received: by 2002:a5d:4e4e:0:b0:337:8f98:8ab4 with SMTP id r14-20020a5d4e4e000000b003378f988ab4mr2777700wrt.37.1707307670693;
        Wed, 07 Feb 2024 04:07:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWyoRwjcmsp0ARCl+kbxRwBCdodgYGIqvw/qeHxh0qsZdp9vtizAAKbHqV3jD4crNufEV63I8bBgb2UQvzYXkc4M/lCVDLqAWBcV5J7l5AyLjj0rKNlv5eUmHQ4GpCpCf95cjNa0SQoQe0bhJbRxxSWVPiwLmWx0tp0u9YqMGzlPhLpz/rbYwbls1Rwe4XOZ+2lTLTQzKrl9YNCbwVK93vzXTQrYcfp4DwRggzGERY9/tzmij9sfZvMUTZOYlXHYrRJIOnTMEyzMMX1FqTaWXL65Kj4XHvpXaNS+RPeajWel1mEXbqnBItWIHTUSjBsp26dcxVt3Wuj3y4=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id f2-20020a5d50c2000000b0033b4db744e5sm1363957wrt.12.2024.02.07.04.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 04:07:50 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH net-next 0/5] net: ravb: Add runtime PM support (part 2)
Date: Wed,  7 Feb 2024 14:07:28 +0200
Message-Id: <20240207120733.1746920-1-claudiu.beznea.uj@bp.renesas.com>
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

Series adds runtime PM support for the ravb driver. This is a continuation
of [1].

There are 4 more preparation patches (patches 1-4) and patch 5
adds runtime PM support.

Patches in this series were part of [2].

Changes since [2]:
- patch 1/5 is new
- use pm_runtime_get_noresume() and pm_runtime_active() in patches
  3/5, 4/5
- fixed higlighted typos in patch 4/5

[1] https://lore.kernel.org/all/20240202084136.3426492-1-claudiu.beznea.uj@bp.renesas.com/
[2] https://lore.kernel.org/all/20240105082339.1468817-1-claudiu.beznea.uj@bp.renesas.com/

Claudiu Beznea (5):
  net: ravb: Get rid of temporary variable irq
  net: ravb: Keep the reverse order of operations in ravb_close()
  net: ravb: Return cached statistics if the interface is down
  net: ravb: Do not apply RX checksum settings to hardware if the
    interface is down
  net: ravb: Add runtime PM support

 drivers/net/ethernet/renesas/ravb_main.c | 118 ++++++++++++++++++-----
 1 file changed, 94 insertions(+), 24 deletions(-)

-- 
2.39.2


