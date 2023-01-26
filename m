Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C78567C5F6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jan 2023 09:36:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233020AbjAZIgS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Jan 2023 03:36:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235465AbjAZIgR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 03:36:17 -0500
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFDD36C139;
        Thu, 26 Jan 2023 00:35:41 -0800 (PST)
Received: by mail-qt1-f178.google.com with SMTP id o5so723746qtr.11;
        Thu, 26 Jan 2023 00:35:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vRIB8MnpWStVHpiH44fh5LractuJCY2Y+UfvjAsI8p8=;
        b=W0ANvEePzGmaw5dIindWfNL7+cuOT/d1/TFp8USmFkuLnLOzwYGmoruQvXyX5tIZ9y
         SWZEWnJoRK26K3CfQoLmYLtF9iCScYgN9vLulS+33uitKrFWDAVUfnhPEyxRvu5vEekl
         zNhcMtzKNv3ije1hGrlgabyIjQPi+Xp8Z0qxibvTCyUfjYLshzPG6eayr9jza9FaDuqq
         LnkFUgBImubERCGhtr+1O6hTUDJ16JXjstRxjalbNTXZQaHOkD6ThP/eEFOcc87THFjR
         7NPRS6uEKjb4F/oypFB+ELnIRlQ1G15d9wQqmto2YMMvWfvHhJ0O9Xbwhweeo4z3C17s
         zp9g==
X-Gm-Message-State: AFqh2krOMPSQrlnc5/8QRCXBUrknaejyUbsPdPc6Vw8TZ+WjM2Suzf2g
        ZksXtS7xbTKwYd/C/aYx2qcpcVjt8flOOg==
X-Google-Smtp-Source: AMrXdXtohC4TSrTppKkd9zDTLxn7SzZ5drLmnnlTTQ1lU9Hp4dUThL+n8xqJv80vcgSWOeeNI/UWyA==
X-Received: by 2002:ac8:6605:0:b0:3b6:341c:9143 with SMTP id c5-20020ac86605000000b003b6341c9143mr45094257qtp.62.1674722046127;
        Thu, 26 Jan 2023 00:34:06 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 2-20020ac82082000000b003ad373d04b6sm362822qtd.59.2023.01.26.00.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 00:34:05 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-50660e2d2ffso14129727b3.1;
        Thu, 26 Jan 2023 00:34:05 -0800 (PST)
X-Received: by 2002:a81:4b02:0:b0:507:6027:60e7 with SMTP id
 y2-20020a814b02000000b00507602760e7mr453322ywa.47.1674722045305; Thu, 26 Jan
 2023 00:34:05 -0800 (PST)
MIME-Version: 1.0
References: <20230123012940.1250879-1-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdX92KMeON0xC9p17kiqWT7ksEBX_NyPiiQk0fLaucDZBA@mail.gmail.com>
 <TYBPR01MB5341B023178B4A10DE52B844D8CE9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <CAMuHMdXXnu88Tn2ucuHZK=3G18v-nCfaTYpomchRXBu3bD7UuA@mail.gmail.com> <3c3e1dc2-1f66-565c-c677-2eae368e10be@arm.com>
In-Reply-To: <3c3e1dc2-1f66-565c-c677-2eae368e10be@arm.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Jan 2023 09:33:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWa3YSX482NTmh1e0LAqEiKrOBTHxrb=cqS3u36c-jw8g@mail.gmail.com>
Message-ID: <CAMuHMdWa3YSX482NTmh1e0LAqEiKrOBTHxrb=cqS3u36c-jw8g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: iommu: renesas,ipmmu-vmsa: Update
 descriptions for R-Car Gen4
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "joro@8bytes.org" <joro@8bytes.org>,
        "will@kernel.org" <will@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Robin,

On Wed, Jan 25, 2023 at 11:42 AM Robin Murphy <robin.murphy@arm.com> wrote:
> On 2023-01-25 08:54, Geert Uytterhoeven wrote:
> > BTW, the related IMCTR register is still documented, and the driver
> > does enable the interrupt bit (IMCTR_INTEN), so I'm wondering how the
> > hardware (documentation) people intend this to be used...
> > Perhaps IMCTR_INTEN will be removed/undocumented, too?
> > Or perhaps the removal/undocumentation of IMSSTR was a mistake?
>
> I guess it should be pretty straightforward to just try reading the
> expected IMSSTR register locations on this SoC to double-check whether
> anything is there.

FTR, I did try this.  Unfortunately the IMSSTR register value is zero
by default, and interrupts are generated only for error conditions (how
to trigger them?), so my debug print in ipmmu_irq() never triggered.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
