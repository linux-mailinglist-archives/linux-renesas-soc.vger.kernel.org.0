Return-Path: <linux-renesas-soc+bounces-27471-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJCWEVaNeGmqqwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27471-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 11:03:02 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FC3925B2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 11:03:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4F89309B75E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 09:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81DE233E372;
	Tue, 27 Jan 2026 09:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t2RuSAy3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CC733CEA5
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jan 2026 09:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769507875; cv=none; b=A+Rcg8d+NDZ+TvRA8Tv+iNdeoEI/Y0sAZ4Ar939kJ1r/8VHqLfnVfDYCFq0qYTPpUpnNNwdpB9tOm4IuHD1VcWcwUDHqWWzq2311MF+z6jryOlXVRJqp8mGckAEVIz9xOl92IGICP5OsDjG1xywt/cKYacdavHhw1OYySSLoy1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769507875; c=relaxed/simple;
	bh=gSbiWZ3nnwhx0HYBWb2dVDb/9iL5lwNnvS44cVKbvhY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DjFWusMo3U/tXTsZ4taYgrCY+ng9McDGDsSFw2RDaeWkqB2rYiePptKHBUAA3scNNHC1wY2wiUEDwWg5/sdOgLbDn5Gkx3aHFtD5cEUW6PE6RwLaK/8Uns9zI0YIOCK1jy9HYYdHIdGtt9aIEdMtjxbFTG4tg5wA1qVeUvCkHSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t2RuSAy3; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so79742385e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jan 2026 01:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769507869; x=1770112669; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BpvSM11iZ+VIl5UylAE730s9GzN2gw5t3lFduUFl6UQ=;
        b=t2RuSAy3K15j69TUhkNGVZl2RYSlDVL/TOOhVSqoW/NJO3GqYzu5B1zFk6qG8TLSzM
         VUkSlRJMtBVrVXu2JmHX8Zlq9ILqtmB5mDS2/cwemVYP2zbRHHaKCJPqXNkeeHdN44fl
         +qY/3e2MKrlanhHaUgaG9u8UTBqF1Yg5ZX/ZbXu8vUNx0XGwfImQYF/0Y1wKg+4rh3xM
         pD2GPLcVvTTKLFVXUFq/0ZkkKq7uX0CaFYht/FkKVhorHMZ6TLKDWmWIGju5vjpzWtCx
         kwwrQKQ5wdUjpsTUONeavcXIIjj4Wmt6xU827mLK6mwQdJgIOprb1VASq8ZD0c5mT+3B
         7d3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769507869; x=1770112669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BpvSM11iZ+VIl5UylAE730s9GzN2gw5t3lFduUFl6UQ=;
        b=YAkYjxo59ClfpyUpLSgIP8Hg7mMqsN4ZNeEh0xQd1cdhX9UH5b7yYteUBCkY0OyimF
         LgMLBOJPbQNm+j2r7fORyFLvMBlgOFoquuUmzc+hwhXckpZGoYW2XU6A9SNHLHhaHGXK
         d+OW+dQ2BXPEP1CvffYxFkOMq2+2Uv+AZMQjIs2x1YHRlhRGuv/hf93CgjKwOwEuL8vQ
         Ceg75Z/ugftSUkZCea10nraJFufLOthuHW0snpNnzskGIYnqZ6bYfor/UjC0YEjcPg6M
         XMzCmALcxzjuevUO0aqYWzLhJUMgmu/TbIWgpseUb93JT+QCfhpEIjwZHiTedEgqwm5o
         6c5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXvKImnxV1iS3zu/n3i2ggq7bN5DkVhNUBrQqP1gBzc/IYm05L14dufN3nZZOLXszhjF+Zl/bcoTmXv3R0SnQSXHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsxG5Qh25kCEgnrvsMmy+LPAcCSZ6yOUCbkfNKVi3SMpByeOBF
	hL3WxQuY+Im6Coqct+QWVEJz/V/7/3x7guR+OiGe4T7wFtgbnHqIcpJ7QSAVqgvmmF0=
X-Gm-Gg: AZuq6aKGaFz7nNuBu7xFuGsDnpld98rzOtrPwGbaaG/b3dtlK3YSKxa0fzyjN0gDsFh
	6dSkQu4Vfbls+lsN1XAgtJ8eKJ/V1DRoRR4WpOCRSzvvMRVAG87BwaO8+CotqTp3HfbsES/MVuR
	JDFi8LhWgIb/tdc1xlwap5piMcQaX1KDFMdQQLZKGYb0eQx/5UkCcQWPc9eeNVoHOzgMkPR6Lho
	vlW4uJXEucihoTj3nJJpAuqyeay5VNXLu0sn0jsDH1KaOrWJDNkCKJFzlLmINVD02d6iJSdHCTi
	vwDn7aBqpSUeKPBOThtmkt6riIgy0v6kKzzjVlxa7pUDChatflcmFhx2iv/bb/hUt1yKPR0bHMq
	yhYVLUrnvP1PgrXzYCP938y23Kh66gudcP9ihVI4LaktE3sttB6LfMNMrEVmCdStJGnOaNzpApD
	XtJm1WZ0C8ujJSoXaMMAnYIa+SJiJk5Lw=
X-Received: by 2002:a05:600c:8b26:b0:477:6d96:b3e5 with SMTP id 5b1f17b1804b1-48069c164d8mr13882815e9.7.1769507868824;
        Tue, 27 Jan 2026 01:57:48 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066bf93cesm49056225e9.9.2026.01.27.01.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 01:57:48 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 27 Jan 2026 10:57:33 +0100
Subject: [PATCH v2 6/7] arm64: dts: qcom: sm8650: Add sound DAI prefix for
 DP
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-6-c55ec1b5d8bf@linaro.org>
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
In-Reply-To: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=783;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=gSbiWZ3nnwhx0HYBWb2dVDb/9iL5lwNnvS44cVKbvhY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpeIwUQjm7QH1p8rQRVenNqQ0wOOWP6xu0215VvBsl
 7jSVnguJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaXiMFAAKCRB33NvayMhJ0fKYEA
 DKjj+Z8YzdOvfOnzStvABIT7k4x4isAu30Z5CXb+Mvz29hh03cTeG7wTRJH565eZRDWPoHI6hlsk+O
 lghQtth1j1Bj9A6xh4ECqzUHAiG0TQjV7q5fUMkW8SzWm26L1+5CGPtVcm87qS3Yen0b+5tvYvgxz6
 TTEgeEYgtRwcHdadkjNJ5G0JqU14qQjbBe5SuUL1vBl+ZDk9Qv1kCm91KFO6Gn/g/CuQ6QDgrGx7Fq
 mJgLoa5rQgtu/Y1NwpO3isuBN/rJQ591y6uAhIIeeB0Ho6nONRW9w6FCp5ov06tnHm86iQ4AHaPs/t
 L618s3sK3FI+ATlXqBeL4YEezrCQrNJp4jrDOwCzuuS+m/VA2+kua1owqZZJE/kb2HapTJuOQ33/Uv
 9VjRaS1Qei63ln293HLt10bstkYS24I+dIJSPDUVM7O3GZOPswnUGaMcdXorpGME0zWJsQ72lkpeQ8
 oW7/+EdpozmLT9C+2KvgvBFX6Qk2tPU31WH+mCLLJ6l0cz8QgRYSEgJVuiAKVtZeeWif1IuCWFEBA/
 YC9wa0qsGXDhQAhu/iuSBZ0STVVAUOEL3HDtOKj6mLoJZIzhlbX9ST0yC6b+WT2Tr7oP3k74sff++m
 /XygLVHFHkC5UgxtwsQ1BypETfBo+w+LJx4oldHPIS4V/P464LimH/eMgrnA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27471-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid,af54000:email]
X-Rspamd-Queue-Id: 96FC3925B2
X-Rspamd-Action: no action

Sound DAI devices exposing same set of mixers, e.g. each DisplayPort
controller, need to add dedicated prefix for these mixers to avoid
conflicts and to allow ALSA to properly configure given instance.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index ec79ba904f5d..db769baf4d58 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5721,6 +5721,7 @@ mdss_dp0: displayport-controller@af54000 {
 				phy-names = "dp";
 
 				#sound-dai-cells = <0>;
+				sound-name-prefix = "DisplayPort0";
 
 				status = "disabled";
 

-- 
2.34.1


