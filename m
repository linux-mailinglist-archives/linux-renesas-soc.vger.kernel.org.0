Return-Path: <linux-renesas-soc+bounces-11019-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8279E6F4E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 14:30:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A25E16C22C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 13:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28AFF207DE6;
	Fri,  6 Dec 2024 13:28:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B952207669;
	Fri,  6 Dec 2024 13:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733491732; cv=none; b=gWhJhHgYPlJG8z2k3ofhj4stnapLYxnctZ5zb1IWOiCdL3PqJOi4yK8T8DGpqT2abOCPzs8IBtWWmfrl2b+Ak6HJjqz69BEQUHekSHSnfdVGjqRyhkI4OAhKSVBFDHgBBAC0jozO+lK3EPKOVjA9i7bmYJ7FHNWbaIOQL0usBro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733491732; c=relaxed/simple;
	bh=QyT9ymmtOAnnPh5L4OiPicNxJpgOzqv4woQXTvghidE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bTStHgTUFIa/YkT4g1d8jS/Dw/5a/3YXMFF8gLPNKIh+wQAK5tWXcFWkXUHyiyEmMHf3LMXUNNLJo9KaF8lRGb7/f7O7r6b1JxcfPypCF7Ap3VFhuFYqPrTYY26P397mUUSBv6QR1UiaHGXfXL+EKm4Lb39uOSU3az4ZWn1UZo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-85b9f2de38eso428254241.2;
        Fri, 06 Dec 2024 05:28:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733491729; x=1734096529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IGRS7L7ZuVSeKuxtHlvR3IqsgSn4DumIp/OSiU1yClc=;
        b=qgthzA5rb3TNMFMTUUL7KTnYmLtbuuf/BsHW4ox373kHLO+tnjYPTQ5YS6+eDGdY7S
         w3sw7SdwjmOsoHghp93oMctJ+LtMk/crW14P5Z+H4CErFBR8Qv8VT6k6oDf7Gt8Sb3Bf
         QAAByUw0rqP3vzgO/FSFT5eKLn4b52HgyjdEBJkWqz5Kq6NaG6r0xXJsa5EGiDT9uFyO
         rY9QH+qTU286Zqx2a0k7EIj0Nl8y1/NFvmwX48r1c1LiqEGWGOn5pW8Zxoy9z+ItzVIg
         T0xFTaUWQ6De39cdFsVbd75bNKg9lpAVEBwa0OdYjY1gNAhhGGcGWU3HreQQSSOryN6n
         FI3g==
X-Forwarded-Encrypted: i=1; AJvYcCWgmHv6Z54J1C2iNMAD0wUn451bF6eO09d0PDo/MqEnEyeP+lk3yGdQK8aFm3GTRCSvfUeRX7lP0n0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuhA7ANJv22ntLX9rCqKM3bivEzCudnbWBjDhxcSCQ73gw2O9P
	r1MFzRUIxQ7NTQPGP4BfOwYqqwZ/q8ftYYELTuFXurjQ5fUl807JU86Levwz
X-Gm-Gg: ASbGncuHLD4TYGd0B9sS+Geys9Ab+XAH/NCnJOC/vStdnPpqQ+asp3XmyR+tDhgRpQU
	eUm9QH7Fge5ucSikqD+knjkJiI/fbpN/224wJH2xfjCGY3QrXHzxughCTeLbs5C6c/11DgfQeI9
	Y+nAALEG+9n/lXg3hjjKl2yrCEfj1PECvWlXs3+qZlT7baza7ZBJLYGfCAtAo3YBs8ujIcRdMIJ
	NxEkuCPqaFGbEi0j3w1qXDB6kyJd/Kj/ramvxOhHa2scA3vca2SrAhnZFUJ0Q1IMwBm7nSK+el4
	TbKbDdmzOqoi
X-Google-Smtp-Source: AGHT+IEJNF5uLxi2pHApLprR392Opxn5RpuYZLIQJkhQ+D6NjLeSgxH6f2zJKIr043Lg8HXK2kS5Lg==
X-Received: by 2002:a05:6102:370f:b0:4af:4d2:488a with SMTP id ada2fe7eead31-4afcab63efemr3330008137.24.1733491727291;
        Fri, 06 Dec 2024 05:28:47 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85c4d74a147sm95530241.23.2024.12.06.05.28.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 05:28:47 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-85c4cd95885so99840241.1;
        Fri, 06 Dec 2024 05:28:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUX4vYKX9V0Kd9JHi53H3+OB2aCc3miFxyIj3vSOdA9w+B83FPzAIAsO0ggnCe6QysxnHmmro5s+OM=@vger.kernel.org
X-Received: by 2002:a05:6122:4b82:b0:515:e446:b9f9 with SMTP id
 71dfb90a1353d-515fcafc2d2mr2893748e0c.12.1733491726845; Fri, 06 Dec 2024
 05:28:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241128091113.24116-1-wsa+renesas@sang-engineering.com> <20241128091113.24116-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20241128091113.24116-3-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Dec 2024 14:28:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXu6LpNAxgLsCRNvEF_SF2m+FhWJjMVhzy=fPvZsg_N3w@mail.gmail.com>
Message-ID: <CAMuHMdXu6LpNAxgLsCRNvEF_SF2m+FhWJjMVhzy=fPvZsg_N3w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: renesas: r9a06g032: use BIT macro consistently
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2024 at 10:11=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.14.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

