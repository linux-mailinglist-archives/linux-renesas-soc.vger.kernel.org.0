Return-Path: <linux-renesas-soc+bounces-20596-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB99B293A5
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Aug 2025 16:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 079C47AA8D5
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Aug 2025 14:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 608B01C4A17;
	Sun, 17 Aug 2025 14:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FfqD3EEg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B494E14B086;
	Sun, 17 Aug 2025 14:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755442301; cv=none; b=dK7YQfzkUyI/zBCKRALYpJLLGfTJk1MG6r1/rGrHTup8h8srTGq/EJdusZuKViDj8nWkymbXQs6XYVCMkgXgbqAp1ZMnjrUrj97wiBVOK13YRl9zKa4/k6+La8AfXSOEdlsgO027ckeBTmyqZSxqXkpSUHt2vAMWuNcmeZ6ZGu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755442301; c=relaxed/simple;
	bh=5TTkF6oHixSGI7qMQ0SJNVote1T2AWnDW9/4iyFRL6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h42hLbmRcgLn6eupdpe5lncONrjACvYFRTZCrhd0BEqbYcdnxVb8hJKxhKTD3OS8iby1go5x4mx/OgYQ7Gpk4qRA+ylauDoOw7v5EjX0nxX0nxUDrXhi2SO/OcE6B0tjYYzreMmKeecWU9lSCvKHFMC+QoWNUlC7zzQr4ltUlME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FfqD3EEg; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45a1b05a59fso24107905e9.1;
        Sun, 17 Aug 2025 07:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755442297; x=1756047097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KcoeDB9zQ9MJNXPgD7LIAzqfPCH8wYV+5xheA0rYfOo=;
        b=FfqD3EEgIcScyWVCbzolDSJPMWQ3UIQOhwA7Kd2c3SVmwbPHP8d9xGl0gkxixqCn7f
         H03kI2+I3Sz4VBRICCykcVGx308opO/ZBEP+q4MNDrHgOzUKy5gGCH4+CQZqekJX7jOJ
         NdBgcr1fEvVTUZK4BPzGg1Dh9fDpa8dG6sybpr8D9iBYjGpjAYAYcGPn9DpC5g3ujAM8
         Vz91/kikIm9rORih0VAgDQIotPeC5PBPG2qOtveON6QNwir8SEEzFVQIN+aKUPJsjeir
         VbZ6ijIUORWQeujXdY2TwvQFqKfWAR5ZMnhh9mjxhoB6GNZZz5uEXHwSMFBFZNYZq4op
         yzCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755442297; x=1756047097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KcoeDB9zQ9MJNXPgD7LIAzqfPCH8wYV+5xheA0rYfOo=;
        b=nX786KmohT792Wx79TIhk4gCrQq/6XlCsz1AAZb2/PNO0KNbxIbJ5hNonBUrK3MPZ6
         duu8na85lk2kh4VroMssGM6CFppqNyJISS5uF8yYnqqee+eq6l4Ld5xOEn2bcQP/c6Wj
         Trw6ALwbEoFzB3frEHMgiJ7JKCVFf09eAzo6SdHI/Ll8FCiV+IKSw17NET3CnX1iZ4Pv
         WeDUDB5F5wCrtDrWtAqvqSoi9GztR29SECtO51rGw9TGEJ1ND+jc1Fo2fibik8BpE0+3
         s/v0gmg1WO9RSh8928lO4teBl++rTJyadqf8FwcqMlp6tmPFaeVxoZQmEv4NcNBrx9+8
         iDsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHHOs0/bPrlCo2hx/kSqGzBxEDXb6f2SvGaThoQgU4MBrSuH16na26TufoX+KxAE8n2avBgPk8+fAv@vger.kernel.org, AJvYcCWp0ZIACqNXWABOwRNzhFaQY2GVBRPg4e2YnmnSCmv446BgMYUAHzqHn4BxQLwa5kQgKrHpAD3wZKHKb+waI8J81qU=@vger.kernel.org, AJvYcCX3uTYBKcTUnZ7eWV6irCwrJ0sWAxXDBh4kf+vUusUbQvuLhtZKoH4qkSYytuJGKrL+IqI6HW0p8ADpjHbX@vger.kernel.org
X-Gm-Message-State: AOJu0YwabXiXuyq9L8gqY041GKVjLVbO3sAiWBttb5Oe4j/uYy9ilrQ0
	JZ/lE5JX8IeuTNgiQzQauIq1yBIm1ECvYZsqGoVaDPeqmETBbEmBvYuO
X-Gm-Gg: ASbGnctkXyIiwWLRj0cuuEpHlB0ow4IzhiYGBOMzKc0thTk8nkIcMMUlBtDiOEg0CBP
	dGn6G7ZBQf4OsB0XkK+QdEokgx0kVKhrLOuGAwQd9wKs04l2/PIf7Y3m4EDZI0sn89hni2J7xvz
	3KoPYLa4tYQoEb0Yk3dIWR2GDYv6e7IkHTfIA6dgpSU/C5KZE+eq0Y0zrqOpI7MV2hJj28ojfbJ
	u10nqz+5SLrOi87CYDahotx3HDgLEgxZH54sK3l0Cq+Q/OutkkzeF21Fju9oc69GOuk16LhukSc
	g+Lvhg9i7iHLwjE/RCLCDljTUi/avE7IpHx/2mROeLeOgiB8v/V3IAN15xZ3zsYB0odR4GRPhCb
	k76VA8ZerKbir7JLr1BP2l8cMXSwpGi0UapJAwX1jhH8VX1eDB+C2dM02sC5SHvKvVy3/r9Dbrw
	==
X-Google-Smtp-Source: AGHT+IH4tCVgAFYEstGC5tL6bEfuWkCdmoT9cOSHEImj9VXypR0kMzJkaRRhhVwq1B3+HZ+9Wq3wiw==
X-Received: by 2002:a05:600c:4755:b0:450:d01f:de6f with SMTP id 5b1f17b1804b1-45a2674e40amr51352865e9.15.1755442297289;
        Sun, 17 Aug 2025 07:51:37 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c99dbsm9917352f8f.36.2025.08.17.07.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 07:51:37 -0700 (PDT)
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
Subject: [PATCH 0/2] Add Schmitt input for NMI function
Date: Sun, 17 Aug 2025 15:51:29 +0100
Message-ID: <20250817145135.166591-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The latest RZ/G3E pin control document (rev 1.2) recommends using Schmitt
input when PS0 pin used as NMI function. Enable Schmitt input for PS0 pin.

Also fix the gpio key's pin control node.

Biju Das (2):
  arm64: dts: renesas: r9a09g047e57-smarc: Fix gpio key's pin control
    node
  arm64: dts: renesas: r9a09g047e57-smarc: Use schmitt input for NMI
    function

 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.43.0


