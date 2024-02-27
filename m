Return-Path: <linux-renesas-soc+bounces-3290-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C0286A28B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 23:33:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FEAC1F2AF40
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 22:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0039C53E07;
	Tue, 27 Feb 2024 22:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="gZCU3kY0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE953EA8A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2024 22:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709073225; cv=none; b=OPfFi+LFjYA3w65OBY/iwWBWSqRR60baJcm6X0r3Iy0eObIAAZrYWbb16VU4x8u1RIlaPWaMB/UXnrDiWHjb/xvIJfoL4UqXuys1RkJSsMFP2wUKYuMHB1BynjD+mB1bNrIAX0N/IqpWMt5+xTb0aYNpNM13JTKf8Sj/KHnBawc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709073225; c=relaxed/simple;
	bh=UOa7JuX7gXiVuYl4IAYiXUx3Y3PVbL4V1SZqE1lhRXY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lEqePTl2X33IaiT8N7H/xnODZejQ0vYT3pLy0oyvOFgbqYbvt1/OyZnbFXSeGuUn6yArmeAivH23PCdZuEK+NwFbHZK18XYbp/xdQmAe3FmB/3nlZTM1fJmGZZtb/ieSHTPimSWR08DaTBq5XEF4/wO0tj59AjUZkrpbKZHV3lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=gZCU3kY0; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d29aad15a5so15476961fa.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2024 14:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1709073222; x=1709678022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cXkln++pp5q7qePZRB0MDAZzW3xrtMQa441/zh5OMDg=;
        b=gZCU3kY01pWn+S7wDDw+FzP0MpcvmXT7y11lykylf33aeGX8sA0ZYnMK2j2X7RddcI
         AQc136leQpNHl/OeycVMuIR7PZwVM0iwC2ubUMq9UUguSW+uOeMBc524A250YgEs/gMI
         o7pGMx369IBbDV9tKd3FgARUt9jUEuzfG/Rgva20Lan7UBiAUqyeIz9+dQ+HICw0pO+z
         JrETRCGNBKABx6ujDGhJ7W9zOHgQH+YJj+OvrV+WirIeQaRHogtTbMCBr8V7AFVKT9ss
         /O/7z+wWLRhI/+5udlXIJQUMJpDuCgD0AINu032K5PLOlqSK6phrqvqb0QAsTcyURuTM
         ln3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709073222; x=1709678022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXkln++pp5q7qePZRB0MDAZzW3xrtMQa441/zh5OMDg=;
        b=v5xKzJnodkknNX1HTR9LW7t42rFKDuQcJ3JiHi99Q3YibaJndMOapLdzaqFwD6SjLR
         GIlGUnqQHM/CK5dy3OpciKriIlJHpXg1A+/UZUy5/hvgNfyR2+50Q546/q/fctBbwOle
         LBfEDug0+Co1VKHXb7cRWr4krxkm2RDxXWJ0EKPQZoZSQ9MXKa+ra2HRokE2nosrPrcK
         hNQFBMo3TK4PYdG+kzAybmNdFl8SDj90neOw+xDiBOj8bYg/ulFPkIgA3Lpz9GoyBX2R
         sR0mMJGwkZMgyrSnokDz9XZ2ZOD8UYPUkIucCJDzKs5ai1HxyzC5kx7/qtKxPTdOLIsh
         D9Gw==
X-Gm-Message-State: AOJu0YxI+sYQjN8c7Q5uDS8B2VxmfGTNLsSxYjiLOtTApXxqsV7kux0L
	TF8wynW+b3K4WMlnEQyPAUkfyBFPeyqfKxRWzmLfXdskFaD5JzH3Pks2+NW68Yo=
X-Google-Smtp-Source: AGHT+IE9iBgllCE4i/i3S6fhbJQU8zEp7inmJE4WCVyzWi48x1LmpTbtSa8dhMBjEvRNGYXSwPtADw==
X-Received: by 2002:a05:6512:1103:b0:512:ec79:3bd1 with SMTP id l3-20020a056512110300b00512ec793bd1mr9740348lfg.0.1709073221553;
        Tue, 27 Feb 2024 14:33:41 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id jp11-20020a170906f74b00b00a437b467c92sm1195860ejb.177.2024.02.27.14.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 14:33:41 -0800 (PST)
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
Subject: [net-next,v2 0/6] ravb: Align Rx descriptor setup and maintenance
Date: Tue, 27 Feb 2024 23:32:59 +0100
Message-ID: <20240227223305.910452-1-niklas.soderlund+renesas@ragnatech.se>
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
 drivers/net/ethernet/renesas/ravb_main.c | 210 ++++++++---------------
 2 files changed, 83 insertions(+), 147 deletions(-)

-- 
2.43.2


