Return-Path: <linux-renesas-soc+bounces-25682-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 385D1CB08C3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Dec 2025 17:24:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 375A630D9864
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Dec 2025 16:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D25130103F;
	Tue,  9 Dec 2025 16:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BGdKk1Bx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E477301020
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Dec 2025 16:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765297312; cv=none; b=HSeu4L3B56MvxerUdJIGpFU4587HP1D1dp4edYVUY9gR/bIRBz20k7ikPkcvrIFpGgXZiou81MZPQY0Xl2m4l1GzW5Zftjkez9JZ69EaKS0D3j3PhZzYaajEmcbvn1hvNpLfgDHShepIT13BM82XORAIWlYd53GbJYFp5T/OwTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765297312; c=relaxed/simple;
	bh=WKVB9gYz078ahZTJ7TAAKtKVHlfvZgJuO6vYNG2AKFg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sFuUyAIPepPolHKxZWPIctVAdXwWobKr9NDDhNcIATVRvrO3TM8bQnZMuybrjUZYZkEj9C+VMZiyBhDhozyqiskwB1gbmbYmctdsb4DO7D781jY4ZvmyHLObsggpqBJ7pFEsJVRFScjHZX3fEu0LA86JJYt9h2uVTCzLfpbf7w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BGdKk1Bx; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso67523795e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Dec 2025 08:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765297309; x=1765902109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6k61kbm8SLV9e2m07xo3XBz6H86gYGw8sgo6ilH2TnI=;
        b=BGdKk1BxWhCVO4ogODrLzBaurkg5bziO3lXrAFPbPhZ/ZkM8+mlSSb47B1+g9dQINd
         QhSBP8VFFHapDdgGsbNJ4bbUzjZyB3ChJBgos67BMLawfUO1g85mmDzXU+Yythyrn+nB
         HhR943qRYqpNy4WhVo0MJiMkTRG7yP/GiF24KVeOsXTS0Aku3RmiXZ4MA9Ll/7DIf8YE
         UKw2yTW6S1E+AcMh+SH3Eop/XlCwlimTuNRSkXHC6QZsi3dNBiVpf1q+q0O4QkXVrbTa
         S0Hls3wxCDeOm6B9etNaC+Yek8M+tZuo1a99W2fjp+SjY6el/a6LCNWtjJAnk15MLH9V
         LD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765297309; x=1765902109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6k61kbm8SLV9e2m07xo3XBz6H86gYGw8sgo6ilH2TnI=;
        b=csjjLyikVrJX5dMoC4eqXU/iFQXWNIjs8bhz/qyNIbgPwU6+4hZhfniXDWoDwi4knI
         WSTB6M4tBccTK6wzP+WbTCDtOiUwlCEmbZ1i63uv87/SBVyACjfhwdbAo0K+w7vWYrt4
         Pg/+QmVX3vuPJzAxaUxU30uOz2N4sud3ks2coYz2meIZ8KEThyUsBLwWjije4xumy5gd
         Y9pbL6NsEQbeK8bmsQPgxa5fNir9u8yuIzrX29MKs7LAb4MQGAOzmpP2srocKhf1l4x1
         Kq0WZx5uFRIkiwmL1h1OSohjkBwSuAb4o70xQ8/ZKRUTRBQzpbZZkjoFMH1a20dZ7/xP
         P+Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUiJk8KFK0yaaBlogqDjH8Vl6mV41yncXRNS8SfkwNOYce5b2JUfbPbIKXHALb/yp5lfXJpayHpPwRaMoYINvL1ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIjxg8URQyEM/hJvAPD7zbC+z3SQ6rtWgdH9WZjbest7ovGB3u
	e36iNElOaQzllssjr/0Ma/F8weUy1gzQqmLDfB7HNnOlGLq+yQXnl9Xh
X-Gm-Gg: ASbGnctI+sQb0TPJDB7k5EaCgG+byz8IfNOCk7VECg1YgxAqPNWhcQfQqVhtjiZNWHf
	RLdEjXTcWrL+Zd8iPEt22yozV3UZViFFGLsLFHNuie1sYoI/NNT5LRNvhJJzcDczzrjCwzETlyR
	IcVKSZ07E1KeArxR7hb8GvcuoMh9KTXzytOLgmwj3kv5G/MrpACjN2fgVpRIzI5lzCzuuo2x/+a
	eMVjqi1BjLxrPpzjAQ45OCnZfTS+uDzJ/uGJ7VQhZnFCRYCpYxcEAK4l3xoPXp29GArZPEOXvLN
	Tz4M/yUtQ3x4ZKFtw/p57SR4maMv8qm1tTydDnZcA/pLLMxc74IqAE9MfcguuAZ3Cgg6KRpJkJM
	JrtBaK513EYED7cJcco8Hs1jtm6edDVswgd9ZoEw7jNGOo/OGO1F6s4NNYOtTbKIpxN9qj5I0WH
	fx/HCeIX7UWpoZFY2/44Ybi95/Wk5S4VvVN9s=
X-Google-Smtp-Source: AGHT+IHTFgQLT3CSEDcGRS9InaoXZRqkZVe771K3JeLcdli+0zRTuA49I/7K39Ax5OsQ9FDXMJf/8g==
X-Received: by 2002:a05:600c:1992:b0:46e:1abc:1811 with SMTP id 5b1f17b1804b1-47939e387e2mr115381085e9.27.1765297308666;
        Tue, 09 Dec 2025 08:21:48 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:357a:854b:fd78:dcbd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d612e49sm54437935e9.3.2025.12.09.08.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 08:21:48 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Frank Li <Frank.li@nxp.com>
Cc: linux-can@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2] dt-bindings: phy: ti,tcan104x-can: Document TI TCAN1046
Date: Tue,  9 Dec 2025 16:21:19 +0000
Message-ID: <20251209162119.2038313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the TI TCAN1046 automotive CAN transceiver. The TCAN1046 is a
dual high-speed CAN transceiver with sleep-mode support and no EN pin,
mirroring the behaviour of the NXP TJA1048, which also provides dual
channels and STB1/2 sleep-control lines.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
TCAN 1046, https://www.ti.com/lit/ds/symlink/tcan1046v-q1.pdf?ts=1765297159307&ref_url=https%253A%252F%252Fwww.ti.com%252Fproduct%252FTCAN1046V-Q1
NXP TJA1048, https://www.nxp.com/docs/en/data-sheet/TJA1048.pdf

v1->v2:
- Used "nxp,tja1048" as a fallback compatible string.
---
 Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
index c686d06f5f56..9f5c37ca6496 100644
--- a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
+++ b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
@@ -20,6 +20,9 @@ properties:
               - microchip,ata6561
               - ti,tcan1051
           - const: ti,tcan1042
+      - items:
+          - const: ti,tcan1046
+          - const: nxp,tja1048
       - enum:
           - ti,tcan1042
           - ti,tcan1043
-- 
2.52.0


