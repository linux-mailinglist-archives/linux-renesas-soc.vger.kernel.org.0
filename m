Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A744759107F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Aug 2022 14:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237117AbiHLMIR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Aug 2022 08:08:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236835AbiHLMIQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Aug 2022 08:08:16 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4743A720D
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Aug 2022 05:08:14 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a7so1704841ejp.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Aug 2022 05:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=C+z24Pl7od6xO10XmMEfecsYemTIfW+XARlPRi62dVY=;
        b=pCQtKNiKvj4jT5B2A5q4NUPDKvxolTQcSH2POMoaJq3ObbOLA+joD4IOaGQLSUS5Ji
         3MlVIxCX5cEGmITO3P1WJySRifgOjFk69o+NV/OGhFH/c183BIhyCesJTatJSWz2U485
         g2HRWMnVYwi8AJ/lUv6w16xs+xFTBu8cJp2DCrRCH5dvjZCmw2xYL/8T3Mk2be21ndb9
         4mCGXZFYCEX9DQs5YmnYspn2EEIyaxBNIB4E6qX/Ojn+JlGxtwujA0Z8CPO1doduQ9Eq
         ULqG+9vglaww4xQjXAZ8djjtFhbv1ySyaJUiM51qc8YlJZNg+cVpYz6L1XWW9YHAvNoo
         vCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=C+z24Pl7od6xO10XmMEfecsYemTIfW+XARlPRi62dVY=;
        b=DIoO59MFkdoZTpqpYx9dUxVxW/dKAO4K59W1a82/gFiZuEVnHNh/eXKY18CbSOlmMD
         xCUgBRaAETNnAMVDpHRKxyf6GpGFxuHut2lTJn41e/HM4VwzpZ9JlDeSJfbfgly6cbMX
         WSnQh1kdd1Kr9CIgUTefYy+qjyMR7z3Td1C1E4k+Xf0CQpt9Tqvv/xqaCW08hAK4p9Il
         h/nP+VCsSecplBBuM3zjlUbXmeYGmtIbXL+UDcB+VlS0PWJBd1isjQkuSCBg1pWjlRvB
         7fDlmM3kBGvZYbN1V5Q8IueNWzfMiniouNvM0EfD2zlcMqpMYEgqBCjViQ4aspioYlh/
         OcYA==
X-Gm-Message-State: ACgBeo3R0anoQxPi+NfjjYfXjc4JFTIyKFaLGSHAYnvXoCIpxgZqjzWG
        rseVMelBKt8wlQHDxC6mFJfoajZZYyYyOR6CuA==
X-Google-Smtp-Source: AA6agR60dtxAj358uYYRUIiuRHWuWIE8XMGf4CTl5mZqw8LCBUfEpoPXa8xYkhTY0ysUxRY6CERq1YJrK2OUbES2cG0=
X-Received: by 2002:a17:906:4fd3:b0:733:8be:24f8 with SMTP id
 i19-20020a1709064fd300b0073308be24f8mr2503315ejw.767.1660306093251; Fri, 12
 Aug 2022 05:08:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:a219:b0:730:8814:715 with HTTP; Fri, 12 Aug 2022
 05:08:12 -0700 (PDT)
Reply-To: paulmichael7787@gmail.com
From:   paul michael <edrichard113@gmail.com>
Date:   Fri, 12 Aug 2022 13:08:12 +0100
Message-ID: <CAK5-vuVU8vaifBZ479tpYkkj+_Hxa-CPTYfBWBFTxNPx3uor-A@mail.gmail.com>
Subject: Greetings
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:634 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [edrichard113[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [edrichard113[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [paulmichael7787[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Every time I retest your email, it tells me to check with my ISP or
Log onto incoming mail server (POP3): Your e-mail server rejected .
Kindly verify if your email is still valid for us to talk.
