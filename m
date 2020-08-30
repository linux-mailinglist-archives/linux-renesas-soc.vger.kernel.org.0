Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3030D256CCD
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Aug 2020 10:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgH3IaV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 30 Aug 2020 04:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbgH3IaO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 30 Aug 2020 04:30:14 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 867A5C061573
        for <linux-renesas-soc@vger.kernel.org>; Sun, 30 Aug 2020 01:30:14 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id k25so335384ljg.9
        for <linux-renesas-soc@vger.kernel.org>; Sun, 30 Aug 2020 01:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=uANdC3Qq5+g0Va1n9SZTJ4/1HBJUaq7gjMVuKlIL7g4=;
        b=0UufQn99RcD2FBH1RMu/b5p3N3sPIBT59BKn3ojvDa3mgbuwB3Om+qi2WgeiLVpMRj
         eUne2CajbcEqR5L6LtqtdCXAhLqfAZQ4Jvrtw2nrh4gf2n6Usu3HEQSOomW3xqzyvs8c
         nF7qKzbr0uR79NhPM2PksNDiJe3RWg+qWnpNAniM1gIApoK5C0TBvDSZ/bMCT7qCITHO
         bGcdzcwRxU3E765xLlQbUeTVTNe08VWPt1ZHRUDSC8UyHENjD9RhOQ2MdR/l78HnwudK
         FkEidNwWUYn5WSOgsOFR/nxDHDVDZGm+pKQJ0gJHNJZcdTs50zJg5KBI2ShCdDkwNoxy
         5xEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=uANdC3Qq5+g0Va1n9SZTJ4/1HBJUaq7gjMVuKlIL7g4=;
        b=czh4xi7lZ+UlwN3/bGeyDGEnUIk4hkAguien3B4IS90CMjNHsXvZvT+fCIoFwZp+m/
         Q7hThj9TbymswwEUIPpeW8h1RUyrMMBysA3KWM5Dkhk8J5LDCPG5UhPravhbm86K/wy4
         UE2Z5CA1SOP5x+ly3ACDncInsYYTBqThz4oSaIwqlJhrhd2Hy69FBQo9yIWU2w4uRPz1
         Zc3obtc8nFp2P4nBtbXTPcRfoEfVGa1dobezMJ9FlaA1/vlyNgvNgkuJSrsFsywhpjco
         3YbR42L87oFdIt9mC6rM9/sGsVsxh3qfjXFDO2eQX6KyWxcADOskXGkf5ZW3twK3F+5x
         8gzA==
X-Gm-Message-State: AOAM533d99zD7SaOTp7NAVTY8AN1ZUTSBwmPkEaaK8zBdHCalsPuBlRa
        DmZB9qwBXc6789MQDkFb3ZqJNg==
X-Google-Smtp-Source: ABdhPJysnyKxv/abzxyGJ2Z56RtKV0bo33IcE+yeUc1qD0kjwBJ5h+z29c5pTBnRQK8PgvhzEIy7zg==
X-Received: by 2002:a2e:3207:: with SMTP id y7mr2984731ljy.302.1598776212842;
        Sun, 30 Aug 2020 01:30:12 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id a26sm878773ljm.63.2020.08.30.01.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 01:30:12 -0700 (PDT)
Date:   Sun, 30 Aug 2020 10:30:11 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] i2c: rcar: use iopoll helpers for better timeout
 handling
Message-ID: <20200830083011.GS594558@oden.dyn.berto.se>
References: <20200829203810.1467-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200829203810.1467-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Neat work, I learnt something new.

On 2020-08-29 22:38:08 +0200, Wolfram Sang wrote:
> Originally, I noticed that the timeout value for initiating bus recovery
> was not optimal. While fixing it, I took the chance to convert its
> handling to the iopoll helpers. And then, I converted the timeout
> handling for resetting the device, too, while I was at it.
> 
> Tested on a Renesas Lager board (H2) and Salvator-XS (M3-N).
> 
> Wolfram Sang (2):
>   i2c: rcar: improve bus busy detection
>   i2c: rcar: refactor and shorten timeout when resetting

For the whole series,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
>  drivers/i2c/busses/i2c-rcar.c | 34 +++++++++++++---------------------
>  1 file changed, 13 insertions(+), 21 deletions(-)
> 
> -- 
> 2.20.1
> 

-- 
Regards,
Niklas Söderlund
