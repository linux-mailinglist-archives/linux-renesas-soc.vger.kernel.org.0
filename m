Return-Path: <linux-renesas-soc+bounces-27677-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EpyOz+1fGm7OQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27677-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 14:42:23 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 097FBBB422
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 14:42:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 714E9300F9B2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 13:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27CCD33EAED;
	Fri, 30 Jan 2026 13:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mL9mN9vQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B515328B7F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 13:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769780279; cv=none; b=JCFpmTAoyA42WLDuKc0cfe3sPkc8HLoiV2cqKOL3dO+GfOGoJ7pAOYyadnMRDgOnb3bHLDIVk/nAvc38O2L9VkyhSng/vaywZhmxCShQqQDWzynCQFZ6KATjt2/9bGLqvPMfx9BaAOROs3X0laqP4JOueWwwwmv8/mjTMPRLP+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769780279; c=relaxed/simple;
	bh=d95vyHE5VFHsMR0/siOYn9RQj1yoKkTPxH6ixL5nFHU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HkPzYX8JkuWmm+4HIdbInQ1KppAO6w3N+QMQHk4VVBa4iUOE2Iy+WzEC98reUZqCsFT2MTZvoqghZDol36TatplOmV3HBnT3G3jW+fq6GBcFGVadyZq04m2sYhd01j88WcrkT2E5HjYzTVlHExjEkuIhCXGRwBAdFrNxEshNkxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mL9mN9vQ; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64b9cb94ff5so2767319a12.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 05:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769780276; x=1770385076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0EdujWQoBAn/IwVhOEaFp9E9St0lYVYzZ1tCazrBN34=;
        b=mL9mN9vQEyJgNKqXqdBH5Wf8g4MvXPIi+Zj7VjKzM6VjD9NAl5iTjWOHD6vGzPv6Ls
         mG5YvvDfiWIj1j/0RJKiBTw1mCnnOqtdKfo/cRxpGCQtwdpd/KNgpd/Qamks5x0mb9gL
         a2BdCNH7ByNjHtWA4u/41Fo2W+E1A4UWVXdvfzzqwH3WtscG0VO9WuLNId+rAgtFh3XL
         qfe2RWQ5P5Xut7ZWxFiPRSRu1CHf+WkvzIJpatURSZXkIDXZ88WIYHV9wru1qMZBobvm
         E1X9GxmjhoG9BiKSMth4AMy66SW3VNM4i8qBA7gybf4XnisRrvuKROElrZvEQ+95/UMn
         DF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769780276; x=1770385076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0EdujWQoBAn/IwVhOEaFp9E9St0lYVYzZ1tCazrBN34=;
        b=jwcvzJZLzLLI4iimOEScJhTv8omKgtmqjRUflOcnbyJ26owTtmn74Z/r50A28KXRtp
         tUS6oEnG1htRjm/TsppbS2eRBn7Mva6AewivP3mf/QuwRBCbux8EgRgwTmH1m8aB0fDc
         BrQs0V38dUJYVYWAOPylw/efjQ2UjQOyNZ3cbB3nDMaCuPvPw4tObcLwYPYRZeNQv0l6
         gTFY15kaDYJd8GgIxe27c/iNtAOe3bkky57o6nhmbE4q/rxxkJOSDhSrDcy2LTYQk/Yr
         GiV5Wt6twCRudjVD/wKFIkTUFBbkykK70EqgMg9DACVuw7nbVbg8yrHJtyoYmrboV3hw
         7xHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXDuuTFyA9D6qjCW8iekH66jkZq7vgB05vUFM9Ot0286feR8ZGBqkG9Q6Qm1BGBfioY/c2N/CsK1y6g6q3hNBqHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYv9TzlnQWIg/mN4nwra+7auaEN1f7znNV8Dz/Se1GiKVR0sth
	s2p8fOE4glNJz9sywj6rixDwFaALDTD8oLoq78qnGXbtBu2Rq8+YxJTbA2m6Uw==
X-Gm-Gg: AZuq6aKK3GmkGoshAL16ymjFU2IJV9mMnSC/nSOJuy7erHDzYFlEOD1QgcZIAoZLW/V
	h3w1v9Ng9SwIU/Bq527INOOf29dHN+xaG5e2+j/w7npIIs2XvEeAYEKOcar5ad699e4X1s6/b7i
	yZYjKOrajBOVJbSvD5niXbRL8LuBLAohUiheCh0R9AfPWoBeLHLlIW/xbgshZ74afe3E6rNqOdZ
	TtFjV4UQuQyMEozT64n30vGdt17QCsPIYV4/KMZj2WgYqpmCGuVAHlu+o6IJIZSdvTnaE6/0cs9
	zuAkxi8eyVaBhpmhYsUpQosGlbCYAT8zGf0ZZ+jzjcq4l9wyga+PzK5C1rAyIqFNtjN2UZ1Lz5p
	VhZCgNzr6knnqF/f7W3w8BMAW0cSn2uQq8Sa102II6/GZZ9UTWO04HQqPbv7DJZEijlH1JSx0S5
	0yl6iRMHutRfQAYW9nqQd5hGKdUUWbRiDfs/U=
X-Received: by 2002:a17:907:7212:b0:b87:daee:a6c4 with SMTP id a640c23a62f3a-b8dff6846admr145665366b.36.1769773667338;
        Fri, 30 Jan 2026 03:47:47 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:bd64:2984:fe71:7633])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8de3046abasm243751266b.2.2026.01.30.03.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 03:47:47 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH net-next v2 0/2] Add support for Renesas RZ/G3L GBETH
Date: Fri, 30 Jan 2026 11:47:38 +0000
Message-ID: <20260130114744.252533-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	TAGGED_FROM(0.00)[bounces-27677-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,st.com,synopsys.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,gmail.com];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,glider.be,foss.st.com,bp.renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 097FBBB422
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

The Renesas RZ/G3L GBETH IP uses Synopsys DesignWare MAC version 5.30
compared to other Renesas SoC such as RZ/V2H that use MAC version 5.20.

The RZ/G3L GBETH requires an extra clock compared to RZ/G3E and has pps
interrupts. Document the Renesas RZ/G3L GBETH IP in bindings and enable
the Gigabit Ethernet Interface (GBETH0) populated on the RZ/G3L SMARC
EVK. The eth1, pincontrol definitions and hotplug support will be added
later.

v1->v2:
 * Separated ethernet patches from series [1]
 * Collected tag for binding patch

[1] https://lore.kernel.org/all/20260128125850.425264-1-biju.das.jz@bp.renesas.com/

Biju Das (2):
  dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/G3L SoC
  net: stmmac: dwmac-renesas-gbeth: Add support for RZ/G3L SoC

 .../bindings/net/renesas,rzv2h-gbeth.yaml     | 77 ++++++++++++++++---
 .../devicetree/bindings/net/snps,dwmac.yaml   |  3 +
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      |  1 +
 3 files changed, 70 insertions(+), 11 deletions(-)

-- 
2.43.0


