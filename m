Return-Path: <linux-renesas-soc+bounces-23481-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 35743C008CB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 12:43:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 16F434FC8EA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 10:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6A502DF134;
	Thu, 23 Oct 2025 10:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GgtmlB1Q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490A42D978A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 10:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761216209; cv=none; b=WTXAIBF+Vp1pFi1juJ0ONNz91rvvqzVZcDxbEcRqG2r5vbB/T7i9FJJOuc35vCUK9JC8zGpUb7GYVcbtzJty6XxgWopEbdKWSMVFHXSA7h4FmAcuEa5xVzI6rXp4Ms7+cmIMWQl4CdWyrBExAduqna8zF1AfswwJFvTzg4+/wF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761216209; c=relaxed/simple;
	bh=yfiZ/v4sjNEPealFn/6obw9kLQ8DcjpygkxhwfB5aQs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Iun23wa69ES5fU0e7AcBks2+6I7NHbDHYcnAH5KMZE7b0JAEvcBE8Cyixyw1qn7933WHzjRm0Ze9OwreDo5+Nz5l79EpSEToC4J7Jp16zpZgHLiBbhsltRggTtkMGUXc6cZD1OWyye429lxzo6UWa8l26pPXmp4B/yAdo07zwfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GgtmlB1Q; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-290d14e5c9aso8454805ad.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 03:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761216207; x=1761821007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oimtdy4jzaui5mD86nBtASLISt4Nnfmett/2NBvJrk4=;
        b=GgtmlB1QZQNg5PWJMc9C5LDGB0XRumfVb4tvMDijqYHJyexYH3wNrYJ3bzl2x1SMTC
         WHo5wca33LktR9OPfq6PYwLanBverSSm89YgO3hho44cKK2v1/6jRmkDfw8osCDItn7E
         ZSqkHnkqUAH4yl/j1RuUKl3fMggBu5UBNuOpvMoJiqshxujT1whbl7DJCX8vvRXcbR9Q
         wOVT6oWJROy/nMeAfgY6/Af/1OFTCMGrXuFfqNrrNQhBIx2zifmpVmwvqX4Kz5rUGCQW
         y0ve86SzAYMBkbVGfp3BxUa1eAjSKmoVFPxpMWjhqJKQUd5CAh//PXjpNg0NORtcnI8E
         ARiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761216207; x=1761821007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oimtdy4jzaui5mD86nBtASLISt4Nnfmett/2NBvJrk4=;
        b=mWEI12sDH4KusSih2TzVdY5rylGGEOa7gNZYa6vnZgE4lp/E9qdvs0PG5f3Dq/QY26
         3MnVScHM4Rccuv2bWCWNuhIp1aihwdbQ7l7LCdXI156WamWp/s71y14JXUmpPrSEotPw
         atVqKSWm6wQsIo7rrRGMFMMyG8BDpEKpmuoIYTEIKwSnjTsUh/Sq+aJCJz8s4d3m7Wx4
         oGC8rldNOescnrkKOygIlDIxut+M6w478xWeU3f8d1wA9SwIUMbU3srjeT9yxYcL3XLu
         nWpfyx7nOKSTJV0fB1HurRLHxWJiVfzbsSQPVPnod3BEBSBPM2p9WIPpDGN/U7GfKyH1
         sZCA==
X-Forwarded-Encrypted: i=1; AJvYcCX7uKhMipXniYpCu8SKsPkt/LiDU/Hdd5uxcNVvItLv+8bdntGKFn4y6autgQj8PdT0hhPpAuIxXbK336goiDe4BQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyY56s99ECtmPrwLVJ9ExstYiE8cEYzas6qLd2mLD+a6QN7V7v9
	RqBgPYmR7d1ZF5LXFjNSHJQvxd/eQQY+e9hGGB9GV+ZV+4eKZN1nyTk4
X-Gm-Gg: ASbGncsbpgZEUwDnZvaQHseC2oUpT1ry8KjABhw7MxGD/3C4nCZvs0++cANG0T1YlZ3
	zRwIW+PRQ2LDsLU0QDrzcyQ56hFOdu5BwHC8/ErWl6cEDtS2bOFHzVuzdmAotXNlOXwYYMnl9Dp
	+2rgf+TvSBZiRvu8y97DZ33ZQmLBD4H/xXis1U66natUUuboKI7IzmEqTlxpn/Zur/FJAOgQMy5
	YGVeEXGtSA5AfGcW3GNoxdd7VdDrrx5FGlB1L+75xmq2RaX6+asVzovPBoJf/qOVsa8mYeSUSWm
	fbBlfPW8UlcUsBYBqu6jNBL3ZyYtOU0ljfVbmymOYKG2p4AtZm9dXdMXPfKSs0LF0mqn18sigOh
	bddf3kJ4s6TUDvgf51zJ82oImzMpne7LL4ZmnvDUfo+3jNkUd/pXHSeJDYI7KulAfT44Gj6nr4E
	ibr9qGSOYEoFZwIJS5EVU=
X-Google-Smtp-Source: AGHT+IH/gs6+8CFlO2G87tCtAtLvUgrD/2n3++PXEeHzzYkJTjhzcKeN8bij7zgjnMAfHtOTCePOQg==
X-Received: by 2002:a17:903:19e6:b0:267:d0fa:5f75 with SMTP id d9443c01a7336-290c9c8a5b0mr338020675ad.1.1761216207465;
        Thu, 23 Oct 2025 03:43:27 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:ef2:36b5:9454:6fa:e888])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946ddec426sm19240945ad.34.2025.10.23.03.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:43:26 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/2] SH-SCI serial driver code cleanup
Date: Thu, 23 Oct 2025 11:43:11 +0100
Message-ID: <20251023104313.210989-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series contains two patches for the SH-SCI serial driver.
The first patch sorts the include files alphabetically, which has no
impact on code behavior. The second patch merges the contents of sh-sci.h
into sh-sci.c to reduce file clutter and improve maintainability.

v1->v2:
- Sorted the include files alphabetically in the first patch.

Cheers,
Prabhakar

Lad Prabhakar (2):
  serial: sh-sci: Sort include files alphabetically
  serial: sh-sci: Merge sh-sci.h into sh-sci.c

 drivers/tty/serial/sh-sci.c | 184 +++++++++++++++++++++++++++++++++++-
 drivers/tty/serial/sh-sci.h | 178 ----------------------------------
 2 files changed, 179 insertions(+), 183 deletions(-)
 delete mode 100644 drivers/tty/serial/sh-sci.h

-- 
2.43.0


