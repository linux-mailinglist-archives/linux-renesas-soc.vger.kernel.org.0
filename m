Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 620FA681DD7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jan 2023 23:12:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231357AbjA3WM4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Jan 2023 17:12:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231221AbjA3WMx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jan 2023 17:12:53 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 255D11BE0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jan 2023 14:12:51 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id p141so15873940ybg.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jan 2023 14:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g8ToLV5S8qBdRAaCaZeGFZ5JargHaeiW4RNoQ1QXfrU=;
        b=KCPJX2mMDMYaXV/IJUrapp41At4QgRN+p7YV7DJ2dhwgsMm1J8zKBrjbraWz7AE7DF
         x5zR5iJoAdXVyjMHTGlkJiPeU6i9s378kgTyzqIa4Fmt6fmn7TdtEYdGbE/LfBHh4LN8
         LJiAdQuq6NLvFQ1QcH8GUQn0LePtU/cKpQTKp0feOxgMtW1Ia8qzLQ+EDkKcBb58YDSr
         g25fTzryrjbDjFcRaQZaTnSHqwxasX3syrrP9A6BFcSY8PtQXsXMmUFHQZ+rRM3g49i2
         NzudWQPo+toa80lOdpvBvMhL9pRW5A/j7viCvFpqFxk/hLfqvOG1VZX+wxL2vkeCd7Rd
         dG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g8ToLV5S8qBdRAaCaZeGFZ5JargHaeiW4RNoQ1QXfrU=;
        b=rJWRHS8LBk5PXCQc6axVdmCcfbD0tSTYCzMOOPycwM7e2G3A/fB5GMC9L13Hx3m8nB
         LAcIiF8p24m2/Ip0GSSCRCrHD2ohxZjAfhKrCYrPhbGjo8j2KWcFHu5Oi9ZvGl7If4jm
         4SINnuSsrttFumOzRYKG8dcbJ/5bCf7etzr93JivEmKloNxrorlQx6M23K26uUv/C2ew
         wjK7ZELZsisNHcpfGKPDK2l811G3OgFnbooj1KTKjRDTaLez5oxdSY7NOIf7HB94eN9T
         zbXtEH3f4AJQE7tz0soPkMphWlgKJmRe1JKN6cALsMX0SXz8A3zw7PacZy/nf5CPrlmI
         KclA==
X-Gm-Message-State: AFqh2kqFmL6QaDVcr9bt0PAgAz5QoeaQmBz2tCLeBMTGZVUzoGqUYP+a
        0CPdsv6rSRvBJsmdcS2jynxAuaSh1lIByYj019N3Dg==
X-Google-Smtp-Source: AMrXdXtEc/TkxyTQ3XFYhzirefrABfjNNGIuXnBx/xdgA/nCgenSGOrjvZe/J7oPZLVJCvT4TWZa4USiw02Xl7X0mOg=
X-Received: by 2002:a25:9d88:0:b0:7c0:acd2:6300 with SMTP id
 v8-20020a259d88000000b007c0acd26300mr4732143ybp.520.1675116770237; Mon, 30
 Jan 2023 14:12:50 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674815692.git.geert+renesas@glider.be>
In-Reply-To: <cover.1674815692.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 30 Jan 2023 23:12:39 +0100
Message-ID: <CACRpkdYoqJGwv1y1A__kJXc=1C_oFH9oS1h10QfM_K1WkhfHgg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.3
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
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

On Fri, Jan 27, 2023 at 5:28 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
>
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.3-tag1
>
> for you to fetch changes up to 698485cd875be1109b2130e0ff6c927010a6b56b:
>
>   pinctrl: renesas: r8a77950: Add VIN[45] pins, groups, and functions (2023-01-26 16:45:49 +0100)

Pulled in, thanks!

Yours,
Linus Walleij
