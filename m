Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A38D7F00C9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 Nov 2023 16:58:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230157AbjKRP6c (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 18 Nov 2023 10:58:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbjKRP6W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 18 Nov 2023 10:58:22 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B72E3A8F
        for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Nov 2023 07:56:38 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-507a55302e0so4368686e87.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Nov 2023 07:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1700322996; x=1700927796; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EpdSmYEMTKgajsmyK7SUPIe652up0wMdUCzgc0Fx6lI=;
        b=wWvKEV/kpw4xOY/FwpY+douIb76wRjTPBr3NvNkx0LSd2B/qKhTknIc7+TY7jmudeF
         T5qtLGaMFDPcbNUKATRY6eETw+nrE6T770XYvF5uL8dJmrw38+EMG27DFqEA/ye3GoP6
         Fjsc4YM7kr9f1UaNBZOqE5Q5V7jMc0DaVSkYIeJdWulWtZND2MtCNw58oss5HGBQ/dRx
         XyRCbKopazH+1G2lCHWV+SMLc9PlaxuR+8ro8Q/Om4TvLUsetfql8eRxnkJ+8c1Arazh
         lFfK8pu3YHj2+IYwgLuQUK6WVgbt6vujuNCO/7xlVw9HooyYdeZq6GSiAM/19/qWP3Lj
         UKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700322996; x=1700927796;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EpdSmYEMTKgajsmyK7SUPIe652up0wMdUCzgc0Fx6lI=;
        b=dfW2axbaOqyI4goZMjQdOE6KUsgOUe2hvbz6+yBHwZpBav/n3HLcHztOqA1lQwTK71
         f6eWqEvAcbzDvn3T8ghd3zavJAQura5r7wy9477/bT+oWrzLAFzd/fcdS6gq386Wut/L
         rvDL3i+UYW33O0b+GQurX0+7SQPSqxoQWKITP9jLboM5k5FTWsunA+z/iBgK2hy2T5J0
         hK1/f5zOMzaKLArcOGd3iBMnuata7ZGdtaYpeOafbSnDY23HYC65nkvIrGc1ApjxGKoH
         tNTWFgxZJ9krJvoPzABUGR9eVMWj57aTbhR71UvF7sZb5HssA9NaYscda3mNrhmX98Rd
         w9iQ==
X-Gm-Message-State: AOJu0YxsdmvwGbDu07uF13Xc/VSAdFjeXhfW07//RIadPA1QoDIj1SGY
        ksrtMlohtaqS6za+m++vyhfF/w==
X-Google-Smtp-Source: AGHT+IHTLvDB6i+cykEOLGjCyuaIyaJJhQ02NctNes08KtX5IFACA+1B7XtWGorJi/ViwTgoTCMvfg==
X-Received: by 2002:ac2:4951:0:b0:503:3808:389a with SMTP id o17-20020ac24951000000b005033808389amr2125556lfi.11.1700322996114;
        Sat, 18 Nov 2023 07:56:36 -0800 (PST)
Received: from localhost (h-46-59-36-206.A463.priv.bahnhof.se. [46.59.36.206])
        by smtp.gmail.com with ESMTPSA id g7-20020a0565123b8700b00509131de510sm608346lfv.151.2023.11.18.07.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 07:56:35 -0800 (PST)
Date:   Sat, 18 Nov 2023 16:56:34 +0100
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Richard Cochran <richardcochran@gmail.com>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 4/5] net: ethernet: renesas: rcar_gen4_ptp: Add V4H
 clock setting
Message-ID: <ZVjest6pUoM2b9mO@oden.dyn.berto.se>
References: <20231117164332.354443-1-niklas.soderlund+renesas@ragnatech.se>
 <20231117164332.354443-5-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdW8L9BxPUkBf-pNrACqAyFcEcczOBEaOqwwgHpisZ_e5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdW8L9BxPUkBf-pNrACqAyFcEcczOBEaOqwwgHpisZ_e5g@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your review.

On 2023-11-18 12:16:51 +0100, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Fri, Nov 17, 2023 at 5:45 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > The gPTP clock is different between R-Car S4 and R-Car V4H. In
> > preparation of adding R-Car V4H support define the clock setting.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks for your patch!
> 
> > --- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
> > +++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
> > @@ -9,8 +9,12 @@
> >
> >  #include <linux/ptp_clock_kernel.h>
> >
> > -#define PTPTIVC_INIT                   0x19000000      /* 320MHz */
> > -#define RCAR_GEN4_PTP_CLOCK_S4         PTPTIVC_INIT
> > +#define PTPTIVC_INIT_200MHZ            0x28000000      /* 200MHz */
> > +#define PTPTIVC_INIT_320MHZ            0x19000000      /* 320MHz */
> > +
> > +#define RCAR_GEN4_PTP_CLOCK_S4         PTPTIVC_INIT_320MHZ
> > +#define RCAR_GEN4_PTP_CLOCK_V4H                PTPTIVC_INIT_200MHZ
> 
> I think the gPTP Timer Increment Value Configuration value should be
> calculated from the module clock rate instead (rsw2 runs at 320 MHz
> on R-Car S4, S0D4_HSC and tsn run at 200 MHz on R-Car V4H).

This is a great idea, I will do so for v2.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Kind Regards,
Niklas Söderlund
