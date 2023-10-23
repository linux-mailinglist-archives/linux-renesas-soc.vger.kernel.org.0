Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5017D2D2E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Oct 2023 10:51:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbjJWIvV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Oct 2023 04:51:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbjJWIvU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Oct 2023 04:51:20 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B919D75
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Oct 2023 01:51:17 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5079f9675c6so4709728e87.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Oct 2023 01:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1698051075; x=1698655875; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ysSPIE1IsCCSmbKD8t6b4YAJn+91dFhQHWn97JPjhfo=;
        b=fBDWFABtdRy/dqJUpSZ+liDyBE3Yz4jUtCRqnbrsQ1+/b6CbT4YpugRDwZnXT42Ov5
         0Sn0D11S4TDcztFBNmNoed/a0A7qXzGcnha0v0g2ND2NsFpXS/pQuR/2bInodCU5l0/u
         FkseaI6z1bluG4Ldw9twsA5kNBDohQt/rd2uqiM7DFCT8ZJfBgpECkP7AKya9NTD8Nma
         iL2wNkEP97CXuX8gis7V6MP7YrNd54fDy6sgU9QzBMMBal0WtjhxjJYQO75hPhdiQKVc
         samvIZjVAzm/Tzxuja7T5QYbrCjXmYupEbk8nubMq+EoPPgh3nsuaNtp+pNZb9XHnLHd
         thTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698051075; x=1698655875;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ysSPIE1IsCCSmbKD8t6b4YAJn+91dFhQHWn97JPjhfo=;
        b=cxCZYJPllCPt7RSQlTbCOuNQrcGyssV8oSC6xTE7lFX3dJyXAyyqEfqXsAqHrXIc5e
         dDscQ1fu6EeExgMDWxqf2pLKjbGrLrhvV9paPNcn1DMK0loNzXe+mukBAiwIexRjx3Mm
         33yh3HxnKnyaAprucSifeMQBZ/rvg9jnopTOGpYveR+bqkypafAbOLNeA1AMKI/jb/k3
         eB7nXYy7kqbgiPUDAOR43XyQePftlIvEKGPriVGkUTWl5XOVwdYYJ4JLLiSpz0zWeaBS
         kFi2Ox9vnC8fojbeMnD0GCSZ/yb4xKUHjrMWMisnxLoVj0zdFaRFn18PvoP1QaNV12EZ
         CIbQ==
X-Gm-Message-State: AOJu0Yw/jA5R2QRQ1b76OxCHKzsbqdNQPuaTc+wIkC2jInFMkkKTAgzP
        TkX464VH0aC2KskMOvO95Qvsnh9l9j6zRBSZ0kM=
X-Google-Smtp-Source: AGHT+IFEURVUnPN4CEHL4cv4l6EZj9sBwtljJmg6BWQjvR/0RRtPiq7dIc0YgYd3MEVCJaTEEeOFfQ==
X-Received: by 2002:a05:6512:3449:b0:503:1d46:6f29 with SMTP id j9-20020a056512344900b005031d466f29mr5831713lfr.37.1698051075030;
        Mon, 23 Oct 2023 01:51:15 -0700 (PDT)
Received: from localhost (h-46-59-36-206.A463.priv.bahnhof.se. [46.59.36.206])
        by smtp.gmail.com with ESMTPSA id v26-20020ac258fa000000b00507a3b8b008sm1610739lfo.112.2023.10.23.01.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 01:51:14 -0700 (PDT)
Date:   Mon, 23 Oct 2023 10:51:13 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH net-next 0/2] net: ethernet: renesas: infrastructure
 preparations for upcoming driver
Message-ID: <ZTY0AXS2QtkIkLX7@oden.dyn.berto.se>
References: <20231022205316.3209-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231022205316.3209-1-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Nice work, for the whole series.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

On 2023-10-22 22:53:14 +0200, Wolfram Sang wrote:
> Before we upstream a new driver, Niklas and I thought that a few
> cleanups for Kconfig/Makefile will help readability and maintainability.
> Here they are, looking forward to comments.
> 
> 
> Wolfram Sang (2):
>   net: ethernet: renesas: group entries in Makefile
>   net: ethernet: renesas: drop SoC names in Kconfig
> 
>  drivers/net/ethernet/renesas/Kconfig  | 9 +--------
>  drivers/net/ethernet/renesas/Makefile | 4 +---
>  2 files changed, 2 insertions(+), 11 deletions(-)
> 
> -- 
> 2.35.1
> 

-- 
Kind Regards,
Niklas Söderlund
