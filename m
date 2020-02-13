Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E38A15BFCF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Feb 2020 14:56:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729971AbgBMN4h (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Feb 2020 08:56:37 -0500
Received: from mail-vk1-f193.google.com ([209.85.221.193]:33298 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730036AbgBMN4h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Feb 2020 08:56:37 -0500
Received: by mail-vk1-f193.google.com with SMTP id i78so1592606vke.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Feb 2020 05:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bbEyJ21Wf9TmNm23pf1q3FJLQ8N1jweEBZj6TLt1LRE=;
        b=am2Y+lTIT9fwoz2AhrUHtsloqIktnGle3RujHx7lfx1vPOKl9bQkMAI3DbpljnNoHE
         JICRqh81kAup9Z0GEWuLxDfKXhqeyoPr5NBCfkZqUTE15OXoKyn6hl1xWiufbfwDHt/F
         1oTyqR/807K+rpYHTOG24XoIjHMgCtYrr9av8w06OOynflcyMmLDX/N553GT38QxUZ3q
         NFK7uxSXb8g/YufF3ZVjhJcVOIOeNrOtLX33w+XCM6stolptSA6GVgoS6KRw6DsGraX3
         z9NHKwWK6gyTF8GRgDWO7MxK99qOFdwHWQCBEHGyLE4xHAC1G+pp2UqN2k7Y7dWVMeOv
         7fRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bbEyJ21Wf9TmNm23pf1q3FJLQ8N1jweEBZj6TLt1LRE=;
        b=aeueH+4gdrUDKzBwN3EJZBj5lTNEcXIHzFcR6QG54br64BlPZJUIVdUn4Xo1e17l/l
         DdU5mEjxrCOexjZIMTJlF6LvNPJ5S752wWuU+Kjt8x7QOdz1eWZREXs+DPspK8gGgiAx
         pxvDE0LyvLgxIa6EwvKIby3EvRiOGX04c7UHTerg2W4jp0FYj4cXr950hI5GSU2d4e4e
         7MUJTlNrUFoZ3SINCK+SXHEG+t+r05dezs55HB3QDvvK/E8RmgIRiuTTSezt4xippQxl
         33Lo15ovSKwuvNEiDS1EqysqxapwUj5GHmeBTfgcnFou81GMR8FYvuJV4KFK2wkFrm/V
         PKcQ==
X-Gm-Message-State: APjAAAWzzmIaWC9Ioq3V2JdHSbZV5LIorWlZt2OjzzmOZuGZzECDBmeA
        vUq/QpbNAeiaQNG6nppsVz8uY4cHEEnFulwSlZ4EJxwR
X-Google-Smtp-Source: APXvYqzRxbW4HihWBIY06dzcLa0pS5WJr+ORNm3BtPDYcpkgz9cVn3dIAPYdWtjINrqQDBEjNzagjjCBL7mmkrHcZhQ=
X-Received: by 2002:a1f:4541:: with SMTP id s62mr10527889vka.59.1581602195953;
 Thu, 13 Feb 2020 05:56:35 -0800 (PST)
MIME-Version: 1.0
References: <20191217114034.13290-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20191217114034.13290-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 13 Feb 2020 14:55:59 +0100
Message-ID: <CAPDyKFraxLHHRDbumxWUo9bh-Qq_xuQMerdpZfjmkYp5ai_kAQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/5] mmc: renesas_sdhi: add manual correction
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 17 Dec 2019 at 12:40, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Add manual tap correction because the automatic one fails for HS400 on
> Gen3.
>
> Changes since RFC v1:
>
> * rebased to mmc/next
> * added review tags from Shimoda-san
> * fixed "enforce" in one commit message (Thanks Geert!)
> * new patch 3/5: I think it makes sense to incorporate this patch from
>   the BSP here already because it enhances manual correction. It could
>   be argued if it should be merged with 2/5, yet for easier review I
>   left it seperate for now
> * new patch 5/5: a cleanup I came up with while working on 3/5.
>
> I kept all tap_related variables 'unsigned long' for now. Geert has a
> point that some of them could be changed to 'unsigned int'. I'd like to
> leave this as a seperate issue, though, once we dealt with the other
> HS400 issues. (Yes, more patches coming...)
>
> I did some more testing but with my environment here, I hardly see taps
> changing. What I see is that with HS400 RVSERR is regularly set but
> SMPCMP is all cleared. So, this series maybe saves some unneeded tuning
> for me. But I think the relevant cases are created in a lab, so some
> more testing would be much appreciated. We definately want to wait for
> Shimoda-san's comments before applying this.
>
> This series depends on mmc/next because of this other series:
> [PATCH 0/5] mmc: renesas_sdhi: prepare for recent HS400 updates
>
> A branch is here:
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/new_manual_calib
>
> Kind regards,
>
>    Wolfram
>
>
> Takeshi Saito (2):
>   mmc: renesas_sdhi: Add manual correction
>   mmc: renesas_sdhi: only check CMD status for HS400 manual correction
>
> Wolfram Sang (3):
>   mmc: renesas_sdhi: remove double clear of automatic correction
>   mmc: renesas_sdhi: enforce manual correction for Gen3
>   mmc: renesas_sdhi: cleanup SCC defines
>
>  drivers/mmc/host/renesas_sdhi.h      |   1 +
>  drivers/mmc/host/renesas_sdhi_core.c | 104 ++++++++++++++++++++++-----
>  2 files changed, 86 insertions(+), 19 deletions(-)
>
> --
> 2.20.1
>

Applied for next, thanks!

Kind regards
Uffe
