Return-Path: <linux-renesas-soc+bounces-32154-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wI4kCiBn+2kbawMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32154-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:06:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A788C4DDD95
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:06:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F83C3053D11
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 15:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFADC4963B4;
	Wed,  6 May 2026 15:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BENxwuWz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968F23EFD39
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 May 2026 15:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778083108; cv=none; b=PtaEMBbnDWD0MxNspUi0+QZi/SyZdHjxTdZ4vulou36cVBpkJOSw6/iDATcU0EOMt9azQv36AqA+JmjeXNbvWN64GVbNZhX34TKs2U9osGbmGqmwno9l43Vo/pMQARxsR89dwVZKz0fojT078hGK9QjIVvJ0XdWARe1cME46pwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778083108; c=relaxed/simple;
	bh=+BrTZN7WjIkYYV/ZkbjuQoqqC2TZZNd5QHXxfi1b1O8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fJzTH+hYdhUoIH48JyeoTQkRNYVs+uod729SrrkMKfdjqtEx5A01BPtJNDiP9sov9HWtbfhd3HxLkxCKXVvtwdgEALy2YUbtJ/X55+hyMHpw+DZUyGIWEKzHIGWTMDgqFrswyrlQjlrEOcC3ekTKRHI+PbWuM6+YBued0TL9F8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BENxwuWz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso64133375e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 08:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778083102; x=1778687902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vdI9Daiia1nMigPzaGMWlZI5mMBjSVg78hSdneCRYEU=;
        b=BENxwuWzcEfVexa+efgsUdenxg2Om4CEtGFbZir8iQKOP4TAU64MU5EZYBKXdyZbtR
         2R3Qm4IJpPbr1T1hw7Qouq2mN6b68v5Vi3dPlJpej8QTPpgfFduteY3PQ1D/XI73k6A9
         1O6r63JlHWbALhzdg2tOZWrdzX0qiDqbYossp2KcethocidwmvK+DvgfwF0eUpzRUXhp
         tfDxA9yoW9Nmt2CAWLuNaLsDUVFTkzmDhJzg+C7vpI7zqa7fHzgx36fmHga7XP207/r6
         JlnszvyWKsbifS/tajTPuIuvQbXZNIWw1PTS49KM6GftpOEayhqnpxEQyvy0khLTJyTi
         zRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778083102; x=1778687902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdI9Daiia1nMigPzaGMWlZI5mMBjSVg78hSdneCRYEU=;
        b=HPXk5TVP3bR5ArU+4F+NsbDeOTtLrh7sYpe4k7QmZf87/0Q4pqS8cvaCeLhmyFmwRV
         1T+pjjwPxDPUR9JCDKrUFLJ7iPIyDLRGtSYPRQhJ2Y6TDW44mAc3pEMt2tTmmTZ8BK+1
         tOK/9CQORKunS8RT9+wyVtR54QnYHQT4evRt7Jkn0177ly3xTH+xVn6dGmLxT8E6/3qG
         s0UR45TJ0XmJBF6GCIAakvS8NuvjAjNBwWGVVzFwuIoummiWvevVgej4zI+rxHfikjh1
         RabHxd926EZt2xEnXItx0EZjFvjyRV/XLmEhfdFfHOF4jo1pvgCaA5AMPtOwlyQQBsST
         0s+Q==
X-Gm-Message-State: AOJu0YwRX3VEFhIRubbTUfFe+qw3zYD44kqoFMpuete2E2H4d9r1UqPr
	PECQ/J1l+Ej34lb2YuZlGyz44ar4TIAMDCqLrpAq8HzGQeCir5MsTFzR
X-Gm-Gg: AeBDiesD1wnqxtYMGgjVivNMdwVVOZx2sbYqoUlv4CDDvy5zm5GR6p4HQLpWVlqL+nI
	IKVPkYFbx3vFx0qiEYD2mFy19dHxfmovYZYaJz94p5FltwVUqRkqRX80/0XGhGdoGMBuggeNcjW
	Cw4j/aUmqF4yJ7qIpTt0JR0nEpuEm+AS6DXLEw8NlO7+3qcFgaGTgKzxHIBBr7Bos9DH559/wnZ
	shfQIcTAHu8N52Ak7tlBDLoV/RIqNTnmw4hyjBjQ1Agr+oxpHBCBdtJ4xt9TQQcCqfkafLhTMPn
	FQ8xV7jOeRyVLMXvTlGK5p4DxrpCbBFIypBGpS0lCHurZeg5R8MZPN81dBCNCTOThPPlbwrJ+xZ
	0uPYuQO8k3arF3u5yratulpaKneELWnSXgAspVjTfbnDXkxdOno74uTFcKBBlGyIcXeHWh9UFEy
	tg5IReg37/j7v/ikL6ODIHkG7HV5bjM3ekrUcFr/5ndphB+fwCrkwHROEHoOsEhAq+87Q4e2FDN
	qSVSe5+4vdUk07jMWj2le14jEKIxSykHHlAxkNbgiYAJy/gvc3XKfHIww==
X-Received: by 2002:a05:600c:a10d:b0:487:12c:e7e1 with SMTP id 5b1f17b1804b1-48e51e1f013mr54008455e9.11.1778083102203;
        Wed, 06 May 2026 08:58:22 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3dcb:40a8:a5b9:2327])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530b2039sm21345205e9.5.2026.05.06.08.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 08:58:21 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] arm64: dts: renesas: rzv2h/v2n-evk: Add alias for on-SoC RTC
Date: Wed,  6 May 2026 16:58:02 +0100
Message-ID: <20260506155804.3984418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A788C4DDD95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32154-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

The RZ/V2H and RZ/V2N SoCs provide an internal RTC, which is already
enabled in the device tree. The corresponding EVK boards also include
an external RTC integrated in the RAA215300 PMIC.

Add an "rtc0" alias that points to the on-SoC RTC node to ensure stable
and predictable device numbering when both RTCs are present.

Cheers,
Prabhakar

Lad Prabhakar (2):
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add alias for on-SoC RTC
  arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Add alias for on-SoC RTC

 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts | 1 +
 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 1 +
 2 files changed, 2 insertions(+)

-- 
2.54.0


