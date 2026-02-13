Return-Path: <linux-renesas-soc+bounces-28179-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHuNLowkj2lNKAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28179-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Feb 2026 14:18:04 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 74740136435
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Feb 2026 14:18:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B6173029C08
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Feb 2026 13:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADEAD35F8CC;
	Fri, 13 Feb 2026 13:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lI8b+OSg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C402CA5A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Feb 2026 13:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770988680; cv=none; b=VQrlp63igb8pamYwyHw+r/nHgpBiBmIt5+NmV0N58LobQ6NjBLfR67eFeak3Sl5jZZxYQpcMlOpffw1kluolWbEUKzDtkPxxmOsyPUUFo0ksnq0Bmb4VsYgZIxDWf6C3iohs3VGJGJf7n1B2OEuXtElAnhAf6ksfTI+X40kbPSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770988680; c=relaxed/simple;
	bh=mCqVL0Im1LADrJFZ5SA80XuYkYbq/qWCO3VuRjyCb5A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NiRQijPG+h1/wMaFdWuJuWH8YnzOUB9qaRbq4ZCREN3wQ9UQfKEWEb70BTw4j/4KKtZ0zgR0wykEgCtqR8t6+cGyDcDE0KPyTgX0MHsCygDRkR93ubfwhr8cmpeEhN/oV3tQI4hgeNL/JjTBd/Y4QQL1jeyP2BfxwHsMJKxZrX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lI8b+OSg; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4806e0f6b69so7360995e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Feb 2026 05:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770988678; x=1771593478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kb+Yauv/s6iAIjpMHMyZsZpTSzWDpVY1auP+Q51Tow4=;
        b=lI8b+OSguFd69RFL2k3cIDukU7eFxzJ0q/DBagWDm6gIFfU2nyBziDMTMPSC5tdqh6
         Llj9o6RxSmzu0vNXNf4WpoXwzyJ9OnOgkI77yDUtE7mwjsA0rbMK5fEalb7vLOEvuSzo
         RQ3YSpCj24cNTKHTElJmvekT8bzkyLD0Rdclc299L7bpJB2+CMnJooUC1tlHjwcvYIRa
         BLm6S/dQplnilw0BhRTLhX3cu+tsc/YPLwhAtHz+dFihHgzDGM8aoGNvJLREryEjTB+x
         T1RN94I/P1T2jJU27KiNhUM6f8s1q4JOKSxnVFuFcshBx3mG+/hOnY3iAuGBtlN+UUX9
         FlpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770988678; x=1771593478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kb+Yauv/s6iAIjpMHMyZsZpTSzWDpVY1auP+Q51Tow4=;
        b=qYlz8GTH0bNVbZm+w3xAez/YdQZKwU0M1JB9uEhrf5WKtNMjgFo7qEb2ws1/YlA/WF
         lVDz8PDJTNDzNTrnCNV0lbgtWxm1nJSrPmwlfkAfQBfxNhqsnxowB+LsVZgjqKxHjLwO
         ytx+jF959oG1g7S3+UJbyCnEXGb9EdTtiEUb/y4oCbc8W3E4Q+K02TSbAlDBemheQecu
         fO55VNnaOnQebCJMh7OUwW5Ci3BeVfJqsvIbLwCWHhNZPoPnrJconXpoamCpfzq4Fe7D
         +y0UyvYcvVnUR7xFojs7nsaLRM0fGwtFk/t5+uXv90ddNTrVbWy6WN04L1h9oQjQLsDZ
         LPCg==
X-Forwarded-Encrypted: i=1; AJvYcCU+v5mRnONCUpsPkI+gLv8TXKF+l7L3tb4v6GJycs20qZ7WQdT6ZwcBioospcfrSoM40F9Qsz37GVfL+7mIdOWkqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNqf1TS2inCsvUzfYoczP0mauRCiR7NPxGn5H4bxyqXqxe0Z6/
	RamOFxBpSfXFY/dH/XnuArJXn5Q0lWSU23q/cv6XW0Qd2Z2c/txaHgvG
X-Gm-Gg: AZuq6aKTu5DA6wpUwyXkPEzlVniedLqRSfbkgoJeMwF0v3sysXnYu1QOjLyOKJkUiBj
	BJYtBBTrUfGxP703egRDbUm/aNJekYysEN0sw00QpPoQ3r7jle3won3ahm3a6/4X2waYtZEnhRj
	yL0U8FtbiVLdpVe+Pzi4CUl57+JpB9V9CvQXMFky0vvfVTN+7h3eLAQ8fhkfMNucdDZiM17ctmX
	S2bzUQ1mrpdcQqE/+1KluBEmSNA1/9KWXbfwcmgXoytRrDTryFWgTjPkKQgKnlrU4JP0jSseeDm
	1/VZUj+4/Xc/41wRT/Y59yvMjcbTlkUkzHEDoYA9awiVv+QGZQ8JvuhRpA7JvQMPb15q/IAntkD
	LCLHrHtXdEMDvlT/UzMbAtcdh5IqybDN7J7kZHHMhi3EMDFRzxgeDrPcyMaq8UMPy6XTM3H1u9I
	n127sBMV1RK8bqrUMVsMyxPIMxVesFthSQXGWIWVYBihcsReF5oX8Yn6HFQdJGWevtezupifVFA
	k1+1JCIW+nPbP3QH5OxVcQQgyn4IFG2C4d+Zg==
X-Received: by 2002:a05:600c:1547:b0:477:6d96:b3c8 with SMTP id 5b1f17b1804b1-48371085837mr42372955e9.23.1770988677560;
        Fri, 13 Feb 2026 05:17:57 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:ed1d:fb0d:baf6:e4d9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4836ff00332sm60942925e9.2.2026.02.13.05.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 05:17:57 -0800 (PST)
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
Subject: [PATCH 0/2] arm64: dts: renesas: r9a09g0[77/87]: Fix CPG register region sizes
Date: Fri, 13 Feb 2026 13:17:40 +0000
Message-ID: <20260213131742.3606334-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-28179-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 74740136435
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

As per the RZ/T2H HW manual below regions are used for clock generation,
low power consumption, and reset control.
- 0x80280000 - 0x8028FFFF (64KB)
- 0x81280000 - 0x8128FFFF (64KB)

The CPG register regions in the RZ/T2H and RZ/N2H DTS files were
incorrectly sized. This patch updates them to match the actual hardware
specification, ensuring that the correct memory regions are mapped for
the clock controller.

Cheeers,
Prabhakar

Lad Prabhakar (2):
  arm64: dts: renesas: r9a09g077: Fix CPG register region sizes
  arm64: dts: renesas: r9a09g087: Fix CPG register region sizes

 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 4 ++--
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.53.0


