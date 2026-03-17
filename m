Return-Path: <linux-renesas-soc+bounces-29651-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFhsHr2vuWkkMQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29651-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 20:47:09 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3738F2B1B40
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 20:47:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B9DFD309A723
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 19:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 373D637A4BC;
	Tue, 17 Mar 2026 19:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VoCcwT/G"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E0534DCC4
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 19:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773776700; cv=none; b=KWQyoKFiQl4D7agBSdoxisrqUhkawe07hTckJLCXEK2AJQ4o595DGd23pgfxddhnJmGb2fFN/NrJ3mhBM1Y6AobyFSVJIRRAhSykxXHMWoJzw5Gi4KYDiC0GNIzsLzWiRsdmG1MOsEQq275SeZPdxnOQgzPZVVWQluqYlt0lXcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773776700; c=relaxed/simple;
	bh=dn5dYtHgaaeDgKGCPYx083eAJbV1dxvbfBoMMROgS3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AWvDY8vw7Zsxw7poUCIC7yGOTtD/yqH1bowDev3FwM7yJF1159OdceObFBw7wekax4vpTYuDCU7TvpQ1YYQqQwrWHj/kmK/bMXgopYpCOa5fzQ2AFKWqFntHh7R/psyVfM4t8B7ALpwJBLVa1uxOFK7/cX6kLZIuPtjHAcW7xgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VoCcwT/G; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso69951455e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 12:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773776695; x=1774381495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wF52lbRB7DTjuwvGcCQ6Kt/mFwxZK5Ryn/ExuWo2fw=;
        b=VoCcwT/G9toXYc2100owvoT9iyuPb0gL71POxaRLYN+L6GTV52nDOvyW+or6xgSDKa
         GOL3LX4MFx1xdd7e1KnFlGQ5WiKxO5J5CncG7wrcnBMfMwaF1h/byDJiRW/MG6MbHPHK
         USmVKlJOfYFgQeDEsJE1bsbKlaIyZgXJNMR3S+r9zYNHR6+8EFZTo9VmDJ8bG6toVMYk
         78YqrvvAJiRzhorZtn8vm0x/kw0CdImpqzx7F+UHgZS0sPfjP8Qkf1T2jAxpOoPQMB1t
         aWlSwrwvzqgUhIXOC8c5eHjeaniE+C9E+SiE8V7A7r5HVFkeEkjVMIMAqlytE6BVcoab
         JjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773776695; x=1774381495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+wF52lbRB7DTjuwvGcCQ6Kt/mFwxZK5Ryn/ExuWo2fw=;
        b=TeQtsPGCPxZIt0N1M5HLElvogdr6PfGh2RRHoOF9rHyJeFEQZO8CXmQthyW2NFOQ10
         eJUE4BWgs+fmfkboE70kFJk2geIzDmhrCRuFW9xsEBn9MkBOS37hqV4BMSFmngzUiLcT
         r/NRHbwk4FSnekN4ZjDOJ0Uajs93KD5FvvxR1+v55z336JoIIb1K7FXGWwE0GvA/zisz
         2PlWuaSgUIvzQzU680atiohecb7GtP/S+shgKkZg7K6zeIWN+WziLm49Hl04hJ1XErqB
         bHVR+al20v0SXEd3OjEeF+S91GwEt76OZDz+XWPeRWYyb+s7zQINvdchK5twU52v5oR0
         lBdw==
X-Forwarded-Encrypted: i=1; AJvYcCVNCQ9ezS78Ws/kFVeQ0u0CYwlEpEtRRQiYzRGOjy2swMhrTlv67HFA5h5T9tewuLvE7pZzOWdaQuIraVbxVmnTaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpV1mA4EnBUte6aDUT6GVW8LSJP4BZ1BDXh0BhPz60cJXW9sWU
	N3BNnIwfW+29umU3qCQlUi+f8s2PJYpaLQPxIErWuL/+WshrbiU9FU95
X-Gm-Gg: ATEYQzy7+Xm4e2zNfEfOgtMLyYtX6x+wgAS4iOxTfZVB+RGlgTeuUCSHXioy+5KgxDk
	RSCgQhad1gxCj0s4GW5GwP9mgDuoVSS9oRRhltfe9+wN+g5dMhBrpiNoccKoeCMs4yyb0yhwyUO
	N+Xo7xV7jqZvxQ7aub0RDgYOPXpx+nsbPU96ojodm7FO71sf6KCSJwqe2yVDABsBRsHPrXlOPWt
	hAom5RJWn9iUyZcrf4mrG5jUq9ZXSSGfAyhGJZtDUl2RMbH7E05jjT5JrJVVYeaT94/rAcDN6qW
	ZngPu5/SztSVkj+BmleVq6pJ0DgvxqgOPHRRG3YVpbz45Vez9jdyi6qn0UHE3GHqisuQ6guapkB
	8mjsjFjCPdMMzfZEvht9Vl1MPIUMXBBMYW1VSioKR6IScDQ+g/o6nUcVlEWA4PT62FQvDEwHIZX
	jXdYJq9Dd5EcaS0+EWy6uZWQWcJ4iRUz+cKZhqqi0I9x892lkY
X-Received: by 2002:a05:600c:314c:b0:485:7f02:afd5 with SMTP id 5b1f17b1804b1-486f443845dmr15952565e9.13.1773776694620;
        Tue, 17 Mar 2026 12:44:54 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e16b:fc56:e220:9aa9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm1788235f8f.21.2026.03.17.12.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 12:44:54 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 8/9] arm64: dts: renesas: renesas-smarc2: Move usb3 nodes to board DTS
Date: Tue, 17 Mar 2026 19:44:35 +0000
Message-ID: <20260317194442.468147-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317194442.468147-1-biju.das.jz@bp.renesas.com>
References: <20260317194442.468147-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29651-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Queue-Id: 3738F2B1B40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The SMARC2 board DTSI is common to multiple SoCs. Move the USB3 nodes to
the board DTS, as some SoCs (e.g. RZ/G3{S,L}) do not support USB3.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Updated commit description
 * Collected the tag
v2->v3:
 * No change
v1->v2:
 * No change
---
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 6 ++++++
 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi    | 8 --------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 1ba50512f4ef..9e66f2179807 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -264,7 +264,13 @@ &sdhi1 {
 	vqmmc-supply = <&vqmmc_sd1_pvdd>;
 };
 
+&usb3_phy {
+	status = "okay";
+};
+
 &xhci {
 	pinctrl-0 = <&usb3_pins>;
 	pinctrl-names = "default";
+
+	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
index e2a34577a1a1..696a933af808 100644
--- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
+++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
@@ -111,11 +111,3 @@ &sdhi1 {
 
 	status = "okay";
 };
-
-&usb3_phy {
-	status = "okay";
-};
-
-&xhci {
-	status = "okay";
-};
-- 
2.43.0


