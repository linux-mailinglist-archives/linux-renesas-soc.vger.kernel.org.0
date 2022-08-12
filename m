Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A604F5912A5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Aug 2022 17:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238665AbiHLPKr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Aug 2022 11:10:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231271AbiHLPKq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Aug 2022 11:10:46 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E17B06A4A5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Aug 2022 08:10:44 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id p18so994097plr.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Aug 2022 08:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=zzbpyiki3NleilhfwCj9lkX5sCoprPIj72OmtlYgi0A=;
        b=TgjhKVmtuJxPQV4CZFyvOAo9j/BYqDYL4o/QhhJHMTjJodzTk7EYoUGM6mB9znKkEo
         wrbPNttEkfw9W2/3jA2hjpY+7TnN5xb3Fj4oVTa9tOlEXbf50oINyijo6FZEqIhKbgqH
         jm7mR17BcBMp9Ky9l/1n6ZublpsuZCK7fhRZU6mABa0ImZejkepfk793YS0idYAYektq
         Eq+zyyBJvGiiEWoJghFvrLUqQkdyjE3Z1ti7DhFjzo7F4SQ5c4HiWJRwDD5ShLhiE2sc
         GhEdpYG79CBKJTFxHtzGn1mB3rRUepPUupDN4vcZosG/ElvEzNQGtPmcrLoV93u6BY5W
         eDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=zzbpyiki3NleilhfwCj9lkX5sCoprPIj72OmtlYgi0A=;
        b=YtHBjdu7fMVcSpaALDQVIK1DgfO8BECszhMNvtOe/VR5MxcyiLFYgeZ/pqevvk2KeB
         gKB113pMLU3cPvr+/nyv0W0A22VQ2ZDeOMeFdXheM6CgkzDW/M9VW3c4r85xCYSJs3pP
         VokJc93rY8cjJxhhxD90aIjq3qccvxSzGslhJeQzY14ub1K9XJPvhP+yBsNqTg25rMy0
         2Y43ubRhsQXnU6H0Cb4l7CtXVfG4MjRtolvw3OkaXlGfzAwDaDV+5xK23Lu2GH+xvMMr
         ypmUnQ+hisnH/L4KyC5/DAXD72FZxwIgLHJq++8SfXSrC6ZxV8SQzHy2hN7Oug9Y+iqc
         vdkQ==
X-Gm-Message-State: ACgBeo32tcdccviazean0GZtAN/7/uGkn7V2Og9n2Y8qgDzEazY0gVVm
        UfRiHF/WslE72A0hYoSs+a9Yxw==
X-Google-Smtp-Source: AA6agR52a8ZV7ZcymiQ5xW9p2OqUonP+NtZlYjd6vNYwb0BqZxt5lsnsAlWG7AoqZ3eO6IKks2b1AQ==
X-Received: by 2002:a17:902:ea03:b0:170:a235:b72b with SMTP id s3-20020a170902ea0300b00170a235b72bmr4486201plg.13.1660317044201;
        Fri, 12 Aug 2022 08:10:44 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id y9-20020a17090a134900b001f766b6a879sm5452486pjf.44.2022.08.12.08.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 08:10:43 -0700 (PDT)
Date:   Fri, 12 Aug 2022 08:10:43 -0700 (PDT)
X-Google-Original-Date: Fri, 12 Aug 2022 08:10:38 PDT (-0700)
Subject:     Re: [PATCH 4/6] dt-bindings: riscv: Add DT binding documentation for Renesas RZ/Five SoC and SMARC EVK
In-Reply-To: <1aa477b2-1d91-066e-5fcd-849ece62388d@linaro.org>
CC:     geert@linux-m68k.org, biju.das.jz@bp.renesas.com,
        prabhakar.csengg@gmail.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com, magnus.damm@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, anup@brainfault.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     krzysztof.kozlowski@linaro.org
Message-ID: <mhng-16e843f9-aba2-41fe-9027-8362472fc7d7@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 11 Aug 2022 23:23:10 PDT (-0700), krzysztof.kozlowski@linaro.org wrote:
> On 11/08/2022 18:42, Geert Uytterhoeven wrote:
>> At the DT validation level, I think the proper solution is to
>> merge Documentation/devicetree/bindings/arm/renesas.yaml and
>> Documentation/devicetree/bindings/riscv/renesas.yaml into a single
>> file under Documentation/devicetree/bindings/soc/renesas/.
>>
>> What do other people think?
>
> I am ok with it.

Seems reasonable to me too, but I pretty much always err on the side of 
keeping SOC stuff split out from the RISC-V stuff.  Just looking at 
Documentation/devicetree/bindings/riscv/, it's pretty much all SOC stuff 
-- should we just move everything but cpus.yaml over?
