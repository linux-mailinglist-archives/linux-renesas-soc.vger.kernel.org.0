Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74764690EC8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Feb 2023 18:01:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbjBIRBx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Feb 2023 12:01:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjBIRBv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Feb 2023 12:01:51 -0500
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 642AB5FED;
        Thu,  9 Feb 2023 09:01:48 -0800 (PST)
Received: by mail-qv1-f41.google.com with SMTP id d13so1744726qvj.8;
        Thu, 09 Feb 2023 09:01:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u6eP2iG0J519XNQxcdOCAFcleHBjRH+XT7X5573aPPQ=;
        b=3/bll7YAYefmYbtkIjbiag7OZYb8PgzOWxYEQsz59dwlcpoRMsScCDiB8KXgz90Qb/
         rJJZA7Y4F8fk03ad4w48wPFLyqMLPyG9VZtRZXdit4yO/wLnuUp8Ixf6ORbr55EyCHJ7
         YZdhhmSn+AMZD0uEC8a+Zitqp1JZhVvHdyIVpdnTqWtQYO5oNQd+Po0p6/RFgwhNiAJY
         s9CErrbLjck9qm1uSqSvt9vVWuQRob4koZIn0poEP9yT+++q+FlEQWjTCJUjy8uN9oEw
         GU9A6p65qAg+zmVtXSPU1I2jOouM2OffYFKfOdzdaK5B/1+OVrAIr0FCpxUuRU5gzPi+
         hVYw==
X-Gm-Message-State: AO0yUKV0eOjmFmmqINaAVAgLWi2NWRwtL5D7jUk0lFOr0Ew9tm7PAWAX
        pm4SrSiDWO+KeMLmjHZIsRXKiB03mSeJfxxy
X-Google-Smtp-Source: AK7set+dIKlq8J8SEhNdTxbykQQiYUKqmGPws3WRfnOYoBoQPAEb/ddbHzAW7UA7yigYrpGT9y5FUA==
X-Received: by 2002:a05:6214:c48:b0:56b:ef2c:5938 with SMTP id r8-20020a0562140c4800b0056bef2c5938mr20582345qvj.50.1675962106515;
        Thu, 09 Feb 2023 09:01:46 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id d206-20020a3768d7000000b00725d8d6983asm1718091qkc.61.2023.02.09.09.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 09:01:46 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-52bfa3dfd95so33450237b3.9;
        Thu, 09 Feb 2023 09:01:46 -0800 (PST)
X-Received: by 2002:a0d:e9c1:0:b0:514:a90f:10ea with SMTP id
 s184-20020a0de9c1000000b00514a90f10eamr1125133ywe.316.1675962105673; Thu, 09
 Feb 2023 09:01:45 -0800 (PST)
MIME-Version: 1.0
References: <20230209133440.2643228-1-yoshihiro.shimoda.uh@renesas.com> <167595345406.213374.1795032702431324096.robh@kernel.org>
In-Reply-To: <167595345406.213374.1795032702431324096.robh@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 9 Feb 2023 18:01:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV_i8crAKW3yxpHWw7MXYsrdpUh4JH6PQZ_kr+qVViH4A@mail.gmail.com>
Message-ID: <CAMuHMdV_i8crAKW3yxpHWw7MXYsrdpUh4JH6PQZ_kr+qVViH4A@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: iommu: renesas,ipmmu-vmsa: Update for
 R-Car Gen4
To:     Rob Herring <robh@kernel.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        will@kernel.org, iommu@lists.linux.dev, joro@8bytes.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        robin.murphy@arm.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On Thu, Feb 9, 2023 at 3:54 PM Rob Herring <robh@kernel.org> wrote:
> On Thu, 09 Feb 2023 22:34:40 +0900, Yoshihiro Shimoda wrote:
> > Since R-Car Gen4 doens't have the main IPMMU IMSSTR register, update
> > the renesas,ipmmu-main property which sets maxItems as 1.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> > Changes from v2:
> > https://lore.kernel.org/all/20230127140446.1728102-1-yoshihiro.shimoda.uh@renesas.com/
> >  - Set maxItems to renesas,ipmmu-main if R-Car Gen4.
> >
> > Changes from v1:
> > https://lore.kernel.org/all/20230123012940.1250879-1-yoshihiro.shimoda.uh@renesas.com/
> >  - Change number of argument for R-Car Gen4 instead of "module id".
> >    On the discussion, using 'minItems' is a solution. But, it causes
> >    "too short" errors on dtbs_check. So, using "oneOf" instead.
> >
> >  .../bindings/iommu/renesas,ipmmu-vmsa.yaml    | 19 ++++++++++++++-----
> >  1 file changed, 14 insertions(+), 5 deletions(-)
> >
>
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
>
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
>
> Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230209133440.2643228-1-yoshihiro.shimoda.uh@renesas.com
>
>
> iommu@ee480000: renesas,ipmmu-main: [[40], [10]] is too long
>         arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb

This is expected, as we're changing the bindings to match the (updated)
documentation, but haven't updated the DTS yet.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
