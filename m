Return-Path: <linux-renesas-soc+bounces-33598-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E1IeL96YIWqDJgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33598-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 17:25:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A28D641668
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 17:25:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=o2JuDYDM;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33598-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33598-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A839930BB1E5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jun 2026 15:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D6B329C71;
	Thu,  4 Jun 2026 15:19:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9170633120E
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Jun 2026 15:19:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780586342; cv=none; b=mLnEeP+3f+uu4RT5RbMQls6FLEZR+X6i20xr3wfg/Luje/YukRA510jmSpY+Oryl4NtmdQil0GS4Ajg2eEtrJZ1s46XbjZPlGuPakBX5MeiL1ueuYVm/Qjm6k4vfN82gGvmzdqoYXY+0KtgyrAKFW8RxLE3wElANoucRXwtlX28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780586342; c=relaxed/simple;
	bh=FsJzusXRvjkVBK8CC4DoLzl0EEg02IPeRG+NSu1x/s8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IS5cH34DaEv9vcA6nvwXeeXSqEUsSvhOdvWPSw6SDHgWHzrtdOEWOuWXn+7ly60ivCTX2XRZpfu9YEyLATOsC8iJKyqgsClH9Tn/w4s9ApyFmzUBD28zEIeUsMtIztKIVv6I+6XrMtdrCCNGGuBnWt+dMpKES48KfTaSc5G1lNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o2JuDYDM; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b9318997so6427305e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 08:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780586339; x=1781191139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v5Yo1OVsaBzd6nBAtTG4s9KPM7zpBpOTGHL8RzytDbE=;
        b=o2JuDYDMnnaKL72OufOMaJTrWIxe8MvV4t7cgEQWQ0sKAoOm3mGDKWFc0X4mc/uBbm
         feD0ngnBXt7RUBGIvaP7dVcLILHn5waHybtPpBSSERJsBDZvFRrL/VXuml5DYPjVMTpe
         rITvAW8Zi+c91u48xon3sO/w1L9+fYfqjYpMi/hc6e1329JV9RqW0dlnSxwEiPdjo6Ju
         LAcSm5cMteooyViGW0jjeG5+fuc/joiSuWhRflTg+D5sgPpIRT/wjgBhnHUcTe07svVp
         KHgrlUPQJYlP6PXy3oDdb5PEXex3qNBF5goUM8PNIZU+gKVhOO54ef1hoA0xQ3NI8sGn
         ewaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780586339; x=1781191139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5Yo1OVsaBzd6nBAtTG4s9KPM7zpBpOTGHL8RzytDbE=;
        b=LV0VfkKfYlrA7AQSuS+G1ouLqfpb0uA1STGMfPMu/zk2qpILiOFgAHWxCLeKZE+/2Q
         sIxOsdtp9TMpzITaVnQVlutWJHcq3hkyDt5MTgyuu+zGUzyl1sma4+EjwqaPdg5+48Uq
         3E4Giyl/JCpTHiRXF42H1skhXmE6+LAn4kv39hR4PpladgS+FZKJJNoc90RJMzmdwe31
         q9LC+K1w8v5wJToNG4TUUlFmPDAB0hgKnVu3K/pylfH1nBiOfWc5A0Uq7Rg0eJZByiZM
         AACovhWYFojOhnr9l80SF0DnFU2UHGkR+Rdixmj7hrc04CLcXjscbHZc6fPM7YO1w/oD
         HL6g==
X-Forwarded-Encrypted: i=1; AFNElJ86VmSX4L8hqOhJ9wyNWpMk57mUKvNrVsSLmB8alOAVNerwxLp6n12LezBPCZUqPP4Kpm7YG0pDXv/hZ5EcvE9uDA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9ShqZWAxuGbDDUvq9Bkn8CARrNqgz/uWw8LPMNDJK7MfY14OZ
	S8L+3YE79GlzD3XWSCd8nzBFHRQbfzwRnHshyiyLuEs0uKcRmQTRsYm/
X-Gm-Gg: Acq92OHR2FAx6F+MhRtjobnfNb+OFX9XzXsXt5Kz3cdyfHbUQxnpnZ6eeBUhkT9eLb5
	hp2FQHPKt7aZkIrO/mju5IroE/9NaVGpVQF3LpsDcWElmj+1AYZY0b9gRt0XsSpIINrD7gHu1E0
	Gzb3Wg3YtyjnA/5V7SpRotk2Or1YGcLnb7nN+jjf/U/5otUsVC5cHU5yiw4dMRdr8GMUKB/9N4B
	OEZC/2edAHvTyV4iyPC6W8dq2t90HQlka7z/c3kTKQ9m5NyMDaGRgRSN6i0Zi1omQk2OyYtDEM2
	gH9BitJr3P9bvYqZWQ5aaKhenNp+aiSOqAk6cD/UgxSvhK5APYJhgrPIxCMXyolhmHOLdjQPz4q
	WIvK0mKaT1Ilar9HKvGvCx1Qm9mikih3oaMWkdd+k2l5b/jZPfGOtO6/Sazt/wgcHXqdbyRygRI
	S9rmqHSjJnfhcelnjlrgvSS021pb1BAGMlJcAdco4yhBbUOGjge8kHesl9MP4=
X-Received: by 2002:a05:600c:470e:b0:490:601f:d775 with SMTP id 5b1f17b1804b1-490b5e83527mr132886395e9.5.1780586338813;
        Thu, 04 Jun 2026 08:18:58 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:1615:3574:e0c0:837d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b5b82sm82776805e9.1.2026.06.04.08.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 08:18:58 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/3] Add GFX support for RZ/G3L SoC
Date: Thu,  4 Jun 2026 16:18:48 +0100
Message-ID: <20260604151855.307772-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33598-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sboyd@kernel.org,m:biju.das.jz@bp.renesas.com,m:bmasney@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,gmail.com,kernel.org];
	FREEMAIL_CC(0.00)[bp.renesas.com,redhat.com,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A28D641668

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi all,

This patch series aims to add GFX support for RZ/G3L SoC

This patch series depend upon[1] for clk and dtsi patches
[1] https://lore.kernel.org/all/20260603065731.93243-1-biju.das.jz@bp.renesas.com/

Biju Das (3):
  clk: renesas: r9a08g046: Add clock and reset entries for GE3D
  arm64: dts: renesas: r9a08g046: Add Mali-G31 GPU node
  arm64: dts: renesas: rzg3l-smarc-som: Enable Mali-G31

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 126 ++++++++++++++++++
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     |  14 ++
 drivers/clk/renesas/r9a08g046-cpg.c           |  23 ++++
 3 files changed, 163 insertions(+)

-- 
2.43.0


