Return-Path: <linux-renesas-soc+bounces-30441-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGWALLHExmm8OQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30441-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 18:56:01 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1054348B71
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 18:56:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7BF2D3005323
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 17:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BFB43F99ED;
	Fri, 27 Mar 2026 17:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0ZhtfXE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B375C35E949
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Mar 2026 17:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774633372; cv=none; b=ISMHeaqsCWhf6lCSEQLy0fpKzC4p3PKq/GXrTV9/RjCWntkUDUG+uJrAVl0+VQeRtqlGuudA73B8gqZbdOsYAdw5S8yb0xmVftd/ZDPA+UPFT2wmmC1JTfzgWiRf54MCKjeFDxA+sTM0LKYzEeNINT7vPGZI6s208GFUFBAipzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774633372; c=relaxed/simple;
	bh=Xu9ww0uZOflx3FeFucbHDo2b9kq7shVVtkxvcwslSX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CQt4Mlj3NIhClekLPBei1afYOzpQJrBuE+KBibDfC/v5qQWOlOu21PH26xTegsO8akzPoXw1xJ1dliYG6Oatxg/yAWihL0aAMlsT1DDTsBJa4p5Y4gRVQ+UEbP+5n/0axFesCcohi32xVWFTXYc+SOzWEz/0/18oBvCSiwEg3gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0ZhtfXE; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43ba1f3fa7eso609788f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Mar 2026 10:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774633369; x=1775238169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RbD/1VQctrGkQcC2fyGA2UEf1NCtGg7ps82iw1U8Cl0=;
        b=L0ZhtfXEmG23WEfCn/pCWcE2AnWoPVORUZCB9WSCCStGcRxVXFcMRnrBMfFPP+vgR8
         QzEdhDdXUACKNtkqfdrqwBtDCuVjjQVlNoLSOkyDa5/L2O+lYciYxVtiFnb9CCnKP0mj
         6e8wS75UteyRjswlPbCSid9VxMgATvRNq+dGpphhjPOcIG1u6URZ9sdo5rN145lpTwMf
         zJ67bcQ22PJOcQK+nlYckT19xlxkK9Czf+gSJtC0LHLQ6f6McmMOP+l0scglg3pX+yX/
         ZEGtSnErsrSf1WR2vijDoh8KpYfKVCGPEawOHef2i5o5iZiR1bwIcXcjgt4wqPNfm5Y9
         Qizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774633369; x=1775238169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbD/1VQctrGkQcC2fyGA2UEf1NCtGg7ps82iw1U8Cl0=;
        b=kafetxTA4dZMmdBGPUg4pMMcOgCAPpB29YwnBZhP/WRhV9Qd9arOa/0cFwNqDMXax7
         BOuRH5pKwm2V1GUme7SvVKDV90yZHPQEE15tHhwVg/brqDK91BUMrmMCXqKW10+5xKeX
         xC5npBiTiEL17evaiZ7kf90mV3wkJRADE9ZIc0GpOPDgD5vCE1DaYUhAF3XZyuVwgQBE
         AwlI5Ykjd1c7qLKNRVfwEWWNFxdzhAoHselp+ZFWs3mH0oZlwhvVfu9amQGiP3JVl9VJ
         upR5UM4RcaRHNgGPdw/f4igCrjUo86V0A50ZnJ7+crfGZJiEuTJwNTM1omhPK2AqSZBg
         sNwA==
X-Forwarded-Encrypted: i=1; AJvYcCVyin8PGTmu0bHR3MgmUzABkQnBGkKSsEHqHRH0Su+PpH7k3mj3ey/TYA/kT8fcGWom8D3DBvZpdMyaPqXWN/8mCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTwQF1KqIHF/hD5c83kxEwzomrJqTPnw3QpDrlV+H8jnIh6iZb
	jmAmsbhQT6sDhSWNf+iKBh2lhCe8vhP1FUhwzli1Q1Bl+7rpmfzpGSlx
X-Gm-Gg: ATEYQzySoRotH3jk3vC+YnZbXlih913sIthZRVPsrbLbyo6zSR1+1bQHMfjl9OT95+7
	hYN6JdnNLkXj+a2cxjJImpndnEKcDy457SqTQfoKVOCHKjLy/hoTaYBdkBXY3v4xqqyzWNUmERB
	/SqbfIBO8c+/c0Dc1nasRxgzOt/unUhKRBq7L/WBEr2N3/T+5Mn+jo8IcYVRSfrwFRxPdNXu4KN
	hmbQkpgBsPLpzrUSolNd471MYtMdQjP3rQW4aKfv7UeHQkH/Hlm+r8J6W9GYnmC2re2fAxhIwjb
	heByYJzT4yv8NBuRLfVjEMtPHGsmZkBy95l14M7m2EnR1gFL8nOTw+dtI5jlj3wBkhnsvJvTSKt
	264iZOeDrtKp/p0OTx1R1eNGN3D5R2nNc+zA6VqBUwox1D4v2vIQg4QCu7BbU8t+NuqexxuBCFA
	RsX3ErTwqx52S6Gh1db05PHK7G/CMS6HKFnkqk/Oz6eAlqThjPyDQMumhAKdT+m0/Tc4hKyUc7n
	WEs1RAnghJyO9jfxe2Vf65cea3v6YK7CAzhpoYNNv0xJMs=
X-Received: by 2002:a05:6000:2307:b0:43b:3d02:7806 with SMTP id ffacd0b85a97d-43b9ea4a457mr5719949f8f.28.1774633368467;
        Fri, 27 Mar 2026 10:42:48 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:cad3:5596:28d0:27e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e528sm15965933f8f.1.2026.03.27.10.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 10:42:48 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/3] Add xSPI support for RZ/T2H and RZ/N2H SoCs
Date: Fri, 27 Mar 2026 17:42:42 +0000
Message-ID: <20260327174245.3947213-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30441-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,bp.renesas.com,sang-engineering.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,renesas.com,bp.renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B1054348B71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

Add support for the xSPI (Extended SPI) Interface on Renesas RZ/T2H and
RZ/N2H SoCs. The xSPI IP on these SoCs is closely related to that found
on the RZ/G3E SoC with some register bit differences in the configuration
registers.

v1->v2:
- Add RB tag from Rob for the dt-bindings patch.
- Add RB tag from Wolfram for the rpc-if duplicate device name patch.
- Added xspi_info_r9a09g077 for RZ/T2H with type XSPI_RZ_T2H instead
  of reusing xspi_info_r9a09g047 with type XSPI_RZ_G3E, to allow for
  better differentiation in the future if needed.

v1: https://lore.kernel.org/all/20260310212927.3372410-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Note, patches apply on to of next-20260326

Cheers,
Prabhakar

Lad Prabhakar (3):
  dt-bindings: memory: renesas,rzg3e-xspi: Add RZ/T2H and RZ/N2H support
  memory: renesas-rpc-if: Fix duplicate device name on multi-instance
    platforms
  memory: renesas-rpc-if: Add support for RZ/T2H SoC

 .../renesas,rzg3e-xspi.yaml                   | 60 +++++++++++++++----
 drivers/memory/renesas-rpc-if.c               | 13 +++-
 include/memory/renesas-rpc-if.h               |  1 +
 3 files changed, 61 insertions(+), 13 deletions(-)

-- 
2.53.0


