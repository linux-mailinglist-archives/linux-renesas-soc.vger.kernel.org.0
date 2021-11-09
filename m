Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 689C444A5C8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Nov 2021 05:32:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240614AbhKIEf1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Nov 2021 23:35:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236033AbhKIEf0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Nov 2021 23:35:26 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8482BC061764
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Nov 2021 20:32:41 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id q124so31546453oig.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Nov 2021 20:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XPW05/I7JWkMC7nH5tjGxCD4A2fkhvnHq9/c9af0GlQ=;
        b=VFf04iPQt21pyD9jgemG/8UjO2n+aCufGZ28WT29USfCMN6WMRHlJwx6YXw+G3e/hi
         l9o4HvJMRjBXcEtDAfVqfI/VaiwPf2WUa4KQ0P7QxDCtMWmKQjLBzOs+WMGiajpfWV6f
         tJvIJtL62+qGxeqv3bId01R5WrekNfG5dXKMnM1Co3lyCKvfakCxjba5fV1JyCegCZj2
         Utq5TtiPKuebOMiYUKoJf2lr1+CEfFHS4Zxmsb10U26N4R220mDZuQ7KqHAgoI48UelD
         9GNTCoVNJQBCLaaKtRh+eysMJuWfQcbwR4Biv7fUkF/W0ifQ3BcBJLRP5A2PfWbpV2Xb
         iriA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XPW05/I7JWkMC7nH5tjGxCD4A2fkhvnHq9/c9af0GlQ=;
        b=RnRUja/iVrntF9XJpi3eZ1H5bL+ctJxz+bwt9fXlk3Zb/YoRkb9mivPLJaegDpe40w
         flmGV6I0z4zx+r0TdjCurCRmBEzeAuVrNcf6P3Am8Pl8YbXXycbPNhH2IOwSNHxO1GNO
         2VrmxCvaV97V/GbAx1P3yewyeZKuwoB/kdqwLkH6oo/jQDWdnht21NrjOLPWTFYJCMuo
         i2AFE3JUKnrlVjSv9zs2zvYDYGryodpjtt5eMRr7gE5CcLnu9syRxKKBfDPOAE5w5IEc
         aJlGkkwIkQtKBP5pgwzCe1T7QqiB5MEcqwBQI4tT22uwsV0wk02Tm4GBYAWOaZ/TrKIu
         qluA==
X-Gm-Message-State: AOAM53362YvzQG6950Z6//Wa8EuQmghSF1D9s9PKiRdORwp+mnEw1n9R
        PGG4Dpvw37EZly070ifc5bVYVNGdgiv3T3W6fMF1tA==
X-Google-Smtp-Source: ABdhPJyiXYZZr89IAwXjMdgsg06kxN10S6s/oac8LsbHgXOCPomhOTw0JA/nU8TmlBO67To6uEcKTgdCFGNIZPdoNy4=
X-Received: by 2002:a54:4791:: with SMTP id o17mr3342475oic.114.1636432360933;
 Mon, 08 Nov 2021 20:32:40 -0800 (PST)
MIME-Version: 1.0
References: <20211027134509.5036-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211027134509.5036-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211027134509.5036-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 05:32:29 +0100
Message-ID: <CACRpkdbY7QtjACCu63k+=Mn-XeLN3+fOjmKYR0w2NbhEZYGbeQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] pinctrl: pinconf-generic: Add support for
 "output-impedance-ohms" to be extracted from DT files
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Oct 27, 2021 at 3:45 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:

> Add "output-impedance-ohms" property to generic options used for DT
> parsing files. This enables drivers, which use generic pin configurations,
> to get the value passed to this property.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Looks good to me:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I suppose Geert will queue this patch with the rest of the Renesas stuff?

Yours,
Linus Walleij
