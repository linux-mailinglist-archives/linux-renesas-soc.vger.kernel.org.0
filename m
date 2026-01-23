Return-Path: <linux-renesas-soc+bounces-27368-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHUSFI/9c2mf0gAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27368-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Jan 2026 00:00:31 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4427B532
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Jan 2026 00:00:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B2643013038
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 23:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 837CC2ED858;
	Fri, 23 Jan 2026 23:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eu9fJu54"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF05288522
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 23:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769209227; cv=none; b=S0N6IVVIAfZATVLg0Ew0khlikgUXwsGIgfL7F8rSoBJnInutKjduxljrrt0XZ2ncPf3UHV6Bg5vghDsXgYdpcm1O7tY/UdQOz1tVRwNs/acvWyNldfwM4kQOGh4uyt+uElOBRea79z9I42ZpSGUQzgsjD/Aav2I8iKyrrwzOzEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769209227; c=relaxed/simple;
	bh=gMCUgoaCQ5f+J+ddeO8YUO+LQ3B1ap2I8FkG+qnup34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T5V7f+fcRnqUEWKc+YahqJffCmyy/sJT/DSNPFhWZ9p0Ww68+zyzAumJv2Sc3m10mNRUfdXMnbS+pXFOFV9Qerj/O8lEmhidudc7x9rD2izqUEMzVV5YFi0uKRVPWJa+YjLUvpx5GkcQocQ9HvCFdHuXlP3xJnzEqtz/80f6AbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eu9fJu54; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4801d1daf53so30253975e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 15:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769209224; x=1769814024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xuo+NZc4vF7YzlS1SzqeQ3Ig5W8Pu0fXgJ9ggSnPoxM=;
        b=eu9fJu54OJpTDO+GhDiq1GgMxCiTyqohGQ5xBH0py8yFjzjYu482EiNzaBL39Wy3pV
         zJ+I7tlub2c0Z/IQz8wAzt655hmLjPf4KDEKI/xVyAL0T59MRVaCNZx/2JHtjbCsXFgQ
         JImGzyq6U4kjpnTwo8/zJYmqG0MUBlSgD9Vrl2VgH+RhiSchMUm7bDxOmNm1t2yjvys4
         5SfzzkE4ytuTdkuObqNCzRsBCF/f0NXcYJ5yysINo3/m2KJ2K3SwHza8bv/JRzNOvFgb
         F+ULshxlQ4fzv4BtUCpjY82Q3tJuHk0nhRUJzwX3zqISI3FASjjj9VMmy9SyshtMd+KC
         SMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769209224; x=1769814024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xuo+NZc4vF7YzlS1SzqeQ3Ig5W8Pu0fXgJ9ggSnPoxM=;
        b=A/mE4XfoDOQzXlI8kkFWQk6xNzUlpPHGHX2u7kCzi9k44GrKbYzEUdl+W9b9IiQiBu
         q6QhsuKi3/68sDYlrjoV1K3bF2qlyxDOKD7UNdQ18UMfTrJqTHjQbSum5Uw6dNhF27oP
         J3m/L+spiWl7hJgtsPPmBZeGhMKQ0CKNH6l5dDeqkE63Znym81hDdseuVTassVg/n7K3
         6f0Qv25i02wMHW3OSsSriyHx5Bjaiq0/vG+IFOxY22Wulq5jR8LxU7PVNqyW/heI5yzp
         bDpTN30lMugyPbIRNUAl9ZU/EEG4UymqXjox03uhCcSJnttO/3J03JAYEtpj3tNojU95
         mRIw==
X-Forwarded-Encrypted: i=1; AJvYcCV0DqrOVpG7cSvjigR6JcCtZ2nVMHqh1Q86yBYOR+I42NrfZgwSIMMhIuLmD3Roxdplz+tkDX0rNydMCL6OV6euag==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfyA7puQ1x+heY5iUqJxvhVpszIJGCAWpCFklGkwjiRrzIlMMg
	eJsJxoN93Wya2lC1sQmRPbrN3dJAwlOsqxT0O20n6N20FInRz7nB/uBz
X-Gm-Gg: AZuq6aK4u69/AHT7nqpHtBkLD+NpV1yYkms+pIZ6I5NIac8Spl+g7q54GaWs0PaTdrg
	Ot/cVQ2v7ucNQz8zJTb2xp5TnOjsVUYgDh5V6N3ledQjbH3g1Je4rvubbetY9KFvwA+F5WvEV5I
	lMOEDf360Gz1BDEfMwB26p1hNgYYSqr0zGxCh9bTbvsKfHmp/zc9y+COvlg2XJjzK9f6hGgnjmm
	7B0lbq68+kkUmStfkFpV0L3sc3RZTskLY71DL0kRkGbGX3raZavlp6ChDfoWAta2lzhIdjJySR+
	8wJJn3elhcSWdN0V86TgQTHeGU80f9nnQEFhf2P54ykJq7pkRxDvRbXI67eHSul2m0Kmdgf2pYE
	wHSYMZ57/Sw3KXmHlhUIh0jUAiwFITkmVsR7shFDiBkjLGoDakHbGq5OfwwellVviLLR88+wvvj
	tIBD74+XYczufQVCHu5lKRXWSEd/wo6Z6P2N0mIFhD3xn/L45t63xqJdNffLFChhxVDvddWOOU3
	osyqudSsCLw42w9KTUWzd/c
X-Received: by 2002:a05:600c:34d3:b0:477:93f7:bbc5 with SMTP id 5b1f17b1804b1-48051905a38mr46895975e9.10.1769209223837;
        Fri, 23 Jan 2026 15:00:23 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:bccf:b3b1:e288:4e83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470cc278sm157142665e9.12.2026.01.23.15.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 15:00:22 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/4] arm64: dts: renesas: rzt2h-n2h-evk: Add ramp delay for SD0 card regulator
Date: Fri, 23 Jan 2026 22:59:54 +0000
Message-ID: <20260123225957.1007089-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123225957.1007089-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260123225957.1007089-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27368-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BC4427B532
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a ramp delay of 60 uV/us to the vqmmc_sdhi0 voltage regulator to
fix UHS-I SD card detection failures.

Measurements on CN78 pin 4 showed the actual voltage ramp time to be
21.86ms when switching between 3.3V and 1.8V. A 25ms ramp delay has
been configured to provide adequate margin. The calculation is based
on the voltage delta of 1.5V (3.3V - 1.8V):
  1500000 uV / 60 uV/us = 25000 us (25ms)

Prior to this patch, UHS-I cards failed to initialize with:

  [   32.723914] mmc0: error -110 whilst initialising SD card

After this patch, UHS-I cards are properly detected on SD0:

  [   28.379122] mmc0: new UHS-I speed SDR104 SDXC card at address aaaa
  [   28.387239] mmcblk0: mmc0:aaaa SR64G 59.5 GiB

Fixes: d065453e5ee09("arm64: dts: renesas: rzt2h-rzn2h-evk: Enable SD card slot")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
index 510399febf29..f87c2492f414 100644
--- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
@@ -53,6 +53,7 @@ vqmmc_sdhi0: regulator-vqmmc-sdhi0 {
 		regulator-max-microvolt = <3300000>;
 		gpios-states = <0>;
 		states = <3300000 0>, <1800000 1>;
+		regulator-ramp-delay = <60>;
 	};
 #endif
 
-- 
2.52.0


