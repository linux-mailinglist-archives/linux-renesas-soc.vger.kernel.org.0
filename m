Return-Path: <linux-renesas-soc+bounces-28351-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLemIel4mGlrJAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28351-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 16:08:25 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A81168BD4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 16:08:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E76E307BB6A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 15:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C268B352F88;
	Fri, 20 Feb 2026 15:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dITtZ3ML"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B346D350A17
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Feb 2026 15:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771599900; cv=none; b=rQn9xqak4YEohZjDdM7yq8sx9UHJf0bE3q2TO4/xM29F8T9OgRtYIPAeW5qZsZV5oOkLrQYjpoe/wBo6+9f54l6tc2plD5rHKVFpB1YuqGI7sqA6njJ2zuXh2v22sh5jyHZUuEH9RLK5mPvI7GHvAuriKXLlFfwP/Cdv1gp/vJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771599900; c=relaxed/simple;
	bh=9jg8GSVzhlvl3qb8dOWI3jmEtHVxMEGdCZtEq2GZnQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M27zV4rbt3SbNEPubOLJkd0mn95ELmzseXgo/QESJbFEzfQ5dmOL/EsC78ou2mmCNO3aqlK7fXYwyKMAbvwbUK1zqbVKG07il0nAGHr6OJSUsW+e2LYf8s8vxzP5e3h9UDiXavsOQiCfNGelXomxOYvTEcbZlg3ks5kEy86Zz3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dITtZ3ML; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-48373a4bca3so13502175e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Feb 2026 07:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771599897; x=1772204697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n/Q+u/BKevrrhSPegLhuE2o2bcsUnKPqq9n4o3xsANw=;
        b=dITtZ3MLY4iYz/JssGFRDAOFDNWbaz3QOxZWASDSd3Khe9uHOlRdVU+kNyWrj9LU9F
         TEiU9zSpOcsKUQa4K6IWB1b/iNRjJC1PigzfrDOY0MEt9rt64g9P55i4IZuqw2x/AgAS
         KvBlDIaoP+w7qTwl9eOjUfbZJGsoi4sbZN7gA7msYtS4pi6Bz0M3Y+bMzWaGhyNGvOz9
         pD/r+o2pc0a33MCUuN3H3CUxTkKGXCFX9R47/UqgKnFlX0acmlyJDro0Jg9+mebZ0AVK
         S1lC32C+K7+uTU3NR+KcpkmgUgm6LrRVDwUQlZpvZCwa5vbejJy7mIk6SrRT8LShF6Mz
         4w7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771599897; x=1772204697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n/Q+u/BKevrrhSPegLhuE2o2bcsUnKPqq9n4o3xsANw=;
        b=jjcZHesZ/7gHAMHwv0WwF+zD9ctNONy0HvHoNBLDgHX/2AczCqxNJ6KvqHRWCaAXrM
         vj1VaPd9+8/HFsccyidG/5py7ansjWh7ovMrWstIMtFt59kMOhkdaFsGV/HNVkfqYDTc
         4Ci/pai+mt9yKC26g9kFti4our8qgTjJON2Q3Zni7OqYs3lxS7mfcR4UePxR/3F4s+Nc
         RD7z8jWn1oN6a0rMTQcbXQp/EpV+vu1pU1KifFkJkn9NXgmeaJOcoMUI6Qzbtz6Onghq
         cxOuhWnIAFvoR0aNRW6HBZ4uDSLK4tmENyqDTE0J1eoVhkKaGJ1zRG9sA/9GM+QimP5d
         sueQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoVS+HbR60qQvYSXwRF94Iqhb9pO6vifkFSB4GD33IT47pcuK2E8M9gyV1Qzq8Thi7V5P0+1zMruTQPtj2NmN8GA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Wk0MIBi+PuP5th/4A8OtJwtX0amKlcBgXKz1/ty1cD1BjuTG
	eZpQp4z+nvqK8LwW2m9O+YggrNFv7CzwnAHOG+cZE0I6LNvISYmz03+xQFrwWpoj6Vg=
X-Gm-Gg: AZuq6aI6iGt/bgQFSVyySKjZcXgFs1Fkw7A2qnOoryVzIMWnPpEBpaILvJxZmKA/Uc8
	p0K4bR8MCcORYD4+1z46Gs+WNRCEc8cONxWwI1xd3Qz/OepJfYUWiPXr0FfvEJAztN0n74o8eJ/
	1nTqJjpcPTU1zFsgdTg5YSIV1qhr+cbFzHPRINU5WncLKerrRDjLk2nDrzxhvCeYD83FK9jt96y
	S3z89r6i+BhKUe+IG8AYDh04ArVScICetK0lyAbD4W/dznMv1BNapXy5bR2gF6jILxf02gDIuOj
	MjaOOtjGC6uEE4T/YRgosynMU5n6muOnqCkQke/A15LW7J4YdjcLAxnkGmHo+4GLQZ1ObvjPDPB
	TOD4GHHTBbC13LoQdElc7Mjsr5jJ8WP2e3Xki3W9Jz896Sx9dbM+sYrz6YBKYoqcQfoD2LWX9tl
	9JQN6b4NISTyBep3+3gRKK0oror6thrTafoBre7g4HpSGd8hkb8/pDVJk=
X-Received: by 2002:a05:600c:8189:b0:482:f12f:f35e with SMTP id 5b1f17b1804b1-48379b98ff9mr345118035e9.12.1771599896846;
        Fri, 20 Feb 2026 07:04:56 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31c56d8sm122064505e9.8.2026.02.20.07.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 07:04:56 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 20 Feb 2026 16:04:47 +0100
Subject: [PATCH v5 8/9] arm64: dts: qcom: sm8650: Add sound DAI prefix for
 DP
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-8-1ad79caa1efa@linaro.org>
References: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-0-1ad79caa1efa@linaro.org>
In-Reply-To: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-0-1ad79caa1efa@linaro.org>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=911;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=9jg8GSVzhlvl3qb8dOWI3jmEtHVxMEGdCZtEq2GZnQ0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpmHgOM8hmvmaTvvuQR/SeDDc3v2JCByWHLeYkZ7J3
 6nYgW0WJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaZh4DgAKCRB33NvayMhJ0eM1D/
 wK2zyhgxt57TnS9KxRZ/vtLiPxeGCeglxesbmPQstE5iG5/ApPEhph0HX2/owKkz7E0X9iTR5QUud3
 EFVcEgbCFXwn/iANTjv9t814SiZza8gN+eVwJHXmK1TPbJS/BdfKwGyk8K4xBKW/0lJnux3QyUkQqG
 pcJ5NsqiSmfuDd7BafmjbljFynxfk/fzUefkCiIzAcPO/cCzVjrbfHD4+az0XM+3kya4qG3o/Jk2xA
 hoYkIPEekzaUTsOY5dHpjCNVz8nCwB3Ec+0OYMJT5VirL0K4TpepV2Tsbf5waUufk+alvE1bsXpf60
 tNhVAGGYE2TpJFIQ2Baj/ctxjPVL9KQUfppDHwAqtFDc4MvKq9UEsP40nEXYvT9lb2oN9uHcqkft1K
 F9WZHGDpa+ALL5wnn9HzdNkbkUHhsAgbKa5A/zEa2hJmaDlnjbbFkK2u2A8HDWLDuom0qlUdDj5/ZJ
 qgswAhXVJJRY6BZA4Ib65cg4F5A7zNXzdQCpATIKj3ZtjVitRHu8DzMMexkJFLjNe7kZ3hog/wVnqJ
 WhDK/DUpihOKjp4OQz85w0XjeLXqdG905z3er/z9wTHLIajs7Ea1UTB60l9KgNU92OBIJRI+pxqLbg
 QH1RPphJqG/dsUGQ8lZjGsFvflZwm/EFyFGHmcaKQc+hzqRrbYh6LWD5nNAQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28351-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,af54000:email,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: 11A81168BD4
X-Rspamd-Action: no action

Sound DAI devices exposing same set of mixers, e.g. each DisplayPort
controller, need to add dedicated prefix for these mixers to avoid
conflicts and to allow ALSA to properly configure given instance.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 758f87a10d8e..6705922c4d45 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5960,6 +5960,7 @@ mdss_dp0: displayport-controller@af54000 {
 				phy-names = "dp";
 
 				#sound-dai-cells = <0>;
+				sound-name-prefix = "DisplayPort0";
 
 				status = "disabled";
 

-- 
2.34.1


