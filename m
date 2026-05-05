Return-Path: <linux-renesas-soc+bounces-32083-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uI+cDLfp+WmsFAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32083-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 14:59:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A06344CE0FF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 14:59:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8CA80304202D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 12:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52171426D37;
	Tue,  5 May 2026 12:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LsQD3jVy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C9B25A655
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 12:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777985968; cv=none; b=nDcV2YnXNEm3ntrxfQdr9xvYOpMQb/DHQ+Y+QnDNoWimlUNvRuTqxka4os4mS/X2mpMPhPBSUV9r39yCRaB7kkAY9A+DqFaQoVcC2DouG4I/ITJaHuWGjj9q7BTD4vBLWK2q3/ZX0BB5j2ActCOd6a4esNlhf/EiXsNzcsoqls0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777985968; c=relaxed/simple;
	bh=hUzf6DhWUXDvkdX8HD9Gwj48RIJFkDs0CZ6OQcnOoD8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c8E93mppuB/wv/xKHRZn7LjmCjljhDo143qpuacyeCvh1uPcKVxJ2KyZ/Pc2aqZp9YcJ20tF0TmF2SaxgNuFhmckcUTUd9N1yP6aobDBNoTzfiubDLIy2ZgpwW/XoyTKTTl1waS98PftrE8aUOe23xONWAE21l7QFDN0QfnR1aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LsQD3jVy; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488d2079582so55809155e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 05:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777985965; x=1778590765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IPKJ1OltZUIEZcaxYTjZIm1/li/hs+r7skSVCHusmnM=;
        b=LsQD3jVyeiMymXJ26yQJXyGbD+0FYoER0Z6yE3ASiGOMn7GEoPpOzPrHHUSkGkSAfm
         TLSr9B70TmtcgfZ/zMTkgeh1gywCpuVjucF3Kr9C4qMcpLlILhhHzVAWtVWBkAmdoejT
         t6AstnVIXqX0ZE8I1kMVspWvZfizVcV16PxCYSjKdelEJi9KD39a78328IZB/d2WJxhP
         L1OqJh9SSHv3uauT662G6xGlOvhZkD0xmLgwydzWOAH9lqht2a6i2Nyt6hjDZBvgyTeg
         GFSWsBxM1ijzHmI9zOQJHIBvbaEuxiVuEGMb4pZqpn28k1rg9kg/KLu/GbKtwvhbOpYO
         +bmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777985965; x=1778590765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPKJ1OltZUIEZcaxYTjZIm1/li/hs+r7skSVCHusmnM=;
        b=dSnKHE+R+gbuJ5MV2LfzLPu5Jg56cO2sqZtKv7jeFgncQBhWbLWGmomoiD8HqxZenW
         Y31VVFUkmLWI05WgmoLJbxzhWEw+9Z2T6nw6SUodrD9ipjdjEjuF90hJrIcv//ZeedMH
         QW1hS0CV7DFj6eOdGzV0h8zRs6YV2p3rYEv6I5K6fW3yHYBchTysHvnH7vyEYjFnOcNU
         yf0vKfUUnWXoNo6AuJfDoQtWffdemFoN/hqA23tM7DhkzbxLbMpHxHTymG9EdakbxTBv
         WUBH2E4GOS175Meq0lVP2o+Se73fgDA/sA4hq2eBk5iW4Y6jg9eSal3dFiIDZ3IMlEzp
         mx5w==
X-Forwarded-Encrypted: i=1; AFNElJ8Eg/kg/lYyjaYJ3KXYv/GjJaT/Wk5nFj3hWS2GAI0IfbR2H6+w10tXQi2sDvrs0gp9qzqROLsigKDnopAwJD5BTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxliTHQ4TQ9d8ii4LW3W99FzPL243BLUksLTWEY6xhLCmaqo4mA
	64oClOdPMMqlaj/0k2q8skRNkRRxum29d3Ur5DYwEi/wVPqtrcovikp/
X-Gm-Gg: AeBDievnr1k/CwAGu9/zEUaRd9iQo4krrWGtCr9b/FldN3F6uWquBJJYa6jyQ3MzCDt
	ryKL4G6fP6mZPLs2PAv6tcsV/vJp8TG/HArpKmsu3VKYW8C4IdEAof8Fzoo7a8eBhPr0jNe1hr7
	fBheuDt9EKPZaCue3RZOFTttCJF56sF3XiMlBIjypPoncWO2rziyHlaoaYKR0Pku03YMpN9jXlP
	ZfY3AiYaIPATxHJQ1XsMoX4RNXionoMoCwSrnEPM0B8r8onEFHbpyNIOJRPMugoIO3q5veEgtTi
	++DxVAP1d1qRrfWhAhMLroE97S1/KG3n1ugM7E1DA08PtiOvYYxg7pkPSraZLrtW4vX5DRwJMLH
	/r5Bb7ptpmVpe47j82b7Vbp+h4xJfnwM38QDz54avYn4XH6s2nLgoarB8jxbvObGNPRObsUdWAR
	gQdpjSAQdOE4NYPrr4Ucwbj/2zBs3HTPqYZ048KSgz4XbrzhBYB4r6SW2I+Dw=
X-Received: by 2002:a05:600c:c174:b0:48d:1a94:56c with SMTP id 5b1f17b1804b1-48d1a94087dmr46619075e9.18.1777985964912;
        Tue, 05 May 2026 05:59:24 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1da3:f63c:84a5:197e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301ad1sm625634745e9.9.2026.05.05.05.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:59:24 -0700 (PDT)
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
Subject: [PATCH 0/2] Enable watchdog on RZ/G3L SMARC EVK
Date: Tue,  5 May 2026 13:59:15 +0100
Message-ID: <20260505125921.149682-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A06344CE0FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32083-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L SOC has 3 watchdog timer channels:
 wdt channel0(wdt0) for Cortex-A55-CPU Non-Secure
 wdt channel1(wdt1) for Cortex-A55 CPU Secure
 wdt channel2(wdt2) for Cortex-M33 CPU

Enable wdt0 on RZ/G3L SMARC EVK platform.

This patch depend upon the binding patch[1] and [2]
[1] https://lore.kernel.org/all/20260206112227.233229-1-biju.das.jz@bp.renesas.com/
[2] https://lore.kernel.org/all/20260505123708.134069-1-biju.das.jz@bp.renesas.com/T/#t

Biju Das (2):
  arm64: dts: renesas: r9a08g046: Add wdt device node
  arm64: dts: renesas: rzg3l-smarc-som: Enable watchdog

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi       | 14 ++++++++++++++
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi |  5 +++++
 2 files changed, 19 insertions(+)

-- 
2.43.0


