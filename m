Return-Path: <linux-renesas-soc+bounces-12971-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B634A2E97F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 11:33:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED0F218887BE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 10:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726821C3C0D;
	Mon, 10 Feb 2025 10:33:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646D515624D;
	Mon, 10 Feb 2025 10:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739183594; cv=none; b=G/TgK17u80K3AhSJkK8T80P19tL8OwHN//Ml4uB99/Ia18/Q2ZUFJ44iFQ4mE4SsOUz7x0A/elPbhQLHzPCQe3H2R1MIDLy7QIOIuZp4s34yqgv+GHrZuxwGKfVwawmmVB10JidBvdOVIf1keeE8w2xB5sM7IvaByk77lUYuVCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739183594; c=relaxed/simple;
	bh=PRIjYgukVL9xgLkbU+1wVGhjbrbQ2a1ytqYVNW0rzA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s5r4Yh0oZTuMOBysMM7Q4wkANWGH4BU/ES/VqIHfk+i3t6dO6+LPB8ZoOq8gOmh2tCcGLXoUPNz2K/FQaYNdEv7dotk5z3U+O0+EUJ7ewOSQ2ycQqwwij9pjLIIA3KGrOJoKCvBbWbpMCM1XcvmKhbKH+QBxNr5hHtof2ZdRWx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4ba86dee27bso915237137.3;
        Mon, 10 Feb 2025 02:33:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739183590; x=1739788390;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aUtEWKWBGl+RUz1Aa17blZ/xFUbDXxxGPDURQS+ed2U=;
        b=cbgo5X2mrmAsj+Qd08NCsCP4Q4x2e9ys7oWKOvpbeY1IXOEAp983/NHKKwuBgbx1rr
         gYB+v8J0nNDtq6Cnh1aXwoHCK6nu+9ZUA202q4TSWoaSGW1rOCMkEXBz2e5b33eu0Dhc
         B95QqQayesTPFPNF5nq/BJ+E9hdvBd9BVQ/u8FTmz4V2tage733ZJvDR3xVcn7W91ZiA
         8xErwet9Dmo7t/hONcQSK0HeACRABdlKxXf2gu/nUUajl1SGqu5ZzxY+AhXl4fYaa35w
         2KKS1J/WoyIQIKUBnT3tmmalHGQ0bmoL7olYtpj7JPOe3GrnHBb+v3zhtMrCauuQ8HYt
         oRuw==
X-Forwarded-Encrypted: i=1; AJvYcCVOXL6oN9ZG0UNl1zkkaROQDEOmUeo03ptsUM8KqwmqJOQdoYse5f2OqYYDu+ytckUl5CiCfWNbRwfmBt7c89S9/A==@vger.kernel.org, AJvYcCX+nDf4595rEscMR6rwRKV7H4AjYLZ1hwzgmN3jBQAKcuO1ROjyjvdKMLzyXUnUqguTx2wpYHZY@vger.kernel.org
X-Gm-Message-State: AOJu0YzFdwd99RaQNSbULYjZVesYiMH4terrqQJuY/BX7xgWw+iTxxOf
	3zNJw4Rfbb4IzIx9DygL9EUEKfFiFK4rWqqWp4V2p7R/0nIFoRFWUmj1kVOf
X-Gm-Gg: ASbGncv2evASU0VkeTGArt9RBXRTV37GHr8uWWb4qKQSsgaNyp1/nztllgPtzF4gatl
	kVjubUk1hY7J7pmrAs2E7jLzYm5L5s6uEUkZ5gKrycjIl4eiLQKkpMnuUYXq3L7B0ZyLqCojawH
	8jcpyf1gT906EBR9fzRdo7K2nGs4oSUKMzwqzrqVQBQjw01oS5YZ0WG/WV3DVhnlLwCPOcPZnA0
	GHwF7Wv3abUp0NczndNvVVMp0HO5MMDU1t+18Sc874p0BDkWDh2FoNhDOzn9d4UWpMmwgM9/2EE
	4Ps4TR2wKciBXzdbVvCiDcPxNnIX1tXAO+kmbxNkJvrSavjlkDCDzQ==
X-Google-Smtp-Source: AGHT+IGr1wI/ui11E/7W4s+nrw9dlq/BMYZbSD+t+rtOTgS2KEyBzyXBxmMw9XgsKhHMKKkLMHE8vw==
X-Received: by 2002:a05:6102:441f:b0:4b4:7cb0:ac99 with SMTP id ada2fe7eead31-4ba85da2bf5mr7484459137.2.1739183590079;
        Mon, 10 Feb 2025 02:33:10 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4bbcf5660c0sm258639137.18.2025.02.10.02.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 02:33:09 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-864e4f5b253so1114230241.1;
        Mon, 10 Feb 2025 02:33:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU3G0SoTFix7+61Kx4/iHQTsZtJOyoIRjLhiackMvxTXNJjfrhUNJuHC1jCxXwf9XXWmBx9EaVciPoj/H98ni2elQ==@vger.kernel.org, AJvYcCWRCqVDd2wsg2wUbNiYEPoZxySGQTYDpKC1EEyk5uXjDo4gfuqZAQF7+P2owClc5iB1A7h2yNmm@vger.kernel.org
X-Received: by 2002:a05:6102:3046:b0:4b2:48cc:5c5a with SMTP id
 ada2fe7eead31-4ba85e8d160mr8493000137.15.1739183589499; Mon, 10 Feb 2025
 02:33:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209145708.106914-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250209145708.106914-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Feb 2025 11:32:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX9krvWfZma-A_X6O18q0J8+jizEDL0C8rkoEXpk2KiAw@mail.gmail.com>
X-Gm-Features: AWEUYZkwJD0lEVOPrylUzlQHEumsgN92-kbxnCCiZTEdO_bmGEawanoxd2ni2JQ
Message-ID: <CAMuHMdX9krvWfZma-A_X6O18q0J8+jizEDL0C8rkoEXpk2KiAw@mail.gmail.com>
Subject: Re: [PATCH] USB: cdc-acm: Fill in Renesas R-Car D3 USB Download mode quirk
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-usb@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Oliver Neukum <oneukum@suse.com>, linux-renesas-soc@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sun, 9 Feb 2025 at 15:57, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add Renesas R-Car D3 USB Download mode quirk and update comments
> on all the other Renesas R-Car USB Download mode quirks to discern
> them from each other. This follows R-Car Series, 3rd Generation
> reference manual Rev.2.00 chapter 19.2.8 USB download mode .
>
> Fixes: 6d853c9e4104 ("usb: cdc-acm: Add DISABLE_ECHO for Renesas USB Download mode")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

Still true in Rev.2.40 of the documentation ;-)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

