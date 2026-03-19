Return-Path: <linux-renesas-soc+bounces-29859-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MS/NAi7u2mtmwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29859-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 09:59:52 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF302C83DE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 09:59:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCB6E3204C18
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 08:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113863B38A4;
	Thu, 19 Mar 2026 08:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iwin/J08"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9AA3AF64A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 08:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910520; cv=none; b=Z7axVAMfRRtMujtg/CQpCtKINcUzcVQhWEip9xxSxXd1C56bVUWVrLnpZXMxjyeHuJTOfA6MOveGHf/amRaMViSKLk4QYgvBtMpwjasR6Wb3KpFub/WHFOw0fyLUyCFBTsgMNdt0WDjd9vnNt9t0VwFa2OZDzq9uf7q/oGzpa6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910520; c=relaxed/simple;
	bh=xLo4vWPighcagwQJbhc+wffzH0vVAVHPHSj+i1QzxbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KFs13LNTL+4YXA6PvrYgAE0RWoe6MYI5JciLR/aL3Brdc1e1fjUowQ+UomzSHQArUifAulBPJ3emimhZ1DFafrBL46U+ZtlMZhxy0q6J4xrv0JVgOgkxmhka864jzW0GOWdvvm49IrS3duFCY9pig6EHEom9ldDPYOZdM21MSsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iwin/J08; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43b4121c40aso417616f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 01:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773910515; x=1774515315; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DZscZQNsNb/rNQYB/DavkSvidSt1AJ/xdAwrA1z+if8=;
        b=iwin/J08UPxo4b6NY9Wc36hm4AUOd9g7J42WfKgQLEQk7rlU55jSk2Gz/jIlRjFuYb
         vQmV6IHAI1bGPV1fT+u9Aq1UVEfVrUattxZzi2v7PYDHKTOGh9OciPbH07brKRdYl5q9
         6qi1tjC+ltgHMBpCYTptHflxDPHCEu/YiW2owiYVzivlX1n2IdJLJ4lG1eylV3KVo66U
         ruQsFwthPI+ae8qJvKowd9gH6xY/fkU2sb31jTbfoKnSTnMwhzm9S+oasDWO3VsW5gR4
         Z9t/VpIQHRPb0UT8yBaLCz6LWd6ypBH5uzE1yvlk0Bzdsp3L8Ch2e/f0AjluawT+aJtL
         wIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773910515; x=1774515315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DZscZQNsNb/rNQYB/DavkSvidSt1AJ/xdAwrA1z+if8=;
        b=ErmCHq4CUnd60IVnI9xF4hqvOH16Qi49WsS+KQh+uagIHp/4ojgO/jTo+Bbp7tm9iD
         gQlWf4NTRyJCmNzLMjFdI3pvzcjCbp867XNVY1K2AGpkgvZ5JdX0DkIOWtwVKH98S2pu
         ddI+l56+xH0ebXBs7QR+lEzaFFOPYlGGwzzUBCp5uvSeOGg8GPoiShCqKuq5ojRL++a4
         VE7BygbvJPV9R1S0XmqAaaT7l2WqQrcdesfng/sBFKOpcJN9kH5coA55EgvQYW9HdPmR
         4QnSX/cq13jzL1sHwoye5gU1WRkgYPdL1Q4Ga7EVVRqGvm6amRMsxUarQ4rBC9AUO7Hz
         yj+A==
X-Forwarded-Encrypted: i=1; AJvYcCWBJL2FImSfT2dY/0E7Ufv9Zye9eoVmhCr4Rt6jV/gx7Lug6CaIbPx9FLReR8MaR7oy27G6putzRHea3Rm8Ymc58A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+5n6lC/T0qwhvsosmM9tXtGhvvV4ezYhfmtwYGcrb5DNT+zBW
	ZgwZ9K3bX5JsqmtN8HMfm0iWh31x3YApNzNH1pctbZQRSQuOJ00VCMRQYM0OzUQ39J8=
X-Gm-Gg: ATEYQzyfW0W4Nivwd9CnBO1zEoALk7E4w2qUzIKysumi7m/ZAqXVk+ttPKlrvP/wQMO
	OCg1b4OUN+jGNS5YI2q80tHA58h01Rp8QVxSbhl6qAgs2qFu+mdkNqki94Ev4HWR/wnoYAYK1ok
	3F5Eyg4NrYv6oI7rwiQyhEudsbAcAoN6NqldQOJKqiWSt3c2ySMRmCdeK4GJsgcgzvKdMVcS9A2
	+8QR25r/wBfVcbw0tQ4xpKactKhkK+3ca+17FtOPVoM7GDD3aAq9S+CAKGuqLXgyGS8iHXKX00q
	Z2+xz6IPZZ+nv6oyiKJ3KGUwCQ2wOBYHuPgyJEYUGpPPraRp7Wb7nVN6T0Ke/XS6OjWHWSrXcsd
	2pKLPpz1IpBmQJ5o8YzBYk0tsKQ1LYkmkNifwb3Nwvlr43EzNb6dLcA4iA9LTPpw85UWAQQsZ7z
	vwlyo6xT8i2PNmxV/eX+lqusTk+bAo3rESTjs0HP+7gHrP
X-Received: by 2002:a05:6000:26cc:b0:43b:4983:5d2e with SMTP id ffacd0b85a97d-43b527ab23cmr11498955f8f.24.1773910514707;
        Thu, 19 Mar 2026 01:55:14 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518588a0sm23072267f8f.16.2026.03.19.01.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 01:55:14 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 19 Mar 2026 09:55:08 +0100
Subject: [PATCH v6 2/5] dt-binding: vendor-prefixes: document the Ayaneo
 brand
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-topic-sm8650-ayaneo-pocket-s2-base-v6-2-797bf96df771@linaro.org>
References: <20260319-topic-sm8650-ayaneo-pocket-s2-base-v6-0-797bf96df771@linaro.org>
In-Reply-To: <20260319-topic-sm8650-ayaneo-pocket-s2-base-v6-0-797bf96df771@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=982;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=xLo4vWPighcagwQJbhc+wffzH0vVAVHPHSj+i1QzxbI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpu7ntGi9/cWBur3xUDlYCJtNFITBcjKIUAv0U8eVW
 maIGT9iJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCabu57QAKCRB33NvayMhJ0XLmD/
 9NK57fkOEHLdy/6RO8xQrL1VFJUgdo2XZT+e/wB26t4jftDmsskbs14wdK2QQY94/QhXzeTIHBYoRV
 6kkJTDHl71ONq+31/lEFMPzkTkVvTq8UOsCa++jDZuLe0IrNEPdYRC1YKSLr+O/b8QVdbNKEO/ntFD
 6BUgdva9BtVvJd1oeEy5IIp8Y7MdE93R3rkuFddWphLPd0B2yshKh1EeMRUqgJLX/ImWrYbWbi8cRJ
 m70hJ0LmEIW1h9XzCegKstYKQT+2c8EPURRMiiE4WPO6TwfnhwLZ0bn/CuFgnkWOOHgBwXiTKcixux
 ohXPSvXhEbrggwJIA/HEI4K5eEYwK/BFwUATsWBxhd7E92Q9kiGYJNhD4JcHfPKtag2NHxTdbh40qg
 I5imT4cfeFkQAGfwrlWewLbpdzAY31LWMMtmR6fDrKw/cU+Rt2p1cS63St1Uy5ZR5aha1nlRx09JJx
 tqU0O8HL1WX8qMsfNof88YTMubhtG23v0qeGJR5vBFOBSUzfsaBxfSuwypbRpmwjWUQo0pU06yJ26X
 KxHLzNSfpXMKpq+Hvk+zAbG2chB3LHTcB8x5sX+pJn/JuVIa2mNF6hnV42eN4Xmpj734qi/r6/MzhI
 4XfN6qHyUyDGDoy5Xo5IE0JOW40SkfaAgzPidsh/a6nVBQF22qWZRIq/K82g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29859-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linaro.org:dkim,linaro.org:email,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ayaneo.com:url]
X-Rspamd-Queue-Id: 7AF302C83DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the Ayaneo from the Anyun Intelligent Technology
(Hong Kong) Co., Ltd company.
Website: https://www.ayaneo.com/product/ayaneobrand.html

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5a806faf7170..1e9338a50d8c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -221,6 +221,8 @@ patternProperties:
     description: Axiado Corporation
   "^axis,.*":
     description: Axis Communications AB
+  "^ayaneo,.*":
+    description: Anyun Intelligent Technology (Hong Kong) Co., Ltd
   "^azoteq,.*":
     description: Azoteq (Pty) Ltd
   "^azw,.*":

-- 
2.34.1


