Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7347DA331
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Oct 2023 00:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346652AbjJ0WL0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Oct 2023 18:11:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346648AbjJ0WLZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Oct 2023 18:11:25 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C343A1B6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Oct 2023 15:11:21 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-280137f1a1bso789790a91.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Oct 2023 15:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1698444681; x=1699049481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+BeMmTUq4g79fi5qvKPQNKqlrDCYL6ILFRVsuXdyovg=;
        b=DsXpxg6LUigg1Qh0zB/bULL+NZLfdsOuOhCpb2MtKfM36fzfG/gr7W3312N3+tOK5D
         wY52t3eWA02DTcwrSSoQQoFAqh2NTIfoAkZqoIlSOS5E6x7qHaAeze+7FXmDwR+NRcFN
         a3b/ekUva/l6VBW9Fo+MScppfwzU5HT+/zo8YDpVYA2oCjVgM4Ypg9Kppf5GGVMVktxu
         O9UXYnG37WOXEuU5mKbCNOcdjrojh2+uWTLtUAphSNaZvnwbceESpl6MPraMM0fhYJah
         bF1JFN74XwZQFyUxQHCaw7ll2fOXyayg0tgXgwMNgxPSp5pgRbEL7/J/3y8TI/rO4kjp
         risg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698444681; x=1699049481;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BeMmTUq4g79fi5qvKPQNKqlrDCYL6ILFRVsuXdyovg=;
        b=MKUAlBZcvZe1gJB2+UzvorbpqCSzyWkFvlxy2NZdavFs8mi5K/s3zsX7EExKrAIT8l
         +fr+5lyVZb5zgOrhIH9K0zNc9A2crprxlMIKPmrdvKrkhhlbKK47K8+VK7LET6fZdX2/
         1cswwmE28wrdNhGlTfI8JcxxZqL4rLjxN3CpgGZpzIl10LxlSvGqr/r/oJzEWJL7H970
         fZlir9/pePlLb8y+om0N7joz5L5q09OBfKtFZ7CE0/wwqfDSp9sOuUQgKGwywH3OCTDz
         cPBZ3u5XY+JCIfExmrhf5n1ocY1QuAPn7ToBDt2u1UZePs2j8ohM7GdHuofzl5QITSdK
         kRBg==
X-Gm-Message-State: AOJu0YwM9aiRSwSpFiT2lpoDfCs90Coy0brg4Bv+s2yBSj4QJtSQOpjv
        XVR9YQmRTSitd7qa+1vF0PY0FA==
X-Google-Smtp-Source: AGHT+IE1Wiqht/oK+k4UaYWOU/6pE6Hl+IiCQQO9vWsJnMAPyBXGS9dG+jErM5PM3/N2wY/7M/7IWg==
X-Received: by 2002:a17:90b:1904:b0:280:16bb:8169 with SMTP id mp4-20020a17090b190400b0028016bb8169mr1783191pjb.40.1698444681014;
        Fri, 27 Oct 2023 15:11:21 -0700 (PDT)
Received: from localhost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id j14-20020a17090a2a8e00b002800b26dbc1sm1901952pjd.32.2023.10.27.15.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 15:11:20 -0700 (PDT)
Date:   Fri, 27 Oct 2023 15:11:20 -0700 (PDT)
X-Google-Original-Date: Fri, 27 Oct 2023 15:11:17 PDT (-0700)
Subject:     Re: [PATCH 5/5] riscv: configs: defconfig: Enable configs required for RZ/Five SoC
In-Reply-To: <CAMuHMdVdWzK_MRz+NeZ_mx=NcH9_EF-B0At=YsOfOABLV3B9tg@mail.gmail.com>
CC:     prabhakar.csengg@gmail.com, magnus.damm@gmail.com,
        conor+dt@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     geert@linux-m68k.org
Message-ID: <mhng-ac92041d-85e9-4725-b61c-bc0fef5549ec@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 03 Oct 2023 05:34:13 PDT (-0700), geert@linux-m68k.org wrote:
> Hi Prabhakar,
>
> On Fri, Sep 29, 2023 at 2:07 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>
>> Enable the configs required by the below IP blocks which are
>> present on RZ/Five SoC:
>> * ADC
>> * CANFD
>> * DMAC
>> * eMMC/SDHI
>> * OSTM
>> * RAVB (+ Micrel PHY)
>> * RIIC
>> * RSPI
>> * SSI (Sound+WM8978 codec)
>> * Thermal
>> * USB (PHY/RESET/OTG)
>>
>> Along with the above some core configs are enabled too,
>> -> CPU frequency scaling as RZ/Five does support this.
>> -> MTD is enabled as RSPI can be connected to flash chips
>> -> Enabled I2C chardev so that it enables userspace to read/write
>>    i2c devices (similar to arm64)
>> -> Thermal configs as RZ/Five SoC does have thermal unit
>> -> GPIO regulator as we might have IP blocks for which voltage
>>    levels are controlled by GPIOs
>> -> OTG configs as RZ/Five USB can support host/function
>> -> Gadget configs so that we can test USB function (as done in arm64
>>    all the gadget configs are enabled)
>>
>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> As I expect this to go in through the RISC-V tree, I will let the
> RISC-V people handle any discussion about more options that should be
> made modular instead of builtin.

I'm pretty much agnostic on that front, so I'm cool just picking up 
this.  I've got just patch 5 in my queue for testing, there's a few 
other things in front of it but it should show up on for-next soon.

>
> Gr{oetje,eeting}s,
>
>                         Geert
