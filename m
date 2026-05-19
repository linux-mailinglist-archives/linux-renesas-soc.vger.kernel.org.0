Return-Path: <linux-renesas-soc+bounces-32792-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AB2wD1s1DGoKaAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32792-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 12:03:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EAB57BD0E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 12:03:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B06183047406
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 10:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5433439DBFB;
	Tue, 19 May 2026 10:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZPHgXDBY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50B7396D19
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 10:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184829; cv=none; b=QLE5wzDhDlxwgUVuhdnfw+6riqLm27se7B80hgCA6cOfpn24g350iCIj5t7kNE1EQmMxt2OmZYxtHkXYzp/DK6eVstogHJ6kD4/JcxK1dsiRBfag7AWcACEOGPuD2lDb18kVLFrv1htDdRD91XprYhcBzJbot5nM0pqz+6qcY6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184829; c=relaxed/simple;
	bh=Z2cv8nB9Bo7eZRD2JKwwYfhOOJYfZGL2ji6ed9VXFpY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I/1ZTsTSQedMDuWIgu6LnyPx2imiFko/gX10Mi0M1qqM5x/6RZ2+rvWHw/LXUXCk+v7/7YWf5PJIrU5ypsgd5Bvh02mV32JOri2GgH9H/SM/n6gwU6W6XsoGGRt5uILU9+/DOqhtv8Mqx0b9kKyC/EGRJnGxugNLF9rpGibLpyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZPHgXDBY; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488ad135063so25863595e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 03:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779184826; x=1779789626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gPMXDUV8ksnki0TYxYEX3U0Fj0wzSQ7y1+fTHl/YrAI=;
        b=ZPHgXDBY7XjeK57L8im+ZR98TvpUzebjFaPDMrH6vkI+6UeGOFDai8BlQVa6y8Fkg3
         eH6oPY5p0cmNwZa7Yq3uKM4DB/f6qt+xcvzGsJWyWX4SzrkQ7lFW2aKZVG6aOv508EaM
         eouf+4KsagbRrz6OcZOHvgevCI7OECQykOr3nkjY6u6fMfyRytHFWOc3ZxzvyrpQ0aKQ
         VUSIQ8N5VkISTNqaMsW29FMQgC/54RH+BqDlWTlKNRzlJXt9rd7tKzxiWuKX8ZDcC6/W
         UUt3qU999jNegD9XLIM9H9iHovCcLakDo1xZDhO+NoovEHoX+trTt1l4m0lgpRsFQfDw
         MAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779184826; x=1779789626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gPMXDUV8ksnki0TYxYEX3U0Fj0wzSQ7y1+fTHl/YrAI=;
        b=aTNMVrunJ0KA23rweXzvMJhGYK81bpesy5JdpucEZ41t7aRykYFY7DutuYHi/5vQ38
         vjRDSdJOSixglCAAf3eK1bMBWOiNm10/kV44YAO7qM0+zhX3JcqU7Xxo26DbbNnCVcR9
         M7fJJjpsklLwnDNjQnvL/lIhQBkgO935xTkw8VLfQd55jFim+hh/zYWT2lzZS+yI9xVC
         NFqirY+LxTQLFa4Kqc5BsCHBcvuHOfzF0Vo+UuMEWlOq6IH888srUIDH1Frr7sm3itRk
         s1Chhh8o23Gbe0VLGNZXTkUGKN6odhbhbkb24W1Y/8FS9KnTTSbTuaKwvrRTvu/kmvHe
         G+nA==
X-Forwarded-Encrypted: i=1; AFNElJ8ZBnHgUK1yw0erpIgMplJRlNR5SCa6u0tJHbqRCtwePOP29Dh4y8DnhoQv8ZrhcBbY6jVCvOLo6jb+kSyiddKRHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeJ4MLN5hurT2K1vniTMzqLmELu5UPPELCFy8eBCSUSQvRFDZg
	3bX9iuLEK+0YuiMLfdBXlOMLYUziPjKz48aueFfqnptIsrU2sQNFFFas
X-Gm-Gg: Acq92OH36IXuyWdm2X4/u+KaPIthbbj7hevwGpi60ryk1kn3rRS4WZLPni8zJKXrhq4
	KxltNvoSEVeRGpBSHG5xNZNYKwnnopBLlc3V3+e5vKVf22bcfNfbuXk6sFm42aE76eqShV5oxUP
	sBuJ6n6s9/Tjg76ULYfL/1QkLHtf89GA2VfDndRoKftmlMxXZXG2XM2QeR/D8pFruvB/h7BtzZE
	2tuHnMCUz5ehfye7XLri7axc/XF/4r4uSK8JDRMg6drsxz9Qa/k1JimW2c2rmCEUjtq8FbyW2/E
	47Zbov3adxWc+/q5x3CvqphrlEns9kv7zU+MBF2pqkoRWPF69lITETomwZxQA70UZLBQRM4934+
	iGKrrs6v/gHAoE7jfQ8oCCbE6wLjURWM5S0VQl36yDBHumIsb4AmW9/MfAj9BsA4bNQ0ZOJp8P+
	K7fbUBQym2yvcawpOnFygsi5FbEFaUIA7kvqi8mGsiPYWEB10Y
X-Received: by 2002:a05:600c:34d4:b0:48f:e230:c3fa with SMTP id 5b1f17b1804b1-48fe6626a58mr296997035e9.32.1779184826098;
        Tue, 19 May 2026 03:00:26 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:4abf:a82a:41d5:6663])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febc56f89sm131791455e9.3.2026.05.19.03.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:00:25 -0700 (PDT)
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
Subject: [PATCH 0/2] Enable RSCI interfaces on RZ/G3L SMARC EVK
Date: Tue, 19 May 2026 11:00:16 +0100
Message-ID: <20260519100022.116318-1-biju.das.jz@bp.renesas.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32792-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: B3EAB57BD0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable device rsci{1,2,3} nodes for the RZ/G3L SMARC EVK.

This patch series depend upon [1]
[1] https://lore.kernel.org/all/20260505123708.134069-1-biju.das.jz@bp.renesas.com/

Biju Das (2):
  arm64: dts: renesas: r9a08g046: Add rsci{0..3} device nodes
  arm64: dts: renesas: r9a08g046l48-smarc: Enable rsci{1,2,3} nodes

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 84 +++++++++++++++++++
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 59 +++++++++++++
 2 files changed, 143 insertions(+)

-- 
2.43.0


