Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE1286B25F3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Mar 2023 14:54:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231298AbjCINx5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Mar 2023 08:53:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231506AbjCINxW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Mar 2023 08:53:22 -0500
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 577DA60405
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Mar 2023 05:53:14 -0800 (PST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-536bbef1c5eso35998557b3.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Mar 2023 05:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678369993;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F7LtHk164+jNJVNTw0w1syfRD3diTdDk3vz1c25k5WU=;
        b=pyhGineOoq7VtVBKa/tVdp8iapgbUBGLa7saLRFXJbTszVz6rjNNRWl/C/JhP0qV9y
         L6vk6X8PyAP8ON8BgVba8N9biBEnH67b0H7Z8qdxHZcJdaLj9VDe1kjf8GBkwfMOXUP+
         jV8ytfSkyRyUADKkGdCZuehysps07F2afyVxmL6BoolEKsaHQSU4yxT8eZAqIZ3W0LdV
         bg6FADulT8LzHPkRKOhU2fdYbZw9AyLokzmezHh3Oxar+5RvUyMBlGAhu9881IitPPfs
         egI1blXnsIW0vaye5YP5+igCutzN1nYx24zSp490lpIbAz5E8nXFThian4I6mBg0iCR9
         L7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678369993;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F7LtHk164+jNJVNTw0w1syfRD3diTdDk3vz1c25k5WU=;
        b=3K++fBDyJJrXdRo9RtGSnDWmptNL3YgZspvN17tBXq05V5Ho4H+m7UttBsVZ7aeOFZ
         RPivNuel+3fNWWDN/yLX2pZPMXi72+CHu/TjyrWTUsuowpORAIOI6YPRLMOXQ9N26C07
         r65/DKMDNP1SWIvqonQ+X1oBUMF85vvcaAXonlRaJ3JVl7EwaqKCQGqG6ECvej/MVDOR
         3CrEQMkxAvmTPJsZP+V0Kz/MYNFF/L8FliOr40LZDPc+ulKVQJl1gUq+LoqdPnjDVAl+
         PomCc7vWidHVat2sUiLNVtwzV2IRLvwjOseUsqO2EPxU3WE6zvpna1CDvm4AvSCcG147
         D3Bg==
X-Gm-Message-State: AO0yUKXz10Pi2M3DUc5rv6zVuLVeVtBl2LzF5Uu6f+VAubMQdhi+ag06
        e1CLpqdOhoxNte8A/Z37pbmcwQHfN/WtwMxPW8Qn7A==
X-Google-Smtp-Source: AK7set/MFSuC/HUj7dizA/KpaU3B/5meZxhe/0WK2VPN0ertmXN3H73XCjAUkfUHxXF2c+wYtE7AzGD0fQoxzVVkquc=
X-Received: by 2002:a81:4312:0:b0:52e:b718:24d5 with SMTP id
 q18-20020a814312000000b0052eb71824d5mr14023539ywa.9.1678369993361; Thu, 09
 Mar 2023 05:53:13 -0800 (PST)
MIME-Version: 1.0
References: <20230307105645.5285-1-wsa+renesas@sang-engineering.com> <20230307105645.5285-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230307105645.5285-2-wsa+renesas@sang-engineering.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 9 Mar 2023 14:53:02 +0100
Message-ID: <CACRpkdZ5vNdakcGrhhOn=q-tXb7CyCCeMbhCMgrO0bD--KcU6Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: renesas: remove R-Car H3 ES1.* handling
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 7, 2023 at 11:57 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

> R-Car H3 ES1.* was only available to an internal development group and
> needed a lot of quirks and workarounds. These become a maintenance
> burden now, so our development group decided to remove upstream support
> and disable booting for this SoC. Public users only have ES2 onwards.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Good bye ES1.*, I expect that Geert will queue the patches as usual.

Yours,
Linus Walleij
