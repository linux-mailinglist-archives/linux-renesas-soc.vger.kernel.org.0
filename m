Return-Path: <linux-renesas-soc+bounces-14799-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4FDA70508
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Mar 2025 16:29:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8CF53BDD7F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Mar 2025 15:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B04AA25D551;
	Tue, 25 Mar 2025 15:26:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAC425D529
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Mar 2025 15:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742916384; cv=none; b=M0lqkyxrUp+z79ZaDkO/GSL9nmooa7dg8IqKcp2RGQIE5R1F/tl0wTOE/hXsUU6HslMEpuCnc2lib5p2qohdr/RMZXNhtuQW4HZgzuagElQzgb03x8RIwaA02HDWwY65dB56nV3tldnR9eFKRI3M53eyOMSI/mi1AVQKQZ3FU6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742916384; c=relaxed/simple;
	bh=KsyhWDZ9vz2zVV4SSVoQ1RCE2E0KDLZcwTuZVzKJ4U8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cBPbcjxCTM3fdRp8UhtuQ5H1U6q8iJEMxzKe6qfeeBPMwZwsPRlwFapyOb8pPj1rVW8QZ2PJPOK4lL/ymg3bj7hteZT58Q9nvHF3P/gHuYKOHXvF2PTFr/oPGUE1w9pt7GSQkbp4Iap1MTCoGlrxG1OKjEYpF192+M4W/K4BLJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac25d2b2354so958954966b.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Mar 2025 08:26:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742916379; x=1743521179;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ey1ptOkb7OET1t+PI+4h/aljRyEZhfbvKjRYRUk152Y=;
        b=OfAOvFj/1Otawvq/OsTByB1JxFfDPlKNtM5p7Y/4w0r+4IudnQM+F8nF/FPbne4tV9
         VerHcPf9dXFHjPChgflHN6dX2N42mXsZ4HQ8gb9iuDuAc3PmyuO+C8cWVZC1/DEKQ8Au
         +9VLheN/+3tJ6jdXAbBncDyv4OiN4idj+BOT8wB44qrTxSdOqi7OA0VAxSLoBqzF/92l
         25cCVBd8Tykvi7bcN4bSvHdvvxpe+PMZRz70ty4MNltWveoHMMQZU8pmMpuV/zuHeHsn
         nithPyCUcN4nlO98z2YwKcwXzR/P2ebLPE21Kt0jzMV3MRolu4kpRBEPn0UmKfXx+jsF
         4paA==
X-Forwarded-Encrypted: i=1; AJvYcCVpPbYQ7d/9LPDF6MJlzWulFiYWRekyIIq7+j9E/jWR1sERYpRCluQVS4XQ/lAPRp20tw5omiQAZ8qF55F+9KTUUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhMEkKvVRJcRjCve6WkGdfRxycZbz+qftxvR8HJI4+8mJjaO6P
	Pdec4wM2BpsJ4yQVOH25DU9UEBC2aO69RN2mjCVpsRdJCMBbbUZpfBameUIYVRQ=
X-Gm-Gg: ASbGncvbtpbAN2pv+bnxANSi2l7klkig8dsBBgyeI6ffVwxZH9nF2ec3J4JZQG1RuMk
	9y6EsWIrmuOy+ZaLLOwCfAGVTWrkvbPrcMX8Lo9sAwZ8AZ7oKnTKTy/S79ONXspOAHjykUtNUkK
	8SiPYMOa9lxhOB91EAdISF2tcs6PtqJjLcDboaE3SE8HGdKaK5kpuCHfSc3eSoPhuTSLW20Jr0I
	eS8MFPNZIyYEBX2WNPA1iTC5OOBj0XUSYT5pV36zAt1LMov3LBQVtsYw7GO2TFIDe1NQfgwHXCZ
	Z2dog7YSndOAWuA5KRVwkWpPKBqm7yc14n+hGVUmLPSNxQJqPtRz4F92OuAoJmdfX6d4fzKpwr/
	2wByFTco=
X-Google-Smtp-Source: AGHT+IE6OpVrMfFf8/ANq0uQPbDH4VmLM+gHwlXlcbdr2pxFPyuXXk907qR+OSUMJUGlrCY7N3TqiA==
X-Received: by 2002:a17:907:c7cd:b0:ac1:ea29:4e63 with SMTP id a640c23a62f3a-ac3f2238d89mr1671674566b.26.1742916378348;
        Tue, 25 Mar 2025 08:26:18 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebcd0c7759sm7904855a12.51.2025.03.25.08.26.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 08:26:16 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so988336266b.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Mar 2025 08:26:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUwIsycpL5x0+/16LziOx46e40U7fI1FlZJHv5RiOaVSCoMht3LwmD5w9czjr1fOg87bNf7JVfSIe0z4n0Sj06AAQ==@vger.kernel.org
X-Received: by 2002:a17:907:97c2:b0:ac6:ba92:79c9 with SMTP id
 a640c23a62f3a-ac6ba927fdbmr398008166b.18.1742916376510; Tue, 25 Mar 2025
 08:26:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <53be6667544de65a15415b699e38a9a965692e45.1742481687.git.robin.murphy@arm.com>
In-Reply-To: <53be6667544de65a15415b699e38a9a965692e45.1742481687.git.robin.murphy@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Mar 2025 16:26:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUtCqwzeWY8G+yHiu4biovymDVb_UtjfYPEQYyYr+dP4Q@mail.gmail.com>
X-Gm-Features: AQ5f1JpxwyaVEoL_gG00SX4u4mmS2G73SUcVvP1i1roPtO6YBwlUw4Ll1yY2FDU
Message-ID: <CAMuHMdUtCqwzeWY8G+yHiu4biovymDVb_UtjfYPEQYyYr+dP4Q@mail.gmail.com>
Subject: Re: [PATCH] iommu/ipmmu-vmsa: Register in a sensible order
To: Robin Murphy <robin.murphy@arm.com>
Cc: joro@8bytes.org, will@kernel.org, iommu@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Robin,

On Thu, 20 Mar 2025 at 15:41, Robin Murphy <robin.murphy@arm.com> wrote:
> IPMMU registers almost-initialised instances, but misses assigning the
> drvdata to make them fully functional, so initial calls back into
> ipmmu_probe_device() are likely to fail unnecessarily. Reorder this to
> work as it should, also pruning the long-out-of-date comment and adding
> the missing sysfs cleanup on error for good measure.
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Fixes: bcb81ac6ae3c ("iommu: Get DT/ACPI parsing into the proper probe path")
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Thanks for your patch!

This fixes the

    sata_rcar ee300000.sata: late IOMMU probe at driver bind,
something fishy here!
    WARNING: CPU: 1 PID: 13 at drivers/iommu/iommu.c:571
__iommu_probe_device+0x208/0x38c

I saw on Salvator-XS with R-Car M3-N.

It does not fix the second issue reported, so it is indeed too early for a
"Closes: https://lore.kernel.org/CAMuHMdWPFnHTFeeWL2-BU8tKOL-E5K2ROOz=LLBLTJJLCK9NgA@mail.gmail.com"
tag.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -1081,31 +1081,24 @@ static int ipmmu_probe(struct platform_device *pdev)
>                 }
>         }
>
> +       platform_set_drvdata(pdev, mmu);

Nit: perhaps insert a blank line here, before the comment below?

>         /*
>          * Register the IPMMU to the IOMMU subsystem in the following cases:
>          * - R-Car Gen2 IPMMU (all devices registered)
>          * - R-Car Gen3 IPMMU (leaf devices only - skip root IPMMU-MM device)
>          */
> -       if (!mmu->features->has_cache_leaf_nodes || !ipmmu_is_root(mmu)) {
> -               ret = iommu_device_sysfs_add(&mmu->iommu, &pdev->dev, NULL,
> -                                            dev_name(&pdev->dev));
> -               if (ret)
> -                       return ret;
> +       if (mmu->features->has_cache_leaf_nodes && ipmmu_is_root(mmu))
> +               return 0;
>
> -               ret = iommu_device_register(&mmu->iommu, &ipmmu_ops, &pdev->dev);
> -               if (ret)
> -                       return ret;
> -       }
> +       ret = iommu_device_sysfs_add(&mmu->iommu, &pdev->dev, NULL, dev_name(&pdev->dev));
> +       if (ret)
> +               return ret;
>
> -       /*
> -        * We can't create the ARM mapping here as it requires the bus to have
> -        * an IOMMU, which only happens when bus_set_iommu() is called in
> -        * ipmmu_init() after the probe function returns.
> -        */
> +       ret = iommu_device_register(&mmu->iommu, &ipmmu_ops, &pdev->dev);
> +       if (ret)
> +               iommu_device_sysfs_remove(&mmu->iommu);
>
> -       platform_set_drvdata(pdev, mmu);
> -
> -       return 0;
> +       return ret;
>  }
>
>  static void ipmmu_remove(struct platform_device *pdev)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

