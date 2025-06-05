Return-Path: <linux-renesas-soc+bounces-17866-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C17ACECDE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Jun 2025 11:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C65A188D423
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Jun 2025 09:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C3920E00B;
	Thu,  5 Jun 2025 09:34:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2253E20B22;
	Thu,  5 Jun 2025 09:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749116078; cv=none; b=JlF4l9DiDKjg80nSh7scrFtrBJt3uhvASWtDGBmdDphs0xw+FsU/Js1IIHMLGVeCOX3+bRZ/wibEjunYHz1FQdcBsyuKIsq11Z3RjvzMXv2ZhiUKiLV77ZU6OelEQsSA3FO22CgPBw+XTMAZDktvdyd+DnCMDcl9ZzMvUBETjOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749116078; c=relaxed/simple;
	bh=MH5roPI22qnR408oGm8y3KqH1pcqcUMgeK8Gsb9GBf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JGmLAqVQSjtaIw4aqwquL2ytiAnlvSfqmy6evlbuOiNol5//DJuQvfLiwrJdlN67atBOdVl1lAXLuSuzLji9gATII5kVhXd9YFW4vmh34NrNqUVplKXKIHy7VfoGzCNZLCpfiFbbNsL2X9d9YywFvIgc65hDRzvs7VrWIApMesk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-52e728960c3so294520e0c.2;
        Thu, 05 Jun 2025 02:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749116075; x=1749720875;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J0zf2R/bnXxTO3wCSK6UDk12klzUuud9Pxof5jEbzh0=;
        b=KrOIZv598ucvMPkztyw/hGdL8r8tCctSPMMWZKRdDDc+nV2mPLQPCo5eHOLvcSnUEJ
         eDqKJbL+tYgadfV8B3fV6YrUnKNLQ+KkOsNpZP+bU1SauXrmhNvSi9tMKOp0536RNKrs
         9iknNZgHDBEQ5SXFIVm+BXEbnbDnLoEuztlsM/KfB01d84g2Pk48jzPzsRA4rTsymH8B
         KUguipvT/ii0unW2D9sv1tr+uz52eY1MYtg843zvFlpjqfUUcy+Lb6/IPEzJChMhSqvN
         FvSqXvEBiMgNMq4oiXB7hwHLc8fsYgddDgnlJg8oVSV/KdUFjHUh6FJ2Q3o+pWlUfAi9
         zM+g==
X-Forwarded-Encrypted: i=1; AJvYcCUSHJiJv2brKUISC9oFf7iniGmwPC6TAJg0WTbfeH6edoaiQHYz9Pw8aAlzsITF7sJNDqk6K8EemQwaqtimvv0XG3U=@vger.kernel.org, AJvYcCVR9M6UlKhUfR2oUbkBzGpSKKHFJiJz6ltdjAS5/Qidi2WgxM5ufusvgHWgHonzLcoZhYkUgVNkw3jq@vger.kernel.org, AJvYcCVfSJvbx1tnHhijOsjAGopkM6Z2mw2ExG6kuEVaCZFrpDpBZYOe5bEZHqoZRW+cOI/pJhFRDV/MLr0u@vger.kernel.org, AJvYcCWwIFihU75fgg0ILT3uMKAaUpxaCBZm0giW5mCL0WUu+olgZzzbFSkReRJ23+4ngHx3Ugfuz1EEkkeLn2Pg@vger.kernel.org
X-Gm-Message-State: AOJu0YzwPs8jRR0fwCjbhI/kw2BbtVl4vthcLfvM6wkUdGVXKpMdbkAh
	mLBMNkQYnu5jS7oA+Zw/fEDeRAczp7vO6bIyE6Zuw7LYDAl14nSz+WovtXr3fdQP+Jg=
X-Gm-Gg: ASbGnct/b8R4/zURf+HGPFJZLWsDY5xHRiQf+dxWoTzLVvAm2HUTUqFDi7b9xQBLkUS
	pSMaFpE6L5BKY+Sd3oZT3rL5H6srKmxPvbTiqnPsikTO9oMQUfovtKY8PO4Bz1VlcPh6DmaRZ+z
	dGDY2TTs9N6W2I031YpqqMrlb6eFrPHmRXLJcdC7DNzKkAnyFKzXgwGBseS1Q6Lqw/+mUOOlaU6
	PsQ3CExqwnFf1Z31JCU2MCVGvxoL0bhwE8CZH9j1Wcj5Yv3FRYjeWVIcrlXYXaGhopRmwv0vscQ
	3WwT5KbOEte8X9YHro2zhIE+bgizON27/a8js5GwgozYK8BSMq5hNsFYrM2x/R8aTBY86aDuTnL
	HQErSFWzMza9/aeoWrMWPvkCO
X-Google-Smtp-Source: AGHT+IF2J6N2DWonSPvqvoq9LselmjQEpZ6xPyDzXxU5VyvWVoqwcbWmjNkExkRPUkyW1P6uonQumQ==
X-Received: by 2002:a05:6122:30a2:b0:52f:4680:1c89 with SMTP id 71dfb90a1353d-530c734132amr5152495e0c.7.1749116075629;
        Thu, 05 Jun 2025 02:34:35 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87e2a3b7d76sm10499454241.32.2025.06.05.02.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 02:34:35 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4e6fc4b2cd3so252343137.2;
        Thu, 05 Jun 2025 02:34:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWjGZWdz0HqNvkKpNNwhlFBYjulN8gTPoy0rzVeG3TVGdPOU4fUZ9BQU1GEq7vgkDcJk3eymEHqQ7VP@vger.kernel.org, AJvYcCWxEkI/EJ0a3J78NhoT2Y7RuSnnxNVfsF82m13LxhehGCkJtL6X6gjuVbcAVNyy3XWeFkmjBsUdfeJB1hxFHD7PGQI=@vger.kernel.org, AJvYcCXM/en3tJmJGK8xnr9WSNzM7l4xHJ7EVZrPGa/wy3yY5hnJL2qMm9CCKQd2o8oPJR510eLJeEJFscavOad/@vger.kernel.org, AJvYcCXTYEej4Iodtr8lBZsMAXgeW1XYw0ftawXrY9omwGDpBi2FZIUcNQbB+FsqvrGf8T3kNvklG0dKEd8L@vger.kernel.org
X-Received: by 2002:a05:6102:5548:b0:4e6:f7e9:c4a5 with SMTP id
 ada2fe7eead31-4e746e4d64bmr4826394137.22.1749116075253; Thu, 05 Jun 2025
 02:34:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527112403.1254122-1-claudiu.beznea.uj@bp.renesas.com> <20250527112403.1254122-4-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250527112403.1254122-4-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Jun 2025 11:34:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVHyDNUPP_7yRKRDK73Ag1LWeXGapAuJHx8AaFbV7nw9g@mail.gmail.com>
X-Gm-Features: AX0GCFv-ZDW14qUoSeuEh1rRoxKpFcaA8nXSNFp621Or6hcLcvOr-E3DQbTCvdg
Message-ID: <CAMuHMdVHyDNUPP_7yRKRDK73Ag1LWeXGapAuJHx8AaFbV7nw9g@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] clk: renesas: rzg2l-cpg: Add macro to loop through
 module clocks
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 May 2025 at 13:24, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add a macro to iterate over the module clocks array. This will be useful
> in the upcoming commits that move MSTOP support into the clock
> enable/disable APIs.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v3:
> - collected tags
> - s/for_each_mstp_clk/for_each_mod_clock/g to align with the
>   review comments and the discussion here:
>   https://lore.kernel.org/all/cb0d43138aa443578dcfdaab146bf9215cde9408.1747927483.git.geert+renesas@glider.be

Thanks, will update the commit queued in renesas-clk for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

