Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48ED07015BC
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 May 2023 11:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238060AbjEMJbs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 13 May 2023 05:31:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238107AbjEMJbn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 13 May 2023 05:31:43 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CDD783C5
        for <linux-renesas-soc@vger.kernel.org>; Sat, 13 May 2023 02:31:38 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2ac82912a59so115942371fa.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 13 May 2023 02:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683970296; x=1686562296;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=SLLhHtlhLsOwzgCf+9ODvlw4dTLaH3cZrdu7lC+dHdIV66WRVMOK4eYsd4b4Gvvs9x
         o97LCm9QF+eqaS+XN6fwaz8zRAAde8OvfdND8NnDs9P4qgm7mZABgLqFkj2GDHkB5wfK
         PMUswbxDcX+ob6U51fHySFGdUpw8J4twVi2i8Ix4WgPf4x9JIzAslaiXECgE9tC7AErD
         xbFM9S0/xyRGsvVlE4F1Mg8tQY9imoiBCZ7DFdD2ddP0JXqdk6iZ8yzVl+WiZUBFWXoC
         pk0QTRyjyuhk/EnbLUpIVb+0H/viRhRw7nnIUaffllglnPMVK7QqsQ3j9vq3fKaYrETj
         89fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683970296; x=1686562296;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=MbqZimD89iYg+d2olYizgk4h4X0SN8dM/mN3vSAI/Im36F/2AOBtlKV8TRz+Iay/93
         dquOmN5SIm8oCuGWUc29D9wLL6o27mdSjKIjG95W4PjBtRySFPBTIBiBTY8Z7LB/vO+E
         Dm5Nm8KA2XCpyqpFqkT3SWl5m/FMnksTDO23HqFK7fYYIcHKc30YDGUkXGgUUs0j5blg
         ZulN5KCJ6O/xIls8u149kpXIWhlREKioe55GlSfNmqG+zdVUlMHe2iIvM86UuGgGAXog
         qthfSLrX7a/7ndjRlOQWsi1VAVDC9YeJXmnWzXFNcVNBtSSCiqptfNEVTl7rdgrwbFfW
         VDkA==
X-Gm-Message-State: AC+VfDx+kZWlFEMopsc2bjydmfNPCV0uI1cEn9edZjaeU4hFeeubAhie
        +r6kD80b40Jv1XKcmcG9p1qGijcJF03e+dJFb84=
X-Google-Smtp-Source: ACHHUZ69yZnOfKT7w5SfUoQY/Cu6wzxYh4muPSQB6E+OFUFLbN2XZi1yBozAa0YVISxiMDtckCQ4QvDJ0SHLEBfq0P0=
X-Received: by 2002:a2e:350d:0:b0:2a8:c858:fb9 with SMTP id
 z13-20020a2e350d000000b002a8c8580fb9mr5241206ljz.29.1683970296351; Sat, 13
 May 2023 02:31:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:98cf:0:b0:2ac:a011:b92d with HTTP; Sat, 13 May 2023
 02:31:35 -0700 (PDT)
Reply-To: ninacoulibaly03@hotmail.com
From:   nina coulibaly <info.ninacoulibaly11@gmail.com>
Date:   Sat, 13 May 2023 02:31:35 -0700
Message-ID: <CAKjR=URVXeQOJMp8Rh+g1gg9HYS5Usrx0OJzpyoQzruWKyn90w@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear,

I am interested to invest with you in your country with total trust
and i hope you will give me total support, sincerity and commitment.
Please get back to me as soon as possible so that i can give you my
proposed details of funding and others.

Best Regards.

Mrs Nina Coulibaly
