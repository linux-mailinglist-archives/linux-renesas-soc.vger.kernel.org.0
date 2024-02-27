Return-Path: <linux-renesas-soc+bounces-3225-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E487868623
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 02:42:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24CA828A312
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 01:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 463B9DF55;
	Tue, 27 Feb 2024 01:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="QRLlbVEr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7712253A7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2024 01:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708998122; cv=none; b=A9xXXHeUNkIQIYIF2Wizlm0aeN+f/CtYUyEfZBRMRi1PR8A7c1BOiSWXOG3DbP27CkEL3EPQDVDmtBXWdNAawhgYe3xbPZhCvwOOXV5rPF+Cg+4VIZIejgGgbeuSy+C42xeGMvk/9mbuchtSGdxnL60aTWjgM5wMikyAocTtOXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708998122; c=relaxed/simple;
	bh=CflGGZBBj+ilA3va3zK/OKpSZFCSCrOngD7N7YFQqdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Mt2DuL+x5wYgZssGdwXwKc6kBtr87L7DUGIdztgwVZJApRr5I3FIdHqr0D6sp/GJ4P49QCH+EcoKCLcwnEQ1btQxUYLms1+uzD0rvsa1odt0B3YjZVLRfIIJuAnO3D7sDa+HXEzzBjv+M6Ga6oakubR4SxColreQ/pnDngaQw3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=QRLlbVEr; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-412a5b63c11so10216535e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Feb 2024 17:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1708998116; x=1709602916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N5COzI3dlwznhkUrEgFBW1XP0RNdr43G1INYrUtjyY4=;
        b=QRLlbVErsvFoREFQAUSOHE7f1hpZhivJmhQL6G3XNPJNjc0e0TBgA4knU1kT8se4z3
         5KnTgAAEqdEoWavAsqR5wW8SYZQ+0gM3H6x0o+YeOtfNvBXCffxszpMWeh3l1fF70u3f
         eJcfc491LpUD0bw203W6GzBwo6VvVWcQfRi1NDg0Q/HuzOhs3lGGJRsRufzzjmnxwBU+
         3mfRHRTGyRjdSMEu0m/OwUdyCrYWTnotrELzlAqeBrrb2Fu/X5JJqlvOaw6UD/xATMCY
         x9KCrCNpe1Ye4LYeJuPcqdJ0Ytu5tzHnttXyAv56uBMzwO63QiNO/QGb3RXXzEdHSktA
         LXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708998116; x=1709602916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N5COzI3dlwznhkUrEgFBW1XP0RNdr43G1INYrUtjyY4=;
        b=pI9tNjlwyaHK+4iLEGSJYdBVRfEwjIknCUL7GKB0K2vVd58fqUvCLxmfI9mGxWd0Nj
         t2BYhWCR+XtXbw6myd+S7uTZy82Ph54rAo/VCEYSMtwLQTtL/9QMkGzAPb01nvYv3UEj
         zM4ZHt49qKQkJoTV3xdwV4rrIMoMsbtPOymRZ1nJQTaIEUm4AOUWArv27sfDe2N93W26
         IopI879IxlhNIdI1eGl5xMyh9ztU1J1iDupla/6gjS8xq76hc+FhhepYxHR3xwbtBO8C
         FKN2DnPqDZqOBlVxHMIgwFecwXluqPqoujD4593iD0FhBq5CVqbqSsmud4/u533rK++A
         oWfg==
X-Gm-Message-State: AOJu0YzOQh+QgWIJKmx1hh/KIk21F7mrcepzAAmRVM3xscwlE/XRhFJr
	2fGNZDaYHp+GQY5UWDeSLVFfP/qct1DvR/wveQ+DUIoazV3Yf6oHSyjWSkFIvFo=
X-Google-Smtp-Source: AGHT+IGyPZFbKL4H/cmHPiVaGfO0PDlYUckMxJ5d5iseoorr5hq3r+Gqi5geGmKXK/dzCMn/9hQyjw==
X-Received: by 2002:a05:600c:3111:b0:412:a390:54ba with SMTP id g17-20020a05600c311100b00412a39054bamr3543057wmo.32.1708998116477;
        Mon, 26 Feb 2024 17:41:56 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id w15-20020a05600c474f00b004129860d532sm9827918wmo.2.2024.02.26.17.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 17:41:56 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next 0/6] ravb: Align Rx descriptor setup and maintenance
Date: Tue, 27 Feb 2024 02:40:08 +0100
Message-ID: <20240227014014.44855-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

When RZ/G2L support was added the Rx code path was split in two, one to 
support R-Car and one to support RZ/G2L. One reason for this is that 
R-Car uses the extended Rx descriptor format, while RZ/G2L uses the 
normal descriptor format.

In many aspects this is not needed as the extended descriptor format is 
just a normal descriptor with extra metadata (timestamsp) appended. And 
the R-Car SoCs can also use normal descriptors if hardware timestamps 
where not desired. This split has lead to RZ/G2L gaining support for 
split descriptors in the Rx path while R-Car still lacks this.

This series is the first step in trying to merge the R-Car and RZ/G2L Rx 
paths so features and bugs corrected in one will benefit the other.

The first patch in the series clarify that the driver now supports 
either normal or extended descriptors, not both at the same time by 
grouping them in a union. This is the foundation that later patches will 
build on the align the two Rx paths.

Patch 2-5 deals with correcting small issues in the Rx frame and 
descriptor sizes that either where incorrect at the time they were added 
in 2017 (my bad) or concepts built on-top of this initial incorrect 
design.

While finally patch 6 merges the R-Car and RZ/G2L for Rx descriptor 
setup and maintenance.

When this work has landed I plan to follow up with more work aligning 
the rest of the Rx code paths and hopefully bring split descriptor 
support to the R-Car SoCs.

Niklas Söderlund (6):
  ravb: Group descriptor types used in Rx ring
  ravb: Make it clear the information relates to maximum frame size
  ravb: Create helper to allocate skb and align it
  ravb: Use the max frame size from hardware info for RZ/G2L
  ravb: Move maximum Rx descriptor data usage to info struct
  ravb: Unify Rx ring maintenance code paths

 drivers/net/ethernet/renesas/ravb.h      |  20 +--
 drivers/net/ethernet/renesas/ravb_main.c | 205 ++++++++---------------
 2 files changed, 79 insertions(+), 146 deletions(-)

-- 
2.43.2


