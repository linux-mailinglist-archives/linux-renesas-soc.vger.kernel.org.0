Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C71C5A9633
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Sep 2022 14:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233336AbiIAMDY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Sep 2022 08:03:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233349AbiIAMDD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Sep 2022 08:03:03 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E64A0CACBB
        for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Sep 2022 05:02:51 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id t5so22224503edc.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Sep 2022 05:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=EQtlz1/8bB0OljN4UM8RiMyes3u0l9AMyZLPYPjwNbg=;
        b=csw5ErrdSflUSncY2RGnqgVsO26AzQXTVkmfMWaLDZu0r1lqkbe1Dm/e4m+d4LMmuF
         f+0F5VaY/M8NkRSLpS5fLGu3FIP5e3Vig2aNluEEwrALGOFvhE2kA63jB7wt+jukOY7g
         HdfXsSBWY3n1NFJe/MuHyN5GsASL7wPwUGoKrNo2DZC+POKv0J0WiLhIMeElR2v/epCt
         Z2lPJmhe6uTZ0m2IBBfibiFUNUG4Ak6QkUbR63nLTbTLaArK71EFrXQIwK9Y2Y0oeQF1
         nL+g/67GbFp7ErsomDo14kVw4edEef0k9aYVZA2jS+cAzanNAXpAAfz80xrP/BtpMxcu
         6ebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=EQtlz1/8bB0OljN4UM8RiMyes3u0l9AMyZLPYPjwNbg=;
        b=UF9R/lEwJOhOhg2dvR7vDFncdzshgzO/nMwkQCu/CKAbsQTo4QyyYOT7yIT9vC+91Y
         2V15CeW10pheBPQPB2KzAleoGXQQlSAVwHGmas1EgYX7eQal4fEogwWol+TgqVBLmpka
         N81Ip8qMOs5W/GBNfFsaduZEodzJJrL0a4dBVAIv6xOl0BdqqN5cYxmkELHNysHeM8xl
         eOQ000bj4WyxeqZeIuQr/D6adjBThCMKv/8IlAjt51Pu1KxDndLmDYjzq7ktwE0y/sYi
         V0kxscGrp/R46qHkfBGY675dccjtksJro3kZRx2xQvSPGWDAZmWZqYZuEjx0lkuv6lfE
         EJDA==
X-Gm-Message-State: ACgBeo30uChQY0QJ06mlF+Ft+xChwxkQTU8+A8Ob5M+qzjDssol/sHAU
        YHUYHH9Dx3kdnRxsn9j9+CITUnyRCtOmmoj6waktDQ==
X-Google-Smtp-Source: AA6agR46lntjoWxygCrFZiR2tXvOJ0E5Z87wwnM92vmKFppeHSarx/2ykA+3g+EifYIeUwUI0d7H7IEkqsfkaefSozc=
X-Received: by 2002:aa7:c488:0:b0:448:d11:4830 with SMTP id
 m8-20020aa7c488000000b004480d114830mr22369484edq.97.1662033769564; Thu, 01
 Sep 2022 05:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220831082653.20449-1-tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220831082653.20449-1-tomi.valkeinen@ideasonboard.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 1 Sep 2022 14:02:38 +0200
Message-ID: <CAG3jFyuaM4DYAsC1u7k==3OzVtheqxBoUJgDDso9sZgY9ByO7w@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] drm/bridge: ti-sn65dsi86: Basic DP support
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 31 Aug 2022 at 10:27, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> Hi,
>
> v5 of the series can be found from:
>
> https://lore.kernel.org/all/20220824130034.196041-1-tomi.valkeinen@ideasonboard.com/
>
> Changes to v5:
> - Drop the broken "check AUX errors better" patch
> - Fix sync pulse widths in "Reject modes with too large blanking"
> - Drop the text about eDP, detect and get_edid from the desc of
>   "Implement bridge connector operations"
>
>  Tomi
>
> Laurent Pinchart (2):
>   drm/bridge: ti-sn65dsi86: Support DisplayPort (non-eDP) mode
>   drm/bridge: ti-sn65dsi86: Implement bridge connector operations for DP
>
> Tomi Valkeinen (1):
>   drm/bridge: ti-sn65dsi86: Reject modes with too large blanking
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 72 +++++++++++++++++++++++++--
>  1 file changed, 69 insertions(+), 3 deletions(-)
>
> --
> 2.34.1
>

Applied to drm-misc-next.
