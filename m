Return-Path: <linux-renesas-soc+bounces-25293-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DB831C8F82D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 17:30:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 247CE34C7BA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 16:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3E2D334379;
	Thu, 27 Nov 2025 16:30:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290432D6608
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 16:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764261010; cv=none; b=TAr2dKKJfua0JU6LKDNDXxjqT9hBDFWTOIg25pdXYnFz8q2Mh212WdsBGaDdaOHliasiFDA41xqwACbNHRu5JwfouzbCWLOwUJOmypcc1JotodEKDxYjmAkmlaFa0bFTukM3OHrb59gJdZwztLyDuZOFgxpk4QHCBIX6SbJpU54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764261010; c=relaxed/simple;
	bh=aspswoNAKOhPVwvu9qhnWpMe8+wEwZQxVwVuoicCgko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D5lgMKGNuh5X91C1HhTpuiRA4B4SMGY/2LUsj2y/CmB1jkO4W52L7hjMuVOYFpSE0qysw8AxqA1hZAg/Tk0h4iXLX6Vo5OAJ+tikGb5svjTCU50dCaI2Zooy4lZm+d2gFo0HPcXnUiMuHl404l4wWdW55cty7Z0wy4WJw3x/xV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-55b22d3b2a6so645835e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 08:30:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764261008; x=1764865808;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gs5FKTH1FZR7cLdsOl+4N50aiArDlXrJC3TGGiC1P6w=;
        b=Felfxo29xfHXECuHbc57g3PFhj+g5Jlu16Rc76s9dazXosv1hJ4mB9nrGMrCBUAlXA
         u1VqildifJhCdmgtKrygU53glk5fD4JXOiPFg0dJ0/M1Gd9i1mKDr/HdIBDCc+sTjNIf
         AwQJzxbeDp2o5r50e6MmrgaSHbeo1NBxXP6fPYwuYj9pHql9pZH0w6bEvsuG+AnsE/an
         nSPjtwHETY3/jUM/zWi6Tj9iA3v4SrnGxcDalWSrRteiSc+iWcoJiny5cJdv5N/Xr6au
         l1svbknUFRg3fNKie8KQwQEC8IpwnOSbGnill+a6dnRxjtfVT6dJsV2U2Cfj9C3aH8a9
         XHCA==
X-Forwarded-Encrypted: i=1; AJvYcCWfGaQWow0mu4RxSfpngXTI8bQ3z4xVXm2FOO4HInh/8T87AGP+bUd3/mZ3hNIFf1crtyCchpi6CZYCKkhV5YJSNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzC93DAS+NjHFG4ytsGYjxquzq4X7E2/qQGdoKbUS7/DUPFzfkx
	kWAUPFH2nXyNy2sWHjVfrCG+mjDjZo/ElZFOhIKuEY7tOmUcTRrdUHhbovwT1siq
X-Gm-Gg: ASbGncuL7seYZ+7AIBULF+B4fArty6D/4oGYFhnz4L8SmYx1t+3MPteWiM2C30csvK0
	/oqVof9RTVGNyqQ5sG7l74OPHoDxo0Zp/xr85W33gEpGPro7KXFVQ2z9ePav3ztR7U6vMkO2Cun
	3PgqC8ExGPvGsVdpkuAnctQ4ED3EIQaw7K9EQO53nzoW2gJ0XCQYwT8eNQDI08HttKgIkG3tudq
	sVGofISwbes/YjlYPyVCt5qpRCDy5CbHzNqqFZS8nAKeLXv5f6KIg93oc9hlC5/L2kBl2mNwavC
	EjmeU6fVxcjymIkcxbnnEbPrC2nnV+2Yipp75tH5TkC55P86mD8b0qp3pqKxRiQllTjCqr5ZtXM
	F2ONRWEzGezxHHOfM66EEgCPPszUbcKxFNJl+WI/1c28p1npof3J6qvJWf3vOS1qebC5nFTlvw3
	31ufmcchyNoIBG1dZF2e+bvZF8Co9C+I0WrSsag7blpzKv7EUB1hYiReZ35i4=
X-Google-Smtp-Source: AGHT+IHpTGd0SPi2YYOtCMDAyZiINpkm/CYsv7dLqaKHp+ojYvZaBEowuzgK8FZKp1UPWeC45o3oLw==
X-Received: by 2002:a05:6122:2c07:b0:559:83e9:290 with SMTP id 71dfb90a1353d-55b81923b82mr8167014e0c.1.1764261007978;
        Thu, 27 Nov 2025 08:30:07 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55cf518c3efsm742678e0c.22.2025.11.27.08.30.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 08:30:06 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-93917ebde8aso1279657241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 08:30:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUrfzdY+oKfA2KndtZmHRG8pYFJOpOvgZOLWZzJK1Ep+jM4fZz7TNDAY866Usb9pMMMtDEBGtB9iG1t2A6m+KLoCQ==@vger.kernel.org
X-Received: by 2002:a05:6102:5248:b0:5db:f897:59f0 with SMTP id
 ada2fe7eead31-5e1c40d02fcmr10686191137.11.1764261006420; Thu, 27 Nov 2025
 08:30:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125221420.288809-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251125221420.288809-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251125221420.288809-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Nov 2025 17:29:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUPZ3Qgorpj=xY7DFkDkxh0k1QLDARRJjiHN7JjoEJ0kg@mail.gmail.com>
X-Gm-Features: AWmQ_blWIFVuTa9dh4H3jpc-C2eBoGOexQqPhzUAA1Z8L2_lfHqF19MEie2Tcf8
Message-ID: <CAMuHMdUPZ3Qgorpj=xY7DFkDkxh0k1QLDARRJjiHN7JjoEJ0kg@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: renesas: r9a09g056: Add entries for the RSPIs
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Nov 2025 at 23:14, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clock and reset entries for the RSPI IPs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

