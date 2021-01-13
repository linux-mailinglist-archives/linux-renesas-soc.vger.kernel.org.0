Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17EA32F4A0B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Jan 2021 12:29:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727450AbhAML0h (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Jan 2021 06:26:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727145AbhAML0g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jan 2021 06:26:36 -0500
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E05EC0617A3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Jan 2021 03:25:42 -0800 (PST)
Received: by mail-vs1-xe2a.google.com with SMTP id s2so917726vsk.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Jan 2021 03:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hbijAPIh7wUd9rih0Pfd0xER1/kaObwyFAEUGZbA5yM=;
        b=ApmP4kmAyOFCccOnoIKag8QSTMl1PYvCqUFnbJPgqRFs4/mTtoCoIY8IvRwGgqxIl9
         j2TimUVO6mUPr08mFW7fNES7xxZ1oGMN4KITlG5hBGVX64k0eU79NcJ60nlK0UfrHmcH
         RV9chFFh6XSyfIUU8Y9oSFTBRO189YWkwIPIgO5mLnZ+P8REtHQ0Doa/+updnJfzcQMf
         CATzMP5y9jq2fWWq7zFzm17Vlult50m2UTzs+q1/pJYh1JFsleCAQ/naGDZySfa+dlhH
         0kt1/S1Aj4FVdCs6pV4uTIBNuia1SHYNZ7Fdtp6Y/c/jGf1yABH1XMuoGVYyEZR1kv3E
         aQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hbijAPIh7wUd9rih0Pfd0xER1/kaObwyFAEUGZbA5yM=;
        b=SUnJP07JtIP2TB6G4j9diR1t/bnhYDrhyq8YxRh9dPwdKJeyvjiIN50XUJCeW4zDe0
         t+2PDLlOlrLU1y7X4PhpVVhypCjPw5/nxq7ZysMmKnc8xBcoHC25GF9Fi9oJw4k+7ErG
         +JxmMdLcJQQRSt010ETpDkEG6XudEJ+tdZYyi+oCgJ4LjhIAVH02RgxQEEyHV8lCzJzU
         koou76iHHf6sg5Aj8Uo90lvZbQjKHboMWE5eIH/boBtiJqdn1DJv+3LXYJ6/31AsOJti
         jv775Xgt2Fp+myD0Qc26Yq/rklIvvhaW1FBc/Ph3Ae2Fsfaoa26kf7tO01fwWLG8VKXq
         3nig==
X-Gm-Message-State: AOAM532O8tahs61+1lcLqicSSmJMuw4QQl9jdQPG6WxXh0cjlMlnqfHE
        9I0wVhFIJrvDv6LLte/qLxXPUEmyHvOMYmLJ0tiWcQ==
X-Google-Smtp-Source: ABdhPJwkWIk8f4E6qjFwt0NDTDGUbLNLUXJu0ZcGdugcXBkZ23N6CGZgdhA/olfnRsJWRTL4YRWQ7sx0+5AGBL+OERk=
X-Received: by 2002:a67:70c6:: with SMTP id l189mr1444580vsc.34.1610537141487;
 Wed, 13 Jan 2021 03:25:41 -0800 (PST)
MIME-Version: 1.0
References: <1608708622-29668-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1608708622-29668-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 13 Jan 2021 12:25:04 +0100
Message-ID: <CAPDyKFojeah1a-DjCacv5R=hxXUTQOqbKtKd2n51ZaHfQ6P3Mw@mail.gmail.com>
Subject: Re: [PATCH 0/2] mmc: host: tmio/renesas_sdhi: Add data timeout error detection
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 23 Dec 2020 at 08:30, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>
> This patch series is based on the mmc.git / next branch. The patch 1/2
> is a updated patch from Wolfram-san submitted [1]. And, I talked
> him locally, I can write this Reviewed-by and Tested-by instead of
> SoB. The patch 2/2 is a new patch for retuning a card when
> the host controller detects cmd/data timeout. And, I got Wolfram-san's
> Reviewed-by locally.
>
> Note that I don't include Hayakawa-san's email account which is
> the author of the patch 1/2 in To/CC because he left from Renesas
> now.
>
> [1]
> https://lore.kernel.org/linux-mmc/20201120150647.123237-3-wsa+renesas@sang-engineering.com/
>
> Masaharu Hayakawa (1):
>   mmc: tmio: Add data timeout error detection
>
> Yoshihiro Shimoda (1):
>   mmc: host: renesas_sdhi: Add a condition of cmd/data timeout for
>     retune
>
>  drivers/mmc/host/renesas_sdhi_core.c | 16 +++++++++++++---
>  drivers/mmc/host/tmio_mmc.h          |  2 +-
>  drivers/mmc/host/tmio_mmc_core.c     |  8 +++++---
>  3 files changed, 19 insertions(+), 7 deletions(-)
>

Applied for next, thanks!

Kind regards
Uffe
