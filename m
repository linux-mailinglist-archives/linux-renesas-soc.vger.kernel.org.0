Return-Path: <linux-renesas-soc+bounces-24633-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6AFC5C85B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 11:19:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 24E65343787
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 10:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89FF5309F02;
	Fri, 14 Nov 2025 10:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/jgR11D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264DF30C34E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 10:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763115237; cv=none; b=OKwwZuZYO8BJsHgQYhxxZYvVSUsTq4Px+fh63ezgWs6N+lCxvTR9huVGTGopH5K9ii343y9EnwDZfPbE0ovV9I/vbjHahBXhtNS28HRtv38AsPziFFUWFuXa06ddiXJ6bOOdlpQoIL9vkX3zHyyOmmeTJtyjU0gbVuUqaDexStw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763115237; c=relaxed/simple;
	bh=80tND+lvNj2i4Qe20utjqahY1P2Ql9GnK85Gqo9FknM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gJ1ELkQkOjLDcSaMoKyn+nC0xLcTAEI6TbfMvtPFHelNtKoA91yYAHdACBiQ3L0sXObwyAN1gvRbKRs2jtZUgb+kT+tAvpd+pUMP26vgOVROhYW3+CPYhp8WUcqoQ3AeKoPyENUGsSR15Kw8ptjtNx10KAl5ktV9YqTiq9i7pLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/jgR11D; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4711810948aso12208445e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 02:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763115233; x=1763720033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uyQOUFUYuxA3AMkkTAfOVziTArOJRDBqIJ84aBAoAyI=;
        b=f/jgR11DxRUzlo/M/m5SVIuRQhP3e6RF6x/FclxPqA0/5ggba9xSCyQBCoVG4AbrvT
         EETzqtQk/rgBUglwxGuHkfKK+B9bbM85K9YLmnKbcXfg9bgw6AYhX7GdZCebr33X+4N5
         OplYpyrwX+5ZjEogTLeZu4TIt0qpTDCmgR8isY9LkvehwFb2bCf9DcOaFYA9ZT0lleo6
         peZZ2D4w1B2E5MgI3EzEQhcDNBVn5V0Ld0m2BOjVlCPx63EaLmpwBVK3QOUfKCHXkdYD
         tfLeQ1XlsMKYySEb/HaXOcv48851CkdnNJDii8Omyl+0xTVlkQzZc7k7bX79VRJiwC/E
         fqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763115233; x=1763720033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uyQOUFUYuxA3AMkkTAfOVziTArOJRDBqIJ84aBAoAyI=;
        b=O2BVPjM3sdYXzTQReRZpTESemiyFFrTsokF7+kOV7pYds1rNAt6UF5kUoDrqrmHbC8
         pVWJ6u7OPW+aZv0sxkAyL+LbymHVMDZVC74/G8hgd/9Ymt0PXD2ENdWViopnhUX90gFt
         6LBI2Ysgu4q5A98AAHVXIA9i7aNrt7ww5HTWaejFAdWaVVUD+ufcYtocugB2zz9/qs49
         wbi+TgYCqLfs/BGLmAjVRLP+gR6Wwj/gupS6VYYFeieC7vJQcaEG3LjM+8PvlAFBmKtl
         gBw7veb3IupvUdElIJTjsEVJs/jxi+i31wjodR80TFUzC4+z3uyrRtPPaPBO0S0ewZhV
         RgBA==
X-Forwarded-Encrypted: i=1; AJvYcCXmMjJzqDbYb9r5pWVD5IFjvcry339ja1pOHkaJMJYYTbNb/hJGfaHttPLye56GT6jFe/x25cpE4fx1VFGe8Ka6Qw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8C37gFkATkW9Ge3O43c+D/9UuelHqLJ6No+Q6iwIOnX6nX9OP
	aXwp1zPXJKjCjSCXFS2TUnF+0BDwDWgF5Vg2ZHxcaZNiHXrkgiceYAfK
X-Gm-Gg: ASbGncv2NGy07vWiFJbIVkDwXNyDg3U4uNEgJ9wAaTuJcTDTuiFmag0ZD5mRsgvPOu0
	w7mT3/0Op3DwCGufQxCI3cjXoUxG3hC42ykNv0kaJB+hiPqT3a/NrldB+Mv5GkU7RGDhbKqGcVR
	bm7r96+gBVcpwnuVfuUsknxyowJ4e53JPDnFK7WACAhc7Q4dxC3MHME75tU4gEJgAzmEZ99Yp4u
	TzrUUQ8loDNkmqoRyKTMgPncs1IrJNSxvsvompnvJyeB8+FEThOejmsgFtYdUawFDBQAaM7D+tu
	UfzklsvcDu1q7FN2cR5sTfkTv6U+hRLu/Nwq0stS4wcYR5HtNiR19gvZBZjsBjX63QquiwA7auw
	Dl3psrrBCaLnPCGLbl6LSk1wOHxi7qQOg1kM2OkuT07II8Pv+5gcAayVXyE6CKny41mn+SLpIog
	HbMj7QrH4px24gGyjwNgNiTsEoYYcRQHM85KE5CBVpOelTUEjfuggN4KoNcUcAb3C6GEq+wHBL3
	0hlJQshrCau1iLH
X-Google-Smtp-Source: AGHT+IHwQRc+3WyYaHuW2eDqpuK7VEQtbvn7J8+LySD9iAVjl3fw46CiL/4mZbRZEV1FnK5/AdofRA==
X-Received: by 2002:a05:600c:3546:b0:477:7658:571e with SMTP id 5b1f17b1804b1-4778fea2df4mr25190315e9.23.1763115233221;
        Fri, 14 Nov 2025 02:13:53 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778bae816bsm40685815e9.0.2025.11.14.02.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 02:13:52 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 0/2] Fix deadlock during RSCI FIFO overrun error
Date: Fri, 14 Nov 2025 10:13:45 +0000
Message-ID: <20251114101350.106699-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

This patch series aims to fix 2 issues
 1) Fix deadlock during RSCI FIFO overrun error, as wrong register used to
    clear the status.
 2) Hardware flow control is supported on all SoCs. Fix the binding.

v2->v3:
 * Added Rb tag from Geert for binding patch.
 * Dropped overrun_clr from struct sci_port_params_bits
 * All of the CFCLR_*C clearing bits match the corresponding
   CSR_*status bits. So, reused the overrun mask for irq clearing.
v1->v2:
 * Split the fixes patches from original series [1]
 * Updated commit message to make it clear that hardware flow control
   supported on all SoC for patch#1
 * Added Ack from Conor for patch#1
 * Added fixes tag for patch#1

[1] https://lore.kernel.org/all/20251027154615.115759-1-biju.das.jz@bp.renesas.com/

Biju Das (2):
  dt-bindings: serial: rsci: Drop "uart-has-rtscts: false"
  serial: sh-sci: Fix deadlock during RSCI FIFO overrun error

 .../devicetree/bindings/serial/renesas,rsci.yaml     |  2 --
 drivers/tty/serial/sh-sci.c                          | 12 ++++++++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

-- 
2.43.0


