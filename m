Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DC5F7A9682
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Sep 2023 19:11:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbjIURBW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Sep 2023 13:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbjIURBF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Sep 2023 13:01:05 -0400
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF98FCFC;
        Thu, 21 Sep 2023 10:00:31 -0700 (PDT)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1c1e3a4a06fso9671505ad.3;
        Thu, 21 Sep 2023 10:00:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695315510; x=1695920310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=idFDQKNDkzP5RSqt/nkSyZRNM7uFs093DSH/JN+PAAU=;
        b=fFTvydo4h1rhHMSkuOsaU5d86+b6eIFARZ0Msf8qKg6gcPKeNpiGggU4mw2y577Tkn
         CXCoDADizXKU8O4IYhUrbqE0cI0NJp0F6D2+X6e7Zl/7u13hIuDwo0uSh6Ot7OsNtJ7/
         CiLF9+nQax0U9bpa+WTt80G8o7LaipzfhE9KDx/XtfIA7p7rPr4JHqKBOcrf9gl2P/8E
         6bajL0LNKsbttu4j+xti70fwazDlyPjV6msd5UK8vy596KQvlkGl/VU4KQL56vX8YL5n
         sX7OgZ+YwMfHwmyzGJGbAxSIGkVptjOfD4Zomitiik0sU6UoOtMsOAZhHVz8DAwQzeYS
         /nQQ==
X-Gm-Message-State: AOJu0YwPdTMzzJQXtPnJUswQNN11fUB1WWidrKBLYNRIGihuXgsTmK+O
        LzMw7PEabOis5DmtZ/UHHn2xtr9DrjYHgUaF
X-Google-Smtp-Source: AGHT+IG9TawMETPzBfgvTvEik3uLo+46CYkwSSW145R4ndL8xfUPnjLov+cYq7MQY9IKWRebCjtByg==
X-Received: by 2002:a81:4f4a:0:b0:576:7dfc:e73e with SMTP id d71-20020a814f4a000000b005767dfce73emr5263457ywb.32.1695288144779;
        Thu, 21 Sep 2023 02:22:24 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id x202-20020a81a0d3000000b0057399b3bd26sm232511ywg.33.2023.09.21.02.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 02:22:24 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-59c0442a359so9002237b3.0;
        Thu, 21 Sep 2023 02:22:24 -0700 (PDT)
X-Received: by 2002:a0d:ea15:0:b0:59b:c11:ad7c with SMTP id
 t21-20020a0dea15000000b0059b0c11ad7cmr4927105ywe.18.1695288143988; Thu, 21
 Sep 2023 02:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230920135439.929695-1-dlemoal@kernel.org> <CAMuHMdWHXC=qPTcLS9VeqfFy7Js84pd84oZqqWdd7E+bAHrcqw@mail.gmail.com>
In-Reply-To: <CAMuHMdWHXC=qPTcLS9VeqfFy7Js84pd84oZqqWdd7E+bAHrcqw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Sep 2023 11:22:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXeeDNjwErH7HfCtnxSYF2o-6ZnkDuOe8u_mX14WKqqBQ@mail.gmail.com>
Message-ID: <CAMuHMdXeeDNjwErH7HfCtnxSYF2o-6ZnkDuOe8u_mX14WKqqBQ@mail.gmail.com>
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
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Sep 21, 2023 at 11:21 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Wed, Sep 20, 2023 at 3:54 PM Damien Le Moal <dlemoal@kernel.org> wrote:
> > The first 9 patches of this series fix several issues with suspend/resume
> > power management operations in scsi and libata. The most significant
> > changes introduced are in patch 4 and 5, where the manage_start_stop
> > flag of scsi devices is split into the manage_system_start_stop and
> > manage_runtime_start_stop flags to allow keeping scsi runtime power
> > operations for spining up/down ATA devices but have libata do its own
> > system suspend/resume device power state management using EH.
> >
> > The remaining patches are code cleanup that do not introduce any
> > significant functional change.
> >
> > This series was tested on qemu and on various PCs and servers. I am
> > CC-ing people who recently reported issues with suspend/resume.
> > Additional testing would be much appreciated.
> >
> > Changes from v3:
> >  * Corrected pathc 1 (typo in commit message and WARN_ON() removal)
> >  * Changed path 3 as suggested by Niklas (moved definition of
> >    ->slave_alloc)
> >  * Rebased on rc2
> >  * Added review tags
>
> Thanks for the update!
>
> I gave this a try on Renesas Salvator-XS with R-Car H3 ES2.0 and
> a SATA hard drive:
>   - The drive is spun up during system resume,
>   - Accessing the drive after the system was resumed is instantaneous.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
