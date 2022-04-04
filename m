Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 724224F1489
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Apr 2022 14:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241340AbiDDMQY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Apr 2022 08:16:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241162AbiDDMQX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 08:16:23 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 395F9B7E6
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Apr 2022 05:14:26 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id y32so1612311lfa.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Apr 2022 05:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sSQP6H+w0A6mK1X6YckSkQa+uY4WT+vpP1uv3lYD8xg=;
        b=SpMe7y/b+L2vVcjET6iWPHNNjIQyT80Rc1DetSrH3U4WGxccF9IMMz05dm7oX5MxkQ
         DDV8jpIueBPmP+bfRB5/BjNfW8nt0bXPO/Ut+6FeB3IZwotrKO9T7EQxAJ9QBihGwvbS
         UURVOthZsrve9v9DmaxOBG6by6HT6hb6X0VMxe2LJyMiHIO6s3RBCV00te1mWCGNXKca
         iO0SPVAjdwk0Q71wWVW/PH+RV6agX4Q32p4omO3vcw3ohfjYFBTtxPizM6uPK2nPb7cc
         P5+ONv19uJhDSjCNHDCXSMkIFYL2ItIM6u0t58NREZMcGiQnn4RNIuOkjMWYUS4B0wxZ
         +ssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sSQP6H+w0A6mK1X6YckSkQa+uY4WT+vpP1uv3lYD8xg=;
        b=XRzgbQT32RxTXkbCwIU2sMk/hCNSG/3hqxXF/o/6d1bFX6wxSpjMRGLD7EsCXOyuWO
         hKnaPIte36hZOtOrLpirlS3ZF9EIAPsF1fjxOVxCRkkkAVSmkmhji4lwxkj1+kQFrHrW
         VIwndrtuoLDZlBpAhNoAVi9+XJoCFOsauo2JVMhVasQkQHDDmZtePvGwLdXtHoPHX/pk
         JhZQnZGo9eK12EvBzslP4Z4rai6sqzfvkKfWejiAKzxi9we2acFYFwxBrMl1CCflsYtr
         7Pr1MGAAOTey7NVF1QF0J+RdkesS33Jf6bRLPRNnP0jxTftAcEMBszB+0Aj8cBY2M3Ft
         ym/A==
X-Gm-Message-State: AOAM530qXslnog/xAEPz6XqJn9ywBkAEC4saYRi8ctEj348RsgXkCBHR
        RTdcD3Pe0LDSCtx4qnCgyHaFiFds0DMNL6nU0ArSnA==
X-Google-Smtp-Source: ABdhPJx6/M59e/LceORrAaJwjmYx51VoKqH6hL5/10GGrTKh07Z9uQ8DL6vpFQ0BRbZrKnzsbYMZly7RZDbHaf8xMNM=
X-Received: by 2002:a05:6512:c0c:b0:44a:6865:860a with SMTP id
 z12-20020a0565120c0c00b0044a6865860amr21944403lfu.71.1649074464272; Mon, 04
 Apr 2022 05:14:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220321115059.21803-1-wsa+renesas@sang-engineering.com> <20220321115059.21803-9-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220321115059.21803-9-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 4 Apr 2022 14:13:48 +0200
Message-ID: <CAPDyKFqwgxhRPBabxfUTC+8UVegWrTg3F0nRn3PoToiO2DWtvQ@mail.gmail.com>
Subject: Re: [RFC PATCH 08/10] mmc: core: improve API to make clear hw_reset
 from bus_ops is for cards
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 21 Mar 2022 at 12:51, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> To make it unambiguous that bus_ops->hw_reset() is for cards and not for
> controllers, we a) add 'card' to the function name and b) make the
> function argument mmc_card instead of mmc_host. All users are converted,
> too.

Again b) is sufficient in my opinion. All bus_ops are for cards, while
host_ops are for hosts.

Also, there may be some corner cases where b) can't be done, like the
->remove() bus_ops for example. In that case, we either have to make
more re-structuring of the code of simply live with that there may be
some special cases.

[...]

Kind regards
Uffe
