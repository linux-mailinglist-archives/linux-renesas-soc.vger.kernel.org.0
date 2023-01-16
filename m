Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67E9B66BC22
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jan 2023 11:48:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbjAPKsv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Jan 2023 05:48:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbjAPKst (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jan 2023 05:48:49 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C889417CF9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 02:48:48 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id c6so29960451pls.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 02:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7yhGlWdBF5caMAAxe282zvA5kjaG8/cFPrVZfzXB7c=;
        b=IYI2UzZkjLnucurKH4EWx2fk9nKOlrdjK4CRgA5oIOFKOpgFgPmT/LkcHpquKaBFuH
         vQi1vMcOTNQ0ZqZzjvVuxasoF++YXZYlLSqnp3mZELNCzCzTLH9ESODtVKU1Vp4H2aeg
         5hMpsHUrwXkeZ/Rc7rzcDLlhvGgnuvoEFdnUbYs5Z4qnRpIDYFWxF0Q6sBl+cKzQk7Lt
         9YGGFTdwxAVyFJM33ohwSZTrXyK3B59jrg5F8RnzOhSbfFbo1Rwa93wT1rN4PsQneNCh
         +LEiN2k7Gg+lR/fhktMMJTu61CGMARbwXJ6ja5Kqpbu+v3FsjEEdh3Wp//OPBCNpkJw3
         4wwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y7yhGlWdBF5caMAAxe282zvA5kjaG8/cFPrVZfzXB7c=;
        b=avpLXPjV2+u7PBJwK4jsF9g9ZlNN6gXCj0HzE0bTwdvVj/irNYkXkntS2encbjC1Bj
         izzQyNv29tE215iJ+j5/55GzF4tsDyjyti1i3I21bRiGOS+oS6WwFquLXrdwxwEse097
         tVLL+zDxpx3I5jj2Cq7fUgztrFkD+fqa0gCc9nsAwPVE4dVNxNbZs4HBBgdz4F19Krx5
         i0KEWSw2XzN9zz1MihZe/835oL5Nw6SxJcf9cIK/yyNsm3NR6P/BeaiTVUAhV5EE/b8Y
         vyx7339nqyYOu+2L1JawrPDR0OBKJQ3GVq6lYZrhmfvcxRiqXVMeMnwh0W8CsEMk5vio
         I9GA==
X-Gm-Message-State: AFqh2kq0CmndjhC/WdTgUxJY79u3XeBihi+x9j4yiTj1+YmUmlV8nG1u
        EOHVVI0zeJS95KMDGAqw37Xod3MvB4Xof1yK+XiSJA==
X-Google-Smtp-Source: AMrXdXtzKlyD+333ZuB5DGkG+xbxyw1v4im/DLoHddsjaC5wj5TaZ9YZyn2QgdnZcjknO0Ko92jz/p88clKCJ0uNy0Q=
X-Received: by 2002:a17:903:2cf:b0:192:9d79:d3db with SMTP id
 s15-20020a17090302cf00b001929d79d3dbmr858630plk.129.1673866128347; Mon, 16
 Jan 2023 02:48:48 -0800 (PST)
MIME-Version: 1.0
References: <20230105134622.254560-1-arnd@kernel.org> <20230105134622.254560-22-arnd@kernel.org>
 <CAPDyKFoNrtZSDm2Ry+7_74uGLqz8KpbtEC0Z6WNxv7G9JruKtA@mail.gmail.com> <694be013-6769-438f-b85d-e7cda1b0c4fd@app.fastmail.com>
In-Reply-To: <694be013-6769-438f-b85d-e7cda1b0c4fd@app.fastmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 16 Jan 2023 11:48:12 +0100
Message-ID: <CAPDyKFontmhU9GWLV+8HG0A4aQQ0j2OpJBg+Gy3hfkjn8J_V6A@mail.gmail.com>
Subject: Re: [PATCH 21/27] mmc: remove tmio_mmc driver
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ian Molton <spyro@f2s.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 5 Jan 2023 at 16:44, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Jan 5, 2023, at 16:01, Ulf Hansson wrote:
> > On Thu, 5 Jan 2023 at 14:47, Arnd Bergmann <arnd@kernel.org> wrote:
> >>
> >> From: Arnd Bergmann <arnd@arndb.de>
> >>
> >> With the TMIO MFD support gone, the corresponding MMC host driver can
> >> be removed as well. The remaining tmio_mmc_core module however is still
> >> used by both the Renesas and Socionext host drivers.
> >>
> >> Cc: Ian Molton <spyro@f2s.com>
> >> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> >> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >> Cc: linux-mmc@vger.kernel.org
> >> Cc: linux-renesas-soc@vger.kernel.org
> >> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >
> > I intend to pick this up via my mmc tree, just awaiting an ack from Wolfram.
>
> Actually I think it would be easier to just take this through
> my tree along with the rest of the series, unless you expect
> conflicts with other patches.

If conflicts, those should probably be easy to resolve, so please go
ahead and take your own route.

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe
