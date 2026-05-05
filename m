Return-Path: <linux-renesas-soc+bounces-32068-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKwDGFXc+WkwEwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32068-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 14:02:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFD94CD268
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 14:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 450C73018D54
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 12:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE16B4218B2;
	Tue,  5 May 2026 12:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1vkoGG5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B704413237
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 12:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777982536; cv=none; b=RiLJwzVMBCfSW+sSADbXgxP4T2xX5Q1dktO50iMZxRnPDanZcaR44mwosWA3/P8IvuZRANfZkDI5JKNeYpHFzquELO+FMiA/pr0DKrfz0P17Q9u2TUoCIWYpE8KAJYnVqvAphQMgg2o/SV92ShHHmr7deCwtYxeJUCrIWV+4Uo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777982536; c=relaxed/simple;
	bh=KFxFjw3A1zjl+OiAvISprXxuU5JoaXyUqY75lcVgo4c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pGUzmy2nMEaZYU0EOqzOrC0zUxoNIS/CBd47A5IXMRKWF+u1Yb28QupGnUEZt0Iit8wGUXkK/ImgAMoJzTHTKSRK37OVPHIdyPR7i6ytlGSGuMVd6ra/L2U5pg+Pe35+GS7m4Tkvhbk6p6xJSGSTRynJRo5XJ9u/lzENMWZ85jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1vkoGG5; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59dcdf60427so4776400e87.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 05:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777982533; x=1778587333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7fZre7px4kA8v1WH8AczqF1O/6+UD6VmHE+nG5BQh30=;
        b=i1vkoGG5hYP3wGyxgtJJZhoSTXoub3PBP/qumJNaOXtX9nryT3Yb0g0FyeYy4Y9gbw
         hvw4V0REZlkPmWG1mxL1NecQPeA++FKi4yZTX1tFdPRkydF47puOcfPPXLzjVfTLcoI6
         k4GEdlgT91FGvMyfUbZvxy54M5Jf/7RDoLBX7lTM0NxCJG8Sqpeu/ka50Zws30uzPz4G
         nqyJ8qsBABYJXJvCBjPisKtXMlSqh6mwOzcBRNTWuT49G+lIHQjfilKI/ApbarxcNuou
         ShgLqrcpWPNbN5nXtTVB2hWp6IYAysULoiRzwU+uox6D2LY4GVXOD9l6WnGAEqru2uyO
         LeUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777982533; x=1778587333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fZre7px4kA8v1WH8AczqF1O/6+UD6VmHE+nG5BQh30=;
        b=spObnfTh99DzzeXxHoVOWxPltdHAm4zPzH/5mjrb4F3bohmlMTCwPDjxaQyNmthBWe
         azwgsiI1eXScPEZHjFcEwwjfBEHyHTj0QeSi7Hei4Z3WNNNdPmZCylTmW51A0kI+5vHI
         4IZW2qdSgtkWLZX8+229KSf04RKtBYO8P7bB5IHCPZZjz8ISjfrJKWVVPcPwuqHa/7Ze
         S1mUSxslU7KuwF7ovwydnsUuBwtl2P9q+UprIAwDVoNjqSN45p+qBSxWcLLkPIRPyKH3
         l+wCWSWR7xHMMKgQBZdwQZdtL4pPpOc6FmYk4vNzknSPrX6fj2uGkJcF3/5p1FLwZqOU
         BdoA==
X-Gm-Message-State: AOJu0Yx7rHaaFLU71KEyFEadoXitVRIWTrXk20IeNsFm8VNnD4F0L5J+
	JaP5+hAlyCYPQ+jBkILaJdlsU44pPs5DQZoYU23YFmGMLIQ5lCw6oR2c
X-Gm-Gg: AeBDietz5o/8rwBtre5LhLoB+5vvw5riGLGOHKY/K8zJjccxT8mimMkgOLzfmz98aO7
	7+XeiUyrG9KKSlYGoKbkXeDGaJ0KXwQpSc0MUxnyivM9Z8TiaT5dZmNdGXyg5iKE5bhNlJVnKy9
	Y5yv/JoIP8HHNNt8e+VMX8ycmb7yFQ9qWKe31lAKEnaSWLrgD3RErQ6R1TZvKcsHJgPR3lABLU3
	rTFVkn0gke/pgLx5SjEZnAzCjJ7GpuFTGQe1jzVZcem6tKT4Qx0213pCWr9d+kVJIcAU7fIWK5F
	Wea65d0PhcxESTrqW1XFY+KdK7Mt3IFEjR4EE5jRfMTQkBT3EPQt4U/I7up1n1aYw5mdyE2FR2w
	iinKOcAKrX4QIZ86d/YaRA+yrYwJlY9ON7dMutx/OI3o897vbNo3D93MbB/mdrEztVoPB/xpJcg
	iJsKZLig0os2sYRVIncT5HB7QGpkCys9Kh5zsr2GfIN6Dul5nvBDgJfA1nmtANhwwO71eAzgHJ9
	Bi3dwxQtVEQrPhMdvlARrenXcWOZMvQaV3TIS3ZYJCwEbZq3qQdx/6A6w==
X-Received: by 2002:a05:6512:3f0b:b0:5a8:6d09:483c with SMTP id 2adb3069b0e04-5a86d0948c6mr3632119e87.22.1777982532251;
        Tue, 05 May 2026 05:02:12 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:7d2a:9b5b:a191:3b81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b03e04sm4386398f8f.21.2026.05.05.05.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:02:11 -0700 (PDT)
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
Subject: [PATCH 0/3] Add xSPI nodes to RZ/N2H and RZ/T2H DTSI files, and enable on RZ/T2H-N2H EVKs
Date: Tue,  5 May 2026 13:01:50 +0100
Message-ID: <20260505120153.680979-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3EFD94CD268
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32068-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[renesas.com:query timed out];
	RSPAMD_EMAILBL_FAIL(0.00)[prabhakar.mahadev-lad.rj.bp.renesas.com:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds device tree nodes for the xSPI (Expanded SPI)
interfaces on the RZ/N2H (R9A09G087) and RZ/T2H (R9A09G077) SoCs, and
enables the xSPI controllers on the RZ/T2H,N2H EVK boards.

Note, the DT bindings patch has been posted separately [0].
[0] https://lore.kernel.org/all/20260505112405.667796-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (3):
  arm64: dts: renesas: r9a09g077: Add xSPI nodes
  arm64: dts: renesas: r9a09g087: Add xSPI nodes
  arm64: dts: renesas: rzt2h-n2h-evk: Enable xSPI nodes

 arch/arm64/boot/dts/renesas/r9a09g077.dtsi    |  38 +++++
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi    |  38 +++++
 .../dts/renesas/rzt2h-n2h-evk-common.dtsi     | 135 ++++++++++++++++++
 3 files changed, 211 insertions(+)


base-commit: 4e98e8ccf664c41c70abb12f2316b2b49ffc3567
-- 
2.54.0


