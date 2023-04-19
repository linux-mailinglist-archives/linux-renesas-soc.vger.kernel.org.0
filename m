Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B4616E7EFF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Apr 2023 17:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233738AbjDSP7K (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Apr 2023 11:59:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232310AbjDSP7J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Apr 2023 11:59:09 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A53C230DB
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Apr 2023 08:59:08 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-517bfdf55c3so1680169a12.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Apr 2023 08:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1681919948; x=1684511948;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AVtjPMREOOUQQbJrVJ+PVQx4OKxpFf/ZUEP61+e+1gQ=;
        b=frYwdCwa+a/xzkbnVucoLlipi8ogEmqZ1qhEAg5zGCAQKrQTu1+DqFZRxnWj0pmuBe
         vNEUyLRxzAchIdqSpVtXOZkJ8lOjJzLbes7827PH6Y1lnvYTaGbAQAedWGOjbyBL4SZw
         dIdAGbt9VCLb5MfB/LgIGiKfZBvabTkYrw8r3YfoaGY9WTUz3J7ZgZWq8KuJUYtrMGDP
         xTet/YdBWXQ5LLvyIroS0hsICAVEt9ZF07DLvdKFCq8K7PoktQZzEKVpjrEkYblFWcDT
         bbUI2DI5Q1WludkRgqqFbZT6CmdyneApjgf/cVP5AC5x+KwMsxRp6zjZSe4yl7Nyx6pk
         6MqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681919948; x=1684511948;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVtjPMREOOUQQbJrVJ+PVQx4OKxpFf/ZUEP61+e+1gQ=;
        b=DwzHAeyKldwVE2nSKcnfeVzOu4bBQ0ml9OBg/TxgzoExpotTdKm+lbBzp33D8IEzt6
         HLeDa1QbJHY4O1kILoGlE6BmgMzH9jJUdbIoC3D9mkRBFGeNvkBdvYvW6HdEWbZh9t5q
         VTtkjHBF6uigYPZb0drqd3EFkg6DlB/MKoJB2dLqKRwIjb8ZY8Nh37V5xnHx3cg2/yJ7
         Thd5/JqqP4RgT/fhnZrQNMLVvlO+ypef4AXsj8M/ssgPCGI+BcDJeZQLFkdioafMhIE4
         Y9VmhyShzlamC1lA/r4vSJ4Zelz8yQvGLPzjzDOPMzetQApFgw21D+oSztT0ppdmqAUH
         tUCQ==
X-Gm-Message-State: AAQBX9enKAqBw1flkbU8PuSEMhE04XcN4aEcMjvRB9SwalWGXBqtOAzx
        wk8PR6a1zuDeOg9CkNeZZUqNaQ==
X-Google-Smtp-Source: AKy350Z2QE182sNm3aUj8RGCOEigVzYtoSb+0d9wOzIYohC9AAOYJzzfsi7c8UvRD0MGHAA7O2OL5w==
X-Received: by 2002:a17:90a:930b:b0:24b:2e6a:24ed with SMTP id p11-20020a17090a930b00b0024b2e6a24edmr1085199pjo.37.1681919943842;
        Wed, 19 Apr 2023 08:59:03 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id l9-20020a17090a49c900b002353082958csm1570643pjm.10.2023.04.19.08.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 08:59:03 -0700 (PDT)
Date:   Wed, 19 Apr 2023 08:59:03 -0700 (PDT)
X-Google-Original-Date: Wed, 19 Apr 2023 08:57:41 PDT (-0700)
Subject:     Re: [PATCH v8 0/7] Add non-coherent DMA support for AX45MP
In-Reply-To: <ZDzs3eYIKPFcv0HQ@infradead.org>
CC:     Conor Dooley <conor@kernel.org>, prabhakar.csengg@gmail.com,
        Arnd Bergmann <arnd@arndb.de>,
        Conor Dooley <conor.dooley@microchip.com>,
        geert+renesas@glider.be, heiko@sntech.de, guoren@kernel.org,
        ajones@ventanamicro.com, Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, samuel@sholland.org,
        linux-riscv@lists.infradead.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     Christoph Hellwig <hch@infradead.org>
Message-ID: <mhng-e296c86c-71b1-46f8-88c6-16eda3590a3d@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, 16 Apr 2023 23:53:17 PDT (-0700), Christoph Hellwig wrote:
> On Wed, Apr 12, 2023 at 09:32:30PM +0100, Conor Dooley wrote:
>> On Wed, Apr 12, 2023 at 12:08:53PM +0100, Prabhakar wrote:
>>
>> > Note,
>> > - This series requires testing on Cores with zicbom and T-Head SoCs
>>
>> As I said last time, I dunno what actual Zicbom stuff exists, other than
>> perhaps the Ventana lads having something. I did some tyre kicking on my
>> D1 and it was fine, although nothing has actually changed materially for
>> either of them with this series in v8..
>
> And as saying before, there is absolutely no reason to add non-standard
> non-coherent DMA support and let this cancer creep.  If you want Linux
> support implement Zicbom, be that in hardware or the SBI.

IMO we should just take the support in Linux: trying to hide stuff behind the
SBI leads to more more headaches than it's worth, we end up with a bunch of
broken firmware to try and work around.  We've already got a mess here because
of the D1 support, we might as well just live with it.

In practice there's just going to be a ton of mess in arch/riscv, as the ISA
has been missing many core features for many years and hardware vendors are
allowed to do whatever they want.  That's obviously a huge headache, but I
think there's nothing we can really do about it.
