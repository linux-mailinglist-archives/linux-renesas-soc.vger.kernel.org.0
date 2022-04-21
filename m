Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 388D150A12F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 15:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382513AbiDUNwy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 09:52:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387757AbiDUNwr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 09:52:47 -0400
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FAE325C3;
        Thu, 21 Apr 2022 06:49:57 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id q75so3552997qke.6;
        Thu, 21 Apr 2022 06:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+RTM2g9K+NfcBARExv9XGKoPWLbGoVIG1b/e3dPaYl0=;
        b=simpCtpQ1XEXU1Zr3AyGrmaNfbBrRO5BHzmvjGs7/uXMXu1EjyvaNg39OFaKbiTGBw
         AiBr19SPw26Ff+X487ZPhTui8ZMlBZArKTBaOyNUOXrFP4QnCtVDnJvSz6pALDCRxGOa
         Z9kN4vxd+Mxmz9JIivjEx4CSUYNYw1hXw7trtjsleE7w5WC4PmsYtqe8FdjoKye+9jmn
         3hvTyR4OVrsj4CBUEWKyj0MSezNIfMWO0k4nK043yKxrZWRxD3ETEWlE+Rw8F7SvKQzf
         tP9lc/BTFUoDxtvs4QCCKZi2r0otS+NSHCmov+7+RC83+8oh7dX+myAOEgji+pu+QZ8W
         GjjQ==
X-Gm-Message-State: AOAM530gtXQ6H7OOJg7LD2SmJiXe2v2dA2BdU0vTJ25+q2XH6mc7xARh
        Ux8eUoUd2uE93imQfV8Qmzn24ATcxDBbuUaq
X-Google-Smtp-Source: ABdhPJzbCgP8OHSyksaotVwS3s8Wga9jGm9hwAWHZf68WduNptfwUtaXrRR2cGw8QRBnpKmhuOG04Q==
X-Received: by 2002:a05:620a:139a:b0:69e:d0c4:38ee with SMTP id k26-20020a05620a139a00b0069ed0c438eemr6530602qki.380.1650548996161;
        Thu, 21 Apr 2022 06:49:56 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id o10-20020ac85a4a000000b002f23c9f8cf0sm3811190qta.10.2022.04.21.06.49.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 06:49:55 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id t67so8863740ybi.2;
        Thu, 21 Apr 2022 06:49:55 -0700 (PDT)
X-Received: by 2002:a05:6902:724:b0:644:c37b:4e21 with SMTP id
 l4-20020a056902072400b00644c37b4e21mr25002822ybt.6.1650548995512; Thu, 21 Apr
 2022 06:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com> <20220420084255.375700-12-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220420084255.375700-12-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Apr 2022 15:49:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUu40FwqF=xu5Pk6QpcXHa4qVHhEZMarx9PfYMv1z2Kpw@mail.gmail.com>
Message-ID: <CAMuHMdUu40FwqF=xu5Pk6QpcXHa4qVHhEZMarx9PfYMv1z2Kpw@mail.gmail.com>
Subject: Re: [PATCH 11/15] soc: renesas: rcar-rst: Add support for R-Car V4H
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 20, 2022 at 10:43 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add support for R-Car V4H (R8A779G0) to the R-Car RST driver.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
