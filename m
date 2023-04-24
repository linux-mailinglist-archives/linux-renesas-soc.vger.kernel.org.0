Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 082636ED501
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Apr 2023 21:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232245AbjDXTDI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Apr 2023 15:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231992AbjDXTDH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Apr 2023 15:03:07 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE01B4C23
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Apr 2023 12:03:05 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4ec94eb6dcaso5189365e87.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Apr 2023 12:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20221208.gappssmtp.com; s=20221208; t=1682362984; x=1684954984;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+rrKZhdqvsHcL2eE1Tlj0lralBU4//ybz6Asm4M4JWI=;
        b=SK+qS9QUAesvGTF7jMTDUC7mg4nbWlqMJke9j6fyDA+3PtdXd/ga8qtPlqDX/R2sjZ
         zyjWmSlk3lMEWhfjKlSugdY6W9ODIAmtvE6GBWVSUKx1G0LEVuVf04avPwwHmnuWnobn
         pI7NyyXq0CwAplJwiKicO2a9FQAbu75JscuC5s6B/6R0xQCWpfbMGN6hNKypKe+uP/km
         HDJF5OkM/RICdlT5ZJ2kZwZnWxwk2H6KBGGexVcJYAzaEfuQFe1BkkrKzAVpuVesjOBs
         IKob7duyYcYASBQNRcP0c2tOELYLMNY1JYB1dQOjOYh05S/PTBkv1aQ80AbJFi69mv9d
         GVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682362984; x=1684954984;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+rrKZhdqvsHcL2eE1Tlj0lralBU4//ybz6Asm4M4JWI=;
        b=lzWSg9m8FoNw/0yPVy4bZU7WfBeZ/lW/KAfkCNOb/VdycNX+yJv8DWUyU6IkYU8RnZ
         q2LeIPpg7QR5bb2fOuG7dBDMYo8TZALEvTE8lLshnQOp3/gh3+reRME/BebT37lsKN2L
         NiaiUpFSSFVoDKDNJt48UpjbvgZcr9Z1i54QkIQsBKUyMh4lJLUJR6AWf/U0sp8zQASl
         2/Ol8OGPQ9yzWuoIBUVtyxKlK2YkP14RzhNokO9zKpLoqCzf0m0qn712Znm1K3VKlhMr
         ga0nPIgB9I5OtI7ySIxM0Mo9vUNFA7oug7232grTW2QLN8lY+yL+nVlAXF8swjPKRz4H
         1XgQ==
X-Gm-Message-State: AAQBX9dn5fxML6l/OvXckJ5a+gpjCqSrlnV5CLugSpJ/5qWulf85CHL7
        50cYSoye1xSf22EzBcyFE1t4kmlKD1ppZWra9bE=
X-Google-Smtp-Source: AKy350bO2hmQmpo9hga9LbnomEMpI+JgAfH7Vq6flRmvl4jiui24eqCScu9P6K83QgJHmvVjNFePxg==
X-Received: by 2002:a19:7403:0:b0:4eb:252e:3ec5 with SMTP id v3-20020a197403000000b004eb252e3ec5mr3252308lfe.14.1682362984089;
        Mon, 24 Apr 2023 12:03:04 -0700 (PDT)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id q22-20020ac246f6000000b004edc4a8bfa3sm1773607lfo.176.2023.04.24.12.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 12:03:03 -0700 (PDT)
Date:   Mon, 24 Apr 2023 21:03:02 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/3] media: rcar-csi2: Add support for V4H
Message-ID: <ZEbSZvzzm7qxYkKb@oden.dyn.berto.se>
References: <20230211145310.3819989-1-niklas.soderlund+renesas@ragnatech.se>
 <7f528964-36ae-71b9-0bd9-5c75b9d89594@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f528964-36ae-71b9-0bd9-5c75b9d89594@xs4all.nl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Hans,

Thanks for looking at this series.

On 2023-04-18 08:45:22 +0200, Hans Verkuil wrote:
> Hi Niklas,
> 
> On 11/02/2023 15:53, Niklas Söderlund wrote:
> > Hello,
> > 
> > This series adds support for Renesas R-Car V4H. The work depends on the 
> > series which adds the compatible value added to the bindings 
> > documentation, posted separately [1].
> > 
> > Patch 1/3 prepares the driver for R-Car Gen4 by creating function 
> > pointers for differences with Gen3. Patch 2/3 prepares for parsing CSI-2 
> > C-PHY properties. Finally patch 3/3 adds V4H support.
> > 
> > Tested on both Gen3 and Gen4 hardware without any regressions. Tested 
> > using both regular capture and v4l-compliance.
> > 
> > 1. [PATCH 0/3] media: dt-bindings: media: Add bindings for video capture on R-Car V4H
> > 
> > Niklas Söderlund (3):
> >   media: rcar-csi2: Prepare for Gen4 support
> >   media: rcar-csi2: Prepare for C-PHY support
> >   media: rcar-csi2: Add support for C-PHY on R-Car V4H
> > 
> >  .../platform/renesas/rcar-vin/rcar-csi2.c     | 394 +++++++++++++++++-
> >  1 file changed, 379 insertions(+), 15 deletions(-)
> > 
> 
> Can you rebase and repost? This series no longer applies.

Sorry it took so long, I have rebased and reposted this series here,

https://patchwork.linuxtv.org/project/linux-media/list/?series=10363

> 
> Thanks!
> 
> 	Hans

-- 
Kind Regards,
Niklas Söderlund
