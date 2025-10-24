Return-Path: <linux-renesas-soc+bounces-23585-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3B1C05A4F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 12:44:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 335D43B36B0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 10:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C533146585;
	Fri, 24 Oct 2025 10:39:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F84D3101A8
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 10:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761302349; cv=none; b=axtKOBLyPeMWX2UwfR1Pbd/8LH7t7QIwlBn4AYsDeCdj6XLTbwLHtaM31fSubJf6We/bCyxkMgnodL534zHGFRvduQ9k17A9oWi6glxpQU2AJc6RSBDBK4EIr9701C+eQVSt+qwrsbQYAjgXTqjPbeMsVp1Dn7YGBI1Zf4zt2ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761302349; c=relaxed/simple;
	bh=xYDIaAtHlpq4aCLHhr2Et9EWkrcN8tXhB/rgvIKV8FQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MXtn9kH3gvOPuyFazbrJNSF9kEBQef3XrgZ/zBpY/j6C8ng2gQzsQThosFaDmYOJj4DsuB3dFCsLRXrIAy8ZRLpxZYK/0pyXKjVxfX3X++pKu0gisixddyvOppqAunUFWcZPUEVlt6CettQGTHbNSYExL/DcFLK0q/Vu9cZIor8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5ce093debf6so1929066137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 03:39:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761302346; x=1761907146;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nXbJXdZuwtjDIdswroCFJwLSL36xsyFBW0J7iQ7tGA4=;
        b=aWmNgDCmLk9yi5nM2blEFCpuDfxoFQgRRtUs+aUz9DKqdYW4v8LePynNqB2CfcVKCG
         jWwCmK1r6KL+oWJSrRTgJV3FsGMBHmgyamUYo3ZHiw2OUml6Nkb1lPPiInN/NyguwB6Q
         sKo/ObymQlQ2DevkYspEVNqqNLc4nAC5RX5+cMNlQ0CQU9kbhrKC49VVxUS4bDywKJ5w
         WSOrqfIA9bXuEnmu4F7elGQ5AYUHvzM8et4eOkbJw+8QBxUru8hZjlkm5gOrHBPvD99G
         VLkCWJOKBy7jsN3xX+e06x/TiSmMK0PlblQ0c15zlev/T7mUsmvSloWjYD/XinbRj1/y
         LpgA==
X-Forwarded-Encrypted: i=1; AJvYcCVHN20V2PyVyzoNNFzoNIMsNq+0XhtTLXRxPrfnWZyA5cmVLvWwGnz4f82u7ljtgkqY2xYQ0Z1+WBny4EOZafSsLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwC7a7E+eRiA5VrpLQcZptfd3e8uzIfRnyh++OLTahi71DigZSO
	Kv7CrIu+XXN99hYP0MyMVlTGg+q9HHt22I5/wAQERqX5T59H3TaLhrRNfSd4B9pT
X-Gm-Gg: ASbGncvflS9zS9Jvu/NBRaE8jlDdBBP/THaGZRFaQScnc7v4kv6GCBL4oqCHo5PLtwk
	ZCtuQj+2ZwOfPsrcxWfQQqCs0n1TphlZsZUsx6SzLwn6855y29paP3d4L9CH0RMcxdLzmUBH8fL
	BBTNxt90Z+wv7gpVSug1iPTqymhOIGTuul6n/rcBLch/hLZ/5gqrscLHmqpbP39kdpXhcGSXRNB
	gxULRLhFZwPl/i2RimRIeEGiUTr4Rt6uETVBXkmDXa13WK+tSmIQyO3H/Wvd/E6P+7xfkpkvC96
	iWLalSkhazdqF+r6lzKk7s+wt+suOp8vg1us36G1gnje0bLJh+KNWr99vbdy7H0CQvkloqyhdht
	am83fH3L8JePj7lnlbC9uIuoC5PM2TB99OT+qhTkxdBcTvXqGtCADrFMTrDx75SfpKP1Z4mOkHt
	wJmfMzK0fCkAXEOnMXwF9SqCvnr7ZWuLN7lMgos6GZON7VzjYZ
X-Google-Smtp-Source: AGHT+IFvv9K8QRzmdhBA/CUxHBf2fCTLuMK69XMuwuBIOFMPDMB2/RzAQzdrW2cwVEaloa2todZb+Q==
X-Received: by 2002:a05:6102:26c2:b0:5db:37cf:f255 with SMTP id ada2fe7eead31-5db37cff5demr1708147137.25.1761302346261;
        Fri, 24 Oct 2025 03:39:06 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-934aba937d6sm1858113241.3.2025.10.24.03.39.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 03:39:05 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-932c42aaf14so1411996241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 03:39:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQnk9LAuaDO+lude7fb6pk1wwyzmOINlPxAMSE1M9HCF0Ia57jtW1XYAHUtfrauGZI0/iWkw5XQsZomfqMBfGhYQ==@vger.kernel.org
X-Received: by 2002:a05:6102:161e:b0:5d5:f79b:e93b with SMTP id
 ada2fe7eead31-5d7dd6a43ebmr10434893137.32.1761302345477; Fri, 24 Oct 2025
 03:39:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023210724.666476-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251023210724.666476-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251023210724.666476-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Oct 2025 12:38:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX6kXwnN+xej9jcr--NQqWeEX+a_V3EUP6YRnwv83iVYw@mail.gmail.com>
X-Gm-Features: AS18NWCn2ugKZLkqYLpsP9JDnV7zmuK_otCIXJWTBFNHqvbQ0CEn3hVk_jPHMqU
Message-ID: <CAMuHMdX6kXwnN+xej9jcr--NQqWeEX+a_V3EUP6YRnwv83iVYw@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: renesas: r9a09g056: Add clock and reset entries
 for ISP
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Oct 2025 at 23:08, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add entries detailing the clocks and resets for the ISP in the
> RZ/V2N SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

