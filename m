Return-Path: <linux-renesas-soc+bounces-28253-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJXoENAok2kI2AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28253-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 15:25:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A79861449B5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 15:25:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9507E3067590
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 14:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9B2313E1B;
	Mon, 16 Feb 2026 14:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pl2H5BtN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18675314B76
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Feb 2026 14:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771251723; cv=none; b=Ej975ZPM7AeqJQ0QRUE6heEjVsm/Gf2JpuusNrfzZUNUWY6WFz7wSislVEGlBXKEePTdSKyISNlIc0t4nxu7j4lJTkDxzmSxFBdxUU7gvbiPr3OHot+QMnOjLdSl//ZkL+EXzf/rsw4i7z7TavBV+Kr4i4WcXJ5hUzjiCrb+X6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771251723; c=relaxed/simple;
	bh=wzWHHqFMOwki+0X8S01dS5VUbfyqYroFprJPuDT0N74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LQDUpLLCrkL0RvCIPZiPDBfbr+NC7mcL4h6Jq4ykxJ9fWOQ4mt/HZDNulcyT0V7XMf8tXm0JtNuWCbJzBYJ86R/B/icijxzs5OwhPxqYRjzd2tCZs5e3ObEYPrQ0uo2iKJDKfl6IV/I4UOEeeKlQlG4cD6ZUqotWeGB4h85czoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pl2H5BtN; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4837584120eso20323055e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Feb 2026 06:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771251719; x=1771856519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ozn5QNaVTZM6XCflZx+XTaaAus+wNSTWM/r0WiJJYgM=;
        b=pl2H5BtNjCdKkuTHzrRNdNcFFs5M0p+NwL7fMu9Cd7ob4Jt2bO0h146vznVMhAx+9i
         ozzG9sVR3SUAeNqQIPvrlgQbWfROhklISoLo1PhIwpeyg2dcRM5LHFmx4zk+qQCk61i9
         Pj8rIEvu6PWJkgPc7Gb9yhEg30poFh+XDNM9yEkdCL7oGzhZhS/FpDI5y8YwYfgLJ6mK
         /hsBzCYR2VVy8dq1Zkif/SSXRmD0Za/yJOBIhbb5GySKt9uw9b4KgK7v983TodQ+ZTjy
         jAjhFQVBE7zf5kCYMnje+w416uHmDUjm5cXYtCLvV/ZFyFxvhqlGXyWEdzPiBy6WNRfX
         RQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771251719; x=1771856519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ozn5QNaVTZM6XCflZx+XTaaAus+wNSTWM/r0WiJJYgM=;
        b=CDu11kECT8OdHehvBHTqPCtILOMWwZ2uRb0UidBJ9DyhTKLEshPViBYgKWjm4QrcGb
         +JcbzZxxq8K+ToCUcrPY95GH7cd7Kx6c9/OGqMK43PhJLXc/0REW+tJPTtJis3u++sl5
         qaDL/PROjt7IqmC33pj34D/ot9eUPKlyx8cWJ6swNBmYji/fhk9lYS+ViT50u4ym/K0x
         goUQa3p6KK3mGKEZOjbjFBgQRFZVzRuIvQekauwU0mIGNSbVue62HKuH1ASz9YI8LaV2
         s1bFuYZbF5UheoT272DNYBCuw91ZDjUiX7ogi1U8z3oDUf7JyuscDanrv24Nww6o1IwG
         LWeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWflRdHcS2KyUvYVIglaWfmEdAPCbCBzg5cXsPBdBiBv8ouXgToiyi/707ZGXKuz8Np6NDHffwFXYmLL3XNpteS1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMea874ysPGnmdTP0uQ7IvcCLEUXeogKrnOdGXyGUO7hSSvgCE
	PrBF0hZiWDOnGEUgwP8Z+VSsMw2iYGicEQt3jbMl1A8vbODfOjaYLi/PGEPIfEteXRs7FIKpCbJ
	+BomuMgEktA==
X-Gm-Gg: AZuq6aJKobi5WsEq9OxsDETEhUTjBY6LjhQnlDV6zPsqxXGRkV83vdF9xRAZyUgAZV5
	OIPaLZeeu/hdJpt2ZCuOjS8lPKT1bsN8nNDRpRTkj6iJI5g3sZS1ynaMt5gD9mwWBrben2mlNo5
	LQqslDj0LCbFzvRQBuAoCvU8LDPyF2fLyOVN2mlvL00J+31k5Y89zqBzpFBuIwS8eDgu+lHMBnk
	oDTNe5j/XeybbnZWJtfw7jXFzvp+DVdnNnHGDUpgvv2bJMF7tZ2NrBIc+G6AyRW/hDwDrOtvUI/
	ZBnyIMzOWJfLjDTOIvcjUsWhZfBnzHRiSpaaBY97woACjm4oQhnUlfY4iDb2hmuxQY3UVhOy6G3
	AcnPwOWV1hdKyhA8ZsD0XANX8gZSjTkdJ0xYUALr4W/tDt4mUb/pNU+hVAo+uQFMWkjv+bx0th2
	1uvCP+dvlBNvAclANs+1SYpp4QagXeq66q/VYonN1l450l
X-Received: by 2002:a05:600c:8b6f:b0:45c:4470:271c with SMTP id 5b1f17b1804b1-48379bd7409mr134905455e9.18.1771251719284;
        Mon, 16 Feb 2026 06:21:59 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48370a63afesm86717475e9.9.2026.02.16.06.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 06:21:58 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 16 Feb 2026 15:21:51 +0100
Subject: [PATCH v4 7/9] dt-bindings: arm: qcom: document the Ayaneo Pocket
 S2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-7-802c82795431@linaro.org>
References: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-0-802c82795431@linaro.org>
In-Reply-To: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-0-802c82795431@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=763;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=wzWHHqFMOwki+0X8S01dS5VUbfyqYroFprJPuDT0N74=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpkyf9k+Jy6GRZo1zmAOB5SAs+yaAqzjE4dfCT/rV2
 H+74vgCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaZMn/QAKCRB33NvayMhJ0aRED/
 9qcigV9CR4KoMFZebkcugIVeXtG/26ZOsDPBZSwz0Uy7JoOR2O+iiMp5lqmxWWR/4BhKPaXIPHd1zI
 KyEAhSWoMFfMU8nt2XbOu7DVfnZCqVDWhWU56Rsmb5SbhbGCQRy3hr/5QeioJaXew/iNVL1JVDvtHH
 pkabNFqkjy7dlaJQMvEtwTNMjexyVOVonhuc+kxNV3giL36DhT4Rn+rqi9g7jlGGtXvAE2UtWXKO3c
 HOuQLSJBMdnB36gzP8WzSceZWciF5fiUMVmvjIueUcHrtjuTw7J5r0ogJdf4/1b3ShTVXexwhGWoUL
 OnFFWUAS2gkMo//oNalAGOBYLTAxkhyIZz2FZBQS/cVvyWQCP2b1hqXoIoiNLg2eltEfDW8/4Y/yfN
 gUg+1y4d6nlL5OwKAXBeGzdRBXprgio89lv9GpFDq9udEg1Ica8BQd/0SNLhT/bL8Jx3x6qEBeXTK7
 JvnhbbzOr/kJi25irV8HguuNThT2wqcE90kSak9kwP9Qrl4FtqQO+j8l8iXZM4NI7zEvWdFW/i3NQe
 JUIALrcV36nbC6ak2P0K1uU/TAr9tluIhvrevPp9hGuc4NzrNcNfs/6rToILnnRDRAoNVIAGgRpfU+
 InRO35gpYcg1wV6eUH3h/t3A1URJg+UAlo1j/KaE1tusNSMtUsaPttkBYmJg==
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28253-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: A79861449B5
X-Rspamd-Action: no action

Document the Qualcomm SM8650 based Ayaneo Pocket S2 gaming console.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca201..351cc2eff14a 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1042,6 +1042,7 @@ properties:
 
       - items:
           - enum:
+              - ayaneo,pocket-s2
               - qcom,sm8650-hdk
               - qcom,sm8650-mtp
               - qcom,sm8650-qrd

-- 
2.34.1


