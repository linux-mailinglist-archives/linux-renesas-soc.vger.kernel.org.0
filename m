Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7AAC3F5F99
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Aug 2021 15:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234695AbhHXN4m (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Aug 2021 09:56:42 -0400
Received: from mail-vk1-f179.google.com ([209.85.221.179]:44693 "EHLO
        mail-vk1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237535AbhHXN4j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Aug 2021 09:56:39 -0400
Received: by mail-vk1-f179.google.com with SMTP id n200so5532970vke.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Aug 2021 06:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S8hP4pVddrWImbh6fCLaXB99hmcWtMRQBThCoTN0H6s=;
        b=pKajhB6kjNSSnPWrgfrEekKYXrC9r5IkXYWZKTaG3LjK6FOBog7VNRluI5b2/jsFV/
         iHyBtU7Wlz4/Nn4rLSd0VxAFOvMwJQMWJt8eQ9Vq3xiO508fkZMq61j8Suo4CncPwm1a
         Vn+uy/nmw+1aXUGhfFB1g0E0CP+jq8xS+vcvbqF+o6f6LricvXkUmUQq5A4L/xBpBe0G
         K0is/4tMNt88O+GJBcMPXTzS7NMcWtihMNtlvnwBZVjoFY6TbdRItCk4VBp0yhdgZOvk
         k44h7m9qj5LNYVe9A9g/5oAbxBocDj5pYrZqpkovKuqM3DzM5E9HAekB6vIdQ3FVfAVN
         ewaw==
X-Gm-Message-State: AOAM532LbSFNz6qjcJSlNWna5imaSPs0PjOGgyDJNyKEKfecNdBJ5ja4
        iJaCQ/fFzOL78Hd6rpIJ9JPVMC19tWYqCSYtlTc=
X-Google-Smtp-Source: ABdhPJwOAVxPzgJVnsFrTLNfWZ/oMMEIpSzQrTS/Wb0ggwHzX527BJKiGPZFrjZHNpbcPeMgxnT0ww/YoTKznMwX8xk=
X-Received: by 2002:ac5:c85c:: with SMTP id g28mr25592892vkm.5.1629813354638;
 Tue, 24 Aug 2021 06:55:54 -0700 (PDT)
MIME-Version: 1.0
References: <83672ee76f6405c82845a55c148fa836f56fbbc1.1629465282.git.robin.murphy@arm.com>
In-Reply-To: <83672ee76f6405c82845a55c148fa836f56fbbc1.1629465282.git.robin.murphy@arm.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 24 Aug 2021 15:55:43 +0200
Message-ID: <CAMuHMdXL7ZtY8kBx=RHsRy1JECsGPDe+E3SM=--w7bUHMYHFBQ@mail.gmail.com>
Subject: Re: [PATCH] iommu/io-pgtable: Abstract iommu_iotlb_gather access
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        kernel test robot <lkp@intel.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Robin,

On Fri, Aug 20, 2021 at 3:22 PM Robin Murphy <robin.murphy@arm.com> wrote:
> Previously io-pgtable merely passed the iommu_iotlb_gather pointer
> through to helpers, but now it has grown its own direct dereference.
> This turns out to break the build for !IOMMU_API configs where the
> structure only has a dummy definition. It will probably also crash
> drivers who don't use the gather mechanism and simply pass in NULL.
>
> Wrap this dereference in a suitable helper which can both be stubbed
> out for !IOMMU_API and encapsulate a NULL check otherwise.
>
> Fixes: 7a7c5badf858 ("iommu: Indicate queued flushes via gather data")

Is this the right Fixes tag?

The build issue was introduced by:
Fixes: a8e5f04458c4e496 ("iommu/io-pgtable: Remove non-strict quirk")

> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Thanks, this fixes the build issues I was seeing.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
