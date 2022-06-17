Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B60AA54F15E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jun 2022 09:05:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380114AbiFQHFI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jun 2022 03:05:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380197AbiFQHFI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jun 2022 03:05:08 -0400
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC8760D9D
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jun 2022 00:05:07 -0700 (PDT)
Received: by mail-qv1-f43.google.com with SMTP id o43so5317675qvo.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jun 2022 00:05:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KErP+gedwWjY7K1XGEMcZqGkEbe4RnD4HzZagWk5dCI=;
        b=NaDBlUXAAp9ajOE+7HreDBu8nfrQdbtLHrKeLDmOyuYvIJ00cSjt4j8BFXcW8S6+N2
         YQew8dATtIOlgelHY4Whf3sVnvmti9857MTaC6UmQEMtLVw2KyUhWWlhndRyry7mADIy
         BRlZPDu51Olm3I7DVcRWHH8UZ4zVbl6jMHhkby3WwC4T5FaTNRMNtyG41URLBMs9zdk+
         jB3inb7R2NJe2Or7J6JaS5aBTIahLk/z4cKKhjO45LCFGojuN436TTNBKK8Raftwie51
         J2V0pakxgcoYzm9IWUqtgWMYKroLAwzTqiyLxjzycypSNwyagb0pff8Bdb1HL5UkegTb
         YDLw==
X-Gm-Message-State: AJIora9K7pw8Zzv7yYQDLQkVuZcAU/L7zcPxISd/lisObn5aJrqwhUm2
        NBtlDNF7UtY4ify2BWvC25GCxelCzieSpw==
X-Google-Smtp-Source: AGRyM1ue5beBb8nJswjAf/GfMpo3I81+dEjcoVgVUff76njqSPsfZEyPjVZQid94aNw3ByG06e9YBg==
X-Received: by 2002:ac8:7f10:0:b0:304:e88d:b6c1 with SMTP id f16-20020ac87f10000000b00304e88db6c1mr7289149qtk.364.1655449506411;
        Fri, 17 Jun 2022 00:05:06 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id d7-20020ac86687000000b00304e47b9602sm3388412qtp.9.2022.06.17.00.05.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 00:05:05 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-3176d94c236so34289827b3.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jun 2022 00:05:05 -0700 (PDT)
X-Received: by 2002:a81:574c:0:b0:317:7c3a:45be with SMTP id
 l73-20020a81574c000000b003177c3a45bemr4081902ywb.316.1655449505005; Fri, 17
 Jun 2022 00:05:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220617010154.3229844-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220617010154.3229844-1-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Jun 2022 09:04:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWDeq9CrNAW9Otk5j+2S30RMro=OOGmfqzy=QM6OBBZHg@mail.gmail.com>
Message-ID: <CAMuHMdWDeq9CrNAW9Otk5j+2S30RMro=OOGmfqzy=QM6OBBZHg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779f0: Fix IPMMU compatible strings
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 17, 2022 at 3:02 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Fix IPMMU compatible strings for R-Car S4-8 (r8a779f0).
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Fixes: 4ff21ed92697 ("arm64: dts: renesas: r8a779f0: Add IPMMU nodes")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
As the bug is only present in renesas-devel, I will fold this into the
original commit.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
