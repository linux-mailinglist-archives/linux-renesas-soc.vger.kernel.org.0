Return-Path: <linux-renesas-soc+bounces-23841-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A61C19E32
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 11:55:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE09A3BBAE6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 10:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A45020C490;
	Wed, 29 Oct 2025 10:46:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5263D23D7D4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 10:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761734795; cv=none; b=cDUn3vaYJDIYXkHVy9uixTfC69FUt/qKhUnxNl+GqDpRYNBiFab9LEW2f8+qVJNPZPFhAZmpypn+08pBTf9L8hNBh+HgJvqZ15sqR8/GZAGXxUl4VJqnBnk7ECxKRGQIwzlq5xbZKXeFfslwS7vNPaD+NWyYL0U/ZTw/D1APCoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761734795; c=relaxed/simple;
	bh=QRKyYZwoNqbIuY6dZzEyJOYSSQzD9+AkrFNc9FdpohI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u0Zs4eCShgkp1ayUsFbHWuEphlirgVLGmOLnFPqgsATSNJCu+3HeEM7BocGNz/vyK+c+fs95fPev2X7RwVYGvkSikjHT43GQXdlLxKnK5ncGA0yJkf/og6ICD+m1bL4SaXQbyrdGr1eL3WSkCzKZGJAhKCcTyE02eIuF3Z2j+Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-59a8c1eb90cso4203739137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 03:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761734792; x=1762339592;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+eA6u7QQ5nlSe+lHdfS7BYGXAj5XGFi12G5/HOmEAPE=;
        b=YudwSLdKWI7iTD689KCGaWkVkfjDLn5xtYo70fCgDr+3wv75NbLWWyJKcH2YFteu3O
         lOAjLQlSh+umpyVgS0uNLUqSKXyXF68n61QVDoIaBcAR981oHBCQk71WMkwkCtHYvoKM
         siZf6b83QgoZ8gAWxpfZU6siTdfbnFPA9a6Bm+nAVuRAKcsRq8ZlelWZsRvHrGGo7LJU
         7nimFl2otOHTr3GJHSx2DNS70Lx+K97fcRcmPCb1qfGGn5g1PuK8xc651z9ta6n1d3d3
         nwbgetP72MQxaFX6t2EQAbvMcz6bsFKXD4RVHCiYrxXcUPUXrMS+V8MTzLZKhjraLRom
         DkgA==
X-Forwarded-Encrypted: i=1; AJvYcCU2ketTU/OeeJa0fde3RFRKDktQxCCQijpKXi3hSzHeq8MiF5N3ZYsgVzJyAbg6BkIA1b2tunxuAz7JJYLUAVJq5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxL0o13/LoXZsqgqq0ClJ+uG4aEQSnap9LQr5fgomHyW0ONQphu
	wXVUTQboim+WskkbVSAU6nwnr9vVv/DS9r9g/qznOkm52eQ8Aiib9N1IdkgaBIon
X-Gm-Gg: ASbGncspvChkkD0LtX9qRcxrTlUtmYD/XG1KqLJQPO0mchyGk+kaYH0WRw3mYy98CKy
	hfcQKZySAhOGBftuQdqBII5qh/A/t6nZgwh4QGeazRR7W5Mb/4wfXQHIgcITbOXKjoSyUL1rFO8
	Ko3ZBmGoj1u72bIQgCsjDF1lpWYT8J0SXMabh/+IS82Gc42HsjcF6xofSzTvigINeC6ZTsYXTpQ
	AWL41ycza+cxnexLPAflvtZpQUTgayhvyZOsOP5EI0i06Ws+MZIcBv6/UJY9dnrHL0xb0U+E3wS
	FtcrLNwnojvuFoEYQJMxWlmkUoN3sT6ARK+VGMthjdydfV19Ef7xFKYNR3yy2iT1SXiFNzergSb
	I1cK3QL7MgEPESycOSJdJoKTcGZKAT5zwLu8G36GmMIc8VvYqCnYYZCY2FbJq3kGZZ2R6cnixvN
	Xxy/QRZCMVbDUkrcVFJdQVIE6X6YTeJzS8qeuKgQ==
X-Google-Smtp-Source: AGHT+IHNbLQsl/QjjZjVn8h+8ZnPFaxaPAVoLi1/n9+LXrM1n+cIy0BwZd/5EgjED3iFRwFNpP8ouQ==
X-Received: by 2002:a05:6102:4a81:b0:5d5:f6ae:38c6 with SMTP id ada2fe7eead31-5db906958d2mr622042137.37.1761734791847;
        Wed, 29 Oct 2025 03:46:31 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-934c4098721sm5095457241.12.2025.10.29.03.46.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 03:46:31 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-932c247fb9aso3027694241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 03:46:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUHZcDyCUC0bvXONy/pOf22u33DHPTydpp89uC0EhT9vryhsLV+LcWOacmE3m2oPSqJMCRnQGyVqEaTxUs/knx+Q==@vger.kernel.org
X-Received: by 2002:a05:6102:54a1:b0:59e:68dd:4167 with SMTP id
 ada2fe7eead31-5db905b133amr578976137.7.1761734790615; Wed, 29 Oct 2025
 03:46:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
 <20251005030355.202242-6-marek.vasut+renesas@mailbox.org> <2666bd0f-b2a3-49b4-9458-1b362d9d1b4e@ideasonboard.com>
 <CAMuHMdX0gPyMNF1vwnkEcJRc99MbqXW_5SqSwrdy8BL0Nyugkg@mail.gmail.com> <a8e2a977-0bf7-476c-9a45-da7f38954465@ideasonboard.com>
In-Reply-To: <a8e2a977-0bf7-476c-9a45-da7f38954465@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 11:46:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXnEHrqzKADRq+xhpNK-JiYCBLS0N1P+B-+RBMR9tGa+Q@mail.gmail.com>
X-Gm-Features: AWmQ_bmRNbYYozi5mZ22DqtUw0N0zNJPBRF0Npg62bLaxI5YiS6Pm-IVrlWp3_I
Message-ID: <CAMuHMdXnEHrqzKADRq+xhpNK-JiYCBLS0N1P+B-+RBMR9tGa+Q@mail.gmail.com>
Subject: Re: [PATCH v3 05/11] drm/rcar-du: dsi: Clean up VCLKSET register macros
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, dri-devel@lists.freedesktop.org, 
	David Airlie <airlied@gmail.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tomi,

On Wed, 29 Oct 2025 at 11:37, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> On 29/10/2025 11:57, Geert Uytterhoeven wrote:
> > On Tue, 28 Oct 2025 at 18:15, Tomi Valkeinen
> > <tomi.valkeinen+renesas@ideasonboard.com> wrote:
> >> On 05/10/2025 06:02, Marek Vasut wrote:
> >>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> >>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> >>> @@ -246,14 +246,14 @@
> >>>
> >>>  #define VCLKSET                              0x100c
> >>>  #define VCLKSET_CKEN                 (1 << 16)
> >>> -#define VCLKSET_COLOR_RGB            (0 << 8)
> >>> -#define VCLKSET_COLOR_YCC            (1 << 8)
> >>> +#define VCLKSET_COLOR_YCC            (1 << 8) /* 0:RGB 1:YCbCr */
> >>>  #define VCLKSET_DIV_V3U(x)           (((x) & 0x3) << 4)
> >>>  #define VCLKSET_DIV_V4H(x)           (((x) & 0x7) << 4)
> >>> -#define VCLKSET_BPP_16                       (0 << 2)
> >>> -#define VCLKSET_BPP_18                       (1 << 2)
> >>> -#define VCLKSET_BPP_18L                      (2 << 2)
> >>> -#define VCLKSET_BPP_24                       (3 << 2)
> >>> +#define VCLKSET_BPP_MASK             (3 << 2)
> >>> +#define VCLKSET_BPP_16                       FIELD_PREP(VCLKSET_BPP_MASK, 0)
> >>> +#define VCLKSET_BPP_18                       FIELD_PREP(VCLKSET_BPP_MASK, 1)
> >>> +#define VCLKSET_BPP_18L                      FIELD_PREP(VCLKSET_BPP_MASK, 2)
> >>> +#define VCLKSET_BPP_24                       FIELD_PREP(VCLKSET_BPP_MASK, 3)
> >>>  #define VCLKSET_LANE(x)                      (((x) & 0x3) << 0)
> >> It probably doesn't matter, but just wanted to mention: here FIELD_PREP
> >> is used with, e.g., (3 << 2). GENMASK returns an unsigned value, whereas
> >> (3 << 2) is signed.
> >
> > Huh?
> >
> > Either you use the unshifted value "(define for) 3" with FIELD_PREP(),
> > or you use the shifted value "(define for) (3 << 2)" without FIELD_PREP()?
> Sure. My point was, VCLKSET_BPP_MASK is a signed value, but GENMASK()
> would produce an unsigned value. Normally FIELD_PREP() is used with
> GENMASK, i.e. with unsigned mask, but here FIELD_PREP is used with a
> signed mask. Does it matter? I don't know, most likely not.

IC. Yes, it is better to use GENMASK(3, 2) here.

Always use BIT() and GENMASK() for bit definitions.
Or the new BIT_U{8,16,32,64} and GENMASK_U{8,16,32,64,128} if you
want to be really explicit, or avoid compiler warnings when using
~mask later.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

