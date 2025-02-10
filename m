Return-Path: <linux-renesas-soc+bounces-12999-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2389A2EF2F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 15:06:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 014267A1577
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 14:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A835F231A40;
	Mon, 10 Feb 2025 14:06:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A7821C9E0;
	Mon, 10 Feb 2025 14:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739196406; cv=none; b=PPcdXzviVVANYEkcb9vYvFB6DUsy+KkXwUUx04bVM1MtsNgWKB3hlSc2qtHdEbxK88PTc25AqRIM6qqA05IDL9U6ibArzkz88xScQKspFf1FTZQXLNtfJajoVJdHQKf23ZaevFQuOHPwE0+0Zc7xgZD2+yqZUDajuy8Byz0GZus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739196406; c=relaxed/simple;
	bh=s/SxefOb0H15AdMHQedNI/+EiassRRLisDihao+TjBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eW51xcGCSaHYQcOzST4hT78se4E2LnnvnVmAELC69FsLUK9i+f2MIs1uSLJb52TvZl6YYBJaiq6vJoeBDHF1+GEXmRttcth6gQg84rdU+sTfio3sRGLx8nbQUkLzMYoxfKfPCkz3YMn0sQdQ6JNHGMeZeOUDERoqVdmF7PUG1h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-86707fe3eccso1975327241.0;
        Mon, 10 Feb 2025 06:06:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739196403; x=1739801203;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W6kDmgOXvSCpquS8DR4mGKaDibtph7+ZMfxSIa+WafI=;
        b=smf8qhtWvm1/SfJWPtCyq9qY+cbVAOD+MzC+REuNsSXuBgRp0LPiQ2dmv1K95QwOTA
         3KxpXlXUEo7V7NKNnYToGOTI9BHn0Am8ZyVX/G/RcjAKYHeLEoa9t12+YIDC/IdqxrZn
         upFGH7nc1B2Z/G4J1Jc96hYqriD81ki1iXLYdXgTsc5GMwp+gTICvn/eBAJR6h19BiBI
         4h/6RATDokY20/aaQVi4n1Q3cbAYngZDsVtXaE27rPd9WR5GbdAQbc21P6In12zvx2sM
         pY8IL35ywLkyVij/CbxqrjtkwrHzYqFt4puhKYjto/TwGQBDKiT284g04XJDRse+BMmS
         ntlw==
X-Forwarded-Encrypted: i=1; AJvYcCVa2A5LyZ43U8KcKo72wnQOFSA5LKsANEZ1TrQpqtcp9B1V651OV4DDFZeVnqeVKPyWXj3Qp0oXMpfy5ust@vger.kernel.org, AJvYcCW1Aj2OqoMavwZjwf3P4IAV8ArRcFqlB0cQZvOhW0DBoAtvfajzHsX6EQCUxTwSdeUYyQRT7NEVj1Dh73NaGedb7RI=@vger.kernel.org, AJvYcCWbLTU1NiXF1FbEGkmEBW9CrpNuZwU4o0IbOqrtxcdXqAizd7MWe1J6PeqFKnN2ZkKTF4m9Ev3mIfs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzE+OpTGQZq/h+yORuWII5mUw2dlntoFoYpRQScv0QXqq/Jtx6o
	Ysk0olYw0M0EcggZuM/UxJ8KHOussRuLFCfPs6RGf2V4eoNh5phNsO7z4gHu
X-Gm-Gg: ASbGncsO9T6K1Wjx+1FHGe/6PF1lTZfupdyPqkEv8tWApf/n8ykfhlYyfOvudjX8Y4U
	TE0cYCHoFM+7o/HY5uifJIfqlsQPw+QTsx+lF7T8PQxj8Fvw6d3pTi1Qz2nsdN1aO+kYCyWlOw3
	zfduZwy16oFUHR84PvMOB0Ar9WaK9/+2rm+f8zfLjgNjwP+c2seVCGIXfGzW6XwXX62PAMKSV/O
	RHRD5J+1MTRQtOnl3lZoqDkQjhLG5aFUf1I79O2RTA0juy84hWwA+xKA7rFcQMbK87Fv0O552TG
	3Wqa9m+zpdB7yUMIyx3GJzPqSvIvq/ueOvcfkpzxJj0bZgTp56fl0QHXqg==
X-Google-Smtp-Source: AGHT+IE+4XSQ2aR0FjRorBL+9LH2mQxQzUkHI3/2oMG3atZU/FeaJxfnMLyvVb4pPDBxqfaiMvHY/A==
X-Received: by 2002:a05:6122:17a0:b0:520:3aea:e55d with SMTP id 71dfb90a1353d-5203aeae7d8mr2920965e0c.5.1739196402013;
        Mon, 10 Feb 2025 06:06:42 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5204e43616esm133891e0c.21.2025.02.10.06.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 06:06:41 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-52043dec766so600990e0c.1;
        Mon, 10 Feb 2025 06:06:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCULYTzDSetat2ZwQ+qSp9UE5cqPcWe0RpyBsCGyMsDb/Pvk2r2whtoBUQ+pdBCvuWmTZCJxf/9Locx2GNZT@vger.kernel.org, AJvYcCV/8nU8tgJ3d/Ay25XxRo8eBsLICZ0xSzq0Ys1MfqIMnSMtg6I801GXBjS9s+f3z8EDWd/gZrfY8B4=@vger.kernel.org, AJvYcCWDkb1zgnJXuvY8SvS0UZEaDdQiNF0amfFk1jjOPbuc+pcYInSA2PIyZOjk3hBMGe8J/E5eXf3Psu3Vtlsy3yYthso=@vger.kernel.org
X-Received: by 2002:a05:6122:11ad:b0:520:5267:819c with SMTP id
 71dfb90a1353d-5205267840emr509770e0c.1.1739196400794; Mon, 10 Feb 2025
 06:06:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com> <20250129165122.2980-7-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250129165122.2980-7-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Feb 2025 15:06:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVUhXQ80DRbr7yFNgzmGMuDEuScZZhKihhtee1U4qP3UA@mail.gmail.com>
X-Gm-Features: AWEUYZnxtULZ_SWBBZBuFBwb88yi1TbL8Xe3rYQd7YgpyPS1Ki3tGXTD_QAkkWk
Message-ID: <CAMuHMdVUhXQ80DRbr7yFNgzmGMuDEuScZZhKihhtee1U4qP3UA@mail.gmail.com>
Subject: Re: [PATCH 06/14] clk: renesas: Add support for RZ/T2H family clock
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Wed, 29 Jan 2025 at 17:52, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> Add the CPG driver for T2H family.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/clk/renesas/rzt2h-cpg.c
> @@ -0,0 +1,549 @@

> +static void __init
> +rzt2h_cpg_register_mod_clk(const struct rzt2h_mod_clk *mod,
> +                          const struct rzt2h_cpg_info *info,
> +                          struct rzt2h_cpg_priv *priv)
> +{
> +       struct mstp_clock *clock = NULL;
> +       struct device *dev = priv->dev;
> +       unsigned int id = mod->id;
> +       struct clk_init_data init;
> +       struct clk *parent, *clk;
> +       const char *parent_name;
> +       unsigned int i;
> +
> +       WARN_DEBUG(id < priv->num_core_clks);
> +       WARN_DEBUG(id >= priv->num_core_clks + priv->num_mod_clks);
> +       WARN_DEBUG(mod->parent >= priv->num_core_clks + priv->num_mod_clks);
> +       WARN_DEBUG(PTR_ERR(priv->clks[id]) != -ENOENT);
> +
> +       /* Skip NULLified clock */
> +       if (!mod->name)
> +               return;

Copied from rzg2l-cpg.c (which copied from renesas-cpg-mssr.c)?
Do you need this?

Given RZ/T2 does not use the "write bit 16 + n when touching bit
n"-scheme (like RZ/G2L and RZ/V2H), I am wondering if it would be easier
to use renesas-cpg-mssr.c instead, like R-Car and RZ/A2M are doing?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

