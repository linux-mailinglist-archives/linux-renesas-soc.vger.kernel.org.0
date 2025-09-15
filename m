Return-Path: <linux-renesas-soc+bounces-21858-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9036B579F7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Sep 2025 14:08:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10E88166C85
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Sep 2025 12:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9E62FABEF;
	Mon, 15 Sep 2025 12:08:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CA630103C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Sep 2025 12:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757938080; cv=none; b=DIDdEOIebg+YXFmDZVyvg7YXQbqywzlBLs1VDrumxYH9MGZxtkQvjbzPF6NwcBK3i2aQHYZU7XgQf/DHzkba2zI7B359WuuY0DAyfsS80nNOxcddyXK5HojQ3gB/tlnzIrXNf7jDGgLWYnT4DNySyOQ0DODJSezNlJr+NqeLsco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757938080; c=relaxed/simple;
	bh=w1EtHwW9I0RFjXogMFDEDAFVqUSNz6KiSixf/4aXXzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UFXfnnDWxjmprb7USvb+IuKaLKcuJhfoUwjvOfGec+z2P9R45itRJDWYAN9QT0+nWR4UJSX9u4qTmtB8Zju0HJy5N3qsIfUtFpc9nDZUe6Z8DU6F0dRhspmEUqp6YarlYnk28XNHtpoS/xmlc90wKTiBo5oV3jimypsrvBPb1j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-544c620d486so2926735e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Sep 2025 05:07:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757938077; x=1758542877;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tBfi4uhS2B+Eniv5scVBhoF8y69qK9fhF+0G1ZdygDE=;
        b=eYn0JkoBZf4dw3yO3bpE2i9S7HDpTfgJGunMwsePUSFbL405FZgTsxGugiwQQIfMz5
         uA+yTOGVwaBDBLv5SR2caBDtMLFbGDn46eFo5sfpCcHqOErW8BPWdQ9PyrqlHfotO4xT
         UOHpw+CyT/KRp8H5mYEBi5P5IpfM8ADBgbZCpjYDBNbDdAlaI+4Nt11mEnC2KfEg4ywb
         l2qbOMULyPWTLX96iIrCcxq+XwijId7uarVnqsKiJ6S/WB2C3LldUJYqRmd7oLknW2ve
         Acv8fehHetLJeM3XZ/0g0F22X5D6kMa5jl4HsO0Ya690RosQho2ZDFm5diZUSXpPyoh4
         +CRg==
X-Forwarded-Encrypted: i=1; AJvYcCUIt6uVLkRGINrVT1ojFj2ywWYEsRKZmilQ22z3dbWCd0ScLBt0rBGVCWfv52CtXzc9hPeh/3YUS4UKiOGmen5ZWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaZO+e9fQ5rSWULGo75y2boSJVARLOW1FMU+jqcaPzP1HtkHwr
	t5t0maXlKA8FySoGyGwVWBqZ4l/SowlPq0CAhHe1SHS1h1B4VcodL/sSWmk7z07h
X-Gm-Gg: ASbGncsNeFgR2qEft5ZuKyuy/AoSF0zLTz7gv4CoTtxgKp++/pImjumpZrJ7k08ib8/
	XCmAfdkFqTprvtfma/Qy84DKYirZcRbvYN56T201s3hs0pODcDFsXiXevuvqy+yTve4c7KoaJgD
	aVVsk+AyWUvnNvpAxF0kbxReMS2XszdXx/3uhNRLu8yWxxt+qSIbQubK4dV5BJ8x/5sESRq1GdL
	PkDkiPhtuYsnUxgmEAN9WAn+eqMx0Vnlg73DEoc0DWVQTzTozju+RY1jaJ8C7RCmYsNCDypJcS4
	C2vQd6Beb4lG2cyCJOdIr19skKmt5hiKSlmN4hN8MjhjBhBs+N2+ZWOaGy6pwweC1qe4KEL8ws4
	yiBn1x3umUc8z6tMdaI3Gzrkadni6ShgBBWC29UFaFPW0Oe4jzAtsHloqaImp
X-Google-Smtp-Source: AGHT+IFyFVL0Kb/BSlAvbUry3uvInzXibervudcYS3XQ4qSib8sGFhFJvRT2skhhpKZh27wEsN2r+A==
X-Received: by 2002:a05:6122:c81:b0:544:7057:a812 with SMTP id 71dfb90a1353d-54a16b7e208mr3821952e0c.3.1757938077013;
        Mon, 15 Sep 2025 05:07:57 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a0d1bc289sm2220414e0c.4.2025.09.15.05.07.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 05:07:56 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5299769c79cso2995320137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Sep 2025 05:07:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXr/VxF/NFBBaSel5HDY+QZUTDeLOPV9ghhxho7H/a+80rNsR/I1mOWNoUVYvd1HVRz+sRUjGy4FQ0jNB8doHdaGQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3589:b0:533:44d4:d624 with SMTP id
 ada2fe7eead31-55609c313b4mr5030595137.8.1757938076242; Mon, 15 Sep 2025
 05:07:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912104733.173281-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250912104733.173281-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Sep 2025 14:07:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXx88-3j6Gu_ZK6tRV=RWu+T_yETaNEMw=rviRsNM7u6g@mail.gmail.com>
X-Gm-Features: AS18NWCFmQom8EOHzoQl-rBXwlbJequ1oD-bXcXBziRkWkdhHqMf1HNZ0ce-n8w
Message-ID: <CAMuHMdXx88-3j6Gu_ZK6tRV=RWu+T_yETaNEMw=rviRsNM7u6g@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] Add suspend/resume support
To: Biju <biju.das.au@gmail.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-can@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 12 Sept 2025 at 12:47, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> This patch series adds proper suspend/resume support to the Renesas
> R-Car CAN-FD controller driver, after the customary cleanuops and fixes.
> It aims to fix CAN-FD operation after resume from s2ram on systems where
> PSCI powers down the SoC.
>
> This patch series has been tested on RZ/G3E SMARC EVK, Ebisu-4D (R-Car E3)
> and White Hawk (R-Car V4H).
>
> v1->v2:
>  * Added logs from RZ/G3E
>  * Collected tags.
>  * Moved enabling of RAM clk from probe().
>  * Added RAM clk handling in rcar_canfd_global_{,de}init().
>  * Fixed the typo in error path of rcar_canfd_resume().

Thanks for updating!

This series behaves the same as v1 on Ebisu-4D (R-Car E3) and White
Hawk (R-Car V4H).  However, that means the small regression I mentioned
before [1] is still present:

   "While this fixes CAN-FD after resume from s2ram on R-Car E3 (Ebisu-4D),
    it does introduce a regression on R-Car V4H (White Hawk): after resume
    from s2idle (White Hawk does not support s2ram), CAN frames sent by
    other devices are no longer received, and the other side sometimes
    reports a "bus-off"."

Note that I did my testing between CAN-FD channel 0 on Ebisu, and
CAN-FD channel 3 on White-Hawk.

I retried with wiring between CAN-FD channel 0 and 1 on White-Hawk,
and with that configuration, CAN-FD still works after s2idle.

   "However, the underlying issue is pre-existing, and can be reproduced
    without this patch: the CAN-FD controller fails in the same way after
    driver unbind/rebind.  So something must be missing in the
    (de)initialization sequence for the R-Car Gen4 CAN-FD register layout.
    Note that it keeps on working after ifdown/ifup, which does not
    reinitialize the full controller."

Same here: CAN-FD channel 0 and 1 on White-Hawk keep on working after
unbind/rebind, unlike channel 3.  So it looks like we have an issue
again with handling channels 2 and higher...

[1] https://lore.kernel.org/all/f9198ea3be46f1eb2e27d046e51293df7fb67f46.1755855779.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

