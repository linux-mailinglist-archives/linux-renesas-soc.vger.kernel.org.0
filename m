Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5267363F556
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Dec 2022 17:35:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232248AbiLAQfO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Dec 2022 11:35:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232116AbiLAQfN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Dec 2022 11:35:13 -0500
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88C66A9E85;
        Thu,  1 Dec 2022 08:35:12 -0800 (PST)
Received: by mail-qv1-f44.google.com with SMTP id p12so1681635qvu.5;
        Thu, 01 Dec 2022 08:35:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uNyQThBRZMWponG93Z3/67KGP2UG/KQtMt9pyQaiuys=;
        b=AiEchH2wSttHBSZPfoPVPO6UATUITSORlKQttS522B/Pb35+l5pfqi90O7XqMFwYDW
         Zo3IDzMSBRqElj9eP3B7sbqY71QniY8KZ4lyvp1lsthaIbwGDOFQLq7OVCk10pwoOMCA
         itTre2jQB9WnzNVHU4ijENd1NsKzlu43+HEshhmaiI06FtOWrkmtRkA1C1QOuROqHMTo
         YTLpbgFIT+KBCNS/M0ExXwVlxmNy4gJp+mlOqsk53gafGHPPGlwnyIRhL5YgZXEwWdFA
         xuWBUDhUSGjFuY7Unr8V5z00wjskqEiMZUp6Kc2I665u3B8pn3L6HKoQvFYSz705WMQz
         elig==
X-Gm-Message-State: ANoB5pm1VRSWIF7hB6RQqFXyleuUjxE7Y2TiNKBTH3iqb6QvVrej21BT
        5mXdtTlAfmIz0D2CEumY0W3gnxP4jDzxNw==
X-Google-Smtp-Source: AA0mqf5EntQNHSUw4zLKeqMa4LuNylxw5BHGNMXTrIzzKGue7OYa4rbU65RZYLv0xuDirae6bdWBqw==
X-Received: by 2002:a05:6214:3487:b0:4c6:9f78:6fc0 with SMTP id mr7-20020a056214348700b004c69f786fc0mr43652970qvb.38.1669912511271;
        Thu, 01 Dec 2022 08:35:11 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id f21-20020a05620a409500b006b953a7929csm3837019qko.73.2022.12.01.08.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 08:35:10 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-3b48b139b46so22499527b3.12;
        Thu, 01 Dec 2022 08:35:10 -0800 (PST)
X-Received: by 2002:a0d:e6d4:0:b0:3c0:5701:ceaf with SMTP id
 p203-20020a0de6d4000000b003c05701ceafmr25044676ywe.358.1669912510376; Thu, 01
 Dec 2022 08:35:10 -0800 (PST)
MIME-Version: 1.0
References: <20221124191643.3193423-1-biju.das.jz@bp.renesas.com> <20221124191643.3193423-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20221124191643.3193423-6-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 1 Dec 2022 17:34:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWdZF0VQxETB87DmiRYQx1BVf5d1rEND8y7HVJGHeU_7A@mail.gmail.com>
Message-ID: <CAMuHMdWdZF0VQxETB87DmiRYQx1BVf5d1rEND8y7HVJGHeU_7A@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: renesas: rzv2m evk: Enable pwm
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
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

On Thu, Nov 24, 2022 at 8:17 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable pwm{8..14} on RZ/V2M EVK.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
