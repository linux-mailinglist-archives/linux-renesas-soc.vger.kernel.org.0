Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 096647CC110
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Oct 2023 12:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234809AbjJQKwD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Oct 2023 06:52:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234622AbjJQKwC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Oct 2023 06:52:02 -0400
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5E19A2;
        Tue, 17 Oct 2023 03:52:00 -0700 (PDT)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-57b5f0d658dso3262062eaf.0;
        Tue, 17 Oct 2023 03:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697539920; x=1698144720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fPRdJ+3TN8Zmg5SzFNo5gq2GpoI/z77WwxmQGbYRfiU=;
        b=RCqn7mNcEeR/kx77+0QRClbUQdwRghnm3reiM25HovHj6plRZ2AbmLNwY4G/zyGvLi
         khz4IL3OdUqG3oR069pm3jSlMT+yBcVrUytapkExg3lE5nUY/s4XDI2ynt9h8YrvMPEu
         LNb73icQAvIyHE/nnYDVj1IStwjDbrC3KWMWdskNFiRzeXQ56tnpUSU/GXR+X1p69NQP
         wn7D7s+C7eO8rD+i8vEGYOhF7gPeq50f+8RSWEilNYU3sGtA6SAorV8EBB9DbEo8lmNz
         uK5brbmcOGVdDtRHKBFsL0mL6wM2MLCH2ZjPL2VcSPBWVuqFhdg2Dvw0NFOE6v7a3SHC
         po4w==
X-Gm-Message-State: AOJu0YxibEjKZbaJgk1UvSyq8CfYVC/F6jPzrYPGp7KdbyUIJydquYGp
        880p22geTodVlkYOKauMLh2Wcnm7IX5F/A==
X-Google-Smtp-Source: AGHT+IFd3iKI9wLlTzsJrXCrzBBpHjkhI7rghbba6LFq3K4sgcOrjxFIoH5VkuTuGXIyau3tWf75YQ==
X-Received: by 2002:a05:6870:2183:b0:1e9:c315:9d66 with SMTP id l3-20020a056870218300b001e9c3159d66mr2032182oae.40.1697539919886;
        Tue, 17 Oct 2023 03:51:59 -0700 (PDT)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com. [209.85.210.50])
        by smtp.gmail.com with ESMTPSA id i2-20020a056830010200b006b9b6aea237sm217009otp.80.2023.10.17.03.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 03:51:59 -0700 (PDT)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6c4fc2ce697so3863996a34.0;
        Tue, 17 Oct 2023 03:51:59 -0700 (PDT)
X-Received: by 2002:a81:4996:0:b0:592:ffc:c787 with SMTP id
 w144-20020a814996000000b005920ffcc787mr1937845ywa.30.1697539494112; Tue, 17
 Oct 2023 03:44:54 -0700 (PDT)
MIME-Version: 1.0
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-5-hch@lst.de>
 <20231016-pantyhose-tall-7565b6b20fb9@wendy> <20231016131745.GB26484@lst.de>
In-Reply-To: <20231016131745.GB26484@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Oct 2023 12:44:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXVZz=YWMAgzUzme-U3qxYeLdi66xw2CGubpesGy+ZjRw@mail.gmail.com>
Message-ID: <CAMuHMdXVZz=YWMAgzUzme-U3qxYeLdi66xw2CGubpesGy+ZjRw@mail.gmail.com>
Subject: Re: [PATCH 04/12] soc: renesas: select RISCV_DMA_NONCOHERENT from ARCH_R9A07G043
To:     Christoph Hellwig <hch@lst.de>
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        Greg Ungerer <gerg@linux-m68k.org>, iommu@lists.linux.dev,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Jim Quinlan <james.quinlan@broadcom.com>,
        arm-soc <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Christoph,

On Mon, Oct 16, 2023 at 3:17 PM Christoph Hellwig <hch@lst.de> wrote:
> On Mon, Oct 16, 2023 at 01:52:57PM +0100, Conor Dooley wrote:
> > > +   select RISCV_DMA_NONCOHERENT
> > >     select ERRATA_ANDES if RISCV_SBI
> > >     select ERRATA_ANDES_CMO if ERRATA_ANDES
> >
> > Since this Kconfig menu has changed a bit in linux-next, the selects
> > are unconditional here, and ERRATA_ANDES_CMO will in turn select
> > RISCV_DMA_NONCOHERENT.
>
> Oh, looks like another patch landed there in linux-next.  I had
> waited for the previous one go go upstream in -rc6.  Not sure
> how to best handle this conflict.

I think the easiest is to ask soc to apply this series?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
