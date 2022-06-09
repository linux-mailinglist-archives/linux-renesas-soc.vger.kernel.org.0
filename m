Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43FB9544644
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jun 2022 10:48:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242325AbiFIInQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Jun 2022 04:43:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242238AbiFIIlM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Jun 2022 04:41:12 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDF6D4339E
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jun 2022 01:40:45 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id a15so36866183lfb.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jun 2022 01:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=bNMrFZUBiVJpR6lhF2wBWNFRHNDip3jOj7y4fU5pgGc=;
        b=wWF9eMOk5An/kQWPzhoJtKCV1I+cxqtjWv8mAbmSCxZ4ow+AizO/zaqq7cDPnssrnl
         xgXqP6uw5lSUNnTlzTxGhW2M5BOdF4kxFiim6c3VZ3a4dK7L+74fXBcr0dT0huAze7CG
         Ko254vpKUgJG3D3LgxkJrc89UvTt95ueJv/9HjA6y8S1SP6ADoMZCJUrU1tZA115zDOP
         c7qjZrna7IgXBCML/hbQn4m1Tt007eTPy5BT9zHidahW//SyKuWpDuzaLV2CWN8QYZ9y
         SExBF8e9VGOutKMAK2FVAOVI+zFVPHmGpmr/M0nmBPKYtFcThqUYpOO22RNdfEN/r8zi
         /bpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=bNMrFZUBiVJpR6lhF2wBWNFRHNDip3jOj7y4fU5pgGc=;
        b=k6guwuonpoI9/k+Y17PBMunEmI40XheBxKTnWPBi8peysmernym9YwEXo+q0nMn2Eq
         tO2uxzLNBrEfKXJi7xI2yMuButZ/qS096yKpLiCH40g9E/BryxsimdrMOpEup7AS4DtK
         /WzltNc+ZnpeZqZoL29bbah2OH/Y4dgVlDgHK8fUa8nBMKgd7T9SC+voJ9KH3s/ED2NX
         2CTYZ/woKNlwVPnY1efnfXYQ2SDb6IKBx4y67sQLsKwX8WgYre1ZXDbG2j/sJaVQM3jG
         lV7lS4kyGeK0eip+0G+S8lk3i8Jxqa79+aDbBh/PeNbbyPQKgUPJVAWpqB/I/BX1pAsx
         lHQw==
X-Gm-Message-State: AOAM531LBTOzcwNF0rD+HWlEwYTbQVit2eLny5h+3iBeiu9rqqtg3V21
        c3m0hrTcof1ZhhWUbWHickX6YA==
X-Google-Smtp-Source: ABdhPJzQw/NRC6VKeXLxNez2VDTh/HT4Dfv5FtG9QCLiwNgmyDgNrUSXruqPbWgiuy/MeLbLZhazcg==
X-Received: by 2002:ac2:5f92:0:b0:479:112e:76d7 with SMTP id r18-20020ac25f92000000b00479112e76d7mr22683619lfe.189.1654764044158;
        Thu, 09 Jun 2022 01:40:44 -0700 (PDT)
Received: from localhost (h-85-24-188-65.A463.priv.bahnhof.se. [85.24.188.65])
        by smtp.gmail.com with ESMTPSA id d25-20020ac25459000000b0047950a3ca3asm1543921lfn.151.2022.06.09.01.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 01:40:43 -0700 (PDT)
Date:   Thu, 9 Jun 2022 10:40:42 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: Add missing space after
 remote-endpoint
Message-ID: <YqGyCtmLM9vl4voC@oden.dyn.berto.se>
References: <20220608175728.1012550-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdV28kUAZjGUwv=hHOFdwCj+OhJDixN+eY_UvPdtPxRmoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdV28kUAZjGUwv=hHOFdwCj+OhJDixN+eY_UvPdtPxRmoQ@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 2022-06-09 10:13:49 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Wed, Jun 8, 2022 at 7:58 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > Add the missing space after remote-endpoint in r8a774c0.dtsi and
> > r8a77990.dtsi before the typo spreads to other files.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks!
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v5.20.

Thanks!

> 
> Do you plan to fix the other in-tree offenders, too?

I was plain too, seems like a perfect opportunity to force myself to try 
and learn Coccinelle :-)

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
