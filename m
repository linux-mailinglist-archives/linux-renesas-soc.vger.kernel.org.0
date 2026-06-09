Return-Path: <linux-renesas-soc+bounces-33761-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qX0QG7wPKGo69QIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33761-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 15:06:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EF66605FC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 15:06:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="r/u6yAUZ";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33761-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33761-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ADF3D30594D0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 12:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 763A641930A;
	Tue,  9 Jun 2026 12:54:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B861240BCDA
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 12:54:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009687; cv=none; b=loZz978CpGa86OjR3fzWGLYuNI+T8zGF1jIC7W6f3g0dy4pyyeWaJFOuB7boCu25DuvPcBhrJyBXNEIDISX2WgcW5YSwcRiw6rLH2a7ZFutMpG6WANKiGFY15w8rXC+cxW6j65zW267BmMUXKf3QyOkpYO/3D+3sUMd9Rg8J2mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009687; c=relaxed/simple;
	bh=hRkDQYl+eauJF1w2RfLFP4dLK0SzDJox/bVwzgoIMDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lOTyNZrMjwAKjmGilSbU1yoBmfVwZTcciKC92sgU8l7LpFVKREn0LsE2UbQcYXrTZ0W2pacHnB88Rj8nnA8P8/kKRNy+9kqWioas3sUEhR0QiKUlMK7HvDb8BdLgHfbeZxRviiJELHiJW8rlavPx0Il6Wci1wgsQxjsQd5glbcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r/u6yAUZ; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso46723475e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 05:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781009683; x=1781614483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O8VflC/yp1i4Fl+RYhCGMVg5NMZXonOa9s4DvisN8aw=;
        b=r/u6yAUZeRVzlLcWS2D1vc7zkk/zEcteW0H+E3VfIidogXnA1s0PTxE5ZPBrkUDAVd
         M11O9PobhOpLAdFTil5YQjbdAV8xdQf6buWuoEs9apI0jdImagPKB15q7aCsLwFucGrn
         88rxqut7lGFuYnV/+r3AQcSrsShnxsS28Ou1/9roAQQwFoA7ReX1v3AFbvZ9Bh5u3xw4
         AG5zlO/bZjFXGbTBsXy+ix4ibG3KB5FKEeVFpwNUIrBmxP9HiQZOEh8W41yBcZYLGwGN
         pYNYA6VWNJQA/CBE8Ig2R2EeDPm4PFOgq+t6/R6lLol93s59GZQuRnDXpS75+nnTrx3H
         Qgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781009683; x=1781614483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8VflC/yp1i4Fl+RYhCGMVg5NMZXonOa9s4DvisN8aw=;
        b=QFwRVB6p0HFvKrX5Bwv+a9N2F0eOBTpQUvSpeFIb5aXHreRwI0sNaQ6i5vv1w7IbT4
         ngHfu3vINT544gv/s35fBRSyVezovET4FvGp69Bxn7b8zFN+i+/6fqPtVVqjkW5iL5s6
         NqiYu+qH1h1RA3/0zo9zIU+iMaWqhw6Q/Pc2N5NOKkPzS+y0q2SQi8/7gAkj59VWYJ/F
         EwvN9felYOyLzi1FipDMaxwvQmVRmb72kE+bZex6B+RDaaqlSO/9+CvLX6ss8AVBIDMo
         1m6Slhoyy4/pXGR4Wv906RIfK5lgU3QWj31NIdYhxHoQBsTeHqDXKpr98CQmVfwj324P
         YaEg==
X-Gm-Message-State: AOJu0Yzzd8ifbVlkIvABnKp3djRjJO0Z7nIWVtzJz9lak3F1N2qzazoh
	zWYwME7v5jBxzxEYqw7kraeROR5J0egB7bOJlz8Hy/nclm3RCYvMjcep
X-Gm-Gg: Acq92OGKxGo3c/yGX7YG4UIRx5co5SRrnfaaRcoK4Oe8jESO4i3n3NZP63i9eYM8dlQ
	Me7bZ9BzJGms+IMN+E5td49ZmlpC8d5XmP3Sjm5a5vZMR6ZbP9Nz454HAriwi8TUieV2nAXi1ov
	qodzNfoB77EMC5rff9E5cC+g9fxttpQZHJBWDV7dEdFtsPhiJhx5OZ3TSxoli16FIt8qWD4j8fy
	G9CpBe+Cx+rrgmwoDUPa2jNl+d8O9nxqVZOqHBch6AuDfRbSxru40HWxaYzL0SL+MWkAVUq7/lw
	BRC5eybpqcKcCKKH95c1iO/TrfdBdBDSlozg12h7SnNCZiKC+s1PROt8pYoZOBm6zVLQTl9B2M0
	S515QZPlCbBCR4IfcXZL9gv39LV7qeaYo6r2BBRh0bIrbCem0FdvbSMTLp3PYVqRjkJAWW6b3Ip
	1gPSQjApRwmVhL8HDTsdl/0bvReU5xAXzG/BMQoVxgPHx4TKUV73oqbkX6iDRctTQxyjgwcjIID
	F3QuQwXZiIGerTlE84bAhHHHrsRh7bTnRkpGGhuID4Kgj2AfIXwG2kaXw==
X-Received: by 2002:a05:600c:34c5:b0:490:be9e:fd07 with SMTP id 5b1f17b1804b1-490c25ae3e8mr328691045e9.10.1781009682728;
        Tue, 09 Jun 2026 05:54:42 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:2b2d:6009:3bbe:fb84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b5b06sm435968425e9.3.2026.06.09.05.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:54:42 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/5] Add DU, VSPD and FCPVD support for RZ/T2H and RZ/N2H SoCs
Date: Tue,  9 Jun 2026 13:53:48 +0100
Message-ID: <20260609125353.401124-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33761-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B4EF66605FC

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds support for the Display Unit (DU) on the RZ/T2H
(r9a09g077) and RZ/N2H (r9a09g087) SoCs. The DU is a key component of
the display pipeline, responsible for driving the display output.
The patches include:
- Adding VSPD and FCPVD nodes to the SoC DTSI files for both RZ/T2H
  and RZ/N2H.
- Adding the DU node to the SoC DTSI files, including clock and
  interrupt configurations.
- Adding DT overlay support for enabling the DU/LCDC pipeline on the
  RZ/T2H and RZ/N2H evaluation kits when fitted with a CN15/CN20
  ADV7513 HDMI transmitter.

Note,
- DU driver patches have been merged into-next.
- FCP/VSP patches have been posted separately and are pending review.
  https://lore.kernel.org/all/20260430100929.1088281-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
- Clock changes have been posted separately and are pending review.
  https://lore.kernel.org/all/20260609105924.962573-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
- Patches apply on top of renesas-devel/renesas-dts-for-v7.3 (039608fad808) branch.

Cheers,
Prabhakar

Lad Prabhakar (5):
  arm64: dts: renesas: r9a09g077: Add VSPD and FCPVD nodes
  arm64: dts: renesas: r9a09g077: Add DU node
  arm64: dts: renesas: r9a09g087: Add VSPD and FCPVD nodes
  arm64: dts: renesas: r9a09g087: Add DU node
  arm64: dts: renesas: Add LCDC overlays for RZ/T2H and RZ/N2H EVKs with
    ADV7513

 arch/arm64/boot/dts/renesas/Makefile          |  6 +++
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi    | 46 +++++++++++++++++
 .../renesas/r9a09g077m44-evk-cn15-lcdc.dtso   | 40 +++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi    | 46 +++++++++++++++++
 .../renesas/r9a09g087m44-evk-cn20-lcdc.dtso   | 35 +++++++++++++
 .../dts/renesas/rzt2h-n2h-evk-du-adv7513.dtsi | 50 +++++++++++++++++++
 6 files changed, 223 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44-evk-cn15-lcdc.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-du-adv7513.dtsi

-- 
2.54.0


