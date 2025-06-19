Return-Path: <linux-renesas-soc+bounces-18550-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E7CAE0A54
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 17:25:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64BC61BC6788
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 15:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36EA821CA0C;
	Thu, 19 Jun 2025 15:18:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAFC1E7C1C;
	Thu, 19 Jun 2025 15:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750346319; cv=none; b=m3ypafIG1iz9tOUHEVGB9Ffb4aYRDxMUvzKKVGLkRIhtsAv7JvTISBoAAAXphe+H46+4fn6+gYYhSst4ppXkm9t92s2IzOI8eX3I3wetVQTHPq7VQCvcPpMvCaOjwiKGtgyPAnyhofev6/Vkd4ZCMyaPwCxZ74cO5/LgVgoLqjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750346319; c=relaxed/simple;
	bh=K4IW7lIWUtY1zhTIjB5bkTIRaAcQkc6anbd+fGlCOKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oteLr/l7S7CU1DvEoYtZ0EF4j7FmGTFfmDrPp+gq093sWYK+JH0rNeC3zHFEg2PeqdAB+g9Yq0rOKHKPYDdW2UWAlAQAWdYRlZKlKSqv0zMoTrCF3wEqaSpl4wSuaBo+6MOip6I5TmP1VmRUNbeAndLNRr7QCKraJLnd6/InsdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5240764f7c1so252354e0c.2;
        Thu, 19 Jun 2025 08:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750346316; x=1750951116;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zq+Bu7p8VD5rmQ2GOexpoCup2qgcNpurLbPBEm0RDxc=;
        b=EMZIQa6diRuGZwzHrmP5fK8mAmntIk5ZXMVqporVfclAbtNgJfJoa9C1Kex/k1EqaG
         rGp01OI1drByWC5yWUZP5lEJomnXZJtViq1NUhUlyUQJPNCBItMd8abb/bEkQz+jgw9z
         FiKd2GEeyu8YDD70Ao2fYKAXx5eYd88EUZ/w7cVJdxsiJ65cxvrxsT8btryNCNikX2U8
         VaBnpFz/kIiBNf0TUmDFknNY7d23CZM591dy/LOvJaSf7rXNsVD3T2WAINfjcM6955SG
         M7QzxsNTYTC1kroSo0vlmCGAgqZdJT7Bj+sXntRf42q7exvL+JVhFkWtXVLcap8+54r+
         ocEQ==
X-Forwarded-Encrypted: i=1; AJvYcCULV8JJ03IJeUoTs9+zU/xcLr80+XiyQEjiwmtlKisHdn2sON9R//FDWd4ePGrANOs8TjrXDL5uK+Bex3PlYO6ApyY=@vger.kernel.org, AJvYcCV6k8uTQSI8Zzr5nguvIQmAv8Gj7dEXsof/mCtw8TjU9EykOdOCXgq50vvk6QiYe3ypz4WPEz5LbIPy@vger.kernel.org, AJvYcCW/n8DPjPcjzTywq+XCbS2OgvNQUdBZL+4MrD08txDbXGD8ipXUJEUOrrT0WoSSYtImXEkQ1g0MUwRX@vger.kernel.org, AJvYcCXK8Y16RVZVstfwGuiAaPAQLhkAOjiXzLVWYi6W/Bxcey1mRra/vV2A2TZmDzFMK4zr95ONLeDemR+hbire@vger.kernel.org
X-Gm-Message-State: AOJu0YzYGo81MrTsS7qPqJ9u/4Y2X0lhxF+8duI+mNrUqaIN2nt4JfbJ
	unrcqI3gqVruRo2/hgOwuaBG4C/v/8RaIFKM927GUDuxBPOggYPevSZYUQ6u7A/Q
X-Gm-Gg: ASbGncurOs/o+ERavPB+gVhc5pnNqfcWaAlmjygTMw5W98gGdT6tmXGo3Jns/1Y44Ki
	sVlTN3j7HggpvGS+Yzd04hq9yKX60c4/V/krN46+3+daRWASF0qniKfD5QqalwCp2EvGOc6AYot
	in/T/jA8Dcxl9+xaZ3VNvNzhBFGb7dtdnt26UXYhlKoIrFzEppmDl301si+E7K9qymUHFH5UfPv
	Evz76wjlLAxXPqGKI3UZSKvtgQo/033e8zMRhTKw+zZCMg+jhEhgvl2Ox1dHhOHrI/SsyXLFNhs
	0T44tgFquIC96KvRtauATRUt4bn+E6+NxUQ3VUC6E8xaEm2OWVusHXHruGEavhU6KGYxpq1GQuQ
	Ol9PLDOYK8fnQPVxQo0pstRycXT9s8Tm3SFA=
X-Google-Smtp-Source: AGHT+IE/UpqRCyxupwfEbVo37wF8mDr/7izWaHfA6UT0e2wz9MI/q9clLni0PGRL8tZQ/JB2HVIkTg==
X-Received: by 2002:a05:6122:547:b0:531:4041:c4c7 with SMTP id 71dfb90a1353d-5314981f572mr16640623e0c.7.1750346315874;
        Thu, 19 Jun 2025 08:18:35 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-531ab2310cfsm26407e0c.15.2025.06.19.08.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 08:18:35 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-87f161d450aso212657241.1;
        Thu, 19 Jun 2025 08:18:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU5sJVp9vJ3hS4jtg/q2HCPYFtJTMaEJ0VhG1nK3F3CVyIfiNupk2Y8ZLnohCOCYq20YlPQd/alKTyOzpQ1iqc2sF8=@vger.kernel.org, AJvYcCUxDKrZgxXk51aYtBU5ITjdAXX2M+bEQuI8ObQWKiTuxazLXdTlrpsbZOpcq0E+nFLmR+QU+KjJnSWm@vger.kernel.org, AJvYcCVNiqOWLXmiG6uld6A8QJNZOGnb0W7J/Cz/bFUvzCHhcF296qVewwbfPsrYWrbQNzAVyKJ2//yaxRah@vger.kernel.org, AJvYcCWyIiwL+OfgHgjgGdCUkDOjiC0k1+EkTVwqXvutVm/bdqc7O8b5kdH4cPDZ+rMdHS2oWSxFRWzpjdt5lNqO@vger.kernel.org
X-Received: by 2002:a05:6102:6a96:b0:4e7:dbd2:4604 with SMTP id
 ada2fe7eead31-4e7f620ae73mr16336682137.17.1750346314956; Thu, 19 Jun 2025
 08:18:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617155757.149597-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250617155757.149597-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250617155757.149597-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Jun 2025 17:18:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVW0wVg8bYPLPkRAfvYoUm_nBVJ86+4TbUKYtnT+j19nw@mail.gmail.com>
X-Gm-Features: Ac12FXykvMV5fAMK60vjAJWfhOeH-LLAsNZLNzvil4HnLbBgThTsrUwS5IldEl4
Message-ID: <CAMuHMdVW0wVg8bYPLPkRAfvYoUm_nBVJ86+4TbUKYtnT+j19nw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] clk: renesas: Add CPG/MSSR support to RZ/N2H SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Jun 2025 at 17:58, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clock driver support for the Renesas RZ/N2H (R9A09G087) SoC by reusing
> the existing RZ/T2H (R9A09G077) CPG/MSSR implementation, as both SoCs
> share the same clock and reset architecture.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
> - Updated commit message
> - Added reviewed-by tags

Thanks, will queue in renesas-clk for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

