Return-Path: <linux-renesas-soc+bounces-28927-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CEmF4yvqmluVQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28927-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 11:42:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B648621F05A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 11:42:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46F1430965AE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 10:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683A137C0F0;
	Fri,  6 Mar 2026 10:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cg+h5f9o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B38361649
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Mar 2026 10:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772793674; cv=none; b=U2tvZVk5Ut7wAJ5t4e+dXFh2Gfd81Azsv82wsQYKPWYtzGp7O9/jWqJvBA9x0Gcpw8sGQ5w9YiMy7OFXD57QLPkIbcZAcQxUcpQ35oPSc04tG+j9MrxUty96KzM1IHWNNHqWx+35kGz3MgsBgI2AcdG9e6xFM92vfT4WifMGYFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772793674; c=relaxed/simple;
	bh=wPZiFdqCiDOOFye8FKOQoufL7cyIaxgiXa67+xHsn0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LeNmctGkwvX3zb0ALkAp7mfXqHXqZehBwWSpMCJj7G7oVLsKtVwffuLDGDfjt27VRp55MvEbjLViks2SeTlGritn4Zn79+mkbKl0xWfsQEQad65EorvOLeiKVu5g8XjXK7I4nZEF8uYeK2cgVbor5f+xJJrIMh+f0cMe9Kf1vkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cg+h5f9o; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ae3a2f6007so46233225ad.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 02:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772793672; x=1773398472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkTY0vM9EzW6XUSGNuKIJpMIFfDu1qpzZf7r+qP4u6M=;
        b=cg+h5f9oKbyf0fsdPUspoF/BDaA6nqPOX86U4ECGVQP9hJMuAvd8kdqlAbljG/rV5y
         SQIHlOqFlnrXIvVQKmbqCkT787dO81tjTS9YeJ6Rqn9fUU6uET64T8S8EYZv7SUP2Y9+
         xUOG3G1Eeggivm8oYVG7jlRbhCGVR85BRWkp9Q3rWkUueqH+wkxkWiK8icJFDRv7Kh9X
         jIDbH8ln+yaRIZ2qmOBWQaaaEWJTuuMdRtXMWaJmpVEHF/+zuYvm4UtTgf4rPW+Je2iv
         CTPBkLCvROhhe11RJPQP4e8C77T3Vw4mnP8bJCX3sQlIImTgbt+67YVeMhOljDDHzzBu
         ap0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772793672; x=1773398472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HkTY0vM9EzW6XUSGNuKIJpMIFfDu1qpzZf7r+qP4u6M=;
        b=JvRvXpmyecSwMaPMgjPnFlbezjsWR4nNeMImP2Lu8QUkHZCPLq6oEOAkcahulfqLo5
         Jk/cHnsTUHSyMpgVCYkWix/QY7Es27+gy4JG2LeBNYT2n+yhQybyZFT6wJFNdK/zq5bF
         aVlg4vmv5aOqqf6ziNs59Aoh60nlpzgBzb+D67Sx4NbWxjvWz0TcLjfzAlcEFiW+99gV
         ucJQXnutY/nHquzzTW/JamiMUmB9kiSlUGafCV0JVmBIjYOzq5HP/T0kDqbV1OGm1Y47
         8OZx6wRj8SdvoQCofUeCqsQ/Oj2X5/akxHCezIFMzIswwGYdsvJcirYVpSAhtW6FbHHT
         /Iig==
X-Forwarded-Encrypted: i=1; AJvYcCWoZ6sLz9Hslv302baiM3ezUUGGckZBJgvLsiZX2m5qm07/+KXX0bVB6DL3xX9LMB+8rbtsWWzy18wSry795JZqLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwV62Y7JWZI8VnKgkdXa+yPfCm+XEtfaZI7Rlg0hfavXPytPz/M
	IfmdlUDp6l9sZzPBQXn/Ask7jCQUaAQWkWJPKezMb090VAN/g4Uri/Gi
X-Gm-Gg: ATEYQzyTLtmWI/rBBGlGJbZbvzU1CRxdI6+Gv+UHyFRaN6CoGpL50i0nSq7Ll9wKUZN
	8WQhllCHabr6QYvH21Nl73GW3w41VDKEPaZ0HM4bpU1g2H1cdSAgF90cdDZUv3xLBxfkNhkjXDB
	+nNAUmYCuwRMi2ZPg1V1RcJSgPJhdxoC7dFbCAZMDrYLkP3MVPzDbopMMxPdUv6CaKV3O/+bAWY
	FRD6GFtgFGym/yKPEpouQlLcezYkla/fSmKTrsPesirwZ6D7Q977ylQR3nt76Doe1Xm8e8Zxp6U
	TG2N1BQZh8EsTzqCKGVHFdaX8u9JY2OPW0nH03Jo/a2CfT7plsaWcbsBDmh9764YiFiOBaQhaVq
	F9s7wyzjhmsPAFB4LdcFXsavg6FjNe3bWOMVXjMwbu21QdixME/SPWnNNLIpv40L//zt2q5CH1S
	3mYSMT6oslz84yFWyyW3XRzvYgI1RaoXwn1OvwhS9QGABFScVlTMFAyMQE4VHmSYhm3nch
X-Received: by 2002:a17:903:985:b0:2ae:8293:74ee with SMTP id d9443c01a7336-2ae8293797emr18095625ad.48.1772793672405;
        Fri, 06 Mar 2026 02:41:12 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83fa2fa5sm16107775ad.70.2026.03.06.02.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 02:41:12 -0800 (PST)
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
Subject: [PATCH v2 2/3] arm: dts: renesas: r8a7740-armadillo800eva: Add wakeup-source to st1232
Date: Fri,  6 Mar 2026 17:40:24 +0700
Message-ID: <20260306104025.43970-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306104025.43970-1-phucduc.bui@gmail.com>
References: <20260305113512.227269-1-phucduc.bui@gmail.com>
 <20260306104025.43970-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B648621F05A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28927-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,sang-engineering.com,labundy.com,wolfvision.net,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org]
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


