Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1F4732D49F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Mar 2021 14:52:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241645AbhCDNwU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Mar 2021 08:52:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241630AbhCDNvx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Mar 2021 08:51:53 -0500
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 541CDC061764
        for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Mar 2021 05:51:10 -0800 (PST)
Received: by mail-vs1-xe30.google.com with SMTP id p123so14588225vsp.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Mar 2021 05:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=S/geTw20p5B68cOXsZGd40rHnujdt48ezg4PHtsKNmg=;
        b=hVT2zPHnAAv7RWRP2/neTi5ZJiA86eP8gu7ETl+/12yqfrL+18Gr5WWM2IDQsOnJyy
         8U1LIZba3vqk3xdbPr0Dzs84cW6EFiKk9DlEb++QxiiVSN+PI+g5pbRiNHFzul7ecyzT
         T9N0vU4OQ1eD8+QsE8GBHp5xtcPMEslg69iLCGPMmTSVlG31WTo2UdXiN4cCwF1I4Lh8
         YbC7o1m6xBOxM6iNs6acvBamacjei15I2dV4sNKqNol48PzdmMC5vbtlMUZAKhxiLtCv
         4a72NlCJ9r6kPCSVyNnTyG2AumpJGwGU6diurVvxE47byEfUF3pHDFZq2O2eErk6oDhT
         H26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=S/geTw20p5B68cOXsZGd40rHnujdt48ezg4PHtsKNmg=;
        b=GE95yrmAxbWUMIfiJxW386dC+yt2itrlxFdfkTDzdola/01Wb+XRvgl0zculBkYAwY
         Z1xxpVhv+n4tlyISj2kHa/sAPlN/G3vySJL6z1lo6GD3kMFWTrPCjrfhC56Hi7brqhYo
         yKJ8lEoASab0jUcdRiFBBljn1Wm7oBLvVpPoU/ww73nIhtvcnUDwtmd7Qiz2rlthfJcK
         I4GmeVIQtou+R1rcNbWEZYapZpwDo41SIdwEUf5GiEUtHSvLRE+FW0In7HnjAgA0UJU/
         toFgP5PbV99QluGL5n8zTiwdytq7IWn8JZwvc1s78LQF+zZnZ6bjSulupP4MQRaAXWBQ
         c+/g==
X-Gm-Message-State: AOAM532Jx2oNzYF84ittbRWyPGbCcuWWGomSsMlsJW5V0mi/4kTkJLTL
        PriFuSzxsokJ0Tg5HQVIvkEJzG4fDyKurCGUFZgXKx2mZPop/g==
X-Google-Smtp-Source: ABdhPJx5hMyeeS1L6mQiERbx+fONlsjxHasCwuB8sLR5b0RMei/ymoR3D/wTkyjHu9hVowx0atH7QDv0Eq7nv9/aL9c=
X-Received: by 2002:a05:6102:7b0:: with SMTP id x16mr535523vsg.34.1614865869628;
 Thu, 04 Mar 2021 05:51:09 -0800 (PST)
MIME-Version: 1.0
References: <20210223100830.25125-1-wsa+renesas@sang-engineering.com>
 <20210223100830.25125-2-wsa+renesas@sang-engineering.com> <CAPDyKFrdxYNBeV4Fy_NJ+1JdF9OtHaxXmSdnvyepAPH4cxUs2A@mail.gmail.com>
 <20210304092931.GB967@kunai>
In-Reply-To: <20210304092931.GB967@kunai>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 4 Mar 2021 14:50:31 +0100
Message-ID: <CAPDyKFrBdCmrfkg37jedaN5uZ-hsJkuR9GBCzTNGHP-_kmFvag@mail.gmail.com>
Subject: Re: [PATCH 1/2] mmc: tmio: support custom irq masks
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 4 Mar 2021 at 10:29, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > To be clear, I am awaiting a v2 of patch 2/2.
>
> Thanks for the heads up! Just sent.

V2 patch applied (could find the email in my inbox, but the patch was
picked up by the patchtracker, weird).

In any case, thanks and kind regards
Uffe
