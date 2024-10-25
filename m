Return-Path: <linux-renesas-soc+bounces-10150-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B429B0743
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 17:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E21131F23CF8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 15:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45BC620F3E7;
	Fri, 25 Oct 2024 15:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iwKxjGHW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CA621F4DA;
	Fri, 25 Oct 2024 15:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729868726; cv=none; b=GO5xkX3NCqpipJ5j07xXflvrvHlkHDCnExNRRtgIgNgGghmsg5qRLn8CQQcsf2TEBl8CgMhHv6o4+Bngwrg4faVg2Lq3edYVTuPeFUEU0WjlFVx7PHmA80g+z1jcQ+cIb7E/kbDBY3YWYVwr/uQE9GV4zvZHEC4nu8UIs3X5a38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729868726; c=relaxed/simple;
	bh=IyonAmKq0ZXAULmY3+PDBoQYB4H6I4G7D5Vm5kNOI5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pesmKgQ49zR7QaUiiOx5n6umWD1TvT2P7OJMsU7mdEloUgHVeZBvzv60hzmtFY4bVEVFwBom5Og8dsdPXlHcrRmAtsAXKZkccR9dESwgTH0MCtDGhKlkWE+rcOSFPto71zb7b4B8aA8lmGsYykE8XLgIatpPt7lWGTAiXmgGP9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iwKxjGHW; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53a097aa3daso2004713e87.1;
        Fri, 25 Oct 2024 08:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729868722; x=1730473522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8PgFaYSXbYxlUGQOc4NTq+xSY/C2TaX6+49YKSFz30=;
        b=iwKxjGHWtFYI7Q3XbIFYodrlWY8CAO9cTUAizf6438xax9gkRzArR6GmcE6DRYTVIN
         r/B2fI8uyxLGJEq6DldYIsvmhOTsLsXsIbQwAay2FTeGjQfKURiaAWKCb/xlosIyigaQ
         ZW28IemdBV4bk17GB2nHV+h1/4lOMsLc+r8+9fKd/zkPooMass2hyJO3inwWM7+P+mKL
         cfjU/0v2axXIOjM86QKDmC3bVFF24y4QuAk5ZVygPX7UDg0x0bkDZpAfxPy1mUGX80mf
         5Wh0+lZYHnP/h9JdD5cfOwdKxHR2NXDuTcMeFYqoVO0OOvllVUQ9G+MoykksMRtjKGgx
         7bBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729868722; x=1730473522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J8PgFaYSXbYxlUGQOc4NTq+xSY/C2TaX6+49YKSFz30=;
        b=MsM4WDz2ikspKlP/4Erw4NjZqZFCVViRn5y89LjKGvdNK/xJqRzPT40oaMQiz3XMZ/
         J9966Wwmouz0klx1x/UHiPwviO0/FmVCrAL2UxX7ahE7qj/euWWP3LHicEYPOCYtkiuN
         Igzg30pJzwuYkd75FbRriNrjcKWtWmi7/wAzPcTUOB7LSQkYP6AQIUnKAZMVqUKDJL7p
         suywEFeGAp9xgu91N8tvvRaHuTwbAtqmBe5HCS3CKT+TmT8jfZS0xHJv2edNjxTgPsXy
         /r6r5lsPZ0Uac9Sb04W4UBaCcNo6aP5gwsos+bTXfGrl85HnZJlK145Mt/MXA6L4YKHg
         5mig==
X-Forwarded-Encrypted: i=1; AJvYcCWxJHHR8/Ir3IUvJ2IjbwTq7i6dP9wvvThyntvk8NrlIax0lQC+IyYslcIn9NLzsHV7zWngIbLMhgCqfWo=@vger.kernel.org, AJvYcCXBj/CZZnx6g71Uk4CaWNKD51WtmVjFbXzm0S+QtoHKbBpkC+n8jtrEtvZ+vhL7qyDoA1OhsDCtjXjoHknjQ8ridhM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg/wIihfqJtUw62/xJsXXdv311RrYtDgP3S9huCjH8nfzLgnno
	ucBwnqNkE5vKxUnJxUGQD4xptkpByakpb0fOOmIqhT9OX1Me8S6F
X-Google-Smtp-Source: AGHT+IHj4F3QdgNRfVLDSNU1G7vcnM8IXI32lmjRYvkYQ64qDpcyY6MgosCjGYXQ5pQBneAidHf3/g==
X-Received: by 2002:a05:6512:3f17:b0:535:645b:fb33 with SMTP id 2adb3069b0e04-53b1a2f21b5mr5077470e87.2.1729868721629;
        Fri, 25 Oct 2024 08:05:21 -0700 (PDT)
Received: from prasmi.Home ([2a06:5906:61b:2d00:1044:9cc9:b89d:54cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3b57bsm1764349f8f.26.2024.10.25.08.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:05:21 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 2/5] ASoC: renesas, rsnd: Update file path
Date: Fri, 25 Oct 2024 16:05:08 +0100
Message-ID: <20241025150511.722040-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025150511.722040-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241025150511.722040-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The "sound/soc/sh" directory has been renamed to "sound/soc/renesas".
Update the reference in renesas,rsnd.txt to reflect the new file path
for consistency.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/sound/renesas,rsnd.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
index dfd768b1ad7d..3f07b072d995 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
@@ -109,7 +109,7 @@ For more detail information, see below
 	  - Register Description
 	   - CTUn Scale Value exx Register (CTUn_SVxxR)
 
-	${LINUX}/sound/soc/sh/rcar/ctu.c
+	${LINUX}/sound/soc/renesas/rcar/ctu.c
 	 - comment of header
 
 You need to use "simple-scu-audio-card" or "audio-graph-scu-card" for it.
-- 
2.43.0


