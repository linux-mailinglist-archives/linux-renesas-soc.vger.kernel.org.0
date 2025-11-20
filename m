Return-Path: <linux-renesas-soc+bounces-24875-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1827CC731AD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 10:24:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0764E4E3780
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 09:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB0A3101D3;
	Thu, 20 Nov 2025 09:24:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F5C3101DF
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Nov 2025 09:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763630664; cv=none; b=mO5lgBXAu/UPCnjI+9Gozk/ZI49Nz7PVcdZz/ESu3XPfsJEJCNYHAb5u+0uj/6YqmM1TuagJa1CWXIbyrczVE+vO4Kp6HWS/qO3Q9YKJn9sPcRFVO8f5Zzaw1X1RJuX2sGH+Hq+SK9Dl0Js5uwycUSNC/lvGOp6y0O2hxPuOXu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763630664; c=relaxed/simple;
	bh=tIehzOADWg2oMjFvo7uQM/EKme/aa27Q/uQTQsKkEoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jgj7Mk3hwVAtF4C5XBKJxv3wxhJcM6CKGlhkdUvEo8Bd2fsFvUW1uyNYNwf/g9ZpwXzhSS+TXKjnGjUGX9ujbS+pFhDSOi8HVf4fNjvW6A+5tSM2Xha6BOFajjC5mP+fWLwxiyG3pYPpS55v6wQyViFGntoNs4jF9eH9NeUK8DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5dfc2a9b79fso246431137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Nov 2025 01:24:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763630662; x=1764235462;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tI+k0XKSvLwM0G3p2ahCZliR+WoCnEU8lO5ycXo6VNk=;
        b=A+DfVHzZ6X4dPfuFfDMpKVbeghPehi7HgU8KgH7KQjdSuBLQednWco7ihw41PmlaHL
         zfx86AdUzRG/1TM3QYdaiB3+45EeQJ2freGIUNkGOIXUdFxq17QsyiPk3AhwHJw/kbLw
         8muXBhTPde6MNDnO6DgKuhv3TINSxG/Xe0NcSseBXaO/U04l6dl7pdd5f01MybVA8PLx
         jVyzTje5JWQFD0t8dN3O8sUH3AFewRoyfqzFPqBrxJgd30nI021zSDUzS/+fPUnnJLiC
         FwvdRjuOk/QadNAVZdorPdhkDC6YV42254ssgqOA+LvPR2xdEGdfiaxbJy/Q8muc1Upb
         aivQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEajLe3r+eh3jlNLwjCsm6mmBnpzfoahjYtfSRjEiIRf0Ixld2470P9hybcfWs+JmFFWK7DWNG5b8fHdt9dkN72Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yya6vo1gNCWDoO0+4/vQ8wvizNIV6F7Ox8ia4L2g9cJH9UJ1zFl
	hXKK8d8d3ZRhv8yTrLkjOHN1Z7IUEcC1FF0JKkWP0ZJZCkbSLLZdZN6GgpFUKow+
X-Gm-Gg: ASbGncuY4pO+/d+1fq3BgHxWxnYhfEioh5JjwZ0qXJGd5MDUlxZCzoAXNlyp4LyMglL
	SK7alnzMCT8meiflocBA3yVjVZqi585tYA30WLmhhb3jtAqiMn/F1/mn6dqN45OSM7sCh7VSVb1
	s6CC+FP0oXzRvpSDhqKYhpLIF0Cl1GgIvCF2zdNf2lsWV8OIfpXNXfR4w6ww2mIxmU/eRElB7XK
	v1bLjWiva6Dd0syrjrtiUpPOVtjSXI4h8f9rGyktPhmXW5cMc7QrfI/bHl1w0UybWjP4gKXsAOb
	+lhSwH17eqUKMWpFFu9ZlbPdGV2sgntbZ5kDvTsb5aGi/NIt/837BMnMGEIt7RXhnUexWVnRrYU
	qajMy9W5Ugy60dnqE2umxH0xYHwakioxRN5AAT/Coo5UDFqBZm7ilmCkRXKO4K4O2JTd9JSeB+m
	bVZJpP+sUsxm4iSH8G19PFAR2bZZhKAIN3XwFxac3Q5aJb/AXnAl1w
X-Google-Smtp-Source: AGHT+IG7nYH9FszpPtgi16EpX70YB+OHsOilJLV/E+FFT94yzIEYoVscuwqtUcbl3iVR33lwUN3Kug==
X-Received: by 2002:a05:6102:38ce:b0:5db:e851:938e with SMTP id ada2fe7eead31-5e1bbc5ad32mr659161137.10.1763630662041;
        Thu, 20 Nov 2025 01:24:22 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93c56276527sm819217241.8.2025.11.20.01.24.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 01:24:21 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9371f6f2813so197416241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Nov 2025 01:24:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVAEcJDuNt0TSea7pHfGDnbql8Yv3GbbOB5Z5N3/4s+F7qf4YhlA4eY/3niGnRTHUjQ368iECU1QdUKWTHdbCLUgw==@vger.kernel.org
X-Received: by 2002:a67:e713:0:b0:5de:736:71e0 with SMTP id
 ada2fe7eead31-5e1bbf31e90mr811357137.29.1763630661351; Thu, 20 Nov 2025
 01:24:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250916150255.4231-1-biju.das.jz@bp.renesas.com>
 <20250916150255.4231-9-biju.das.jz@bp.renesas.com> <CAMuHMdUACU1tPKDgoOhgBW8KkDCxSEzqb7TnucYk2dW2jOet5g@mail.gmail.com>
In-Reply-To: <CAMuHMdUACU1tPKDgoOhgBW8KkDCxSEzqb7TnucYk2dW2jOet5g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Nov 2025 10:24:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWPA1rSTLzgmjBcofh1jNcH7L92gJEVzVBXqgm8ByN8iQ@mail.gmail.com>
X-Gm-Features: AWmQ_blXL6vQHpYLkm7kEyRyWu76K4MDkks9C145cLfpZdNOxCjRGmyKdbxa0co
Message-ID: <CAMuHMdWPA1rSTLzgmjBcofh1jNcH7L92gJEVzVBXqgm8ByN8iQ@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] arm64: dts: renesas: r9a09g047e57-smarc: Enable USB3HOST
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Sept 2025 at 14:27, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, 16 Sept 2025 at 17:03, Biju <biju.das.au@gmail.com> wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Enable USB3.2 Gen2 Host controller(a.k.a USB3HOST) on the RZ/G3E SMARC EVK
> > platform.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

