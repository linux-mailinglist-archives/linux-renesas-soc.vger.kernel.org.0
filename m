Return-Path: <linux-renesas-soc+bounces-18599-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 970C2AE27DB
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Jun 2025 09:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C5C2189FE82
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Jun 2025 07:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5822A1DEFC8;
	Sat, 21 Jun 2025 07:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KqGUysGc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7351DE2CC;
	Sat, 21 Jun 2025 07:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750492296; cv=none; b=JSHIJ6Urlp5u79WC4vOiciUITDuzCIoZbOqKqzgY6t02QR54TyqfT4lW+KmSEsWfMiCWAoRcnCDfYLr64XqQTF/8E/mMNjBdwQ9F3BLJ3D0R2wtPuqbir1nBoQqfzAVE1sW/cLzdtDdHBz4C3T8jwGobVFkeumNUcHIoGxdkYdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750492296; c=relaxed/simple;
	bh=B5JXGZGmMiWSQNghFqgfsxwqKjADuBDCng2oC7GG9V4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Md8e5u0AAJ3r5KBiCtmKYpujNl84yubPYU+kRynbITrVuhX8ys00OpnFpEameBFs8MCYZ7Q0L6WMzU5bNNgnPE6rIvx0EEQ405ibGAhqmSsZj/MZzNOe9HwGso0g6u9//aNdSx+cT2ZdNjuAJhCU8m/+efJLSARj0oHeWFxnZbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KqGUysGc; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so1962260a12.3;
        Sat, 21 Jun 2025 00:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750492294; x=1751097094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SKbBTi7IDp31OkTJ6cIcfFVheRI1s9qIcPf1iWX2qRU=;
        b=KqGUysGcMN3Dxd8lB7b+XmMO4pMt9SSM3zB0gobsA9pydhPbbnM33iUE50fSkniV51
         8bQF/ctr+B2nuLyp1+AZBI1RqMGqZ605PQ5Yduz2DQ8eIf7NnI5B2ORUGudErb1ks/tZ
         VPXSF+Y0E/S0MFQdCsbQZZxp1dyyQ15CRhPzPy2ryJWGkGqV8zg/1Wo/A2rTw0bx//6w
         zcznNQpRP6U+VuY0jdFBpA/8VBhsv/x5vLLY9tOXLm7Qff2nRV58+rmok9n7GZjgucfL
         du7qGIC+Q+ie03+vn7O6Ag8+5dytG1KyoGANTMFhUN31QkRA17AJGNusFYzTws2iS+JD
         K6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750492294; x=1751097094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKbBTi7IDp31OkTJ6cIcfFVheRI1s9qIcPf1iWX2qRU=;
        b=gbrMJp84Mr3abY4m5QaRm0+1lexkbXE2HirkXS/k+7PUNUHs/fV9tpafNE9lFW6hO6
         4NIFarbWISXP4d1ZDHi6WKL0f0nxuAdV2KFxxH0T0amEVoNFQqTUtP/I4KCFzS8jsQtm
         /PgYMfecCJcbgldSTa38BYOPeLNkgkI7NREM2kItq7KOQHg6u6ujRblpgQILx7J6nU26
         USlaniXctpcDqB1d5SDqO+PY1GVp+FwlLXcce2mVgaaQRTk84iYBkD5pqdAX8m5cIWKI
         5zsR9BVJ565uPtHFfkB7g/ErP0aAnEN8FXbcEoErG/IyIJ7enkoEDV3Cq+f7hcEZwYTL
         tU5g==
X-Forwarded-Encrypted: i=1; AJvYcCU7p95LGvgTXQAtuH7LB+Zdub6qk3bB6+Kpzf87ltSziysju2msAOjF+c4XBbHQgJ77MGko8lB1fPyX77Irs3VPGcg=@vger.kernel.org, AJvYcCUVz577O4OmI+EUq1n3p6WYjn24INw26QOhSRVPnXRo1tqtadWcSwM0y6QPbWkv91GYocKPh7jHBO/bXl54@vger.kernel.org, AJvYcCVMW/p/7ITSUgOMg3XOW8i711qLOEqDuR3N6o/s2HwMgz32c4OwHImQdJXB40xETNa9/RzKrJpyD/wexm4g3W0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZYeRt1DqMCIRgRXTmt++txBP+k3KGEhMxzv5ZfdnhkT1ZAj3b
	0rM7OzAWyVtHc4E09CMgI+YClMfr34p8rY0hEWH17r5CTouJLdMvd5YJ
X-Gm-Gg: ASbGnctFA51J6UQHLRX5ESKnTvLMOfxSvrzb1sVoJQBkB7WoSX6eTZiKqEl1P7f9uGM
	TbmyLp/Ig6qsgy/q5KQk8uVuLmy3tlMrxYnrFfTTO2KnkoZ6v1Kxj27uT7G3lvbcU7f8kNcvd4I
	50dpDz+tkM1cLdTSwA/1rIF8IrXk4xAON+BsJDn0omM/d0ahZGsvPP5e6SbunwmNqUa3xpRaFj3
	yQMTHq3kRlP2O9BU9m8jd2MfgcAMt+nScYcGPnmT/yu1yEtri9bWAX7XSMZerfjT4rB7NAfni/4
	aNJz8wfjw//32+KrZBhAfFNouSzI3MpvjgkBHW4Wkkxcb6Nfn2PTcTAZ8P2IponSEJrbZ7rp7cF
	tFtl3N/Te0+tYteGX3dpqCZzZjei+nuA=
X-Google-Smtp-Source: AGHT+IE3lIj/203gOa8XTRN8xFQrZ8cA/HMSLP//zwl4/K0OX3xxlSIn7UAWFQ85jKtLSnVzoak0LQ==
X-Received: by 2002:a17:903:4b4e:b0:223:f9a4:3f99 with SMTP id d9443c01a7336-237d9954dbcmr99624285ad.29.1750492294103;
        Sat, 21 Jun 2025 00:51:34 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83ee9f6sm34823025ad.73.2025.06.21.00.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 00:51:33 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Date: Sat, 21 Jun 2025 15:50:59 +0800
Subject: [PATCH v2 1/2] dt-bindings: arm: aspeed: add Meta Clemente board
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-add-support-for-meta-clemente-bmc-v2-1-6c5ef059149c@fii-foxconn.com>
References: <20250621-add-support-for-meta-clemente-bmc-v2-0-6c5ef059149c@fii-foxconn.com>
In-Reply-To: <20250621-add-support-for-meta-clemente-bmc-v2-0-6c5ef059149c@fii-foxconn.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 bruce.jy.hung@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
 Leo Wang <leo.jt.wang@fii-foxconn.com>, Leo Wang <leo.jt.wang@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750492287; l=886;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=jaJuRFuiQIpQeCgkDZC/ZckoYXAyyJRWtir3QL+VwYw=;
 b=o/ivUb3h2VmdUZCsXclswk/7ebeMr2ftIKUaS3uY5YVto790ke/jBbOCn9b1TS6JW3H83cREG
 xmBm5Tfnhn4AVTGa8+huWqdiYOWDEsu2x9mowKz9yGkID3sl/9dRRQf
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=

From: Leo Wang <leo.jt.wang@gmail.com>

Document the new compatibles used on Meta Clemente.

Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 01333ac111fbb076582a6c0e801903c3500b459f..ff3fea63cecd99ec2dc56d3cf71403f897681a98 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
+              - facebook,clemente-bmc
               - facebook,cloudripper-bmc
               - facebook,elbert-bmc
               - facebook,fuji-bmc

-- 
2.43.0


