Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD0362F1B2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Nov 2022 10:46:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233315AbiKRJqf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Nov 2022 04:46:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241247AbiKRJqA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2022 04:46:00 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F6078FB36
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 01:45:48 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id u8-20020a17090a5e4800b002106dcdd4a0so7874814pji.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 01:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=upqtDzREVNFWzOSbSX1ftaCYSrdTO3ZpSoBEWd/qpPI=;
        b=OdJ9QNLfo92ONr4j7OUL9e7Wtvjrx+AFDAaqM+c2pxL+99brrflyNS5dxuBlbubmXh
         h1GzLSgZdlO13W17jbgbs1cLQbihWSj/uxc6/ZneJZfDOl0FVCknvxOhoMSA3M1ZsiFf
         xlYcLupJoNgM0mYOJfk7SQTrZWfEPjiouVt7fTzpE5uGI+Vs5gVtTMt7En4NFQDmL8Al
         LL42nq/9AyMaxPyCz+ST9Q3nxdCZVwt+gzXSKGpob+EhwYWq/zOS2SPetgaS5DFr7+Lw
         SRlq/8WANtOe9sy49Vrtu9zKOMSkuH562DuPmIX3nHZ8ih4ouSSBRIjwhWG0LC3rdALc
         GjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=upqtDzREVNFWzOSbSX1ftaCYSrdTO3ZpSoBEWd/qpPI=;
        b=ElD8ZwiAKoqG385mk4a2rd9CwSCw5KhJlZXjtO7LlWrf35svtU43XbUJhHYngxp8Wr
         UYchnVAJ1epTwbByni35VI80bftTRr5oIJBAgwjuse3KSVmpqvOqQfbvwkS1AXe8z7b8
         L4fa0axb/dphBNUXaphF5HEp5DRg8+UJBecspB4hCiGNJfF1XWU40TeeJk4g+xJFKzgS
         z9X7WqCkEDXFnwximUhg+vlny8AkoXrmJRBoD4qhlY2+hunduj6FpoQUtuI9tw6bOdAR
         LV0pdERgpwSCybzXwtjUApsNIFmxoYr7PtXS4HXveqdRlifulhy9JWL69aZb2Uu+6Bdu
         4Ipw==
X-Gm-Message-State: ANoB5pn7eSLw/hu7ibIeYgcAEtL6GixVXKiEZkUMqHvKSZXcLgCoDuCO
        Ik4lF9Pu61vNuf9wtET5vd2PeCEZxEEWqrhMd+xXgQ==
X-Google-Smtp-Source: AA0mqf6j3LXoyxeUZMTF6iHITcWrhRXx8OVPu1mlxYAL03w1XwW5tuUg5f0CkpAtVQaZZ+4oM3y+Ix2L1iPideudyl8=
X-Received: by 2002:a17:902:a503:b0:188:cca8:df29 with SMTP id
 s3-20020a170902a50300b00188cca8df29mr6800168plq.148.1668764748089; Fri, 18
 Nov 2022 01:45:48 -0800 (PST)
MIME-Version: 1.0
References: <20221102125430.28466-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20221102125430.28466-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 18 Nov 2022 10:45:10 +0100
Message-ID: <CAPDyKFoGhSWxOPXqDag-a=oCTqgLMz2C0=JZcZXm6X8r9cmaZQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] mmc: tmio: further cleanups after kmap_atomic removal
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
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

On Wed, 2 Nov 2022 at 13:54, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Thanks to Adrian's patches mentioned in patch 1 in this series, we can
> now simplify the TMIO driver a tad further to ease future refactoring.
> This is marked as RFC because testing the corner cases is not so easy so
> extra eyes for review are more than welcome.
>
> Thanks and happy hacking!
>
>    Wolfram
>
>
> Wolfram Sang (2):
>   mmc: tmio: remove tmio_mmc_k(un)map_atomic helpers
>   mmc: tmio: remove 'alignment_shift' from platform data
>
>  drivers/mmc/host/renesas_sdhi_core.c     |  1 -
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c | 10 +++++-----
>  drivers/mmc/host/tmio_mmc.h              | 11 -----------
>  drivers/mmc/host/tmio_mmc_core.c         | 13 +++++++------
>  include/linux/mfd/tmio.h                 |  1 -
>  5 files changed, 12 insertions(+), 24 deletions(-)
>

Applied for next, thanks!

Kind regards
Uffe
