Return-Path: <linux-renesas-soc+bounces-12695-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66861A21FD4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 15:58:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B851C168049
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 14:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4730A1D63E5;
	Wed, 29 Jan 2025 14:58:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194021B4250;
	Wed, 29 Jan 2025 14:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738162705; cv=none; b=W7SMI9A/8nXwiEAwrqcwAT7hMF9MxA0hbzpDf8yX43iPdBq+q1G+F04EvL2EjX60bNBLo6WpLiba7fs5+cnwRrJmRjO4HYJigPxA37XSY2G0TXBE9Es5Q5u03nU/9807Z/M8hoeh+Ys2rxI5MEqssNCuKMLsZYu+3TnpPS+kg1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738162705; c=relaxed/simple;
	bh=3LPXKlDDfVyQVvZFLF+r9dREtZeA86OsVIv8HH/Wshw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EOAQ/hHCNxdRP/BlYEUtvqTqgsZzB8tsL0dIKh6ZXNbzGtwPpxK3ayi6cyBdrkg0HpRTdDNphT1WmrlPzRhnyo4j6PBIzfTgozWqmjevOlTPNR7JWZVztTqxVSM9H5IonGJSJ4HRT56XDtejj1nEvVOswhdMTOYahl/HM81ftxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4b24d969db1so1440887137.0;
        Wed, 29 Jan 2025 06:58:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738162701; x=1738767501;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VWaar81/OL/kNnYPNHn5k0vfqnNd1x60vBsOeOMMMS8=;
        b=NgvgzIK0NFq2IKwO0r9n7grCIBhTusrtFo170VPNhZpuI1NRcO7GYB5iPTn/CxbUK4
         XVINamPdrQikHOGQQ7FfhiWb3lGYBXX5XQ9Mws9sittVSQzS0zSpAfMEq5leCn1zxG1P
         vPGUKDLBO1Gv65vdcpNXYe8UOh/9b7r6RS7mhONBF2K6xMrDtyyjhX50jIgTLDdHVcZ2
         DexG2zCpg8Qvg/oaWCXJ7DKIcTzUKKsKkiaw9DTbmbq5CLExokNddvIaCjv+3GboThoH
         1Nlbpo71UWsvoyDFeKJLlK2LX7R2aqAchL/jJ9a9+F76Krv3CRC2MJv63L1rlOaB7zCR
         1k5A==
X-Forwarded-Encrypted: i=1; AJvYcCV551N51O3JGkHvI9hPY5P7uS63GUunRy8kh7LCRQqKaewp59lpD5A10YGik/XBx8U0VZd9UxDj3Tn8mGnP@vger.kernel.org, AJvYcCW8gBIjFrFJMesoyCn5qyU/yauDy0Nkm0V7ek7I53w4jmzvSnniXJ/6Pv18RWc+C3h8kqAaTstCTj0h@vger.kernel.org, AJvYcCWTRa3rQktiu69Cv/TtUJc/uC6se2XYmt8LXw7/AKmS7sR3mve4kHVmXZUopfjP2YS2DNg4GArQ7C8NrAruranwYcM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/2d/Ooug6Hdr4sTNmtQRdy98gnUgSogJzycQnEMAwBxEnEg2i
	xRGB7bVtkce3R0lVaQdeHSK9CTJI3dnS/1nYzf7d0sAFY8v5bm3ov/rQ+qe9
X-Gm-Gg: ASbGncs/cHwxeKbZGAyJHq8REmZrE4DWr0b6YB5TJaareEUmKK6jq7nz6lAO0Iushw1
	1Lvf5mQSotdT0VqWq1901IiEIB2KazbzjAuolPY3WmbhOoSj66fWpaKQhAbaS3P2mJ4SqaW7vj4
	SEk9BECos5I7yrYIPTDREQaWfDaY6zJoF3qPSbmb1mdJ7PXrvW/PFwvZYBsPhxlENbMiIAo+U9x
	N6SPU0wa2F0r5i3xctpbPFHwlOvmBtIDL6LajOIlToUU1ocnB0BWLzMpU9OybInVJXqurpy8hRm
	PF1i056w40RctBDVzV3gOVK2aE2qIKn5zB+k/GaiKjvBFR/xy2AeDyYFsaYwPMHi
X-Google-Smtp-Source: AGHT+IHGZ6Ej28LUbLeEOJOBoHCVXM+3pdVieRHn1oT+Xdo46xKr4wJ46DCfWo+DKUQbxeHPovpAXw==
X-Received: by 2002:a05:6102:dce:b0:4b2:cbe5:fbc5 with SMTP id ada2fe7eead31-4b9a528aaa6mr2484509137.20.1738162700907;
        Wed, 29 Jan 2025 06:58:20 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-864a9c17d0dsm2847002241.27.2025.01.29.06.58.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 06:58:20 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4affab62589so1901809137.1;
        Wed, 29 Jan 2025 06:58:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVA6FbK7vsIlQ0wxwbkpP372EuXipe1R12DFtRs7TqHl0528YoXmqa7/0OB5fAmcqbLfrwcpQMWPEOu3cg3@vger.kernel.org, AJvYcCWvG8q9LwJUjntj0A8VLT/bJXq4ZqTYlxt2fgh8Oq9vGt7dLCnyBzPPVpwQVzSnEYQtHhI8WNBNgzLq@vger.kernel.org, AJvYcCXYm77JOLh2TB2O9fz5qjNK9oc5rPGv50778xxuNT57vn5atyaGp6URrqfBAv4bkk+wSasfL8giI6CJLVFsq0rW+cs=@vger.kernel.org
X-Received: by 2002:a05:6102:32d6:b0:4b1:20b1:bff3 with SMTP id
 ada2fe7eead31-4b9a524fccfmr2560357137.16.1738162700297; Wed, 29 Jan 2025
 06:58:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128031342.52675-1-john.madieu.xa@bp.renesas.com> <20250128031342.52675-2-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250128031342.52675-2-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Jan 2025 15:58:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWTJm3yNnLxKWdN0gnNbFM6bH-CQ0R534sK1jqO+P6YYA@mail.gmail.com>
X-Gm-Features: AWEUYZl_gtYutNcuzoNV4d-Jc1lLN3vGfG_dck5mGgosgIP8aL5rPsVK36G7W2c
Message-ID: <CAMuHMdWTJm3yNnLxKWdN0gnNbFM6bH-CQ0R534sK1jqO+P6YYA@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] soc: renesas: Add SYSC driver for Renesas RZ family
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, biju.das.jz@bp.renesas.com, 
	claudiu.beznea.uj@bp.renesas.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, john.madieu@gmail.com, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	magnus.damm@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Jan 2025 at 04:14, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The RZ/G3S system controller (SYSC) has various registers that control
> different functionalities. One of the exposed register offsers information
> about the SoC identification.
>
> Add a driver that identifies the SoC. Later the driver will be extended
> with other functionalities.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
> Changes:
> v5: added sanity check after devm_kstrdup().

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

