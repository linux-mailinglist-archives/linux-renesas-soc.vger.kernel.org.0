Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C85F67CBE0A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Oct 2023 10:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234667AbjJQIsg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Oct 2023 04:48:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232134AbjJQIsg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Oct 2023 04:48:36 -0400
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE1718E;
        Tue, 17 Oct 2023 01:48:34 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5a7e5dc8573so66905997b3.0;
        Tue, 17 Oct 2023 01:48:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697532514; x=1698137314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5wdO2B9/QvvZjPAQkmDCzsWoJIs0Ay3wdYhcrR1VVXg=;
        b=FjEscLdIB6VgbyUfQ5C7/Eq5L9SnkrqCHxAuXk7XdHLITCXJUWbo6Y2OvGdMcmbOkz
         Pfri9ev03S5YfdErMJR5YUNmYxtm78DExmTAvkzg5u+/JhWCBTr6830jqqWYejU5hIKV
         RLX4GWs5fcPK02BRd8aTrKqii7bJ6PbMxF9KdW+NNiIaz+jOEOKSPcYWXpSl33ivZW5d
         riXYAlELBGhdKM860exEAQpvOAydX1L/heyDxXCfxieGqngd9QJU1F+u3vqFcCM2xKLL
         gDRpVAlMLawdJ/kAX5uJmoaiFL55BMmp70TfwB3wBR3vEcSTn8Kp+dh7cFtEKfyynBa6
         PLJw==
X-Gm-Message-State: AOJu0YwoLdb3MkzN8QlCyyVngYV//6U88JOrM84Bxhrv3DH316vk01Uv
        2gxoSvH2JfvDLk+Pe854/hrnQ1Z4splelA==
X-Google-Smtp-Source: AGHT+IGoQYntKxg4r57RPPTuSK7ML81Khbu4zSOH40yTxhY3UW3SFoL1ZPhZgZuCBU1+YOOo7rWBXA==
X-Received: by 2002:a0d:e746:0:b0:59b:cfe1:bcf1 with SMTP id q67-20020a0de746000000b0059bcfe1bcf1mr1795860ywe.44.1697532513883;
        Tue, 17 Oct 2023 01:48:33 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id h14-20020a81b40e000000b0058fc7604f45sm439279ywi.130.2023.10.17.01.48.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 01:48:33 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5a7ac4c3666so66655137b3.3;
        Tue, 17 Oct 2023 01:48:33 -0700 (PDT)
X-Received: by 2002:a05:690c:dc8:b0:5a8:5079:422 with SMTP id
 db8-20020a05690c0dc800b005a850790422mr2326403ywb.26.1697532513384; Tue, 17
 Oct 2023 01:48:33 -0700 (PDT)
MIME-Version: 1.0
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-13-hch@lst.de>
In-Reply-To: <20231016054755.915155-13-hch@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Oct 2023 10:48:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUgM1FMKSJcq4QD9Gc=B8XF7_jWxhm634bTYQ9a6voVhA@mail.gmail.com>
Message-ID: <CAMuHMdUgM1FMKSJcq4QD9Gc=B8XF7_jWxhm634bTYQ9a6voVhA@mail.gmail.com>
Subject: Re: [PATCH 12/12] m68k: remove unused includes from dma.c
To:     Christoph Hellwig <hch@lst.de>
Cc:     Greg Ungerer <gerg@linux-m68k.org>, iommu@lists.linux.dev,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Jim Quinlan <james.quinlan@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Oct 16, 2023 at 7:48 AM Christoph Hellwig <hch@lst.de> wrote:
> dma.c doesn't need most of the headers it includes.  Also there is
> no point in undefining the DEBUG symbol given that it isn't used
> anywhere in this small file.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
