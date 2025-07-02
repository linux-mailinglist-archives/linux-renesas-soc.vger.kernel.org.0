Return-Path: <linux-renesas-soc+bounces-19041-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA920AF610D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 20:22:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B0B94E6A6B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 18:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0945030E858;
	Wed,  2 Jul 2025 18:22:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3A030115A;
	Wed,  2 Jul 2025 18:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751480569; cv=none; b=EvUA8rF9ZCo5lDGOox7QpnN0BfFe8Vkc9zjYcES6/tdpSWUTJHKvl8XYTjPzFbVU5ocBvYowio5nQB2xy55LZQCZaSErWybwGvtpZYJhNIHxEwE8Pik30HB6ca+h3Uo+bI9zpPqYekCk2SQfiZAgzlfvlqiGktrzqAIOfB26BQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751480569; c=relaxed/simple;
	bh=YpMBAI/bqgC+sShsem9A2gMb/qAt7qQlraTwE7kjXdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LTTYpRbh5KFCycEyoW2YdlU2mB9kwBOToKCCsdKRPMWTRjDDHwB4YOs4oNhWi74H6nPjVz/0iw1cPZo6fLiDr3OyNTX/0i0qI/tDpbufa3pytc4l+m5HAe6wTPltdwC/TbrzMw2vk9w0y7gDTTLeQ1HTaHVdsjQrgvQaty5dfTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-528ce9731dbso1453557e0c.0;
        Wed, 02 Jul 2025 11:22:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751480566; x=1752085366;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OVLn/mZL9PUM2p5Xnx0xBL/BmbjTqroNI9t8koiODGA=;
        b=naXmIncpwm/9izPN53PmfUGwdmMDMBWF1PPyN2c7nbg3XdUNK1sXmdcpi/7nPC5q9f
         GB70XsrDcjh4KTOAxDcv72k8HmyjpKRIgbh6N2be3xosmp/+4ptYjGm9fTrJj2YlgmIC
         sXYxURjtFzjlxP2XiK/vzOwfm6UGQFnoagw2rQcqX976PQ2ZmcZcgevsNnyg7odQQRu3
         u7ZqPlk6HY6vBlaGbdNuGRF6n4TVG3TMNEvrA3GG7MjFWUt+gKer2uHd55y2VDW3sJaI
         W1dOY77kpSq1pFOQJOyu90v5EsDoWfQDtHCGD0Eo5OHGJpvl4Y6RcD526MDsv11XZ/Aq
         Ntzg==
X-Forwarded-Encrypted: i=1; AJvYcCWXnegZX+9awO+ryX5Iy45zoUtzLVTalZyWPjElsj8MhmMmFI68JdhESRmW4HMKiiXTEcba7M3/xNlrYaIu@vger.kernel.org, AJvYcCWjDck0SFQRWlPngaqZ7vb6Y4HTUfuN6JFvNaVYwivpK/PaQufCeIZZOovA0EUuR2rVSV11pR+4St2S@vger.kernel.org, AJvYcCXRsFNWbXQcyJks+T4zFWU4XiDWVZOKe9rx8D/d4mi7tgS2ZVBKIUlXzHv4Bnb1toluyVs7aw4OeX0n@vger.kernel.org, AJvYcCXU9iVAGDGmB7QYOtdYviaDAxbMad366CPmNOHjrWAEvMhgMagMZqiEkFSkgGHN7e8vsfUwDmbLEX9SAuv68kCziy8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqXilowKYO+EscFunaPVuHgGxraf/klwUtMpTqnvKzkEgpqGsC
	YK5YHQYQ/Fkr+zi+bJNSzP29ozCFAR1qN9ijh6I7FVy2ALR3XEsR+jQD+BzMNmKu
X-Gm-Gg: ASbGncuy9Er3flmZxXDHayJd9+h1Ll7vyXv8wxGN76qcFTar1cYHnFGsrMKtbScapV/
	bsNAZe7jEz15D6pw559Z3Umzs0SOKfBnrHoASPxwGUdDHA5veyKPC22XOmRo7/rHXvJWnT6vDDE
	RfVmh0srIzPhi4BJCnaohfijHDlkGnChGh7b1upwNj63dTGEVvhW1v9T3wRlkqjW9Vzcnt8Te6u
	o3YIC12jGHbsHNYp63AKQ0OTGQ+xr0QEb0AVpbsl7JfYzlxYQ9dW8jceCOXJYtU77UjEzC1LB2L
	MFdP/Oy8TFMGMjPRBmgP4EU+9rIMUe/3pLoyzBeB5o1d9N8bFuEDBDAjYrOtGRwIMwbRbARQ/Ou
	oivUwor1enK7OHZAVf3v063Hy
X-Google-Smtp-Source: AGHT+IHCsEdGOhXMkOKts0CVk5ZnNwxQXCZlwo1CDFyX1WLrnhu3MB5b8Bk3hPYWtvNQpCWeevKMBQ==
X-Received: by 2002:a05:6122:4682:b0:530:72da:d13d with SMTP id 71dfb90a1353d-53457fe128bmr2963316e0c.1.1751480565701;
        Wed, 02 Jul 2025 11:22:45 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53309079321sm2304705e0c.9.2025.07.02.11.22.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 11:22:44 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4e9c689d538so1194543137.0;
        Wed, 02 Jul 2025 11:22:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8gW+q6HS7pJH6y+lLt5GfLnVKirijsoYrUL9A+EAxCYVdW2NAJy1nZAcUuV4g339SVhXVkdFCCQl15nvK@vger.kernel.org, AJvYcCUJ0hdj78KOcioQL/g57d1JMchLE1UVXrfc00Ah4aK429h8DyreX8vlkix4FpHV4coRSuiGJf21XR9c@vger.kernel.org, AJvYcCXb6QhRPHTqhjWE8dxUHS61rovn4wuZSkXwLsM4FOo+OpAneTXTIe1vcNdNwNClE8OWBVuHk5zfKojI@vger.kernel.org, AJvYcCXsm9HzNd2qq1+DPjwU6biWhuM5hVWxzlCD3F11IH3EZdU70rTKTa7nYHXI5ExmlgEp9uudUOEowNXjmeawBSuZO1w=@vger.kernel.org
X-Received: by 2002:a05:6102:6448:b0:4e7:3d55:5212 with SMTP id
 ada2fe7eead31-4f16107a779mr3051272137.11.1751480564506; Wed, 02 Jul 2025
 11:22:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627204237.214635-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250627204237.214635-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVpL4gdPB=vEbGiA4neNiUSKdxvKU3AFGVROsdes3VaPA@mail.gmail.com>
In-Reply-To: <CAMuHMdVpL4gdPB=vEbGiA4neNiUSKdxvKU3AFGVROsdes3VaPA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Jul 2025 20:22:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUNG0YzL8gLaukdgbzEEPHXaG+YZRruddGjqt96XRrqLg@mail.gmail.com>
X-Gm-Features: Ac12FXz4E5I550_ULHXCidDPVc0JHC8scgliJ9l3DB3XDzgz8at_OK0ed_ZoPeo
Message-ID: <CAMuHMdUNG0YzL8gLaukdgbzEEPHXaG+YZRruddGjqt96XRrqLg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: renesas,r9a09g056/57-cpg: Add
 XSPI core clock
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Jul 2025 at 14:34, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, 27 Jun 2025 at 22:42, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add XSPI core clock definitions to the clock bindings for the Renesas
> > R9A09G056 and R9A09G057 SoCs. These clocks IDs are used to support XSPI
> > interface.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will split, and queue in renesas-r9a09g056-dt-binding-defs and
> renesas-r9a09g057-dt-binding-defs, to be shared by renesas-clk and
> renesas-devel.

Looks like I can do without the split, as both dt-bindings-defs branches
are upstream.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

