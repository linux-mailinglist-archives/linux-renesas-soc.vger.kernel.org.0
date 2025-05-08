Return-Path: <linux-renesas-soc+bounces-16791-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BEED3AAF513
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 09:58:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39DDD4E517C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 07:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 690B921018F;
	Thu,  8 May 2025 07:58:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C690205E3E
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 May 2025 07:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746691120; cv=none; b=C4XxV8k39FxoQYgQedCAAmkLEUgvMNKAH/JY+skQU8ZKi4v+p5L/QcClqY4eB/9ssnQ48KNpHsSHgtCgNLo4GnGoa/y7gBCYVIdXvUGLAYK5g7BPWYBMrYDT4c09pExcF6voDAmv89A84FCalO8R1XZTNGWfQ/ZYxZFr/uue/JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746691120; c=relaxed/simple;
	bh=cNQM9Ftib/4gHfGr12YtONprrb9RJKgxwbBdUoNVJng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=itpkoPe5MRixht98/xx3CsvfiQsbcEYHkrfd7kadUBAEXliZIB+ZyoTJ5vegw3ernfmu/33qCASZ1PEM/HTNHE7LQ3p/rV9IZMYr6mjgLw253uHKMK963b/glLL8G44sE3YpvpBGIwfSt70Q8u/ZgxXAQCKOZllPkWjMIpOH0K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-52410fb2afeso528768e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 May 2025 00:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746691117; x=1747295917;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KHHVM6hR+9dzPht86VzpbhxK/AkB8IccPjxZwhL1zpM=;
        b=Gm/WGZ80dhE7Z13YrHRghUo4o9bXWor9XfSbZn7RGZZYHnKU7GgiqEJN2m4GLVhb4L
         RfRPf8+69Kg/D3IKrBE4m7vJnEEnqTEAUzC21D7PNETXXmHveR14vbL1okcti2T6fCBy
         zBjS3/pm5WNtwvBt4dL07I5l/P1jE5ZEieaHCdCxjynOGv0znvK41V/by05rCDiBjLyG
         +cVYtUWkXFzvX6WqtSrzsbIo7NmnDlx7lnJRSDklb+jk5J7fzbltE+PUQUo03jU2jmMF
         oo+upnIb/qg+tZ42wR7ZAsrhvq731U1/dTxsZgyQaXVSWIWDUz0nuYAxdT0nAdjFW8oa
         jmww==
X-Gm-Message-State: AOJu0YyQBjbCrCMiCpcrfob8AuGAMqoGTqyMhKg4ceqXNcxQPBOIzV0h
	bjQTa/5CvLnoLRqCe3QMotTSU2Y28EUVhXQHv3uWZuzBRUQLKqF144/6/p7A
X-Gm-Gg: ASbGncvpbUkrhRQJn3FJgbUvTBd2Gpp5f1cMHqox94M26gQX76avww9o24PF7N2UYS/
	+i//R+BBGs04fmEc41e74TyJDO381MYHf8IPVsFYWZC9mbFQv/w9WTMkAg0b7uTdwyxUCBHieC3
	mI2jtg+PCJPomY3ARXtZrGrMgsrI3KMXup/DV2kNkGQr68myQWPO2lt7aoShgqzOudVLiWTlNfj
	gkT/40VtBhugx85cGsTCHeSp+sk/QoWgxnjNebxjrHhpqz0TNzY3XabTWTYYBdo8e55hLcV1iR+
	P/rH2qfN0JJ4N7xwtNGXNUgqlvFt/jVGT2YhOaP35naL4z6A4mdm4txKZo0N4N781lvaW09l/0d
	62GApExo=
X-Google-Smtp-Source: AGHT+IFjpHN0xZoCcZUduLKfujWp5vHpXyXTxUoTKCBgPk+QMsYuOLzHGjHXsdrGudc6XJOLRfd/aQ==
X-Received: by 2002:a05:6122:168c:b0:52a:ee11:ed76 with SMTP id 71dfb90a1353d-52c440cf9f1mr1705620e0c.5.1746691117027;
        Thu, 08 May 2025 00:58:37 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52ae41f0b13sm2894843e0c.41.2025.05.08.00.58.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 00:58:35 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-524168b16d3so516044e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 May 2025 00:58:35 -0700 (PDT)
X-Received: by 2002:a05:6102:3352:b0:4c1:7be4:eb61 with SMTP id
 ada2fe7eead31-4ddad0d4b11mr2044441137.25.1746691115415; Thu, 08 May 2025
 00:58:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <874ixxcg3w.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <874ixxcg3w.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 May 2025 09:58:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUima_gPB8RNM-=JOR3uL4PBTG-O3FgEF9bFuH7E898wQ@mail.gmail.com>
X-Gm-Features: ATxdqUFQ1rr08A6JkA1CbEF01nRejOBL5CKDotYdQ5oeF8FmTkxqmkborL6i1SU
Message-ID: <CAMuHMdUima_gPB8RNM-=JOR3uL4PBTG-O3FgEF9bFuH7E898wQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: tidyup MSIOF Sound
 setting samples
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

On Wed, 7 May 2025 at 04:24, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Sparrow Hawk has Headset (CONN3) AUX_IN (CONN4) for Sound input/output
> which is using MSIOF. It needs DA7212 codec setting to use it, and
> is difficult to understand for beginner. Let me explain a little more
> in detail.

Thanks for your patch!

> Suggested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

As I haven't sent a pull request yet for commit c29748ccad8841d7
("arm64: dts: renesas: sparrow-hawk: Add MSIOF Sound support") in
renesas-devel, I will fold this into the original.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

