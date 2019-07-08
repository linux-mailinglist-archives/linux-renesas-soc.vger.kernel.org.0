Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7ACC961DE5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2019 13:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729482AbfGHLqc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jul 2019 07:46:32 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:41885 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727415AbfGHLqc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jul 2019 07:46:32 -0400
Received: by mail-vs1-f65.google.com with SMTP id 2so7972849vso.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jul 2019 04:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R2ZdY3vnEp0/xxIG9ODcbL1P9vx2puRdU7JsuqsdsDE=;
        b=lOuDWrVlmU37BJpmIdi5RO/Gmtkght9XnLNIHFt4VfvVfB85rutsfvBlEEBA90kBrk
         u70O+fr8GhG0CgxszBykj2/yiSbIqJCp0/L2i2/A3IktViPEA7RkHOvG6dAzlVheB+yT
         FEYdveLceIA42kJWkicK26TivzVUu9pvBMeoH471i7ECnJ8ndMF6Qb9sTo4KHw8ziwU4
         3IilPOvwiloO1NR/U/DvitYhtppqAbmPjVkvorKXhzUTEJKqhpzy1hFWz5cgPooUXrSs
         OVeaJ/rIVJc1Eiuoxj/gwewyiQ3rbLfsBRg9VQjWazy+XR24Crj3d6W8I6Kd7PExdRPQ
         7t8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R2ZdY3vnEp0/xxIG9ODcbL1P9vx2puRdU7JsuqsdsDE=;
        b=frpSFnQmJDE+Hcq8ZdwuA86ZdX9WQ1QCZVbiLCJMQZ8OXDdBcXNRNPiBZHBLae2be0
         hwW4qyCljDRnJ/O49PQY3H7+mO9Fy0yqaAeOqhnXaUuca6WYta2igyyyUocFR7BSCwQl
         f+f8MbgxR8foSXdvzwnzF1FK6EALwI2qZ3NhvwRQ8VHIK64XdxWI8n2TLiMLH14CvUY1
         Kre+KOvF2bVSg0JNmGDJMgbnr86c6XPRz5PY4OXWIhwj62yNnL0OXQCeSP+an324dFTM
         DDz0ctgp193jFE8yQP6xt/d2Vh9reNy5pRhyoMlJcfGb5Y0/OvnSq3/vZcPIBVZbr9LZ
         kJew==
X-Gm-Message-State: APjAAAXSHiMyCPSIU0jFwOrGf7nxBRVOKUmvbsGV0/UtIyQVpuAGEKqc
        LtjIKG6E1VISXQ2a0LsDAXpptoOSTg7QzNkrCBxHhg==
X-Google-Smtp-Source: APXvYqz/0AeZ3lpWjyWdDtbRymPqi8GXkj3SOZMAZXHn0JyhhB2oxU3RiSdU8S5bXxz39obVN9uEBxKyU4CHxLWaA00=
X-Received: by 2002:a67:ee5b:: with SMTP id g27mr9861928vsp.165.1562586391357;
 Mon, 08 Jul 2019 04:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <1561020610-953-1-git-send-email-yoshihiro.shimoda.uh@renesas.com> <20190701083253.GA22719@lst.de>
In-Reply-To: <20190701083253.GA22719@lst.de>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 8 Jul 2019 13:45:55 +0200
Message-ID: <CAPDyKFpg6zMRtnD89juuXR8Epas7qJOo8GgdTR=Q1kbZ0=69LA@mail.gmail.com>
Subject: Re: [RFC PATCH v7 0/5] treewide: improve R-Car SDHI performance
To:     Christoph Hellwig <hch@lst.de>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <joro@8bytes.org>,
        Jens Axboe <axboe@kernel.dk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        linux-block <linux-block@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 1 Jul 2019 at 10:32, Christoph Hellwig <hch@lst.de> wrote:
>
> Any comments from the block, iommu and mmc maintainers?  I'd be happy
> to queue this up in the dma-mapping tree, but I'll need some ACKs
> for that fast.  Alternatively I can just queue up the DMA API bits,
> leaving the rest for the next merge window, but would drag things
> out far too long IMHO.

Apologize for the delay, the mmc parts looks good to me. If not too
late, feel free to pick it up.

Otherwise, let's do it for the next cycle.

Kind regards
Uffe
