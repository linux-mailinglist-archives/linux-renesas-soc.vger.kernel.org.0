Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43602348C5F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Mar 2021 10:11:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbhCYJLU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Mar 2021 05:11:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbhCYJLF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Mar 2021 05:11:05 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A454C06174A
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Mar 2021 02:11:04 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id u9so2137688ljd.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Mar 2021 02:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Pr+/f6IeJ4Npr54uktu8d3XUH8cijXHTmifckcXraMk=;
        b=gDXS73ZRj1/wn5Zqv7xyLSJJXU/MTs+ReNA2zmQK2VJdC3Q/pcrI2dHhGivT9gihTv
         EnKhpiLoXMDGDq6vJLWrdgmb4n0jNB+c8JQ4y9aclZR3ReRHR4ifLkzqhPd871/UU85i
         Sj6A3DmzGsN7sPl+uvtW4SgICxOXmMujENA8GzD3Xjsh2CnPewa2l1fjZnbpprFavCGX
         WMRnWfnOAV7yeRl1IQGDAt0ZWhEtZEuaDeeRxsmBB5t9LEUsBFH7JzdXygtBR7NBVdo0
         wJfXvd5Dc2DBobNqPcd+NV7Be4mG9OC+HGMfwAYY2n6OapH9stJGRbs7DpRQtrNwoqvP
         9MgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pr+/f6IeJ4Npr54uktu8d3XUH8cijXHTmifckcXraMk=;
        b=gw1r3zaPcUc33nteG6R7nQBSD6j/ueS587jK2jltCqPAzLvcLScq+opXHLp+HnwcAW
         1h1iWaRIrzpReGYdMbflMreY6PUG82Pi6LdCqqLnUo5s7S+LvB90T0aMND1iW5wzUPRo
         ArmEkaVoO3eOBLv7OPSdISELz9WjaSyOX1jt9CsBxO1OkXzmxtStIm/i52uPdEL/xNgP
         JnIA+urbSWmvubl9M686T0Nsq/yWxK2m50gO7SbJBgCQB9S+0GFR6vX5oLRer+54mV6S
         DpMqT8KTo/jJx2/LZtEDcQKMIQTJPoUiOUd7HEWAml32sGXRpSH24VY3XdN13mbpOJBG
         MqOg==
X-Gm-Message-State: AOAM532kS/kk58iDCm6HUp0i9rr3PNtLw/SuGtyQgFtKnPyDPwa5BEZx
        tdjhXPEvB6O+OzDopGK4YR04t8ia51uCjMt/kv1hFw==
X-Google-Smtp-Source: ABdhPJztdC0HGxneywAXMLYkZFyHGu3KVeZi6HFJuXEIJ1E0uHn6CkA2X3tydFPXVpmBzKuGzTM0iq3KfkoOiuBAn4U=
X-Received: by 2002:a2e:1649:: with SMTP id 9mr5192688ljw.74.1616663463102;
 Thu, 25 Mar 2021 02:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210319090749.2711012-1-geert+renesas@glider.be>
In-Reply-To: <20210319090749.2711012-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 25 Mar 2021 10:10:52 +0100
Message-ID: <CACRpkdYhTrJeV7UBwUrm=pXQnQSccVKKSGHEkq=GxZqHwqruHg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: sh-pfc: Updates for v5.13
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 19, 2021 at 10:07 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
>
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.13-tag1

Pulled into my "devel" branch!

Thnks!
Linus Walleij
