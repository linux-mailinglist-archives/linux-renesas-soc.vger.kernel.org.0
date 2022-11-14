Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6DA662847F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Nov 2022 16:58:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236409AbiKNP6M (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Nov 2022 10:58:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237288AbiKNP6K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2022 10:58:10 -0500
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 608F72ED4D
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 07:58:09 -0800 (PST)
Received: by mail-qk1-f172.google.com with SMTP id v8so7630549qkg.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 07:58:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pfEyzqO7zNfF1jLfaP8n8/UyQ9OOq8xEv2EA/r9+xTw=;
        b=FjcXhYU0PMiizA1TFNy3TH32XUYWxHL9FTW8/pIFJ774DD9eaBzK/ebbAHZQFxTHRf
         arkFrf/VOgTus6uScUnZF4ImeptMeK2SL+JBnomxghkRmuF12kdhBUAUZY/AvP88RabH
         ZYuzttxVfyifvG4C8ToBn8Ufy3bO8ZJpXz6dMWoCnusmk4zTU1qNc9vjzMLQok8XjqVc
         y4wBg2zCPES3MkJcBw/fWv2rpXxZVlTYhVh0ujtFvHyj3HhtDzeulkgMcWcwyhJzRwI1
         9Cu0Qz+y1EU94BiTmKzukQgQIzGCU5+x/11NUY612gnHrA8xWy+dvvCbEx5vL7izcuuQ
         1mgQ==
X-Gm-Message-State: ANoB5pl3N2a4SF28hK3NJGO5R3pAYxlYMgpgKeo9jSCha/regjNWfCgB
        cyYGXNFJO9/jG4a50n+UOuuZCCv8M+2VRg==
X-Google-Smtp-Source: AA0mqf7IpReDb+C2gS3DazdNn2a2u3rV5J1y+UJMuuFel5Uv/oMP+Ijk6h+vbPA5xlKjk72yBuGA9w==
X-Received: by 2002:a37:8907:0:b0:6fa:a96f:d1eb with SMTP id l7-20020a378907000000b006faa96fd1ebmr11634704qkd.241.1668441488305;
        Mon, 14 Nov 2022 07:58:08 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id a14-20020ac8108e000000b003a57004313fsm5800510qtj.3.2022.11.14.07.58.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 07:58:07 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-3701a0681daso110606477b3.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 07:58:07 -0800 (PST)
X-Received: by 2002:a81:1c52:0:b0:357:66a5:bb25 with SMTP id
 c79-20020a811c52000000b0035766a5bb25mr13432154ywc.383.1668441487593; Mon, 14
 Nov 2022 07:58:07 -0800 (PST)
MIME-Version: 1.0
References: <20221110131630.3814538-1-yoshihiro.shimoda.uh@renesas.com> <20221110131630.3814538-4-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20221110131630.3814538-4-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Nov 2022 16:57:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWo0k4D0tdOYuXiuOuVNMyS4pPGFJ2YzLtXh7STvcg3jQ@mail.gmail.com>
Message-ID: <CAMuHMdWo0k4D0tdOYuXiuOuVNMyS4pPGFJ2YzLtXh7STvcg3jQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] arm64: configs: Enable Renesas R-Car S4-8 Spider
 Ethernet devices
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Nov 10, 2022 at 2:16 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Enable Renesas "Ethernet Switch", Ethernet SERDES and Marvell 10G PHY
> drivers to be used by NFS root on the Renesas Spider board.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
