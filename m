Return-Path: <linux-renesas-soc+bounces-22191-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A873B94B37
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 09:09:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E9627A4889
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 07:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD5029CF5;
	Tue, 23 Sep 2025 07:05:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1044130F93E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 07:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758611105; cv=none; b=mng7gPO+z7i/AvXyurpG0Nkhn5m9+/TPKPjSeJJjGIz1fRtlzRC8C1P4IlY6N9/Z0+ke9XFtHCZUi0SXU2c7bCL0IK8doHk4Oey9XUs1gQXoc2TX1YvkL5OdekM/4WyYOhW6siVzhFSkwWiGOJnpiKQkATiuNi4M1m3wN8c3Fcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758611105; c=relaxed/simple;
	bh=o2uBmggyCnP3RASSdv7vq3M9mUEKNXKMw4hsc2V3Qxs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lKz1gsyeddKfTegSAPb18ZFj4ZT+kgUSAoFbbdL9L6DMe/3B8mFqfPp/so3mTgR1olZs/y2j0PwWd9EmoE17beGQYPinlofetHpF2sgsj9xt/zgJH+J8/tgjPmDaBlQQiiYYaL7IxcP4W2ndwv5tV49E9o8hoXsNhzazUR7Mv6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-8cda57802f3so1381513241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 00:05:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758611102; x=1759215902;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cTSa9ZrFX35P20ri8x54pvG4hV62yKGbElIfp1uaYxc=;
        b=Yo257OgiJLx7lhAwPWooXz1RJVP+Ntkh2LlYt6pCr6uTPKUZJKICziNcocTLYOpbem
         JHjGJ5SSckcyrMTXXySWFDYwyRIcNyMPpHqm8X0qZWdFVBkoTUmo1HOp735nU0x0W7ik
         zriMABIEdWiEy5ykrgmOMr0z8y80HbKgV8hBXcO7xHxjAehFDkljBavT6fGIIpCk8DNU
         9TaOoolYLeG08jma6UlM+rJMThrGM10Anp27Ll827eREeFyWneF6NGjJ5uaV//5s2fse
         orz0xz3TMPSIux3P929wAdqcge18Olr2VQkQQZWWTfCxEPio5w2BWTvcKJxFCRL37rla
         Yhog==
X-Forwarded-Encrypted: i=1; AJvYcCXq18OgKXe7nAGQsX8sPSQVNjH2LvAQlbnuEDHQO5HEh3jvE4bRricGcseNrTK1lrjcSGkippKlxjZae6S+/VJf2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxctmN1Ep4hhsM4mHhKnki97Z2cpjxVMkhoAYGaIg2iGpHohuV8
	NNUBqdcE4td7vwR89Y7aDpb8fTKGSYHZPR3diMWUr4HXKa+nchZK9T/1blpuoXvQ
X-Gm-Gg: ASbGncsfjZuN+8MMSX5A2SkMWLVJrerWqNVyhH/zX1YkNvdIVPO67NjESzH38hEGTpF
	MQuQNa0tM3VL1NjHhWH8UHPJ7iu+ZmLb5WvG9Bmsr1Xymka7GhtOAIqEm2Of5amhOeHzE2yqWF7
	83d1P3bBIQxRBiWt43YCgPXL5kRmE/QRQGde4jfVZImkcEBFewqlGkI6xRKCcKoNSUKNWzYKv7f
	qmAqNvKTGmDyGt5h8LmtuDhm5oyEb49Ys2RTkMHUTm2ocNriv0lq+RkpmkPBqPaPu5iXLLQCBFI
	rEvHaZEEQecC12PjrwmItBPxAZXBiGh6AhQz0IXd69JOibf8plxaRZAzO+/my3VN6W/V9IvnEi/
	y15kaMmMAXDNfnfifV3zuj3ELMaz5iiR9vfTb8IYIwR98ujCWOR5rPpopubBRBdQj
X-Google-Smtp-Source: AGHT+IHsC8r9EgTYrqmLJx/bVp/CE23BkMCdmAkm3gEI3DiJWnrQViHJ4RbAR0mfk0HEj6dSiWYaSg==
X-Received: by 2002:a05:6102:1610:b0:533:ff66:698c with SMTP id ada2fe7eead31-5a57e77391fmr511730137.2.1758611101763;
        Tue, 23 Sep 2025 00:05:01 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8e3e58e7514sm2360107241.2.2025.09.23.00.05.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 00:05:01 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-54a8f6a2d80so1204807e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 00:05:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4nRm0EAY4nhiMhnF2caRpaAav2bGt6l0g713Jj/zxeMUlQkdX39jn7yxrERkhuhCJkaNXB0d2v7kA9VwYB8JWPA==@vger.kernel.org
X-Received: by 2002:a05:6102:3e1b:b0:534:cfe0:f83e with SMTP id
 ada2fe7eead31-5a57e774684mr497929137.3.1758611101246; Tue, 23 Sep 2025
 00:05:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250915235910.47768-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdXAK6EhxPoNoqwqWSjGtwM24gL4qjSf6_n+NMCcpDf1HA@mail.gmail.com>
 <6fdc7d1e-8eaa-4244-a6b4-4a07e719dd73@mailbox.org> <CAMuHMdVrw1Mr_hKvgve03DQwvpqSPNaN5XUnYRJPXMeX1wvv0A@mail.gmail.com>
 <de4e4003-214f-4260-854c-d15efc81bb74@mailbox.org> <CAMuHMdVgFNb-3TgL7a+AJMYE6tqOiMpGYFDhXnQoz9R5gLz=-A@mail.gmail.com>
 <12b54030-5505-416b-9e4e-2338263c5c7a@mailbox.org> <CAMuHMdUnKqHQpaTkiuYUmR1kQ2GwVvj0SeML-9x3Rc+srtXW+w@mail.gmail.com>
 <3e6544a4-a202-4a1b-8cef-a864936db5f2@mailbox.org> <CAMuHMdUZ0U4OZOgOMXVKque55JwuSjA7kxBg7htmFjzca6+DyQ@mail.gmail.com>
 <c34424d5-b1ac-483e-a1e1-8dd8bfdc2c51@mailbox.org>
In-Reply-To: <c34424d5-b1ac-483e-a1e1-8dd8bfdc2c51@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Sep 2025 09:04:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUKAz67vD+5pQm-sJx64CY9fwdRpNcreHNF6Oet43-YYw@mail.gmail.com>
X-Gm-Features: AS18NWCkJPDSQ7i_rlf0FanL-iuzDqO4gQrvZfLgfjUxJp_g2BkVs26NNcSRwJo
Message-ID: <CAMuHMdUKAz67vD+5pQm-sJx64CY9fwdRpNcreHNF6Oet43-YYw@mail.gmail.com>
Subject: Re: [PATCH] PCI: rcar-gen4: Fix inverted break condition in PHY initialization
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Sept 2025 at 17:49, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/22/25 5:33 PM, Geert Uytterhoeven wrote:
> > On Mon, 22 Sept 2025 at 17:17, Marek Vasut <marek.vasut@mailbox.org> wrote:
> >> On 9/22/25 12:10 PM, Geert Uytterhoeven wrote:
> >>>> I have instead posted what I think are proper fixes for that SError:
> >>>>
> >>>> PCI: rcar-gen4: Add missing 1ms delay after PWR reset assertion
> >>>> https://patchwork.kernel.org/project/linux-pci/patch/20250918030058.330960-1-marek.vasut+renesas@mailbox.org/
> >>>
> >>> I used v3 instead.
> >>> While that patch seems to fix the SError after a hard reset (hardware
> >>> reset), it is not sufficient after a soft reset (typing "reboot").
> >>>
> >>>> clk: renesas: cpg-mssr: Add missing 1ms delay into reset toggle callback
> >>>> https://patchwork.kernel.org/project/linux-clk/patch/20250918030552.331389-1-marek.vasut+renesas@mailbox.org/
> >>>
> >>> This does not fix the SError, as expected (pcie-rcar-gen4.c does not
> >>> call reset_control_reset(), but reset_control_{,de}assert()).
> >>>
> >>>> clk: renesas: cpg-mssr: Read back reset registers to assure values latched
> >>>> https://patchwork.kernel.org/project/linux-clk/patch/20250918030723.331634-1-marek.vasut+renesas@mailbox.org/
> >>>
> >>> I used v2 instead, which seems to fix the SError.
> >>
> >> Those three patches have to be used together, and this inverted break
> >> condition fix should be applied too.
> >>
> >> The first two are corrections which align the code behavior with
> >> reference manual. This inverted break fix is another correction. The
> >> last patch in the list above actually fixes the asynchronized reset
> >> behavior and turns it into synchronized reset behavior, therefore fixing
> >> the SError in the process.
> >
> > FTR, I always had the inverted break condition fix applied.
> > All 3 fixes on top should be fine.
>
> Maybe I can finally properly deserve your TB on this patch with this
> option (C) , all three patches applied.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

