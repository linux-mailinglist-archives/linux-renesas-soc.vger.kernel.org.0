Return-Path: <linux-renesas-soc+bounces-17036-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE70FAB5277
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 12:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80CF1162F11
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 10:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 671DE242D83;
	Tue, 13 May 2025 10:10:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD3D242936;
	Tue, 13 May 2025 10:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747131017; cv=none; b=rnTHR9GKnpMIByo7olYIBQgpOgMurtCcR2oZ47hEqkzZRk9GTMm1LFZ5OW4O0H9tfYTBtRmyRV8Pa3orEP5H6WoPnvYTW7GWar45QDAd+QPnJRN3C9Y2f8TPaDardphQddbaPM3fF+FbVyRe7KxVIBSsafqvmtue80Eku1GFNCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747131017; c=relaxed/simple;
	bh=odXP4jacTJrgnDY+LG3HYYqyaDF6mb6R1oBRuN2esec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dqFA5NroknW2EWLa1dhX6J79e+xpM/ctH7RkWW0LsPHI1JBj5bgvz9uhsgswQHjjcZOptOMqtZRw5hwGAfb8z89x0B/9VB+jyglgfuT6axAs5+gmqTxeg62AHsYFgvll+uLQ/JVh9XM16SsngPRjKVfrAdQOf1bSqrS4DLgCGB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-8783b2cbce3so1365225241.3;
        Tue, 13 May 2025 03:10:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747131013; x=1747735813;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tEHsGcgeFxHmqxM+gq4Bvi2pObgGCXu9Z6FvaGC39Dk=;
        b=jTygksAEPrzQx/YCJ/H9qIlRrRtnR6m1LoKQ+AGheeRfDI7SaUUVihEjuTT+5aeTps
         ModP8JToBfD1U29wZeDxgDB/pwNC3ecLcrk0HyIn1W+DW3cE2+rKhUo33iSZ0lFOI0+I
         9YUm0lc8/0PJkDgXYx1DIsh/0N+B7mGX2r2FMPZMLRmuTeJ3gw/cqfqWdA/W4YV4pxwk
         6rDteTbx3t7qBopdPWshU07FXk2DkiD1Ty673eyfZNBn3XQ8Cb/jA7/w9Fz4muVtm60E
         4cMnhOSVw9AS9glddmTWURT0DzqzME0ckDOaFH3P1ubsGmygd+V9t//aVZ93VJRZmU31
         2ZZg==
X-Forwarded-Encrypted: i=1; AJvYcCVOxVom+EY3YqfLeQlv6VxIYiff/5J5PwAYyQI6pVSc0DQGEFnVF1P7QHj1lbuG0GMTCpwKmqceyc+8nWnZ@vger.kernel.org, AJvYcCWcsLZFC8VFHiABWs5qOZ+/QvXHbn+m0NNUiWUfXQ0nSu0NNUcfB0LeO/kCfo67YVm99aUDpnTJDe8=@vger.kernel.org, AJvYcCXlLt+xGkvuZYxR7wkGY83+v17gXr0McplqhWi6+b2k7LN5ScIPzK69IQ2ywe/9rCOS1levC3rNru46RVk4lkCO5Yg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhytHkLfu5yJx6HMF2OGs8d74JGy5z0qaDXagDRV3ZWZtp5yBq
	UnzFR0GOXIcBciayXrurTPJKmbGVS18Vw3VnOC58o1c9ulD+ex742esTPIWt
X-Gm-Gg: ASbGncu5H2vmjkrWRWjF0in9P0Dr9tq9cKrXRr24GDmam8f2NE7rO7fZpm/Bz3r8OFK
	FN0uFAQOFpZQFQOzBgV9icpJwpcrBugx2SlYAoALtnMopokydUSvfQ8bld3/mTIzU8LNlBQgHQH
	rz2eSVggOYxEFSWdKRsZlD3FQ0almKpS0kkJ6mFlkzb+DgNOW5U7q56jD19fhse9s0jxVc5sJzh
	lyPj0rR7XdTIC8tpvsHB7dNN/ecYxoO+AUvsVpKW9T08iLF2oYOS5nXi5KU0TJDvgdC4Lb3cwtQ
	/GEM3g93GCmkDEomYQQRvSomZAK6Renwjhtm0F9hvctVrcYYUaJAJ52/XMAAW8tjcKic8sqd55g
	3ezUKAu7Zfq3EVV8cART7Cae9
X-Google-Smtp-Source: AGHT+IHJv1mh4oudJFanXJU1gxkDANo2RFbl2+zEVadvk4HeoSMT37LVvSWOChbr2HwzIDWnEv8o6Q==
X-Received: by 2002:a05:6102:4bc4:b0:4bb:eb4a:f9ef with SMTP id ada2fe7eead31-4deed30e605mr12767743137.4.1747131013548;
        Tue, 13 May 2025 03:10:13 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f61701d1sm6470534241.11.2025.05.13.03.10.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 03:10:13 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86d5e3ddb66so1632716241.2;
        Tue, 13 May 2025 03:10:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUgVaUBg1in+BVwitz6I37cxu5QoBNz31vN8miwtcniWZF3KWGo1ILPiTKWEydoxnDW9YU4qmzPDgT0f5oJET9Nhnk=@vger.kernel.org, AJvYcCWGW9VP6GDts0JVeOMl0xWAau70wze5VIE7b0AA90bb1xjSUyU+BrOOcMFMNL/lhe1+rKhygCACYWJ2UW7B@vger.kernel.org, AJvYcCXt4t04U+v84COjeWR8wsEqoWa5mduPm8698z+SVdcxXsYQ9wopra6MJelh2c3BVXRtx0vmbTX6+Ds=@vger.kernel.org
X-Received: by 2002:a05:6102:150e:b0:4c3:6546:5456 with SMTP id
 ada2fe7eead31-4deed30cdb5mr14839665137.3.1747131013029; Tue, 13 May 2025
 03:10:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429081956.3804621-1-thierry.bultel.yh@bp.renesas.com> <20250429081956.3804621-6-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250429081956.3804621-6-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 May 2025 12:10:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVY7dphF7DkC28of=5TQpRt5_vynkL1GssRopj9Yzh_hQ@mail.gmail.com>
X-Gm-Features: AX0GCFsyCgBliMzI4nUjy751X_YHJrFNp-gw04bxtnT-KEGMKnJWXLDv1kgjZbg
Message-ID: <CAMuHMdVY7dphF7DkC28of=5TQpRt5_vynkL1GssRopj9Yzh_hQ@mail.gmail.com>
Subject: Re: [PATCH v8 05/11] clk: renesas: Pass sub struct of cpg_mssr_priv
 to cpg_clk_register
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Apr 2025 at 10:20, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> In a subsequent patch, the registration callback will need more parameters
> from cpg_mssr_priv (like another base address with clock controllers
> with double register block, and also, notifiers and rmw_lock).
> Instead of adding more parameters, move the needed parameters to a public
> sub-struct.
> Instead moving clks to this structure, which would have implied to add
> an allocation (and cleanup) for it, keep the way the allocation is done
> and just have a copy of the pointer in the public structure.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
> Changes v7->v8:
>  - moved struct cpg_mssr_pub pub to the beginning of struct cpg_mssr_priv
>  - make *core & *info fit on the same line
>  - order of doc tags

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

