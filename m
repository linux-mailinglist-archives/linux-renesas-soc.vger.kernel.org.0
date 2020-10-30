Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42EFA2A0826
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Oct 2020 15:41:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726239AbgJ3OlT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Oct 2020 10:41:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbgJ3OlT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Oct 2020 10:41:19 -0400
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B179C0613D2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Oct 2020 07:41:19 -0700 (PDT)
Received: by mail-ua1-x92b.google.com with SMTP id 52so1785174uaj.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Oct 2020 07:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=72WYhmHhRIUV7VxzEgGJ4A6OwqvnvgelCtR0uWkddiY=;
        b=iWB5OC0LnRRLwty1Km5QQriQoOHJ3pYb3ZVR+sAdW8IayhXLPGMDO+04BcWlQ2NSNa
         u1K1H9cLDj8aLljJzpGLoaOJMHohXRTMPkho+c1Hlqh6Fp+QXe9dN8DnfATK3pHw9vmv
         XPe0L/RolpCVdUwQKDeuGdcec2gziQ+L3ynn7up+v8+FTkYI3guPm9dVcNvrUwkuZkY8
         PGJWUcY5WEDofxPTj5BZ1rOxwXwoUHi2540hU5saRwgaqnYbpKS+ZLeLIrWfjIpifp73
         xJmJff0tJ2EOF0tN9636y7nkr/4msjJjCFJw9mIOgZg7SypDMYz9PHaQ6PuM0T3vLsXv
         sA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=72WYhmHhRIUV7VxzEgGJ4A6OwqvnvgelCtR0uWkddiY=;
        b=o5/DyVCk0ormC5DRzSQdY0IqcSQlOSBIamK8xBtGByl1pO4Q6ZemrDlLfMvduGFFxb
         Ip6MPXGeNyhE5iwwdz/y/J9O8J86o+1IiGxBAoaYVfDXCQ1RUTP26tMjXAuAci4GilbV
         eTyGxksH0ebswj05Td/D9ugGe6q0mzM4kNxR//ZkQW8vld7e8ft4Vldimq1OQB3mESc+
         95Kbcznp7PM9Qq4wQz9Hn8PgavqFwbGAxS4uFXaxvr+4ghgN1GTcvcXN7p9zDwVqHa2p
         jVKoxuaflgy3ccTvuJI6vitTxgeuPLCRfIK90BubDEwI9v1FVC1kqnA6HKgPYJijatNc
         FjeA==
X-Gm-Message-State: AOAM5330w7ZlKf0jfy26emHY1xDwf07G74hWHAsXGdDKFsTJuskKLOnx
        LKDNA/Ybq+gcYdhRZ+u+GVbpWWrb+tUZfVoZmbKooZkh770TOKQP
X-Google-Smtp-Source: ABdhPJwxe9C7rytQC1jfTIUBghGvjFItUZsLZn+oUlGSeWhSxxP9UPZSyvqyaaFYLux6B1upb8uRKC+oOgnA1kSuDjE=
X-Received: by 2002:ab0:140e:: with SMTP id b14mr1668835uae.100.1604068878220;
 Fri, 30 Oct 2020 07:41:18 -0700 (PDT)
MIME-Version: 1.0
References: <1602581312-23607-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <TY2PR01MB3692EB14470C517E771746E0D8150@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB3692EB14470C517E771746E0D8150@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 30 Oct 2020 15:40:41 +0100
Message-ID: <CAPDyKFoSd6+i9Od1tmodNjPVG_4GU2YAnyLMs9a7C36SBzn+rQ@mail.gmail.com>
Subject: Re: [PATCH/RFC] mmc: core: disable power off notification when host
 is removed
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 30 Oct 2020 at 14:02, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>
> Hi Ulf,
>
> > From: Yoshihiro Shimoda, Sent: Tuesday, October 13, 2020 6:29 PM
> >
> > User is possible to turn the power off after a host was removed.
> > So, disable the power off notification when a host is removed.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  This topic was discussed in a few month ago [1], and now I could make
> >  a patch for unbinding the mmc host. I'm not sure this is a correct way
> >  so that I marked RFC.
>
> I would like to drop this patch because my colleague found an issue after
> he applied this patch. The issue is the following timeout happened if
> we unbind a host controller right after system suspend because
> the _mmc_resume() was not called.

In principle we would like to run the similar operations at "remove"
as during "system suspend".

>
>         mmc0: Power Off Notification timed out, 100
>
> I'll make v2 patch in next week.

I will have a closer look at your v2, apologies for the delay in review.

Kind regards
Uffe
