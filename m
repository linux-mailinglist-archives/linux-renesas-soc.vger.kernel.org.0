Return-Path: <linux-renesas-soc+bounces-11037-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 370ED9E78D5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 20:21:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDD1C1886BC6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 19:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6980B1FFC67;
	Fri,  6 Dec 2024 19:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="DqNtanWt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2EB1CF5DF
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Dec 2024 19:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733512909; cv=none; b=hevHZo/rPw77UMyO0Ne0rN6wzs/BCKEqYVlVctJqeLIIvfEU1KnLxKm8n+hkkBkSamD1DRDLLlHk+L0LJSOYnZW5AYvsG2f3AQI+R0mXi6eWZWUAvHqSbyOgNkkhHwOxaBohV4Jbt3p6Yh1rnF0KTMv2DwBzvB94l2T6A2euVyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733512909; c=relaxed/simple;
	bh=0GFGArkZIeu9YFzFvIo10D81sChF5r/4lriL8Wgz9mM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lxbCWMdcefwzPxlXhOB2/YHEJIVz9EupNcjrJTbjAS+2/mRBqvxvVFfqovMQAxpvZuMfvddMzdNS9Z4I/IeWSGXbbamOPrah3whYYHUy3R47I+MDH9ZIBYULhTyDyYLrjKc1KMun9SU0y3ljnZ2FXrTB1DBCUn0Lz9X1ufrgVwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=DqNtanWt; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53df1d1b6e8so2250036e87.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Dec 2024 11:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1733512906; x=1734117706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=alKzgZIWJBJQIC3RtpQ5nlO/OOrtZ6jVpTyw98aDLPE=;
        b=DqNtanWtwkaJW+jNdggEKnNE0Y/rILIyu6YBbEz/XJZalfM78u5z1asQT3VBkCoZON
         n9phqGQLt0Tx/lkDxt3Y1Yl26xbvn9Ca3NoTbcKinHuY63Guu4qVb1IArEAa05N6qx9t
         sSnh0WuxC9OCh4psgjvPGbyoqar0LTW84+wlaZgMm4fEGDx+XhVSPxUJaYSR94TKnCF5
         ESGy4hL3/SUkKEeX8sWrounWjgPabMABp5eVVNNvJ93xBeI6XUDZQUQrxfiH/6VtFxby
         koJ5UhAhVhD5Bzbgq0muHfbYxNzdkCeJl/CWTYuUllBilSYnogGwXty0pkX/b2JDjM0H
         Dnaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733512906; x=1734117706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=alKzgZIWJBJQIC3RtpQ5nlO/OOrtZ6jVpTyw98aDLPE=;
        b=k4ZE6KZUV0qJSam844H4O1lc70s/a5mdNIuJ2ToQgNK5gjDG1UdkeV7T2rL0NaDz3S
         XCYGYP2HTmjR8quC7u/1f113JK7zBgKI7muk+MUQh9CCHFLjG6XwaVwjH/MFeIZIO4bX
         dP7IsCxED/Z/UXLOXGkCRtPyOXmy5wpvv3F+aieEHedpeVV7FZWz0C7xuKdcnmaQkhkq
         sTizKRbAiJCtzn8ruXsTe1l3WjsULSpXjCtqJDnPKuVC/KA9CGVkuGNl8idlFoPyV41d
         DtkPhB6o+OmX0PZk2ky47FFB9vU08xoOwoe9SkvClcZBDWPdGIRofPisRHtxzHeZGTmN
         SAdg==
X-Forwarded-Encrypted: i=1; AJvYcCXOLv/EuRZVh3BHJ+HrWNjPPg3SthhIDnbqG4F3H27peNVDM1BivjN4/PFiOwDftjUh9McxN3UcI4hRciYQ/srZuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv3klN31Vsc8IKK5y3u6o/12vp7DdJpAlcsOCt16PMng/h2kxo
	MdmGhu9yKWiF6ojbuXXyEmWjApKjWqGIVdV111rH//Lu+WLBaepMEG/1Qvzf4xw=
X-Gm-Gg: ASbGncs9h9Q4hWwb7PipmRube2TKdvUS5K4brJ8yJdzuvyc6IF/7LZ7MF9bX2Qfq5ug
	nTiWfWInvAMbA2ma/7u2pBYpbYwbfHc4AKBbg2SHfx0bCDGffzIq6EshC5N4GF5jXGda+e9NTdA
	bFcnWqS5EJ+PcJduBCwPfwEXFAOXBRJdr15xFMDkBDPBkR/5beeS5gzXLG6mahePenbnWPMaI2R
	X5M47D/uNAotyLuB0LUERUQGwlHhFWK87leUe4DZhrHeur+zAeqZimB4RnatjXX
X-Google-Smtp-Source: AGHT+IGXrMN3PorF3VW/yScaTvpLE0Z6C7mKmkFF9Kzew6G834zYw9FfFy4W2LNLgP2XaPcVO5ogvA==
X-Received: by 2002:a05:6512:2316:b0:53d:dd02:7cc5 with SMTP id 2adb3069b0e04-53e2c2b12b9mr1148864e87.7.1733512905680;
        Fri, 06 Dec 2024 11:21:45 -0800 (PST)
Received: from cobook.home ([91.198.101.25])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e22974f20sm590041e87.70.2024.12.06.11.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 11:21:45 -0800 (PST)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Dege <michael.dege@renesas.com>,
	Christian Mardmoeller <christian.mardmoeller@renesas.com>,
	Dennis Ostermann <dennis.ostermann@renesas.com>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH net-next 1/2] net: renesas: rswitch: do not deinit disabled ports
Date: Sat,  7 Dec 2024 00:21:39 +0500
Message-Id: <20241206192140.1714-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In rswitch_ether_port_init_all(), only enabled ports are initialized.
Then, rswitch_ether_port_deinit_all() shall also only deinitialize
enabled ports.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 3b57abada200..cba80ccc3ce2 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1527,7 +1527,7 @@ static void rswitch_ether_port_deinit_all(struct rswitch_private *priv)
 {
 	unsigned int i;
 
-	for (i = 0; i < RSWITCH_NUM_PORTS; i++) {
+	rswitch_for_each_enabled_port(priv, i) {
 		phy_exit(priv->rdev[i]->serdes);
 		rswitch_ether_port_deinit_one(priv->rdev[i]);
 	}
-- 
2.39.5


