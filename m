Return-Path: <linux-renesas-soc+bounces-34564-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W0RLJuvJQ2r8hwoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34564-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 15:51:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 382CB6E50F2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 15:51:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=AqvDthPe;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34564-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34564-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 01C093033222
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 13:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D17B73E2773;
	Tue, 30 Jun 2026 13:51:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050F8283FD9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2026 13:51:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782827486; cv=none; b=iq0zDq6ySFn3b/oYyz9nFtV8RkmeXpkft3NOV0LAe+us+MvljN8rTLZNutwUVQrdtMF9lrYPtDSEr0yEga36sL68jelv2qHOKc3gbwXMJU4BBQLHXd6mVKw336U2Tn+DXOa2M/QtL9rAKY1D0La2juqd3jtnmDX5x9DJORerwgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782827486; c=relaxed/simple;
	bh=PgojFsD1/N3BmrsVTkPr2gfq4qeEOrZIF9naADyS8pU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZdQ9vAT1oSOWjxBqa85mtQk8Xrs2QpHnXyJdI+sRuJwdP+wiHFur7t3q5voDjky1kg0K/G3PGcb+jeggslqjPjGJr+rI0JFbyUJ46Bd/z67B+7W5F4X8plNtI7LoTzIrFYNSDWtWysbJgKvl6IepvI2Q3uZiJhAvPlphpt80Ylc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AqvDthPe; arc=none smtp.client-ip=209.85.221.46
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4745492ed3aso1359725f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2026 06:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782827482; x=1783432282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fXI5HLrGQCJ/qDQSn0D2WY2pyWpMCSDIiJq7g2CIyqQ=;
        b=AqvDthPep5EtWVZnDh320En24EHekwWnPrk7e/vTya6lsvlnlo2h3vYmWBdViymTJ4
         djISsTl2DmiQ44O7yFMT1TJ8aMCabQDDwys22mf6LJ3OIxHqIF4BU258TuS34fRlGamM
         phXiKiygXaPekefBB6AT15x5LptkfQxIfmZuA28fecQJnK9CQHv5BZx4I0dahnE1cgEU
         GVsWLBwhI09kSsBFot4Tc9ka2TYyNtJhA9+KOJc1wD2SL8cK4SAWtM6b40xDuVxWb5LW
         pUUPxz+sYWPOLASmkXn0kQIEoM+6pAgIAGukb6Wum/KId7du8NQyyZozF/ddEz62KdPF
         8vSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782827482; x=1783432282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXI5HLrGQCJ/qDQSn0D2WY2pyWpMCSDIiJq7g2CIyqQ=;
        b=FICIlC52RsKGByTHg8e2P3tTDHbAFPFko3XNhqAUFVn5S2EO25jzVVpT5RUgwaUrrB
         bW0/NWYbQkZZbmY5Q4Njzllzclo+y40xSk3TeWpFMEwlq8kC06r5mHjnIV5RnB9QpCdA
         6KmacjWQ0pW+Lvh9hDU8tQjKo56xIHZgWBkGzIAUXD4AYibkBXCZb8h7/qxtbbA6nOIJ
         zWiTA8BMwMCDRtp8JJfhdoHHM/mnbpByHoJqaXxfayjQIp8u8+1wlcCDLL2WQ3SLV/SL
         itVQOLaUFz6VOZ8KluOU1K+aTuXghn7lZzSXEIpbPqWtRYlZk4aU7oDwD2K10Ec4Blt9
         zpxg==
X-Forwarded-Encrypted: i=1; AHgh+Roi4uOPVJ43grCAKhVKhvGlG4ox7mEkbMDhW/fKLhojxeUWchl7Cwma74n0VJ1HPqdijtTHfXJ7oc49mbpOD4OIfA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5jul+q7bdLzKAvzRGF8eUnQ+4EKQ8feLe8AcXWWKpQyU8+kxw
	CzB2G1wPGnZKF6e7H++jDoKzQe4KP7tSxra549ctjq4vsWoP7pf3UEAn
X-Gm-Gg: AfdE7clBStQPSZbvkSmbmgC7OV/ht4BRRFHTfEzzUjPR32ZYGONLzfXlWCdDoFg6ezs
	6h5+f7TrFxN04ftsM9/Zyy5CDzMRRL4FmCQ6L0w9AEX/OmtPlMvO0ABnUG3x6xqOVKKWNRZ2olm
	UjSP1gkRYv66I/iqDVKrn0EXmdiJaC2sCSuAdPyG96uw0VyqcnhkaiExdFInMzvhajXQYzQSpVY
	0N2fPg+oRN61JeCjNoPPg184LKsCM/otSv/WzWdgKk8/4eae6V6Wwk7EublMvqHa6WxjhOfV2uZ
	ZKpK9NKOpVCCPh49aFUCmdq9a/eW84K8Sq9cGbPz15QPP77g9awK/vgrZ8HIimkMZeObRqjWth0
	c4cC7CoAiXVvJmWuKhXjEOCSToszGtGR5TWEqr7NyqMbuk0Zg0WJSWec/MvO5liw0jLiAkqP6Jl
	yBpyg0mFcwNoGL60UnvqLK5RC+vVz8aUwJXaRfSQ==
X-Received: by 2002:a05:6000:46d0:b0:472:7dce:d8c7 with SMTP id ffacd0b85a97d-4765b608f21mr647635f8f.36.1782827482164;
        Tue, 30 Jun 2026 06:51:22 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:3f6d:4f26:2d9c:ab4f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf26sm7216964f8f.19.2026.06.30.06.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 06:51:21 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tu Nguyen <tu.nguyen.xg@renesas.com>,
	Rob Herring <robh@kernel.org>,
	Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
	linux-can@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/3] Renesas CANFD Fixes
Date: Tue, 30 Jun 2026 14:51:13 +0100
Message-ID: <20260630135119.104774-1-biju.das.jz@bp.renesas.com>
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
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34564-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mkl@pengutronix.de,m:mailhol@kernel.org,m:wsa+renesas@sang-engineering.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:tu.nguyen.xg@renesas.com,m:robh@kernel.org,m:ulrich.hecht+renesas@gmail.com,m:linux-can@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.au@gmail.com,m:wsa@sang-engineering.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:ulrichhecht@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[pengutronix.de,kernel.org,sang-engineering.com,glider.be,gmail.com];
	FREEMAIL_CC(0.00)[bp.renesas.com,renesas.com,kernel.org,gmail.com,vger.kernel.org];
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
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 382CB6E50F2

From: Biju Das <biju.das.jz@bp.renesas.com>

This series fixes the pre-existing issues reported by sashiko[1].

This patch series depend upon [2]

[1]https://lore.kernel.org/linux-renesas-soc/aj2PBvZYaVs0G-be@shikoro/
[2]https://lore.kernel.org/all/20260625135216.130450-1-biju.das.jz@bp.renesas.com/

Biju Das (3):
  can: rcar_canfd: Fix dangling pointer on channel probe failure
  can: rcar_canfd: Fix double-cleanup and unclocked register access on
    init failure
  can: rcar_canfd: Fix interrupt registration order

 drivers/net/can/rcar/rcar_canfd.c | 33 ++++++++++++++++---------------
 1 file changed, 17 insertions(+), 16 deletions(-)

-- 
2.43.0


