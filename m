Return-Path: <linux-renesas-soc+bounces-28933-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEQOLmC4qmlpVwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28933-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 12:20:00 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB0221F90E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 12:19:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CD257300FEEB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 11:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 483CF37E2F0;
	Fri,  6 Mar 2026 11:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="drbKAYCt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253EE35F160
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Mar 2026 11:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772795992; cv=none; b=MkLYneTVEgSjMI0eNFzg80lQxft+7o18CgH55XOqfUX8DCZEEJcC5JbcuIO/uSJQgHiZkqSIVp1T2SCOCZHlRNsybTaCos3CkL+AV1+uGuwGrXgNKSyv5FgQJZTU0V7e1vNa85ij1LZMNgNG7WpQeI0XCD5oCtHX9dvoPDwfna8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772795992; c=relaxed/simple;
	bh=wPZiFdqCiDOOFye8FKOQoufL7cyIaxgiXa67+xHsn0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LxIn5RhqtQ081tyIzLuSKHK7Amg/izTOZpq5Jrs7l5Dx6pxE5BNa2gsmc9etFQzKuvUPeefFBvdn+Zy5oIIQ6M1iNXpbAWB903/jrvq0VjL0SnsYE05RnW3cMJolUN5UWIg49yKvVkwN8Sf0furX5XRCp+w+VpN4NcH3prgmtfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=drbKAYCt; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8299f1ca86fso358781b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 03:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772795990; x=1773400790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkTY0vM9EzW6XUSGNuKIJpMIFfDu1qpzZf7r+qP4u6M=;
        b=drbKAYCt4uW2h6ub9Ae8LCUScPvaqqaG24jMY6TPtg4ab0XPTqr0AomrM5XLWgGGuW
         ocXQTkFqxcESx7Eq4IIeENfkY0AmCL6uqVyA7Td65PE2g5WTotRw2twpgth/eJMiSF81
         aYXlWfKSw22UbNczqIa3LcrmVynUBoUnAD6+gpK2HVhX+oQKKx73PWcbG+RJALPVPbR6
         1KyxRjtjLdxpC5m7vvh4pcY3klbuNBgaR/QNc8gejDLiX/aPkbNwDrq6YSeV5egKaDn6
         qinICQ0StFtQ0sD1vxZGHhCu4uQEn0yWCVpBfYnHGrl44JtrulHJ2iRcT+W3rl6zY4eb
         hmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772795990; x=1773400790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HkTY0vM9EzW6XUSGNuKIJpMIFfDu1qpzZf7r+qP4u6M=;
        b=t+QWKDHjn4HpQ6+D6Q5a9Zbq5DPevL7D1jBh5/78m0jgq1yswVrYgTXm/O3LnttxPx
         zxuw8ROnz8Y127uLUH5qmGKBdbvwT+noJWMIR1SNI9m9jeHfyzP4WRY08DoRGQS4WwGK
         WO7RRiO4RGJdwCKNdPlkAlGismQFR44N2wj3wpqYEpxl4pUESytZCGY+OuJbj1TjYIUA
         8S6HnOX0osgNzocTNN0gWNHbOq7RK/OmFSU8n4xTFC1L6rKegLj858ZL5UqVELc6LXML
         z/1eEWVWJpSTesQof6RrGLLZ4VFUti2v84zynxu+UAgJKJP2Z3pjJ5W4zYU7vzWWAj9Z
         r0kA==
X-Forwarded-Encrypted: i=1; AJvYcCVVxI9DkMVU4zDXy56eSwrM3h7ontpRfQNvInAitSfm61iBgjnTVjyhZK76BqaBuYB9Xt2awbZEXWl6d+bRr+AtQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaVGJlRrqOnaVMSsfgfx9TSW5L0KO3ee59adei5tmhyPf7GwzX
	iYVzApYVztFTx2blXt8AJFxbD24V4tUuSrUAJ6IPVnffV9L9IJrYJUUn
X-Gm-Gg: ATEYQzzyD9rmhmrn9cwSW1R3wy4D8iqaay6eD2OX4bJaw7gSWzQYLL28AC8GBb4sLzm
	IsqFiFsWsrxWSI1ouI2lpVg1CpKcA0u241fas+HtwhJUHCJP3HsIyAt7+odod4y3WyMPVdmnKio
	nbfRsncl5f8iV0id6SzWbxgengov3YD9V8eAle8ZB++5k0CvrJTz29EeNbwFvVuDyaU5weYVAGA
	4zeSnJbr+9Bqn7W7cYeSGLMmTskq8zGtf058tITAOXfTeK8sOf7is3QNHCn0GoIRNuVMAT4MDYU
	J0GH/j5HRP7sgVnxsAlTn/nn3mdZ7fuKXbChdUMr6FQAtEO2ctc0inKzxTz6OSfWrY2xxsf4eBr
	06MGTEyWnKZm/vxuH0oNaxHWWW2yTgNCpEsvTs+m9aGCerz+UQZ3GwRudZIlLKr+//8N/lP1UcN
	mGkmaYoyUexGflWlTymUBTmNYpzyXTZzs9KizItHE2l0aNLWcpOfsH/ylibA==
X-Received: by 2002:a05:6a00:1ace:b0:823:3078:f684 with SMTP id d2e1a72fcca58-829a2f425e5mr1584387b3a.32.1772795990480;
        Fri, 06 Mar 2026 03:19:50 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4636cfbsm1475973b3a.13.2026.03.06.03.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 03:19:50 -0800 (PST)
From: phucduc.bui@gmail.com
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jeff LaBundy <jeff@labundy.com>,
	Bastian Hecht <hechtb@gmail.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 2/3] arm: dts: renesas: r8a7740-armadillo800eva: Add wakeup-source to st1232
Date: Fri,  6 Mar 2026 18:19:11 +0700
Message-ID: <20260306111912.58388-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306111912.58388-1-phucduc.bui@gmail.com>
References: <20260306104025.43970-1-phucduc.bui@gmail.com>
 <20260306111912.58388-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0DB0221F90E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28933-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,sang-engineering.com,labundy.com,wolfvision.net,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.55:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: bui duc phuc <phucduc.bui@gmail.com>

Add the wakeup-source property to the ST1232 touchscreen node
in the device tree so that the touchscreen interrupt can wake
the system from suspend when the panel is touched.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts b/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
index 04d24b6d8056..d47a6cc3e756 100644
--- a/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
+++ b/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
@@ -228,6 +228,7 @@ touchscreen@55 {
 		pinctrl-0 = <&st1232_pins>;
 		pinctrl-names = "default";
 		gpios = <&pfc 166 GPIO_ACTIVE_LOW>;
+		wakeup-source;
 	};
 };
 
-- 
2.43.0


