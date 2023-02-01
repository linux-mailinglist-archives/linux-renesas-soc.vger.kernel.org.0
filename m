Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9B10686040
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Feb 2023 08:05:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbjBAHFp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Feb 2023 02:05:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231752AbjBAHFm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Feb 2023 02:05:42 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F07783CB
        for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Jan 2023 23:05:25 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so610616wms.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Jan 2023 23:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8gKGvK+r7EDr5He9Gl8MsjplN89RsEBb0xFGFSeoWY=;
        b=ZDfGYSydUbs+W/mZ/JEdD6Q+8lcaLxLNi99HmCRr8gzdobuZMw/guj3LdnXcCx0jfS
         i/DhUZgi36mxwP7NxLmv/bIWDlAEd3yc/osBtAxPRl9qH8KIMR349F6AFdABhD0Qtn0I
         HSXoUmkKir6bff3h+lW+pB/Z6iRz6Ai4zv38CN1gpBrya5U682EU/6QBVmCPDYDVISYV
         d2oMFyDeR7jUfDue8RH6lTl0NRpDwaVv06H4rEPbemSqpTVQGx29KqonFPRPoXIoJSyM
         nTBEfeMaLzABTZMAIS0EzErF5H5641OBt4VdmoZuijfWPIN8aeuwXKeNd2jAvv526ZVF
         LYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e8gKGvK+r7EDr5He9Gl8MsjplN89RsEBb0xFGFSeoWY=;
        b=mOEtlxb6Yq7eGtkB8opS95W5DraP08UCsGflOXjCXH3inETK0f9D4qls97pln1yXyC
         F/rOhOZeBghDhpF10293sJpEbs6TwoKPtmhpoft4AawU/wGr8Ulab6mTx9rga6M+1QkV
         4o3GWE/fqcc/zKc3vTHtI5A0laapxCfixVwOV6be5lXMiUCu9J+pXMdmUZDT3VJuQSVg
         Ix7SVDl1gpV4hxTyc4Y4WCzNGCtecoOkHNDOzROI3lXA5nJCgfKJbMGvrz2pw1EAQ9P1
         rEMGkvzrX07QjUSgpOFndLfN7Gzq4OGE8cE19sfMCiMD2Gu2ogmcVDnYaUtLrh4b45Cg
         gCQg==
X-Gm-Message-State: AO0yUKUHLw8bZpzBWpcqOC7W8KlXIYe9F0BNJygfyl5SOHiOu2z7+ibZ
        FMJv7iqgVF+WwERxjEYd2ADhoQ==
X-Google-Smtp-Source: AK7set+k/wPPr1ZjoqjkmJ3suXeJsAYSrNEbwNPRfVbpz2KUV//5EoU3DiEoIgpuYmPe3INabtxGwA==
X-Received: by 2002:a05:600c:4fd3:b0:3dc:5b88:e6dd with SMTP id o19-20020a05600c4fd300b003dc5b88e6ddmr914970wmq.10.1675235123776;
        Tue, 31 Jan 2023 23:05:23 -0800 (PST)
Received: from smtpclient.apple (global-5-143.n-2.net.cam.ac.uk. [131.111.5.143])
        by smtp.gmail.com with ESMTPSA id r12-20020a05600c35cc00b003d9fba3c7a4sm800681wmq.16.2023.01.31.23.05.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Jan 2023 23:05:23 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [QUERY]: Block region to mmap
From:   Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <Y9oHT1D1X9cdHLr0@infradead.org>
Date:   Wed, 1 Feb 2023 07:05:22 +0000
Cc:     Matthew Wilcox <willy@infradead.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Linux-MM <linux-mm@kvack.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert.uytterhoeven@gmail.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <11BE997B-93C7-4D38-99BF-FD025A1FB945@jrtc27.com>
References: <CA+V-a8tR1KiLSs=Psa=w7kf0zT=yU5_Ekr6-3V1MR==Wtzmksg@mail.gmail.com>
 <Y9KQPxzHBuZGIN4U@casper.infradead.org>
 <CA+V-a8uizF8sQgs8cfTwH3OnK+nvr2dXAoSOPTXCXLFnprHSeA@mail.gmail.com>
 <Y9fhOFEV0kS9U06/@casper.infradead.org> <Y9oHT1D1X9cdHLr0@infradead.org>
To:     Christoph Hellwig <hch@infradead.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 1 Feb 2023, at 06:31, Christoph Hellwig <hch@infradead.org> wrote:
> On Mon, Jan 30, 2023 at 03:24:40PM +0000, Matthew Wilcox wrote:
>>> Basically we are making use of the memory protection unit (MPU) so
>>> that only M-mode is allowed to access this region and S/U modes are
>>> blocked.
>>=20
>> This sounds like RISC-V terminology.  I have no idea what M, S or U
>> modes are (Supervisor and User, I'd guess for the last two?)
>=20
>=20
> Yes, M =3D Machine, S =3D Supervisor, and U =3D User.
> M omde is the absolutele worst idea of RISC-V and basically a mix
> of microcode and super-SMM mode.
>=20
>> Before we go too deeply into it, how much would it cost to buy all of
>> these parts and feed them into a shredder?  I'm not entirely joking;
>> if it's less than the software engineering time it'd take to develop
>> and support this feature, we should do it.
>=20
> The above suggests this is in no way an actual hardware problem, but =
the
> stupid decision is done in the M-Mode firmware.  I think it is very
> reasonable to simply not support the devices in Linux until the =
firmware
> is fixed.

No, it really is a hardware spec violation. Virtual addresses within
the magic range bypass translation with no way to turn it off. The
firmware is being (has been?) patched to block those accesses at the
physical memory protection level so any attempt to use those virtual
addresses will fault, but if Linux wants to support this cursed
hardware and its gross spec violation then it needs to forbid any
allocation of the VA range.

This magic range also overlaps with the default base address used for
both GNU ld and LLVM LLD, for added entertainment, so almost every
position-dependent binary that exists in the world for RISC-V cannot be
run on this hardware. One could change that for future binaries, but
that doesn=E2=80=99t seem right to me... IMO this hardware is even more =
=E2=80=9Cnot
RISC-V=E2=80=9D than the D1 with its page table mess, but I don=E2=80=99t =
think we=E2=80=99ll
ever see RISC-V International come out and say that, so it=E2=80=99s up =
to the
open-source communities to decide what they want to support and what
they view as too much of a violation to be acceptable.

Jess

