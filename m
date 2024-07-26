Return-Path: <linux-renesas-soc+bounces-7559-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D69D093D5B4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 17:10:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13A0B1C2031B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 15:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021201F95E;
	Fri, 26 Jul 2024 15:10:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB141EA6F;
	Fri, 26 Jul 2024 15:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722006605; cv=none; b=JGdQyUmpR2DaovP7O6FSqE1tdt/oGdzv3ZhOtCD93yBsjy5kccjGN2c7hMAAWqdeHsC7k1wE1WhvRaiEhiK05kJO8Vg/amI2l6V3KRslH5VPI+yUkABh28DdSwOPhpaV/nNIl+0jZNxEsRULLZ4hKh2Y7NQ/eZph8gNZqzPo0AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722006605; c=relaxed/simple;
	bh=lbj7+/EBYhSUTgiIfynocRVBV5Tyfr3JqTeNfACTxtc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HDGtlrTjxriQhCMKaIUO+p82WMVdnP2ZMpf/NQpqbjIc80xqiq7jmD3q3VDuARQMFaCVD0HUXuQdnXHwrEPS11l9BHvN24EYqHgkyQy8vlyT5CazxxqcgDdLzWvR+RZrbzTq+uLAeI+iyyzcv/SLAXhkm5v+1GAT6biO9cFWAsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6512866fa87so21618547b3.2;
        Fri, 26 Jul 2024 08:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722006602; x=1722611402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6NPObEJcy4MbaYeuqnmDPLpIdxEgAN/QMYLotXg1FKQ=;
        b=pOKuJ2t+EJzb/HRXO8wPM7mrdHKoQv1NnbNfsDBg/GqGRSDALTSFdKKBtsO71e9jwc
         zSoZU5EL7TlwH7IkMgCJQmlNA0CEQPVGg2yb1yKar8iOnKFrBZScrgpCd4tcBCLkJth8
         MH4wu8XjdIm+LUczGz+osRyVH8t3DNao8ThHS3cuB8uO5Lkepfs3VOVRtxBdeq7LETnF
         79J1WuV8/bE43LmHDlQP/hDCayO+KEHanX6yBBu5CUgNxsJHFofLXIcTHhaoPTDEYNbG
         78Wgc18qDqS/5BQfYRW/7b8z1pk3jGOTHi7bn7TQhXTGSaIZB3cHHrEgxbE/dUGW8cIf
         YL8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjKpGEWj/TZT+CcKP+LQd43PL4WodSxqPuauSX/18T7cp57sK7Wq2cFpMpOEZmkmwAHpzY5b9XZNbY98cHV6/6vPNVt6CIk2+KHkFULcXf3pX5mrAT/G8lCptCVlmFP4vn/C6xvpu5C1PqL3pykPnJfXPu1+dCd+Joq+jrfuVhHN/g3iNVdbbqCdA=
X-Gm-Message-State: AOJu0YwlPsrWaWv4nsuzlq1GOhSoT7vnXK/BsE3aAMaZ6iy8yB4aiBfQ
	hqNy26RuvXplC8gXm91zWE+SXuusNK0hwNsQSBkJvlprIrAmxcLW7nBK9KDmF8Y=
X-Google-Smtp-Source: AGHT+IGRgTS6NfIbHWyf2TEZQIusREDCPpG5LTGPaH+l2dXC6HiI5/9KWK7c1PZ2N330tBPY35/RPw==
X-Received: by 2002:a81:9e14:0:b0:651:6888:9fee with SMTP id 00721157ae682-67a0653ec57mr956467b3.18.1722006602550;
        Fri, 26 Jul 2024 08:10:02 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6756bc9ec42sm9231807b3.115.2024.07.26.08.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jul 2024 08:10:02 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-65fe1239f12so19325007b3.0;
        Fri, 26 Jul 2024 08:10:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+Jnb5SImmRPS3NvYHnzekh2fRfgEzy/P7Yau0h//DX3LKNOFzvvI3dcRhOVI5gANayVNawq/iAPT90hTNLACKtxtWdEcLf4/9Wd1sCyB2rJ4EyXdVQ7IKuxgwE0qT3ihFLKHTYF8IGTwOTmWCKv6xEzGOOAb30eXocALK7fDTjU9Psi5B2u61wwA=
X-Received: by 2002:a05:690c:4a09:b0:64a:5443:7cba with SMTP id
 00721157ae682-67a090a645amr979837b3.31.1722006601729; Fri, 26 Jul 2024
 08:10:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715103555.507767-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240715103555.507767-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240715103555.507767-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Jul 2024 17:09:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXUWqtPwKV1-yqogJ8K552fHgveZRHh0W9Xqh37J3FbKA@mail.gmail.com>
Message-ID: <CAMuHMdXUWqtPwKV1-yqogJ8K552fHgveZRHh0W9Xqh37J3FbKA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: renesas: rzg2l-cpg: Refactor to use priv for
 clks and base in clock register functions
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2024 at 12:37=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Simplify the `rzg2l-cpg` driver by removing explicit passing of `clks` an=
d
> `base` parameters in various clock registration functions. These values
> are now accessed directly from the `priv` structure.
>
> While at it, drop masking of parent clocks with 0xffff as nothing is ever
> stored in the high bits.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - Squashed patches (2,3,4)/4 into single patch
> - Dropped masking of parent clock with 0xffff
> - Dropped creating local variable clks

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.12.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

