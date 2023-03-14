Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96C416B8DAD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Mar 2023 09:42:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbjCNImo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Mar 2023 04:42:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbjCNIml (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Mar 2023 04:42:41 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFAAB2822D
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Mar 2023 01:42:23 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5445009c26bso64825677b3.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Mar 2023 01:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678783343;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RyfJlLPgjERQcTzZdEIvIGdNCCYbhGHEmYJcVkMFQx8=;
        b=sAKlkh+PD8fSIcuCtZF3dp6H2rffw4yT6e/1S6gniQdexILJ4kNwGDKmWE5Yb/Z7Rf
         J4nTSihP/wcKeEb6OlFGId6CldujUB2jfNkKJeQbZ6IiUWPQMMvrf9RiTBt+BYPnMoml
         WFEgS1t8TaPpiy5QmNNUqbegmtn22gfHHQsS+L1o1/r07vxUdHth+NZsPgfAZkx3bfX6
         SPmw2tAfweH/Mjyc0qIY35493OZu49je1M6yqTLgmbIeu3UnB7McqZKb+J1xX1be+Rs9
         SMo8GVkG//UPQL5EZSObC//ZwnqvROh9sHb1IqA8UabHg/d3I77dZAxJhP5h6npQE9Hg
         YA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678783343;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RyfJlLPgjERQcTzZdEIvIGdNCCYbhGHEmYJcVkMFQx8=;
        b=lhGtBgKooXRDHGbVlREkaEf7cB4DQo53rVaiNM53HzR3OBmJTkxBgF3Gynp4V13Wji
         QkSBuHIafPKCxqQjcp2azKH2k0RNbrY8f4H3WjIu6Qo3sMhNV3rezLAEZgLfyCM39haT
         25YprR5wjw6Ftsqba0sU0W5d4pQmsbtQl7/jDlXAcJy0BapBJDL01CMNngEPZJVtSRxK
         oTz8N7xQmV3M9Ew7D8CTdlHkJM0u4/hPXywIHYpI/oHj4ZFlkaZWnADhSilpMiUrVhP2
         MfhG4DmCOO/7fSlZezMOL/2mS+40oaGIXshucGBl+ayXK3F6c1TUVD6dpjTBNsCXRoha
         oQZA==
X-Gm-Message-State: AO0yUKV3BviIl66gDZX/lL2dLw5ZCwh8CqFGUmifDcnFr/6YJSn0TtWg
        o4XHhLZZYm87+PBS/rXEpKFn1kFXlFmYs5FcemE25Q==
X-Google-Smtp-Source: AK7set+5W+F4WPOOqhDRx4CVAT8IMDCIBpyCU/Ol0rUg1nVe96Ns9ilnkVMyyby2mh6+/aPqtuVgkHjoUuUWlWwpiPc=
X-Received: by 2002:a81:b605:0:b0:541:9895:4ce9 with SMTP id
 u5-20020a81b605000000b0054198954ce9mr4816352ywh.9.1678783342936; Tue, 14 Mar
 2023 01:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230306090014.128732-1-biju.das.jz@bp.renesas.com>
 <20230306090014.128732-2-biju.das.jz@bp.renesas.com> <ZAZ4LY+xG2LGiHwh@surfacebook>
 <OS0PR01MB5922EA0703F259A99C157D3286B79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75Vd6qTG67_1DGiemy8n-mQn=9kiGrC0rEYw2XO0rm4Tbag@mail.gmail.com>
 <OS0PR01MB59224CECBB888ADC9214145286B59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75VfDL74cEUQkxC1JuUB7SS1vYTPj_K7+VkQ-i-MKXad5Lw@mail.gmail.com>
 <OS0PR01MB5922CC51889D094129820C0C86B59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CACRpkdZS5UKc7bDPs-zx_QyJU9GwJAhB7372oSC9tB-txgghtw@mail.gmail.com> <OS0PR01MB5922D0321A0779A8E78B96AA86BE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922D0321A0779A8E78B96AA86BE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 14 Mar 2023 09:42:11 +0100
Message-ID: <CACRpkdbLonPgBMD6f2Rc-E3sFtMhoc0Mzt00uTUmiAnx59JC2Q@mail.gmail.com>
Subject: Re: [PATCH v6 01/13] pinctrl: core: Add pinctrl_get_device()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 14, 2023 at 9:27 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:

> If we cannot do it in user space, then we need to make it as part of
> Dt bindings and users will define the use case they need in DT.

That sounds like a much better idea :)

The kernel is for protecting hardware from users after all, and it
seems you want to select one of these use cases and DT is
excellent for system config like this.

So I would say work ahead on this path.

Yours,
Linus Walleij
