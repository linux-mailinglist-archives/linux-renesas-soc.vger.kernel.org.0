Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD194F656E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Apr 2022 18:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237907AbiDFQfz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Apr 2022 12:35:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237958AbiDFQfj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Apr 2022 12:35:39 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72CC4250E17
        for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Apr 2022 06:53:58 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id c15so3297414ljr.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Apr 2022 06:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=EqQfJZ4mc7OO4cUc0d4RFE7EZvMiOuWXacxJvIJtpOI=;
        b=Qx74LWKwYs4HkeHYGg+haqaFK4GUAG0f8pvAnEKZ+KrpaGG0Cepxod2JrpypOJRV+F
         r+qx+DKhtDKhXCVkrara3sNhM22dx1zXlE+nwnzj2Lt04V030fhU+0njpe1bq0eNNDLB
         zT7tqR1z0QGLmotX6pU8WRtnodUV0hgdG2v2VpRRcAEmfRrTQMw0ncRZFQZlo+qbi+/m
         OArcxVGks6iTqj5yCilMlw02NJNLesHxTytvLdrTM11MmNTldE8zKjzqaExl+dUIFelJ
         rtQ/st3eB/23lzNVD0OfjhRfjNdonGZvsYj3WgGa5BUQWtqOn1hdJH6vFijDutu9G/Sh
         iOtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=EqQfJZ4mc7OO4cUc0d4RFE7EZvMiOuWXacxJvIJtpOI=;
        b=G8bOXHZGfOdix5Q49j7s74NM+SLqgoPmMl02aqYPD3A+QF1Kop1uQdNIdXzeiklvp9
         /AoyQ5g0OhZquTYxnK04oThOjGTi0fFH3eFF+F1utcPB2hmMn5ArlAQQ2YUZ+EvF+I07
         EbIsMt7YyJAAdizIL1lFrQ6dVs4mrALBEcWbzyVo8UdJtkFP3gmDzuEvfGqTpI/hFLZA
         5bXH5EqXxyaRXFULc0X324dUo8LquG6iAt2JWgu5YNSUfE6YB4CgjH/IptTkXwhkgsTp
         w8lX+qT9sgfkVROED4ZvHOAtwT1CUwB6RPo8vQhvjeUF6/bB5TJ+S8pBmyb2d4UkSG4i
         6YFg==
X-Gm-Message-State: AOAM531RJ9Pc6IDCJDxzASxrlrUjcgX7nxyRLcvUkG/N5lBgaBN5vIiD
        g4k/mgPQiWAXWIoenMDmUVzGD+DtmKByeZcBc8UeUg==
X-Google-Smtp-Source: ABdhPJw+oz8MjSOzN5SYIp1viKlgFytSd6eCLPyNN3Hmxh5mccBpwesQl71g1I06gJ5yKXAsx6jkHNtUd4c/v3RqRas=
X-Received: by 2002:a05:651c:1783:b0:249:43a8:b6f9 with SMTP id
 bn3-20020a05651c178300b0024943a8b6f9mr5247979ljb.273.1649253235784; Wed, 06
 Apr 2022 06:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220321115059.21803-1-wsa+renesas@sang-engineering.com>
 <20220321115059.21803-2-wsa+renesas@sang-engineering.com> <CAPDyKFqt8UUfGVHvpSX5ciP7qJReTYed=sffCGWPP9psS3vC_w@mail.gmail.com>
 <Yk1INkxW/i5p8yxf@ninjato>
In-Reply-To: <Yk1INkxW/i5p8yxf@ninjato>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 6 Apr 2022 15:53:19 +0200
Message-ID: <CAPDyKFo5aO-s13sP4MyjZgP-w+1Bmd59a-o+t3pVA+NgKoCHGg@mail.gmail.com>
Subject: Re: [RFC PATCH 01/10] mmc: core: improve API to make clear
 mmc_hw_reset is for cards
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 6 Apr 2022 at 09:58, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Ulf,
>
> > > To make it unambiguous that mmc_hw_reset() is for cards and not for
> > > controllers, we a) add 'card' to the function name and b) make the
> > > function argument mmc_card instead of mmc_host. A fallback is provided
> > > until all users are converted.
> >
> > In my opinion, I think b) is sufficient and would be a nice improvement.
>
> If you say so... but I do wonder why we can't be super clear with the
> function name alone without the function argument as an additional
> source of information? Kernel hacking is complicated enough.
>
> > In this regard, I suggest we make one big cross-subsystem patch (the
> > smallest change as possible) then I can pick it up and send it for the
> > v5.18-rc2.
>
> Ok, I can prepare this.

Great!

>
> > > -static void mmc_hw_reset_for_init(struct mmc_host *host)
> > > +/* we can't use mmc_card as a parameter, it is not populated yet */
> >
> > Please drop this. The function is internal/static and at least to me,
> > rather self-explanatory.
>
> All other ?w_reset() functions have a card as a parameter. For people
> trying to get into the MMC core, this comment might be helpful to
> understand the anomaly? I know that you as the maintainer do know this
> by heart, this comment is meant for people learning the stuff.

I understand your point, however I don't think it makes much sense to
try to clarify the names on mmc_hw|sw_reset() alone. There are simply
lots of other functions that then would need to be changed too.
Otherwise we would just end up with having even more in-consistency in
function namings. To me, that's even worse.

>
> All the best,
>
>    Wolfram

Kind regards
Uffe
