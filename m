Return-Path: <linux-renesas-soc+bounces-16067-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B66BA90451
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 15:27:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98BE517A4A0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 13:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F0E23774;
	Wed, 16 Apr 2025 13:27:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA9317BA6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Apr 2025 13:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744810060; cv=none; b=sCq2WTZKZHTI1kt1N4ibiu1hNRr8nhH1/9Ld0OGGNGdG7slLNTrnsVq3NKVItjHQRRGuE/KSxNKlZALMzLONbk8JO9P5BqB6LAsph9FduBGO34D3365twQEYqLKyyx9gDR9+m9iFfK6UhMuzk6h9FY6y1VhVXWlnIuX7WdyfJjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744810060; c=relaxed/simple;
	bh=f9zcDun1CUiLV9We7bSMQAo/GVla+70us5ZdSEWJwrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d4FqsGYsNIviuKRrUx7TlkzI/j3+BbgAPwW3nQzOZx7B3tCehIsiCAJ4+uQWBp6+dTnqfFHzddMzq/QZcpt4k5gc2VBeqmwZr0c2Wk9s3DGBv8JdB9yWf8YnEeFYgSkEZRXbnodY0t12oDhCcZvLTMSVkGdULJ8IGAXGLcarY+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-86d5e42c924so5322092241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Apr 2025 06:27:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744810057; x=1745414857;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/qOjQJpyyoC1fsLTnQCp3awC9vtAI7ezMxeKPUqoKMo=;
        b=AQNZCIRAKN1rxZCZ/xBe2mm4pMWmSCzyCna/9JR186LbCSDkFnPNqNOXFE5fJezr5r
         eOUfakm5WbzFZRTIc0j3WmdJiuDhKpw4ig7fxQyjoxGBUg7RDCmvnnqgf0JgIMyrVzG/
         RYzob+CCSXbcdBZwwkcOrIqgJgPd2MYGLgMSxbDoc/NB1mgsAlURIMnLbWdeCGJodVPK
         tglc8DcIkEI7aYKF66470ewdd1biAvq2w8r/Pcg/ARknyfX41gbiQsjBFMiECAyibmF/
         Ff5EcfB4XgRRb2fYIuzZaXkRb9Buy7FqEgxbF5v4acemDi/SbWHGrE3EA6ngFBPsjHSs
         SD8A==
X-Gm-Message-State: AOJu0YwHdLz4uup4nr/EPOJ6WwwpAxvQJYQYaeEJK3w9wCY/vptP/pvQ
	Bme7VZ8/4oFgMnmRaQu/KoElexeeIIIzQ6V3ApKBeL3N302rZTi9gHZVB1lF
X-Gm-Gg: ASbGncuAtUKSXU5sGinL6Cx0/6t7rwaHF8EoIJH9sR81AbEls0EA4CmBVUWOAX+4at4
	RzeRAS+BBugedcYd5PVFVg5Qy7jDYJIRoQUYxX9KICj/ZoR6O0eVt6IGeVB7xfAOmbyvqlVzL9k
	9hgZ+CrxqImby2MY1IJywyxHRsPwMbNHo6LTO09X2/N8BUwt1vEKr6MXfePx7P5twI6C2WQNTYg
	ZZu2uoz5r+jlKcXq6oeavFiwgQO4envHXNp/IqmUaNvqujHsBCTYftntZuqYnEUYj0ZwDXVcvM4
	lf3YqP6RPjbX3fyvWODpfDXnZNpZ9RB+qQoZdXDIiMxWCrvzoDCg2lVEInyTu+7XRCRMO63mLqL
	z27rRfhE=
X-Google-Smtp-Source: AGHT+IG3DBgKBvMG3fsJV+Mgp66WrQByzYRumi2lOHmDyr2/mErh7X8fvTx96bPciph+9NZTl7bY6A==
X-Received: by 2002:a05:6102:66c:b0:4c1:9526:a636 with SMTP id ada2fe7eead31-4cb5920d54dmr821814137.15.1744810056935;
        Wed, 16 Apr 2025 06:27:36 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8755716bae6sm3050766241.15.2025.04.16.06.27.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 06:27:36 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-524125f6cadso5215600e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Apr 2025 06:27:36 -0700 (PDT)
X-Received: by 2002:a05:6122:1d16:b0:523:a88b:9ac5 with SMTP id
 71dfb90a1353d-5290e1bffbamr1144601e0c.9.1744810056151; Wed, 16 Apr 2025
 06:27:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1729240989.git.geert+renesas@glider.be> <05e43f61321b4191d5f97dec2349facd4b56c899.1729240989.git.geert+renesas@glider.be>
In-Reply-To: <05e43f61321b4191d5f97dec2349facd4b56c899.1729240989.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Apr 2025 15:27:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUiR0N+CS2FOp3aNa_mouLMYNk_r9oBLzBgNXAfM84f3A@mail.gmail.com>
X-Gm-Features: ATxdqUF5H4bnKcXD6LYDNiWRVkkarNy7wpl2Deegf9tS4tKrydXitZVt20GJG9M
Message-ID: <CAMuHMdUiR0N+CS2FOp3aNa_mouLMYNk_r9oBLzBgNXAfM84f3A@mail.gmail.com>
Subject: Re: [PATCH/RFC 1/1] arm64: dts: renesas: white-hawk: Add mini-DP
 output support
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

On Fri, 18 Oct 2024 at 11:33, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Add support for the mini-DisplayPort connector on the White Hawk
> BreakOut board.  This port is driven by a TI SN65DSI86 DSI to eDP
> bridge, which in turn gets the pixel data from the second DSI channel on
> the R-Car V4H SoC.  Note that this port is not present on the White Hawk
> Single development board.
>
> Based on the work by Tomi Valkeinen for the mini-DP port on the White
> Hawk CPU board, and by a patch in the BSP by LUU HOAI.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> Does not work:
>   - Display resolution is detected correctly (1920x1080 or 2560x1440),
>   - Black screen, displays say no signal detected,

The second display pipeline has a Display Stream Compression (DSC)
encoder between the Display Unit (DU) and the DSI encoder.  Forcing the
DSC module clock on gives a working display, just like on Sparrow Hawk.

So now we just need DT bindings for the DSC, and a very simple DSC
driver that calls pm_runtime_resume_and_get() ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

