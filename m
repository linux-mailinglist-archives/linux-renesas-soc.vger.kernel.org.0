Return-Path: <linux-renesas-soc+bounces-25984-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C20CD62CD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 14:37:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71212301F268
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 13:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF4A30BB8E;
	Mon, 22 Dec 2025 13:37:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B5530BF64
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 13:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766410653; cv=none; b=Rb1SrDWaJvpSZ+YKOVgnT5Jf2v+t1AYuvKx5oAHVwhv4WZutnkqO1XzjXtWBsOkp4X081EwtiqpIvEF8N85AU+N1d9bSrxFPc5dugGivSSQrlp8CgU8+s0QVcPKBO6AxQdvRW17tmD+A3RB84ru5aNCmKWuN+FMytibh1LmC0M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766410653; c=relaxed/simple;
	bh=kmiOttyYIjYm7xyTUQY+lGKL/xfSLPWV0w1j0JJ2lw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sc7wxuxnEll/+CyKUJ/vA2ZYhJt+dRL6pBV7/LnYXffDu5mUI2lGmR3Y/bnzoUZ7OK55UpdXCZS0z0klwV7TpNKSjC6I/J/U7D53Qq/OaBoaCqiqna7UW9qrGAGt5FlErDs4s9x8bdkYtmZ8605hsSQIFWU9kuvJMc3Wc1cA4Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-55b4dafb425so3202419e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 05:37:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766410651; x=1767015451;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ziPTnFwCBRDCM+hgwI03QmPTuxViV3RQXwnH1A3smg0=;
        b=t6F0Rltxe0UDUafAtBRfctk+oBhYx9BhJBr/RBzcDDm7DclqzcFbWRThq9a+ZcYTL8
         rAHq2LQu4TBTeS8NjXBVLyVHq7eGlncJO7Gk0wyGTUbfAcoxobNiqinxZn6BOhVS9OKR
         TjQroZ2tdWPMFdUWmpjV2lvkatpRCl2VRqqaTfoW8w5/QRkQq47/YF960BZyGLHVTOE6
         FjNsFAD7rtR7dIDuFNQxnLqV5OL21FzjlTjpjAlQtkkyLL7/jvA60APO8cKZmQKR42l4
         OZ9boLNdZEAyH29oIgA4cpqISs94W3u3qejbswr1G12caGA+ROjq5Itfuow6jmuWXgJR
         FSJg==
X-Forwarded-Encrypted: i=1; AJvYcCX+PuEhMYRek5MjHRypXIyCWEAb4bCsxnAJDJQyyVnJyj/9g4JuWP3/Pxl1i68p61HTO557vzlNRB8XROth5fFvVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyap4iZ1JA16FYUN+Yiz/LoGVeiR3HRIlbtotKCNnGIw069cNsC
	ge1sjkLFg69MWhDmtTuWfRY3nDxU5MGHuDQfbRjpk8MI+IjZ6/eskpj/ivNExVKZ
X-Gm-Gg: AY/fxX71w6D/6yxi2IwnnERRyMAJ4TREsIhl2SXsVY/9hTruF7OLmbOCJfUr/fzMWl4
	dYgCpKijjhAvV25OlhZwO0SHv1nWXaT9GIsbZclu0nZ/+bDOfXNwL3p8Rc8Md9Jw2c0wIMMSW1q
	wj2/e4FfZ5NAVQzm0ts28DkwZ5u0k5SfFfJtE3oFUN7x+pl8hDa1p1w6Jv4GptOfjU1YE+ID1ss
	RFtxxeNsMEowb63PBcHSqSnKMdbU5wdlFsQAKxK/MyWfa/3fRheieVkJyRehZvxIPrxSxAvYhPp
	J9/2crM0wA4SlU9SheZGdqGyzSgLg50yQuOLjap/gbYbc+x2gC0RqA1Tj+t2f/GEocqMlYyFP+Z
	jg7Q+htNKMZfB3AhU+b/n9UXK7nyLQfo1BOTGwuraOW5u4Wl1e53Jcjpkbgd/Y5zsuyyrXDUmdU
	teUi5yGK42w0dv/A2Y3UiY/JeAvBH+8PyfAiQfc8mRXwEkijkaUYNY
X-Google-Smtp-Source: AGHT+IEkCXQcbcTZyBW+JtVTDhlHmPUpFVnvhW6cjsBdXG+0cT6+3O46xiQoKyukxik13mPliBLkrg==
X-Received: by 2002:ac5:c4d5:0:b0:55b:69c4:47b5 with SMTP id 71dfb90a1353d-5614f62cc8fmr3510730e0c.2.1766410651402;
        Mon, 22 Dec 2025 05:37:31 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615d16c900sm3356372e0c.22.2025.12.22.05.37.31
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 05:37:31 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-55b0d4b560aso3262417e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 05:37:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWYW6XUIR9uIjrIWEUGNOx3hjWGQQix0ek+G4qRYp4AwTfiqH93cFQcKmu2acXG4C2ZsmgOkFkIm76TLY/jqmTDJg==@vger.kernel.org
X-Received: by 2002:a05:6102:580b:b0:5e8:1f33:bb17 with SMTP id
 ada2fe7eead31-5eb025ae57bmr5007226137.21.1766410650837; Mon, 22 Dec 2025
 05:37:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023212314.679303-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251023212314.679303-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251023212314.679303-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Dec 2025 14:37:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVp7PRfmMTpEAi5VrYby-HHJyMUZkseVJ2UcKSrcocwPA@mail.gmail.com>
X-Gm-Features: AQt7F2q9Egs9uxnX4tQZBDWDuKM3dnSLVxUrvzIK0fXdF4dO9tZ83CCxYckYpeg
Message-ID: <CAMuHMdVp7PRfmMTpEAi5VrYby-HHJyMUZkseVJ2UcKSrcocwPA@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r9a09g057: Add DU and DSI nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Oct 2025 at 23:23, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add DU and DSI nodes to RZ/V2H(P) SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

