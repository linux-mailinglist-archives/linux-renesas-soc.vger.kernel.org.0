Return-Path: <linux-renesas-soc+bounces-22336-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA1AB9A287
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 16:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49AC832182F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 14:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52641218AA0;
	Wed, 24 Sep 2025 14:07:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5CE1DE3DF
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 14:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758722828; cv=none; b=iy4XB4jsg4hl6cE8FAKZrBmB19CdOIk+EFBSIdoQygM1JvcBTqGGZMX9828R4YqTwHgHxtWQK+idxYQSCe/FDL9m7UKekdOUQwivzBjAO5xQGPi8IAdYPW4UUSkSCy/2maAQvz7MNG0wCbpJ6hrowwRt9zlkp7UcDrkIozUHNqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758722828; c=relaxed/simple;
	bh=z9AOKPs04tBQ4HuQHD5qLwqf6qq8m12qH0VEjcOwE/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hrBewisWlsc1MWDmYk+JfyNqc3hKi3a5egk2+ZvewFLu/NlRU8NZB+IdrfZL7nlsweqnk32TqmQEb22e9+DxZSj4fPzVEh36KVYn7qoXjWhZmhSaGVnrdyuaPh4qvW112I9c5gGta4yy7p1JrqSFr8L4VW8esQVqL3fWeuOd94U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-ea5aa2fdac8so5956546276.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 07:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758722825; x=1759327625;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JsHa4BTdlxzG8oL6cTUTw8znwap/WVMmft0DoAQSEiM=;
        b=kMz+2Qzs2/y1hWElqrMLPjuRIrxwcNdUgs5X6fSjkqr3rsVoEQPjudOTYRljwZNvhm
         KfuNQc/1qB2q0KkxwnkCsU4flThzvHhv4hDl8jLMLGrk0MY3rTUWEoQZJyerJvSrtJ6q
         49QLcntQ2qrWk00eqgTrg3vgLYO58909prTw+0ij3z9uN7khjcnW6ch3fCG/rWm2bBk3
         BsN3TmzsBXuzxyfQ2IAQRqMJYuptagGZhnOdQxulqIreE85XT3l/bP4qPgHqcXruX1Am
         8IwpP9yfnIEx496O834Red/+C6yZ5M/71I8XJPbrvlui9gW7AEjsD68mAlQAwoCWc7BY
         +S2g==
X-Forwarded-Encrypted: i=1; AJvYcCWntMnCRb5O6W72YQqFuedsqY15xZCJTvUA4XJLw/N+DpjQH/uHElR+zGGfV8LyGXpKZVKqBQ7vLc39EQY7p6YJLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9sCfAZbVOtNRw2tXchhCs+aEcXP15T6ePC7uM4BG1elV6BVFx
	skuHxAXciYSTxcvz3QMT6ICxmcQmfsMji87ezt6GxXdKzpZQEgiVtjtoe4uWpOG6
X-Gm-Gg: ASbGncuRxbvWVS1wGA3X8eguKktwOOGwgt2uNI5lcGN0O7lia784SqOXAa1nbR81KPq
	jCLnEMRK13qm9sw76wDaleGch7RaYTT6TTX/rCy02hjlujYykDOhB+INX95PruWG46xtBRqpTpB
	OFt8SIGAEIbQFqZKlm6V+5mBGohLFFTdAILHMgIL+C4udJsLn26J75knsmbrN/LOny94lIqLyl9
	+DGU9DoB7bFAVe+ij09hyWeJv6/oyZ/300Y/UYXy2U4WzIROaUQ89edb9pygPE8bh8QbiloZKUS
	tlAhd0Dr/DvgYPuiJc63Zymbvm6MD69v075/znBWwuPZDK6gvsIUp6e9uB542yfHG4+M86sVAr3
	q1+4r7XbIOq+YW4w81ev9pybplBVxsc16CnH5KPXYE6TWAoD6G4BYwI1YZGmKAMCo
X-Google-Smtp-Source: AGHT+IGBVY79C4W2edCEoJ3NZIEdqLh32lSBexZMj8y4HXAr7KPu1VL+/4PEC9ImLz1JcDsjdd89Hw==
X-Received: by 2002:a05:6902:480f:b0:ea9:3bc3:8954 with SMTP id 3f1490d57ef6-eb37fcc2de6mr81011276.42.1758722824805;
        Wed, 24 Sep 2025 07:07:04 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-ea5ce8544b5sm5894568276.17.2025.09.24.07.07.04
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 07:07:04 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-ea5c77525c4so5175940276.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 07:07:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWt4ZsgZVc8bc9PX56U7E/R2pZtREvGAxHMth4VGzMFBDt3/mztKo2YAVckTHC3BlIW9rHmetyolY42Q//n3Ie1Rg==@vger.kernel.org
X-Received: by 2002:a05:6122:3115:b0:54a:96ce:786e with SMTP id
 71dfb90a1353d-54bcb0b6125mr2198963e0c.8.1758722326099; Wed, 24 Sep 2025
 06:58:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910140305.541961-1-claudiu.beznea.uj@bp.renesas.com> <20250910140305.541961-7-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250910140305.541961-7-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Sep 2025 15:58:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVrGbRHXa+13nGTf-S_cgHvDASvDTUSqhiC8updddJUFA@mail.gmail.com>
X-Gm-Features: AS18NWAg1I_dL3GYezwY1MvHo4wl2EuUyKfvLAv7l_tUzF74SJUhWeo0uWlshA8
Message-ID: <CAMuHMdVrGbRHXa+13nGTf-S_cgHvDASvDTUSqhiC8updddJUFA@mail.gmail.com>
Subject: Re: [PATCH v6 6/7] arm64: dts: renesas: r9a08g045: Add USB support
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, magnus.damm@gmail.com, 
	yoshihiro.shimoda.uh@renesas.com, biju.das.jz@bp.renesas.com, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Sept 2025 at 16:03, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add USB nodes for the Renesas RZ/G3S SoC. This consists of PHY reset,
> host and device support.
>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

