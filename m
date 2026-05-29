Return-Path: <linux-renesas-soc+bounces-33345-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIM6BsWPGWpTxggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33345-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 15:08:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9A0602A89
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 15:08:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 19EB130230F0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 13:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF6292D063E;
	Fri, 29 May 2026 13:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UOfoEqcO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50AB19DF62
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 13:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780060029; cv=none; b=lyLzKZU0lZ7OHPr6bIfn9EgAmuTMFgxiEhi+p0v+1MXF/WLa3fjylzEjfid8p55imY0a3/81nM5j//VUleBEDk75exVqOhsxptRsxro4AUs5bWC/BxyJNvvoPeqjVMM5fOaw20nKmtyHowqeqt8nduVSP5l1BI3N+DbSArxlubs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780060029; c=relaxed/simple;
	bh=oVI6sIQKYjEO+Rc3pR1I1ANyMxO1m2J6rxUYRzjolvU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iYMxQtqNko5fSQ8KdhK8eN0IsxWHXfSNUFoitEz/iyayXHgikmVYPkZ/L4oEWgc36ZLHTN8FHNn1oWHDWpoLwQOEBYUpuLbtt/4bOmt/bQAv4mT/t1ycG88bSUWxBptOjXSLy3nXVTnK872ntSKulEARvRiB3+DSPZmGOAK78pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UOfoEqcO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso75181635e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 06:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780060027; x=1780664827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=erHZp8fQE5ClrM6SGxP1RSdxu3DDgrul+rrCY76ZQDE=;
        b=UOfoEqcOsVmOFT4QrfAZaRnEG+xdU2mYMZDZv/6H8RnrgLX0Rbt6aHAbVvIphvOglL
         LZTzko4wcuVGtuxK0VPTxnqMSex6ZApQ0VhsmmGs2eEdcMsGRlQvfDj0ZkKzf5vv0twa
         cn3Cu7BZwkfN20mIGtRZ4J/4F5S3cTaNpUcrgzZK+UiMyomthFbRwDez1xscpF5xU8on
         wHniaHBU18ifHl7tCE/+6X0RaiDNAHdVYgqrOnbuVsyn4d0/hSOQ8JD+BykGptERmSX6
         gnY32b50ZIv9TC2qXjnBzk5uLVmOVqogMP625xTl/WdTchSlTDfCHZeUSrl1uMwuRU4n
         xKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780060027; x=1780664827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erHZp8fQE5ClrM6SGxP1RSdxu3DDgrul+rrCY76ZQDE=;
        b=Z3kJZXCkqxVqH7ccvx5tNojDtJwhGMmK7lxBQ7475J2mfWjs82fRBcCcWm+jrh6gRw
         efBiZ7g/OwFuOg173m8n++hOQKZFYqs32Shr/DzcCKd2Bg7i9tUF7cUqblDZLqZY7Jvk
         B5PomGhirAiBHkzEqh61cL+14alWF7QgDHYB8Qx9IBB5/cWLpBKfwlF4YasMoxhWszck
         LT5y2y4arHKiI3I9nuKQiZXVNT0Mzkqr2GeFIghrb+Fom5ZgsKYrbAlAw3B16V0m5owt
         pQERe6hdKEixOohhg30zNJuJrjI29YHnr4hdewGDZYRQlj71r+gR9/jp6CFs/YV90RNf
         DkNw==
X-Forwarded-Encrypted: i=1; AFNElJ9GMyZit/EPO5PgHRTL5Bhl4GqvSDu7x7h7TGDMTpsFvO8LdZ24gUbNlnUeHJGuPDUHHiqdtFSMqkhXJ15mAGoGsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwGRn9hZuOghqh5B5Cd3GxwaY4bKKANf2Xxh+RKf80i+C/sbDi
	4SQQjMPPf/i2/IcJXISmB6GKb7zBeYJixcaB5qvyZAiIZ7Ey04e8eHP/
X-Gm-Gg: Acq92OH7O4fCX/lh51GHMTSX+XqP3xA2PyakU7ZCDMlzALhGY+lcxB/afL1IZ4MZiQF
	J3T25J36nguEnQ0yWnpurPHPmyapw2ZDdBHkmcdjWOo0le0wvidBiDk59tzzZEu376JsfQ+GKqR
	Kj+qON7NQGDQy0OEpcD8iZihIuIAyxTUOslfx+EEHkjv0TNRy3+It+FdrI8joIaOe4YtTDFnpdo
	rVFfPxklA095gQJ7jFZ4ZdIrI9puEjyutkegERQ3++GjjQ2D5JhvZWP8LEy1XcTe1YZvtMtnQDR
	jSTiConoA0Ii2ZsGLIyJ7gIcQBLIkxDQ2ZX8FpWqiRpgJC1/lp8agHkjJ5UgAwd2VtsBH8B/tTu
	hbWOcKRpAT8bUAsVwKPJBCNs3SSB0v22R+JzGf8getAmWw9TrNQjQlgEjKaUwDd63w0ElwcpLgZ
	PaC3bALENdpFH868AVHbUPMekvptLpMY7yhro767lEjsZYGb411YoKTeIl9WY=
X-Received: by 2002:a05:600c:47d3:b0:48f:eb8b:997a with SMTP id 5b1f17b1804b1-4909c0c75e5mr30174545e9.31.1780060027001;
        Fri, 29 May 2026 06:07:07 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:df4f:8f31:69aa:c094])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909dff2a80sm45247225e9.3.2026.05.29.06.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 06:07:06 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Enable RSPI support on RZ/G3L SMARC EVK
Date: Fri, 29 May 2026 14:06:59 +0100
Message-ID: <20260529130704.327505-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33345-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 1C9A0602A89
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,

This patch series enables RSPI support to RZ/G3L SMARC EVK.

v1->v2:
 * Updated reg size from 0x400->0x1000.
 * Dropped num-cs as the hardware has 4 CS lines and the driver is
   hard-coded to 4.
 * Collected tag.

Biju Das (2):
  arm64: dts: renesas: r9a08g046: Add RSPI{0..2} nodes
  arm64: dts: renesas: r9a08g046l48-smarc: Enable RSPI2

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 69 +++++++++++++++++++
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 19 +++++
 2 files changed, 88 insertions(+)

-- 
2.43.0


