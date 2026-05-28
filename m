Return-Path: <linux-renesas-soc+bounces-33242-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEzxD5noF2osVQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33242-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 09:02:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C075ED76C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 09:02:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D561D30160E5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 07:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED2523403EF;
	Thu, 28 May 2026 07:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YcqXxFNJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE1928B4E2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 07:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779951764; cv=none; b=iQ+ZlXSkFwK31HulYM44DBKvg7rWRxSjMv1sxPB/Bw1NCzoNfzviowhgP2JgTZ9XwvtHGUE+OaEZ4xxpY4jmRTgNA1VuO5jqGvPKoxO3iPeTR4BvHBI6Z56l6oucjIpkBMpd2UPv1Vm3HyETxqIlpp2rqYudQ2D/XQdK8NytSHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779951764; c=relaxed/simple;
	bh=hDoN54MTD74gN4yN4xjB0MzcxLKrEqzy2G25xlC0dUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FJX2JjM1iOOvlfjNak/Tkh9eT7TiV9lzyeqXgvvn/SdIlkOv57we7LXZQUggSFgyPdyScV2y5lvJ1wEKBDCdbzRL0KyWZCDU+6oF9piE3HYnFpiGPecXTaGbmPVEWTD8AXYK7/ugzD5/vSLAJXM7xKVLSxAEWkzoZ+4l9hsC3Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YcqXxFNJ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso59099485e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 00:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779951762; x=1780556562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sP4Ad5E3RYrUNHKmcQKUr55iNcUkio8ThdQe9K6CwHE=;
        b=YcqXxFNJ6GXTQ9on4lhVcZOBsRiPGlPLOwNS5we5IkCXmjawgk32bY5fN5/6mH0fqE
         QOM8DDB8dmsPb8+UCgQAwwFwm1x7W/npSSvuNRTR5DF9CJ0iB+J3/UDdVkLxFiqZI1hi
         pGIH8/mZZhQg7mvdb0Nb86cD/1UTKCpLwdgYEWjU4SdI4+s8nLf63FHKD+VLZzODSW8A
         vxEPbM7ONua2wmZmtsB+XpyzlZmgK2UUNqwP+yjLF/eP7VLh9UiHmP4mtdSxiDPngbBR
         tov1EWfPJ5iC1iTa1jVwaePJb6W/xmGDlVwYMtldeaNpZqPRWTskUMVSzMcCzsUnfHTX
         tIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779951762; x=1780556562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sP4Ad5E3RYrUNHKmcQKUr55iNcUkio8ThdQe9K6CwHE=;
        b=pZeCsDMjlyVPcaLvLFc3FHrQ1BIAcLHuyQUPaHBV3uLqEq42l+e7i2c6NOXg68Hsef
         nYHLh/cUHc8UB5+deM9YxiQPMcisCnimLQlDBRAetnrzA8O7dQVu2X6aEOJbNGAgOXCX
         JIGah1ptjSaa5C7kN0zgiFKdBdHhn+QhHFpweuO4k4D1Wx+vq+L9BkLaWAxLbVBdqO3K
         mbMdAAvA4c2ALoi/2mxadpkWW1Zdne3Mjl1F+5tew9HGhZcisHtVABiUfBndoJmOuvfR
         iLlGKD9PV/7lgDpNofV/YcGuChi8tWqm5vx9s1ECmO4nU3/JZR2Fas6LI8S9pBTOjmG/
         qRVw==
X-Forwarded-Encrypted: i=1; AFNElJ9JJRaPTTJg5jFBPOWX/i6uMeQJksC5UvXTY3bJAYQkOEiFayL9D3K+7+HTBnsVj7U+h46K4UVSGj1W05z/6WRw6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YydyGxdIFR0p5uXE/3ye5Xn9QfWYafEh2Ju4m0VlxKaGStdKmdO
	4+L5W3DnRfQs3u8DTDRx9MOSHw1jnn4P8lK0aLE3f0uh38k5rHzfNNW7
X-Gm-Gg: Acq92OG5P+FO1g/9W0hFKRmRV6jZEREYZDDS4Kzw9QzigqylZvhO3aKXryiLJPdQweD
	x0r+xrZGvGO65FT0TkRlWPniGaYC7gl4v7XI5uIQaJkP9qAk1UPoC5M3a6K8FtWZBmlcMOilg5f
	txQ3sTIx410Y/eySuEC+jFpQGz27m1kkm/sSwrr33LuFwt0vYexyxIEpPWz3XFv+6Iha8i0EatZ
	+XDWBSpO0n+RxicPkWTL/GUmnOHCGsnNcJSQGPNsIU5geOfEu2I2gfeyx0luJWsxaG3pcYRPKgi
	TEt0wR1L+IqiVsIuNTt11kE7cNTTW2gYselvaUlXa6LhRzK79Q/k81xKGYM3weHYKw8ndTfGxeh
	El4Qn8SUn4yaAXvfCNBIBDHjeIg1ajpEdRmNc+iVjN3fTdbm5wQeioej6gkp0fYEMw7/1/PsNxZ
	kcuzKZvDGZK0ZiqXFMoDqBWdUDlM8+PVu12gyZR+uvoV/tOvZpwo6U24+VIpU=
X-Received: by 2002:a05:600c:46cc:b0:490:48df:2793 with SMTP id 5b1f17b1804b1-49048df2f57mr406833635e9.26.1779951761659;
        Thu, 28 May 2026 00:02:41 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:c724:a823:10ad:6b85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909235d4e5sm28528385e9.2.2026.05.28.00.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 00:02:41 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Add RZ/G3L SMARC EVK support for I2C and GPIO keys
Date: Thu, 28 May 2026 08:02:33 +0100
Message-ID: <20260528070239.33352-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33242-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: A8C075ED76C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

This patch series aims enable I2C{2..3} and GPIO keys on RZ/G3L SMARC EVK
platform.

v1->v2:
 * Dropped scif, i2c SoC dtsi patches as they are accepted for 
   renesas-devel for v7.2.
 * Updated commit header and description for the cover letter.
 * Collected tags.
 * Updated the macro value for RZ_BOOT_MODE3, so setting the switch ON
   pulls low, selecting SDIO {CD,IOVS,PWEN} and GPIO4 active.
 * Updated comment for SW_GPIO4 as it uses a single-pole double-throw
   switch.
 * Updated macro value for SW_GPIO4 such that SW_GPIO4 == 1 would mean
   that GPIO4 is enabled.
 * Updated keys device node with !RZ_BOOT_MODE3 || !SW_GPIO4.
 
Biju Das (2):
  arm64: dts: renesas: r9a08g046l48-smarc: Add gpio keys
  arm64: dts: renesas: r9a08g046l48-smarc: Enable I2C{2,3} devices

 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 55 +++++++++++++++++--
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 21 +++++++
 2 files changed, 70 insertions(+), 6 deletions(-)

-- 
2.43.0


