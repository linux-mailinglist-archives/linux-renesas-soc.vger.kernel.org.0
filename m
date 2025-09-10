Return-Path: <linux-renesas-soc+bounces-21699-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 561C0B51393
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 12:10:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C537F3AFE85
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 10:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 883993168ED;
	Wed, 10 Sep 2025 10:09:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C983093C9;
	Wed, 10 Sep 2025 10:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757498994; cv=none; b=EioniPxye1st6r4zqzDB35TaiyXjzUgqbqjHUUgd2B2183TfqEm9AJXxu8uMmpTB43KH5xMQSG6Iv/2AFFsd3hXN2424wWMrhmSMXWMw1l5vpAZC1FcTtp/99xae42Q8gnzeJTOhK3QaKOKMMod1ESnaRbnrf870+ye/kEeOFZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757498994; c=relaxed/simple;
	bh=41hj1LsqBEEnUu/oVfgAQEkzuLRxVVACzyHYDG+AJQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ec49JuGBHh8jc80Y5YVRrTTYd2LxtrA6rkV8P3U8pafmRRNXiGDJjyWRdOL1GEvRlHMyiTKfSnriOg/Q6KMZ+niClwNu5z26EiAHuVUPwnZT6HceC1g+NpPCU+VxwwJzjH/dzfmqg+T+zzSqRBBQFUkW7vPVKwmI6i9AFdi9+OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-890190d9f89so3419642241.2;
        Wed, 10 Sep 2025 03:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757498991; x=1758103791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQbItlL6nJ3jExzsgpoE75BEbZRvOH9P0SgufEiofto=;
        b=DP9IePtDxeCvkXlRcRMahRxsIaSEAO7ci1goVWIDc3cj+gewIXVRTdlLCfHj9AHa7W
         yw5gnlNQlsyh1h+vXD6yHojB0nPn0xAh7TebVTBVi7qZl6iP/b6dn4G0YcfxeVTeK3F6
         aDQ+DzEUExU5kKpQedWhqj6/4uxEt2R8yygnzvzZll9x8u033M4CvlRWwAdawWyZAlsz
         Ezyfqo74EgHDzC18K6PpDrn9L/wdMkfDWorYsCIXQSbvzDsM24UUqJBBdTFO6z4f1PcY
         Jc39w1tZ0TyhOpEGWJ3AYt+VvIEIHTG2GLfBhKIGQTIldsGcEe4cw8PHnLm4zk++A6ko
         CdZw==
X-Forwarded-Encrypted: i=1; AJvYcCUHfQ/F3AWE/sDS/nlWKWFPVg0Kth86W2v+Li0ddTstmHVf79+vfu98GuZh8z5jwQX/V9KooVqYqKFiqRCZ@vger.kernel.org, AJvYcCUbLR8fER0KQd5NQMI+JVwLV1AkfEnI0gMbH6YVyHKURwh4FusjalKwIwN05/RHBAGeuZvg9+18POk=@vger.kernel.org, AJvYcCXXSJuo5MvGGi/V71vl3LTAMJlB7tyJBqnMKTabRQqiXlv8StiVqdFfv6NXkMU9cuMyXbAG+hqB5bTerPQGsjFxl8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRPLEZM9Np5EVe4iq+3dBN0cJjZ+2o2pEFCHXzc10ybS9pCU2R
	Mu/SCk2Y/fFLn3tITIJ1pqEl8INbCVZZr6x5yr52MZASHUd4ZUp0ZQDrKoZ8tEVs
X-Gm-Gg: ASbGncvj/zGqvCNyL4ePcR8PmuZe8ghJbhWEx43HRQxQIYKCOujwxvI5L13e4/fmi4c
	ZqGVwMXWgko3vymiqjygBbT/HR0a1MxebioMwUDf8wbGXKecv7wNTAZ8H0JxdKMtfhgjRxb9am6
	2+jaxwFmrePS2PjY5Vec+hbpbyVTN4pOWj4JPpChenfh2Ui6YZxwWSlL5KbXcCgE/cGsTRlgOgv
	QSATqtrA0gMObEJUGJ2QMTgU+vPtKoRtnasBPMttfNoNwrurmowZwxsqs/J+X9VxHiKZDnfDPIA
	W1zTw0VPVZEEsyBGtdzlSRtJisWM+EKSquoUY52BZR27Djd/lnglRTh2CSVp5ewLrsNNgyiZjQx
	xKTgHJH/50g7GQsMrdLE4ml1g+MwVZi2fRnFwU25LYcjWBBbrwV8L0o388AnrCc+N3FgXUt0=
X-Google-Smtp-Source: AGHT+IHFa+FneQ2dAsvLh1J4CUylut4MM8CvnNR2Lf7ssTCFE1KHtNl7MBqZh0P6br1wvjXRFBn2xg==
X-Received: by 2002:a05:6102:6447:b0:527:d1de:893b with SMTP id ada2fe7eead31-53d21db6e02mr4408863137.18.1757498991292;
        Wed, 10 Sep 2025 03:09:51 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-52af191584fsm12507232137.11.2025.09.10.03.09.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 03:09:51 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-8c1e1b6ecd5so915219241.1;
        Wed, 10 Sep 2025 03:09:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUDhuJ7NlCBC6tspw2oT98FViBcfQO0+7bwDiLIUBxLg7DnDO9HGM++iFfLC8lO15ZL4IPC4AoGtm4=@vger.kernel.org, AJvYcCVzEbqiEiTG/E6WcnL5ftT9uQRJF+OcKJRge5nSxJygo4ENKszB9aX73hgJmWPV9oTL5FlI/mQ43Fc5H20u@vger.kernel.org, AJvYcCXiTkwTdqwwUVTXNEWgTponAjDypekqDZmGXH9TWOXm9C2QrdBUDyzoN5arb3It68pYxQt4TDitw5qs3b4WCnaj3hg=@vger.kernel.org
X-Received: by 2002:a05:6102:290e:b0:530:f657:c25 with SMTP id
 ada2fe7eead31-53d1aeac1efmr4496496137.5.1757498990898; Wed, 10 Sep 2025
 03:09:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904155507.245744-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250904155507.245744-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250904155507.245744-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Sep 2025 12:09:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVrx3Nhf10CeJrDV8fWuNXLRjjecYGHJfELAuxN3mY5KA@mail.gmail.com>
X-Gm-Features: AS18NWCMc88swLPhTeoQZ5Wh_5YjKE_T8q-ASGiuYTxiLp8_dhkCPysbVkNQThc
Message-ID: <CAMuHMdVrx3Nhf10CeJrDV8fWuNXLRjjecYGHJfELAuxN3mY5KA@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g056: Add clock and reset entries
 for I3C
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Sept 2025 at 17:55, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add module clock entries for the I3C controller on the RZ/V2N
> (R9A09G056) SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

