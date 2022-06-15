Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1D7954C28B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jun 2022 09:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241560AbiFOHUy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jun 2022 03:20:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239815AbiFOHUy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jun 2022 03:20:54 -0400
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60F0A43AC3;
        Wed, 15 Jun 2022 00:20:53 -0700 (PDT)
Received: by mail-qk1-f179.google.com with SMTP id d23so8166785qke.0;
        Wed, 15 Jun 2022 00:20:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IZrgGy//qiNvpo0QiFkOVNBs87FgtEm52Qgjyjrw9DQ=;
        b=eLYFNRbSkngvX9cT9qKYJiog9ols/+BultjfnLFLokwdOmNsfq51q7Hx4cDmsqWA8K
         fYSj/yh4jzD8c2UpLc5KEf9hMT6qa3PefqFiZ5BAEdk8KxGroLE41H9Xt2+PtMxG06QR
         nwY2IgWOjiQWeYIWhb1kd6OmzRNXO6eO/GW3AuaZBcedFNEMyrAZnD3UaEa/84JHC+N8
         mussj/TGMAUx2cfGDV+/mt26HW/YeKisNoDs4z6+GM+dFkyuKZE5LjEz/xGVFU0VgxGb
         IgEbz0FpgW8iQM9hfn/UFGhJJxJ9K0PsqcXVFtWPNGyqZvagefOkVwZgQSW3NJK1BCYw
         nx+g==
X-Gm-Message-State: AOAM532XbTpjWKCCEn/ulEEn5CZQDPpUYXDmwr9CcPF4ZVBYSaaMSiaz
        e9jUJl1dnoeaqR9Gs5TEn8vzDbaIQX3cLw==
X-Google-Smtp-Source: ABdhPJyfKji0R8TUKNkLqgxnO2bQ5ni5SYp/lhgx+0thb8SfT/HgK1WZU261Pflc4Qs3BOV/I2VjAQ==
X-Received: by 2002:a37:7d5:0:b0:6a7:7ea0:87be with SMTP id 204-20020a3707d5000000b006a77ea087bemr7225798qkh.458.1655277652325;
        Wed, 15 Jun 2022 00:20:52 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id bj25-20020a05620a191900b006a69d7f390csm11538409qkb.103.2022.06.15.00.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 00:20:51 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id w2so18996993ybi.7;
        Wed, 15 Jun 2022 00:20:51 -0700 (PDT)
X-Received: by 2002:a25:818c:0:b0:664:a584:fafd with SMTP id
 p12-20020a25818c000000b00664a584fafdmr8856194ybk.543.1655277651264; Wed, 15
 Jun 2022 00:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220603110524.1997825-1-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWY7OpB=F3sUoBEpMyJx9U=+YJBFrVd59y=wdsEvN=4JA@mail.gmail.com> <yq11qvqskps.fsf@ca-mkp.ca.oracle.com>
In-Reply-To: <yq11qvqskps.fsf@ca-mkp.ca.oracle.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Jun 2022 09:20:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVR2=VHUxfDTukDt7rSOPBYCFr3qXQzZNTdkw9Z-jEBkg@mail.gmail.com>
Message-ID: <CAMuHMdVR2=VHUxfDTukDt7rSOPBYCFr3qXQzZNTdkw9Z-jEBkg@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] treewide: ufs: Add support for Renesas R-Car UFS controller
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Alim Akhtar <alim.akhtar@samsung.com>, avri.altman@wdc.com,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        scsi <linux-scsi@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Martin,

On Wed, Jun 15, 2022 at 4:54 AM Martin K. Petersen
<martin.petersen@oracle.com> wrote:
> > I see you have applied this series, including the DTS parts, to your
> > for-next tree. Please never apply DTS patches to the SCSI tree, as
> > they are meant to go in through the soc tree.
>
> OK. Just queued it up in for-next to see what would break. It's not in
> the actual queue for 5.20.

IC. How will I know when they are queued for real?

> > Can you please drop the last two patches from your tree?
>
> Sure. I can also wait with the rest if you prefer?

No need to wait with the rest, unless you are not happy with it yet?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
