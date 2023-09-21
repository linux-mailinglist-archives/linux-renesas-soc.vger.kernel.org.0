Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50FC27A9F50
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Sep 2023 22:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231648AbjIUUUz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Sep 2023 16:20:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232031AbjIUUUO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Sep 2023 16:20:14 -0400
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6923566D2;
        Thu, 21 Sep 2023 10:18:01 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-76d846a4b85so474576241.1;
        Thu, 21 Sep 2023 10:18:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695316681; x=1695921481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NO0yqQguls8fEFEOgHbqQzy4RYylK/iX7jORUKeFHng=;
        b=Jutdcrnp+rJ4XZe6BL5uPIVaazcY3jmqsNr+joD/UkH+B/umwOLuKw54YvKAXUPp8z
         QwGIyTgitzm/hnJFPregpzPliIFeXiBjPOURIXP9xq2LIJReTzMA2oodEClVwTJ6+y/U
         cfdfLIX/vH9vF1nfJr7NsNrVuMW/PrqvESJCwWWidCCMls8H+y+7X/lY9mVvLWSW2z4I
         hWAzp6TxNIzT9l6+iyBI+CcKfvO59oOQvumnqQ+jAwrU9sTCI4HfJMU0RsAJZV9ULIh2
         G3e2xo5Q194EDh1Salh/FpW22tsliy+h46HIyDcgDro8KebHS9lssJssJWuIJ4jrzKHG
         3u8w==
X-Gm-Message-State: AOJu0YwstSHjhd8bejqascd3i3ObC0SWVQaVXHp3YJIrZz7H+lmmg4zy
        gWTQr0RZ84SI1yGBh7B1Okv5OAWJWe7Uz5WF
X-Google-Smtp-Source: AGHT+IEaOjq+6yCoT0ifd/ilRJd7IkoMM9BERuexe9lXdiGIKZrTtKBbG0H7qcTLTwY+ssFbz2aS2Q==
X-Received: by 2002:a81:4ed3:0:b0:57a:8de9:16a3 with SMTP id c202-20020a814ed3000000b0057a8de916a3mr4874119ywb.8.1695288124230;
        Thu, 21 Sep 2023 02:22:04 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id f184-20020a0dc3c1000000b0059af121d0b8sm235845ywd.52.2023.09.21.02.22.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 02:22:03 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-59be6605e1dso8931557b3.3;
        Thu, 21 Sep 2023 02:22:03 -0700 (PDT)
X-Received: by 2002:a0d:d8d7:0:b0:58f:9696:842d with SMTP id
 a206-20020a0dd8d7000000b0058f9696842dmr4800813ywe.15.1695288123555; Thu, 21
 Sep 2023 02:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230920135439.929695-1-dlemoal@kernel.org>
In-Reply-To: <20230920135439.929695-1-dlemoal@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Sep 2023 11:21:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWHXC=qPTcLS9VeqfFy7Js84pd84oZqqWdd7E+bAHrcqw@mail.gmail.com>
Message-ID: <CAMuHMdWHXC=qPTcLS9VeqfFy7Js84pd84oZqqWdd7E+bAHrcqw@mail.gmail.com>
Subject: Re: [PATCH v4 00/23] Fix libata suspend/resume handling and code cleanup
To:     Damien Le Moal <dlemoal@kernel.org>
Cc:     linux-ide@vger.kernel.org, linux-scsi@vger.kernel.org,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        John Garry <john.g.garry@oracle.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Paul Ausbeck <paula@soe.ucsc.edu>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Joe Breuer <linux-kernel@jmbreuer.net>,
        Chia-Lin Kao <acelan.kao@canonical.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Damien,

On Wed, Sep 20, 2023 at 3:54 PM Damien Le Moal <dlemoal@kernel.org> wrote:
> The first 9 patches of this series fix several issues with suspend/resume
> power management operations in scsi and libata. The most significant
> changes introduced are in patch 4 and 5, where the manage_start_stop
> flag of scsi devices is split into the manage_system_start_stop and
> manage_runtime_start_stop flags to allow keeping scsi runtime power
> operations for spining up/down ATA devices but have libata do its own
> system suspend/resume device power state management using EH.
>
> The remaining patches are code cleanup that do not introduce any
> significant functional change.
>
> This series was tested on qemu and on various PCs and servers. I am
> CC-ing people who recently reported issues with suspend/resume.
> Additional testing would be much appreciated.
>
> Changes from v3:
>  * Corrected pathc 1 (typo in commit message and WARN_ON() removal)
>  * Changed path 3 as suggested by Niklas (moved definition of
>    ->slave_alloc)
>  * Rebased on rc2
>  * Added review tags

Thanks for the update!

I gave this a try on Renesas Salvator-XS with R-Car H3 ES2.0 and
a SATA hard drive:
  - The drive is spun up during system resume,
  - Accessing the drive after the system was resumed is instantaneous.


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
