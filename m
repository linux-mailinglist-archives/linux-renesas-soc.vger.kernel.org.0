Return-Path: <linux-renesas-soc+bounces-13590-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1E6A421B7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 14:46:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A4F1188D15E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 13:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332F9F4E2;
	Mon, 24 Feb 2025 13:46:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D92C13B5B6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Feb 2025 13:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740404763; cv=none; b=p0lVUJNrQqR6ktgrQHCv/hTPoMgzGrGTT1eZBkIbmlVGDL7Gc+PxjtUtZ3v+Qxs4GCme+LWWthiuPrVdDoy9bv5pvVHWz8qiK9R87zTBDKPCTRHFuqe0Cz9dOfOBZmNzm6BG3wLgI3s/G4sBel/3hXMYXNtcl04O3uEpINI5XmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740404763; c=relaxed/simple;
	bh=eoBY/HSo2KeOlJbnbLVZJTCFAgxywlpjN7qbcRGlP+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oDig9lbacZ10dr2iPt85DhyCiTuKamjnQ9LykD3k6xd2svIdQsbFuf+33T0ZwAu11b6yEIlrIUudKvxptoBCr4/MahllY+lKYb//On9zGajxY8SmNJEofwCo7A6t1zL6UFCEMaeAvz+nXmvnUeJXLQiwARtDeVhOdMU6D+Q+doY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4bd73f93215so2798274137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Feb 2025 05:46:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740404760; x=1741009560;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k7djpnw0ThRBwU/Uf9+fb18NK0fA14bonrfmaAUoJnw=;
        b=GZuRXNgxx2FRXvJDAjasRpCXofyyZaMVV6vT/4gviOrTAtMsNw0HZLstSPavgy7gW7
         ajH5RD8eWjAlM2a5VZ3Rb0mE9VoXVMk45ZRz+WN2NqyXqHejhhI3U2b6GbASl4yz81OX
         F17LkS5w4HcO0ZlzAe1GXKmTtS5KymQ4dcHUBMPQ9dF7qn+mD3tbnykX7EfZHGOgnDTE
         0xAqzAeeZb66eTZvFjZfqvFCPNKZwTGRmCHVeGSnCgpR9bL3SL5nd/kyn9TQ0cR+07Jl
         fz6DUyPcPA9vI5+AQXQFAbbniAPtcvrc49bMmKGhI+xl1XHfBnUGENgNMx6nJBR9Se2U
         tPnw==
X-Forwarded-Encrypted: i=1; AJvYcCXfqiD2/7wDsCxJh1IS3tyG4X5FJC5ngBhuP3xMTP7V1RjDGDuxX2zsQTvMriMpPKXaNxKN/srhVNG8yLJCne7CEg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5Y7ErKfFpgvL+ssjULzB1yxhuRZ4bz7LGiZ/Y8ibLVijUqg42
	bsV5HrkwLjb2Sz7PpjJmpvJebWpvJFlCdiLrVxPXXgGccVGRAD5PWGSp23Au99I=
X-Gm-Gg: ASbGncu2cPsLZb1oJ+rD31pcrsF2T7Nsrwrc6HF8kREUcxa7Bdzj9H79+JKOjZ5WFXv
	wzp54cnpyD68y04Ye3yNNnhBQ31qEP4W7IUVL4hdBvPmJJEP/u3K/xI7OA4NhQ6gO49LhanoCnv
	g7rqbJtQQ9gg+XmwjazvQKsH/Glh7ne3hBwI5SaIzWOy3rgLQdYFuIRmmtGOMHJUcDdQsVEeJaj
	fjANgDpreBwbhoXiahBFzo5ruB4pfQip/862k3IfCOFtV+vVGTORB4bs4Im4Cq0+DA6cL8JeVl8
	E8AhK5Hhxdy6fVLysYSxKH8SaVl7zYcocNlck8Hf88deZwAqCasf82nyyG429scD
X-Google-Smtp-Source: AGHT+IGdRXUbNM2Phb0gGWuLvDa7RemjP+CTTlQxxREXBABEcFaqsdqtDLuwqhWwWX9E9xhktH1z/Q==
X-Received: by 2002:a05:6102:3710:b0:4bb:e5bf:9c79 with SMTP id ada2fe7eead31-4bfc293c0f6mr5805450137.22.1740404760080;
        Mon, 24 Feb 2025 05:46:00 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-868e86cbfa7sm4598422241.31.2025.02.24.05.45.59
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 05:45:59 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4be60963da5so2877700137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Feb 2025 05:45:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVrJOAwGs7YENJZtJgan1Y1qW5mOLJdJolNZ+vR0dm0FXCL8lJubFeH82kLFOqLR1xkO+SeiP/zrgsM4qOMf1fACg==@vger.kernel.org
X-Received: by 2002:a05:6102:3e18:b0:4bb:f0aa:b348 with SMTP id
 ada2fe7eead31-4bfc27d86d3mr6191982137.9.1740404759689; Mon, 24 Feb 2025
 05:45:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250224131253.134199-1-biju.das.jz@bp.renesas.com> <20250224131253.134199-11-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250224131253.134199-11-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Feb 2025 14:45:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU84BqccQpVUv22raWtqwe1F5Pfxw620V54nxEPN0ioxg@mail.gmail.com>
X-Gm-Features: AWEUYZmRMRuYAUdcATpwhlFKq0GFLuLFv7B9Jj4HtdeW9H7EkFHmRiPBdyIrFkg
Message-ID: <CAMuHMdU84BqccQpVUv22raWtqwe1F5Pfxw620V54nxEPN0ioxg@mail.gmail.com>
Subject: Re: [PATCH v6 10/12] irqchip/renesas-rzv2h: Update TSSR_TIEN macro
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Feb 2025 at 14:13, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> On RZ/G3E, TIEN bit position is at 15 compared to 7 on RZ/V2H. Replace the
> macro ICU_TSSR_TIEN(n)->ICU_TSSR_TIEN(n, _field_width) for supporting both
> these SoCs.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v5->v6:
>  * Retained the macro ICU_TSSR_TIEN by adding _field_width parameter.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

