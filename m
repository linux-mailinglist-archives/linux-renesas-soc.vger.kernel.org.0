Return-Path: <linux-renesas-soc+bounces-23880-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB254C1BFD2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 17:15:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EDA619C032F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 16:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8A134AB04;
	Wed, 29 Oct 2025 16:08:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C2F347FEE
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 16:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761754104; cv=none; b=sIrNqJRP8ey84y6KePyVAMBdbPVFsJqvcKB0XOwSF1YTfXQan4d2xNBoDeibrNvz+jWoBtBCuVfm+4+T+NPod7EcRygRA4x4MR/dwGj31xCCso3ncz2qJ5C52cS4jr4kGvsO5n1La6f9OSmDG7Tg7uLrPfOqOUIbqIl0O+yowkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761754104; c=relaxed/simple;
	bh=x7hF+/Cp6WC101sN6xlMTM+BgF2Pmoe9fIFD9LQyyDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lpAa2tdDySAUI3JCFIptdNsIq8zVYI3+8/RKmP3nfxMIQef206jGZKUT8umrHsjrCND1fRaROEvpV/LdJ/tc1Ks015I+5GfScVWL86UnNZ35vdrh4PoOpIfTfhmFjFmE77MIjH4MkrqMkj2YewcthI/T+FwfHJdV+EX1CkW/7Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-54bc08ef45dso3877e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 09:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761754101; x=1762358901;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N/ipYGthC0MioeorbLHvDmgjrqF5uNCNGBSSRMGKMZ4=;
        b=XljJHd31pUdg0VWfkNhBp8IQOdVsq1UHyCU0acbGylfyPJuVQabt2jPnHdk+z/X0w5
         83sbgl0wvBZkiOOm0qMZqjpYfn+lUgGapN4C7mGw0DBQJ99GjfK8CckZWR/E9JDT4Hls
         W5LWe346XrLY4bB8XrwrYE7FXVPMKFZrPpf3LwKanuD3MAMgZn2ElHomyI2xDcrPInNk
         NuTPLr21K3DZ44zwyvG3qBLqAyye6eWivGKBrd67DSmWpKFnkPiHZ0ZCZpkYrwqm39je
         rSA60oxNWBPkEfQ5JJP2xsdZdYeuwKLMyvl7h4zPU5OY18+HM89unN7hIhvsyzdUmcQs
         3+cw==
X-Forwarded-Encrypted: i=1; AJvYcCWYXzRGfweA3DHFUXG+MUjHd5rXGsXeYiAcFO7hdTgIKtGXo/L2eJR3MvnuwaGGA7+kUBS1JKNC47BBV5mIhtuKNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ7hx9ygK5OGOsc+t1ZA4PshwmfuL6SL+oJSLZtB1uEoPs2ryI
	uJJLMb/BHzl6lZHgPE1E086A3qoSZMNW+jYqUABnzL4nDFAv4k/z/T5CbEIkJBeP
X-Gm-Gg: ASbGncsehISFdoQf0TUkkb9SM/1imzw04r7ckpeFLQHYcb+euEQtFYurBVvIwGvNiaF
	XL0vrxel83YwgJlNjjTJwkBRJtOPquH3ga8p1iGTkaGjeFIgyU6PstJLgpXtjUMcYkvV21/GY9R
	NBK8uKnPPyDQCU+XTuVWjPENqK0/rt6XCj8ZJR8GheGMZ46mKTOPDnpFKEboHm3aJN9rWZcMqZy
	q/hJ29hwTx3Qea7ONy+RHC+kkPJQbYoYMjTlkcjrvz9MX049RbipDKY08m1xxeNQ/oLH1y9wMNv
	Em3VO+XhfStyT7dkuKStrh4bb3C+R++Ho+/eMJnc0aRl7dmbckAUOET0LmT5YHsuuNn34Zr+VLb
	JFQZiKPHNKn6fiNcvzwoLKabWMhtk+ASHfQgJNTedvpoJoEThOHNII7EdmLGnLmF2Mmp/cmnFkI
	osTkfpHEMQU5gvzsc83uCGJRVcK1MNa4D1dQyXbckhAghN/JLNG2mu
X-Google-Smtp-Source: AGHT+IE3WTRH2mIos0L4HYcUGEM0aah6qJQEiETNyF+W3xa8B2PrPOMx4PgSFXBPxOM1RovD7a8dKw==
X-Received: by 2002:a05:6122:32c9:b0:556:3bd1:85aa with SMTP id 71dfb90a1353d-5581412697amr1148958e0c.8.1761754100717;
        Wed, 29 Oct 2025 09:08:20 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557ddb08b9bsm5597135e0c.6.2025.10.29.09.08.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 09:08:18 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5db3b074f58so55445137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 09:08:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUoyT6PLfDcHiHJdDQpCc45pPKFD0FP9kgAP9rjyt50+1GrKM+8xYDV25CveYm5DqCXY/PjTjFmdgrzpQ57aMSIlQ==@vger.kernel.org
X-Received: by 2002:a05:6102:4a89:b0:5d6:1564:d7f1 with SMTP id
 ada2fe7eead31-5db906b8f37mr1467931137.36.1761754098557; Wed, 29 Oct 2025
 09:08:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027004816.562965-1-den@valinux.co.jp>
In-Reply-To: <20251027004816.562965-1-den@valinux.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 17:08:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVtR_8OZG2XrD5PHY+ybaH4dudya4VXNXD3iHktdDyF8w@mail.gmail.com>
X-Gm-Features: AWmQ_blrV7P_F3R16HOIrRem1UqE4h3nEa2JhxUtyuN9Q8vEJnpLXJhqDTLYNJo
Message-ID: <CAMuHMdVtR_8OZG2XrD5PHY+ybaH4dudya4VXNXD3iHktdDyF8w@mail.gmail.com>
Subject: Re: [PATCH] iommu: ipmmu-vmsa: Add DMA controllers to devices_allowlist
To: Koichiro Den <den@valinux.co.jp>
Cc: iommu@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com
Content-Type: text/plain; charset="UTF-8"

Hi Den-san,

On Mon, 27 Oct 2025 at 02:26, Koichiro Den <den@valinux.co.jp> wrote:
> Add Renesas DMA controller devices to the devices_allowlist to enable
> their use with the IPMMU. This allows DMA channels to operate through
> the IOMMU when enabled.
>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>

Thanks for your patch!

> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -741,7 +741,9 @@ static const char * const devices_allowlist[] = {
>         "ee100000.mmc",
>         "ee120000.mmc",
>         "ee140000.mmc",
> -       "ee160000.mmc"
> +       "ee160000.mmc",
> +       "e7350000.dma-controller",
> +       "e7351000.dma-controller"

While your change looks correct to me, it causes DMA mapping failures on
Gray Hawk Single and Sparrow Hawk when IPMMU support is enabled
(on renesas-drivers-2025-10-28-v6.18-rc3 with renesas_defconfig
+ CONFIG_IPMMU_VMSA=y):

    rcar-dmac e7351000.dma-controller: chan1: failed to map 1@0x00000000e656000c
    sh-sci e6560000.serial: Failed preparing Tx DMA descriptor

0xe656000c = HSCIF2 Transmit FIFO data register.

With "#define DEBUG" added to drivers/dma/sh/rcar-dmac.c:

    rcar-dmac e7351000.dma-controller: chan1: failed to map 1@0x00000000e656000c
    sh-sci e6560000.serial: Failed preparing Tx DMA descriptor
    rcar-dmac e7351000.dma-controller: chan2: map 1@0x00000000e6560014
to 0x00000000fff82014 dir: DMA_TO_DEVICE
    rcar-dmac e7351000.dma-controller: chan2: chunk
00000000e5110c20/000000005e0ede90 sgl 0@000000000d8c5440, 256/256
0x00000000fff82014 -> 0x00000000ffed6000
    rcar-dmac e7351000.dma-controller: chan2: submit #2@000000005e0ede90
    rcar-dmac e7351000.dma-controller: chan2: chunk
0000000025f2f66c/00000000e5f0dd15 sgl 0@0000000064f1067f, 256/256
0x00000000fff82014 -> 0x00000000ffed6100
    rcar-dmac e7351000.dma-controller: chan2: submit #3@00000000e5f0dd15
    rcar-dmac e7351000.dma-controller: chan2: queue chunk
00000000e5110c20: 256@0x00000000fff82014 -> 0x00000000ffed6000

0xe6560014 = HSCIF2 Receive FIFO data register

Comparing to the CONFIG_IPMMU_VMSA=n case:

    rcar-dmac e7351000.dma-controller: chan1: map 1@0x00000000e656000c
to 0x00000000e656000c dir: DMA_FROM_DEVICE
    rcar-dmac e7351000.dma-controller: chan1: chunk
0000000096396eb4/00000000f35357b6 sgl 0@0000000013546bf6, 74/74
0x0000000489ab5000 -> 0x00000000e656000c
    rcar-dmac e7351000.dma-controller: chan1: submit #2@00000000f35357b6
    rcar-dmac e7351000.dma-controller: chan1: queue chunk
0000000096396eb4: 74@0x0000000489ab5000 -> 0x00000000e656000c

This confuses me even more: why no DMA_TO_DEVICE mapping in the
latter case?

>  };
>
>  static bool ipmmu_device_is_allowed(struct device *dev)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

