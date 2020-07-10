Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2227421B0CF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2020 09:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbgGJH5U (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Jul 2020 03:57:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727086AbgGJH5Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Jul 2020 03:57:16 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43A46C08E6DC
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2020 00:57:15 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id m18so596486vkk.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2020 00:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iedZoBoQDLoLatFfLaRWw9W6SY3ltFRWXMemHfukFEo=;
        b=b8i+seRD1bQu+c9MLbDpPcuq1iv5iTWV3nt28HUPXW7ZKEzcJNYaiFPabQ5KcnGL2a
         5MaUJ4ik2N13rzyS0qHvDyggBDtYdjVb0ouRC8SAHnj5mj8qmZh/4+q27itxk/0BkSBV
         Q8rSyuLEuNe+n8ZkRsCjCe/zjSRe4SRd/PNRsNgT/8HeFitO1ilEsrpwByj/lXNa8uvz
         0tjPvnTU+ZfUhZNccTxrQeqWdUQk40Y93uZuV8fb0f/0sOD1q0XFWy6qhbRa7cRonWsW
         mEVLg+nCE0uW7dJ3mYNuPl0tLbxx0uUU+sbKnd26Dxls13LodQw9Re4IKxGmnIPqVwOD
         7efA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iedZoBoQDLoLatFfLaRWw9W6SY3ltFRWXMemHfukFEo=;
        b=BOfZKBzLnRSKbUTdpARxl5BfvlfYHaL3lqGQYywPNbgkBqZm4VQZtJIJdGa+DsSyOZ
         hqxGZvY8u5WDxhyzkgNwJsArHdwmzPu7JDTYSPdkZAKcYDV3DTLgtXuZBCrtOoUEXBNH
         7Lb8mDZPG907fKzSd+u+yX17LyJvRkeJ7oD1RvBgZ4yns2b5sprTg4+EUubrlGAFDktQ
         dUaUWOkhzq3mhXTAvtPOEeMkAW6ec1jAP71DIbSwUn00TRCHyXURTEg4NlLr79R1HXJz
         GtURFExv6UYOhHNnSMbybtlPUZthIaLMImVx7xhcgIoM8PRpSDCw+6mo3SUAUWZd6XLG
         N8JQ==
X-Gm-Message-State: AOAM532bTUu8pWkeEJcVSVHL4MovoTusKAnfMRwqPzJhAjIrdUXViKX6
        X51veumNA/ENw/CiqOo00SB5IosZMdGC4MYMpuiHBw==
X-Google-Smtp-Source: ABdhPJzNsYDkox6SuPvvFRcEEl9Q8Pt/nFMpFpjPAAa4bEGFJKfY6V5jpDoRqqMtswg9jg19Mf3ZI66NM4uGLX7b+wc=
X-Received: by 2002:a1f:1889:: with SMTP id 131mr41537793vky.59.1594367834359;
 Fri, 10 Jul 2020 00:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <1594123122-13156-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1594123122-13156-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 10 Jul 2020 09:56:37 +0200
Message-ID: <CAPDyKFp9mO6UkcPR+BqJFhTMhK9aWFV5H3r=zT9Aodq4O3J3ZQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] mmc: core: add a new property/caps2
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 7 Jul 2020 at 13:59, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>
> Some environment (like r8a77951-salvator-xs) is possible
> to perform a full power cycle of the card in suspend via firmware
> (PSCI on arm-trusted-firmware). However, the current MMC core
> cannot issue Power Off Notification. This patch series can do it.
>
> We discussed on the v3 email thread [1].
>
> [1]
> https://lore.kernel.org/linux-renesas-soc/1592792699-24638-1-git-send-email-yoshihiro.shimoda.uh@renesas.com/T/#m9c25f35d7126b1c14ea431a773757652ad094341
>
>
> Changes from v4:
>  - Just add a new property/caps2 flag of MMC bindings to fix the issue.
>  https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=308795
>
> Changes from v3:
>  - Modify regulator subsytem and regulator/fixed driver.
>  - Use regulator_is_enabled() instead of firmware API.
>  - Update R-Car Gen3 related dts files for the reference.
>    But, I have only tested on r8a779{5,61}-salvaltor-xs.dts.
>  https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=306281
>
> Changes from v2:
>  - Fix typo of function name in patch2.
>  - Remove RFC.
>  https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=305523
>
> Changes from v1:
>  - Use pm_suspend_via_firmware() API instead of pm_suspend_target_state.
>  - Modify the psci driver to call pm_set_suspend_via_firmware.
>  https://patchwork.kernel.org/patch/11557505/
>
>
> *** BLURB HERE ***
>
> Yoshihiro Shimoda (2):
>   dt-bindings: mmc: Add full-pwr-cycle-in-suspend property
>   mmc: core: Add MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND
>
>  Documentation/devicetree/bindings/mmc/mmc-controller.yaml | 5 +++++
>  drivers/mmc/core/host.c                                   | 2 ++
>  drivers/mmc/core/mmc.c                                    | 3 ++-
>  include/linux/mmc/host.h                                  | 1 +
>  4 files changed, 10 insertions(+), 1 deletion(-)
>
> --
> 2.7.4
>

Applied for next, thanks!

Kind regards
Uffe
