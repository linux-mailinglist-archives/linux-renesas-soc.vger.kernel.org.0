Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 641BC67B296
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jan 2023 13:30:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233330AbjAYMal (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Jan 2023 07:30:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjAYMak (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 07:30:40 -0500
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D36F4577F0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2023 04:30:39 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-4fd37a1551cso236199237b3.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2023 04:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gTVJ5IeBy0z9R5c5aNjfyFKovOA3r97gzXqNSx0yexE=;
        b=AsBm6dEOEuSBgIj7OsJAOnftvKkT6rBN6P2wzlFIKn3kR8YGtxFPJooMQn/sYVLvky
         /b6Mdw4nrVBYlg69L+8bWvqct9IlyOhzunrixHPlUe0D3rOnVXoYtZM467trNOF6yMsi
         sLhMRcodynBeNI6DYVMAzDREo9c+1o2DEgiWlm6ozysyiUPMgJcQvkAlVaaEajtVRNJP
         oj1odxsyYvR8YpHvqjVcRQf7Xwyx55GeAv+ar4IB0Ni0eZPxlmKq6yrPje/Ruwi3fxWM
         59h7/YZdMZ/Ldy6HGbmcKXQTgfKJa4W4GrnBjr7DVX2ajeCoip5khf6Qg/+E4anSMz9Y
         t+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gTVJ5IeBy0z9R5c5aNjfyFKovOA3r97gzXqNSx0yexE=;
        b=PSfiRwtQq5Q3QrH4nv/SEXYE+LchlclYB4eRbr8RePLBIn2q0F/cdzltVKRvl2Ylet
         /YKWpc01/GiiLgETE5D77lG5l/IcSd7WGJza8YmCuerHttxjWaecpipJ9s9PgU2OUCuS
         jL8wPwH8wZRKtS927FlqbfX7C6dvDOL4kjyi7iZuSg2y3j4nQEvfzi65ZX3ILMUS5R8d
         2TsOrEt0F8vIkmChQpRszPoa4/44CP7KUfjRyJDAiBb8Erhtz6spSM+s1/d8E8DtILF9
         9gI2e98VtRBguCcS8zn+EFou/q+zLaE8sbILM5XnN803kg21TP4XnlZtaRHWfFkzLM5M
         wVAg==
X-Gm-Message-State: AFqh2kpsf2fsNPvvJH8HF1lR73zgHnOwsuR1lX9mzTDWBsA4dG8FGp3A
        uv72hdBRZ4Glfg9zbMSPG8jPLmWV+CmRKhcEOYkqQr+fKLGftzLD
X-Google-Smtp-Source: AMrXdXut2HOW6nQLQPB79z8MmIxPOz8DnDv0LgpXrdDm5LiUzPvokqudwvptpL2xy0l3DxSJcVaiA90Cebe+1eBbFzs=
X-Received: by 2002:a0d:c9c4:0:b0:461:bf16:bb9f with SMTP id
 l187-20020a0dc9c4000000b00461bf16bb9fmr3701514ywd.105.1674649839044; Wed, 25
 Jan 2023 04:30:39 -0800 (PST)
MIME-Version: 1.0
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 25 Jan 2023 12:30:13 +0000
Message-ID: <CA+V-a8tR1KiLSs=Psa=w7kf0zT=yU5_Ekr6-3V1MR==Wtzmksg@mail.gmail.com>
Subject: [QUERY]: Block region to mmap
To:     Linux-MM <linux-mm@kvack.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        device-tree <devicetree-discuss@lists.ozlabs.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jessica Clarke <jrtc27@jrtc27.com>,
        Geert Uytterhoeven <geert.uytterhoeven@gmail.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

Renesas RZ/Five RISC-V SoC has Instruction local memory and Data local
memory (ILM & DLM) mapped between region 0x30000 - 0x4FFFF. When a
virtual address falls within this range, the MMU doesn't trigger a
page fault; it assumes the virtual address is a physical address which
can cause undesired behaviours.

To avoid this the ILM/DLM memory regions are now added to the root
domain region of the PMPU with permissions set to 0x0 for S/U modes so
that any access to these regions gets blocked and for M-mode we grant
full access (R/W/X). This prevents any users from accessing these
regions by triggering an unhandled signal 11 in S/U modes.

This works as expected but for applications say for example when doing
mmap to this region would still succeed and later down the path when
doing a read/write to this location would cause unhandled signal 11.
To handle this case gracefully we might want mmap() itself to fail if
the addr/offset falls in this local memory region.

Tracing through the mmap call we have arch_mmap_check() if implemented
by architectures this callback gets called and it can be used as a
validator to make sure mmap() to the local memory region fails. (Note
maybe this callback can be implemented using ALTERNATIVX() macro so
that other RISC-V SoCs do nop() to this callback). This approach seems
reasonable but isn't a generic approach. For other platforms with
similar issues will have to go through similar implementation. Instead
if we define the memory regions in the device tree that aren't to be
allowed to be mmaped with this approach the implementation can be
generic and can be used on other archs/platforms.

Looking at the kernel code SPARC architecture (UltraSPARC T1) also has
a hole in the virtual memory address space (relevant commit-id to fix
this issue 8bcd17411643beb9a601e032d0cf1016909a81d3).
As this VA hole =E2=80=9Csupport=E2=80=9D has been added a long time ago no=
w, and
maybe simply replicating their approach is not acceptable anymore
hence the proposed approach.

Is there any better approach which I am missing, any pointers comments welc=
ome.

Cheers,
Prabhakar
