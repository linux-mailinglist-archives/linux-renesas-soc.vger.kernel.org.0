Return-Path: <linux-renesas-soc+bounces-33458-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BGixBIFCH2oVjQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33458-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 22:52:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF1D631E45
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 22:52:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=c6byGlGz;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33458-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33458-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A10F30956CF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 20:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C523A3845A7;
	Tue,  2 Jun 2026 20:47:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF363876AB
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 20:47:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780433232; cv=none; b=jnvSuX2E+9Lp7Be3bAYG1eTYiDMaN1Fi6+GTJ1/AXvf8fGuCFNPdWr+/nZHdS0OtKeN1n2JEa5wNbEMAU0Zn6WuyHjBmedxuyUE9jOJXokxnFLHEsTxkYBBzi2fh8FQolOTNxPZzWa/f9saaTQqVdodxb+62vh5p7azWx8s18l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780433232; c=relaxed/simple;
	bh=CH5jEkH/7DtiWKRIAoey1zT04jj0PVsEEIht4C6SGRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j+n7FH+m0DOjhEH7xYrrU77qeyAuchuOhO7uuMCDdLj9+7GNIGu5XeCy54sXba/SR3iJD41dNwjwb91HUKQiVpK8BzBuedpJZYwBDL7eE1BEjjbG54JGw4nLH5S9c++4IbW/hvNZ2YPYVR5hzJzsdd7Rk60kOWaDqXbstPtOYXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6byGlGz; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4906869f0cbso113119815e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 13:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780433230; x=1781038030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c+zSDqbjDhTQXHHFgjfSwZJRVdEr3LaMQ8oiOrRUKac=;
        b=c6byGlGzI/L1Gtf9ar+6zcEOMhNYYnEVKtZemQPfrsmddyy3ZqBWiC4S2g0+7Fn/1S
         1hrs57BSxXWA3C8uv0T5EbWiTKIo/reht++La/ZvunOWjug+HrOi4HOq4Sb6ZlGZw1pM
         edZkI8Wt7LsJEl+FHEUt0UNqaRK95jATgW96i511dlaAxemjb4oSlfrfG3JeRhVvQvdQ
         kOdVzmp5O6n0QLwtS8GDjqjDryqOJim56aEW8sA2BshAIJocXNdBAdHJ5QXtt7zeWomD
         UPdaq27rjUVoKMJnhh6vbPzIF7uuLUBtAJM3sL0brOZVNK5hpZ0xYk/xsuwSWS/JTdv1
         badw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780433230; x=1781038030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+zSDqbjDhTQXHHFgjfSwZJRVdEr3LaMQ8oiOrRUKac=;
        b=pEalo3yTwZAgTF1ObCPS5lGZ24RBGkFnU5n6p80oAh9D19gWuF08/GlbHP0P99Bzwd
         R11183eLn5Pdvd3gsMVy86jbhmUta5TBmFWAAyDD5+XZrKB4HLMaic+HETDHyYV4Sbp3
         cp40aoOZ7CqKtHjrL4hhN0r+wk2nEGigMwOf8VfxaSDf2ier98ghnzGkc+DIVEgO3cYj
         qrz7QVdCAiSfqlwrjkLF52MOOEpSJakFQHNL3NVxAQviF2ghzM0PokL4YaB1KAFr9vkN
         AtcG+hQQjHNNAQnlxpyB5BGVPKkfAFkXk8R7xZrvajpCZenOlY7/rM/j6STIdSIzSK8+
         vQiA==
X-Forwarded-Encrypted: i=1; AFNElJ//2SkkX093HNNrz6U9e8+FMFn5PFwjTCQaTMgVKd+5cA6lu49EeMpi7vncmYhlKtc3bTZ3SbixqSjt33fL7PJDbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7nZ4bxn5gP1y/CgHI+XCGuIWO9P/TtY0iK7+g/loS2EeF9qOH
	gWDSqDOwRi5GWFCR3TaCDbIhUVLv1gf8zDe04T1e+08LQb0SWesF8rPn
X-Gm-Gg: Acq92OGSJG+O3f+T5WtZfdMFIJ9BwngCMwP2zY7IdoQpWCk2UZGJn6SCqEImtR3ab4+
	+rcf8nY8CmOHLXugHlKF1oDawoIyTQyPdVq0JW62D+Hc+IzxtNdjsg1cQQCE9QsQLiOpV1g+LNl
	q818So4N8+bPiBNiBQT8u6SVoJN+VR4i3foVXAjoSYpYt5dzV2kvGQQQengXlmnNwC2iu/MRydL
	ov5UoOf1BGdiiN0XsV5AjUCepTBqbObEUTL0qUFq7EZJEHw6Tn+1PPXydMUpUKx4+dP+iIetoc3
	Yoxkox9eHw+JkzwsqmbpAwt45aP6rvQuznLRwxWd4Ts/QB/Ogf7eT9x8WGU5ppVXGIIYBIuPka7
	uu5p3Wzzikv+5ttZov/rmfXk0FRjkOELNIo9Fnddc+MXAMYr5J3nRSwt+E4SEIH+FO5wnEH908L
	JXRoaDPY0pGGed+gMHSJfBQiMHo84rXEu4DTGISZrca6Jdwnnpr4bVoLpvJwH0mT/w6rsB8rA73
	qUGkksVCP2xj8WlgIPX7V8zPnySJWyzBLKebcvUjFTPDeNYdsDTnVDd
X-Received: by 2002:a05:600c:5288:b0:489:5022:39a4 with SMTP id 5b1f17b1804b1-490b5ec053amr6618515e9.9.1780433229685;
        Tue, 02 Jun 2026 13:47:09 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:5ef:9913:4a77:3bcf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351d40sm1957833f8f.26.2026.06.02.13.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 13:47:09 -0700 (PDT)
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
Subject: [PATCH 0/2] Add PCIe support to RZ/V2H SoC and EVK
Date: Tue,  2 Jun 2026 21:47:05 +0100
Message-ID: <20260602204707.1920839-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33458-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org,vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bp.renesas.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7DF1D631E45

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds PCIe support to the Renesas RZ/V2H SoC and enables
PCIe on the RZ/V2H EVK. The first patch adds the necessary device tree
nodes for the PCIe controller, while the second patch enables the PCIe
slot on the EVK.

Note, the driver and binding patches have been posted separately [0].
[0] https://lore.kernel.org/all/20260602195019.1798126-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  arm64: dts: renesas: r9a09g057: Add PCIe nodes
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable PCIe

 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    | 140 ++++++++++++++++++
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  18 +++
 2 files changed, 158 insertions(+)

-- 
2.54.0


