Return-Path: <linux-renesas-soc+bounces-16125-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF78EA92253
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 18:11:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE20B16ED1B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 16:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2939725485A;
	Thu, 17 Apr 2025 16:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UXqz1snV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714A6347B4;
	Thu, 17 Apr 2025 16:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744906276; cv=none; b=Ekdmh8D1uMYIi/z1VIQx+5pfceiAMYUYyAkpkcx5cx3QrifS8xg9NTGaoYMaBnBs/qUGXIIs5oJdVP3DpyfEg/ctV9C0k6M9z+9R4q5eX+v3dd357du6m1Tlq+kowMdZXz7CmN4UNVSivKn8wV4Ljt5DlAfxPSjNypSj4dUYtio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744906276; c=relaxed/simple;
	bh=0JvHSv/zBfDwIrbND3HHsM5lPGuyvdsrhZLlK7Q+Jbw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UQn2ZNRfKxDqPN/b20ZAKGa3w5WfJwZrTXsGtg3wVoyYZZgfzlssYj+0k5HE0x5wQCDK6muUxHbAcpvhBpAW4UCyVyhvukSb99DzKNDB8JZi569baSiuhTeqoA4P8uVVdNZGPzoY6PI07s3HeQdD/U4AvEBa2FdCmae0c1Z8fSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UXqz1snV; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso1476451f8f.1;
        Thu, 17 Apr 2025 09:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744906273; x=1745511073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0YoOig2NlT2ugypUY7ub3Z8t3Ukg5TG35rVUrcVY94k=;
        b=UXqz1snVxb38BHKOg0Z1g4pFXIGQSb7UYvrKkorIWYzefCoQ2IDmwqlcsZmqWJvg3T
         UXl0HHxo+XlYNohcHlRJnPsiHOY685jblq3kLA9qOtQyR7xlBsKa5e2zIM49I92I1W+l
         fH/1lLpwZiM7UhDzCPJCWwdGl4SritH11Vu+LMWpN4lyf+F9PSbw66QUf79BqoEPruuG
         wgStIPD3vxU9KylrMvqiVYANRkScEnpCuikAa0zBsWcbnrRSCtIEUD5yDyssAO6Puaup
         CqESYGAuuvevBTkr+9moUJRua0RHxeb0lp79Qp2b2kuQnvK+NuZUCudvvPpszOuVBbb+
         BjcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744906273; x=1745511073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0YoOig2NlT2ugypUY7ub3Z8t3Ukg5TG35rVUrcVY94k=;
        b=QJHqIPY1GsmMyIrCdEPR6UtNAABv4OUsRXGoEQ3ij3De7V+VgXklPUJNMZvjBCvsLN
         hmPSjt5Qpmhja126zNvxdV72qv+BNW35UX3vyo/g4F3PjMgfBYQTSkZRPXbg7KNLrn+2
         GJcBmIhWh9xft9vjfBFL9e9YqPFkYSG4Dc+0uwqNh67fcWS38JgVDwzQRlUAublv1qyN
         m4rXFT5kZQAQU5+29KKDqqaMV00JjDGPq0fgvPmXgyUmhTXZi5bc4bkYTr/wjSmv3nwJ
         5y8F+kUUY0MmSpQrY4ErvrbMzhptX3lgM9o+HpScaCRHJSmks4gAQeLQZII+6m6y0Isi
         J3fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhPagfcGDeTqMJD2MPNXomOFyWEbSaqP7xrJzIqPeeaOqg+aGIUxg8cwJBgK+KiF9jkvql4/mPcHPACQz0eLVNOM4=@vger.kernel.org, AJvYcCX1zaqkrwHWZhRWgY36diizvsMXNkpTPCMnUctPgLMBVII9rDuLyLRPC3rHTkNEDsM+ImsEtG2p@vger.kernel.org, AJvYcCXO2t6j9RVlFHCfvtU/jaYGdU2yoZzIe4Wfb1IeH1NF6DGqcF9YtXvT6Y7xdUdTeenJhMyyQNtximB7XxQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKsOIiCxi7znK3b0jxe7RepCJ1Wk/U17N7StD+sNdkeF5H9b12
	53xfpZeu+77CWnRHJLNbtof+EjN2SN+T0ktXU15NIeaGjAad/DN4
X-Gm-Gg: ASbGncvF8sAv1ekJpxYNx9WDrBxSa2Ety+yBKpdNBAoMM/ES2a7Fz6NXeCOMhIsiYh0
	po0OiXQPcdpHKILm5NZ0nFzOnRC4VxHw9yuoPfKpXdmfFaUj/j97amA3p5FVPLoGCGjpCNmKzy8
	gaBl4XlBlLdDy5LXNfTK1lyLJrWjy1XqSH7vJa0zNMEtee6cULYiyC5GyZZgcBefIzuEO+semQs
	fVHMWisUPqI6A7vBjQNQyoEbZ7hKBK1z1Z2v5VhoLRbxB9xD2hbipduYLs2GoqgEXop04JS4ZQs
	LZB4MiSEzz5SRldJX5mIbIuYvYol8n1bf8r++JnYWQ==
X-Google-Smtp-Source: AGHT+IGC8XUS3Me7ine70yCjc2tBMhV+dBWz5fKYCdIg5NPTsQPgafcB1x+Wut8kapX6DuF22rs8gA==
X-Received: by 2002:a05:6000:2a84:b0:391:21e2:ec3b with SMTP id ffacd0b85a97d-39ef9cc594fmr361937f8f.3.1744906272540;
        Thu, 17 Apr 2025 09:11:12 -0700 (PDT)
Received: from localhost ([194.120.133.58])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eaf43cd69sm20426895f8f.80.2025.04.17.09.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 09:11:12 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] net: dsa: rzn1_a5psw: Make the read-only array offsets static const
Date: Thu, 17 Apr 2025 17:11:06 +0100
Message-ID: <20250417161106.490122-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the read-only array offsets and md5_init on the stack
at run time, instead make it static const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/dsa/rzn1_a5psw.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 31ea8130a495..df7466d4fe8f 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -337,8 +337,9 @@ static void a5psw_port_rx_block_set(struct a5psw *a5psw, int port, bool block)
 static void a5psw_flooding_set_resolution(struct a5psw *a5psw, int port,
 					  bool set)
 {
-	u8 offsets[] = {A5PSW_UCAST_DEF_MASK, A5PSW_BCAST_DEF_MASK,
-			A5PSW_MCAST_DEF_MASK};
+	static const u8 offsets[] = {
+		A5PSW_UCAST_DEF_MASK, A5PSW_BCAST_DEF_MASK, A5PSW_MCAST_DEF_MASK
+	};
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(offsets); i++)
-- 
2.49.0


