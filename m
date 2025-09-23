Return-Path: <linux-renesas-soc+bounces-22204-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E78FB95547
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 11:52:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17F2D3B3106
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 09:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2901320CB2;
	Tue, 23 Sep 2025 09:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNIQYjoF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52F6320A20
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 09:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758621156; cv=none; b=iojdjzZZ3J0MwBnGcWwalz7hwbI5IUw0H/sIgLrPYMNDBrjC/JJfiSejAYz1X1kxFfNcp3bQ+dLNwO9i5JIFpzA+4kfHwcUSWEHJW179fBHv/VFf6DHmBImu3IKbsHvofc/OW84tgd2/Sn3H3rsbj9M46r85EMOfxs2m6kBTbPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758621156; c=relaxed/simple;
	bh=0BnOPQDELNokGZZYmpRQ1cd8xaZrosaBnpt3/XVY0Cg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OPGaoKnxluL9Ms/eRgpsyWEwAUX64wdTOdD7n9eLd21cZfEoImcl2GSUarEQNBJaq+RwnAvF7ZcZZrDQcmcac5lv9UvpmarJSUMDlh/LogFaD1WsS1PqlouJLoZFfu42CyaRsspDnNtHc1iqapj1RGn+/VgQb5uKOVUX625Y95U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gNIQYjoF; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-46cbdf513d7so22346145e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 02:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758621153; x=1759225953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LY0Z8Ik+ok4lx1moFpVF9A6wNG/8oeWUYiVAkRks1lI=;
        b=gNIQYjoFKSf8E9eM/ivy9Vxl0llSXIQfUtr+3IVKU/htxQZyJILrCaJoCF5jiXNoOW
         29SCLo6R5NK6YxhZYsj0iTKPIUXMlpYLMPojFqRSfHbpoGA6h2apoQ/hZ33c8L2WWTRr
         5ctAnSIW7KthhtCUe9DsHHGPITcGd+Gvm+CfSjL3+1yh+wWA7wF9wB0uyOXUNS4j26Jj
         QXfBE6DflSFY2mWlOLEEmmBs6HERGdZaX+tMKB28Pk4LyDcNAfTdTjfVD0inojmuz7KA
         HN2Oq4oPbqnP14Y5l/RHRo9asGKF1OYN0j34JlEmlMSGawyZ5wqNqcbyp0llHyPmQ8n4
         BdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758621153; x=1759225953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LY0Z8Ik+ok4lx1moFpVF9A6wNG/8oeWUYiVAkRks1lI=;
        b=RL34iN/ayD9NqXU7XfnkDTMuNifPD1ECMUZSB0HueTca2rBs1tiPOGkGcYrQz/Jzsg
         un+/YQvd5Mx8lHw28eaZfsTfUVYGcSWtVWkRD7KgBJn/IKL0xs/yONP4zofZQ2w2AsAO
         DoOQu5XRWm1MVWPrwwPP7IHypZonS+MZeekTbr2kNdXoVyhMXXj407WXZF9YdfTWHGo8
         MDeMONCdd70LgQ2ofY3hKCGwrV1iMQ/z03WR9vwx+N3adDiVkZ6HyrLRnv0eHRkFZNHh
         I6ouIOw6KdWoeQhXR6Me5MvZNW3BFPLpNx6waPVyT+5lZdvqBQD0wkDFNPj8l4xGtOFI
         JGzA==
X-Forwarded-Encrypted: i=1; AJvYcCX5gB+ULgcGc/i7fwoUW6R5Ii3O1qYQPo3AGuGZYBQh9inczHOaAceSigibO2lKtsU5aDP5ntZ6NOzrmbJjNBtANA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk1l68Rxm15iCQ53uu8fP5Ks7N2tYvtehgQIgD6u3Djy7VVIaJ
	HiFSMrVtGO3arfLGQNqUztXnO0q9kPEU/mHpIOwNRn0RUQN5wzHpWMAH
X-Gm-Gg: ASbGncuMxMmLUaXErn39DD9dRnNeXFThJmM9X1VI0ao6Q8bh3pSgA67IEF1k8Ut2J3U
	OCfL7Ir/kpXkSmJn8x19Ztt2K0o1F3n1FYTTo8PycTpgQoUSw4R3mD4Z4f4mMpXhSYy+gcOyTGp
	ko4Hhc41J9jOzJroUqLnwA3p8ZoSfKC9BgawJ42kGpfkv+BbjziBsZGmI0XJOeFwcvQwZ1h92dj
	bxsVUG2VZHBK6HKwfj1lJjw9mkztzE62gfJ9gi0PUocJYXYOXcE298j7fEukjpoVYOc035L04dh
	78G0didK9zvG6vAipcetj8p1dSCYXVOhyyEwRsx+9JFv66ltrnc+ftmzkAq4V/WQVJ/F+ngqth2
	DqMTizkYx//EDgu/YSpa7mr3KAe1grhn32EgXm2J5Jk0HWuGcFpp6zAM3iA==
X-Google-Smtp-Source: AGHT+IFsjWmH1yjZS2/W9w+zjAbYKelnR5zFxdIn1q1xM5jD5x8f4Cm37BnIW0kg5YVrR17ICbU27Q==
X-Received: by 2002:a05:600c:1907:b0:46e:1fb7:a1b3 with SMTP id 5b1f17b1804b1-46e1fb7ab54mr16883045e9.23.1758621153090;
        Tue, 23 Sep 2025 02:52:33 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a5d1:59f5:ca88:d11c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46d3ab09b27sm86882985e9.21.2025.09.23.02.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 02:52:32 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] lib/string_choices: Add str_assert_deassert() helper
Date: Tue, 23 Sep 2025 10:52:29 +0100
Message-ID: <20250923095229.2149740-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add str_assert_deassert() helper to return "assert" or "deassert"
string literal depending on the boolean argument. Also add the
inversed variant str_deassert_assert().

Suggested-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Hi All,
Note checkpatch complians about adding a new line before the macro
definition. But this is the existing style in this file. So keeping
it as is.
Cheers, Prabhakar
---
 include/linux/string_choices.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/string_choices.h b/include/linux/string_choices.h
index a27c87c954ae..ee84087d4b26 100644
--- a/include/linux/string_choices.h
+++ b/include/linux/string_choices.h
@@ -17,6 +17,12 @@
 
 #include <linux/types.h>
 
+static inline const char *str_assert_deassert(bool v)
+{
+	return v ? "assert" : "deassert";
+}
+#define str_deassert_assert(v)		str_assert_deassert(!(v))
+
 static inline const char *str_enable_disable(bool v)
 {
 	return v ? "enable" : "disable";
-- 
2.51.0


