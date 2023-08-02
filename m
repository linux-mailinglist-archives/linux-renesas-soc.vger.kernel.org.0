Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69C9D76DB55
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Aug 2023 01:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbjHBXPJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Aug 2023 19:15:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230512AbjHBXPI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Aug 2023 19:15:08 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E6651BFA
        for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Aug 2023 16:14:47 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-bff89873d34so290052276.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Aug 2023 16:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691018087; x=1691622887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCAUHX9CMj86tQNhShQNA9P7+c+YIDPXdibh9FXsZNA=;
        b=FUQH7OwFUOLN5x+o+NClbzaI5s189I4zQIU4r/Br6QTAYN/tUf3omazOop92EDLo96
         Wy1SWk3+1DwZALTa70/xMUTVEvsfIg57ddvVgKg4WEg9a5FxGzJua4mrnH4rqeg7eeDg
         A86ZS09Xae7IxaZjsBdhNtvi4HSXT60BH3F3n/L4lFQbYlyMhJJxaUgXxT8NmP2e/d02
         gJsRf28B7bgUJHpvXGJQxDM54b/mv+F5kLnuZKwLMnoGLczCH8KAgY+qaZwQE/uWKnMR
         LOIsT6dyfCtUETSMPdFw3Ste93BRT5sZxEp/l4YpBRotEwHSeA/fUryYrNmt1F6CExcV
         qwyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691018087; x=1691622887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCAUHX9CMj86tQNhShQNA9P7+c+YIDPXdibh9FXsZNA=;
        b=gPM10n+/Q4VuKOYX2Z1RIMyEwxic1RbjygFyUFG/X2WuLerCVP89M/J0FjjCxHT/Sw
         iM0n5FaCu4+3xzVPOtYLb0SRMO5FxSjeunA6PNX8HObLb/zvUjmhQRCJR7RI6ZLCRwmC
         8CyfiRvNWrCEesCLv0pbWtzjmmoB5umyf7YdzRQS+m1CqiIUHCeoBmLPY3m0ZNqaUoBk
         UEeOnNb8HVV2YXQWCxroKo7OYPHsEovn3KuSD11OSSwQsSGWqL0wf8+9PS5nZR3itZEE
         4gaXUpciJMF7bIa4i/ihTntKti+VIB1wzx3w1zSNn2el+dFEY/418AS+bvWP2ABPOzrW
         61IA==
X-Gm-Message-State: ABy/qLbSsX+5hm790hB1o73/27fK1D/OgsZb1TFyd/QiPg9A2C4ZtP8O
        ZQ/21mvDS3Vilylj2Qk6uqpPBVSgPeNX8O1Ef0jNuqvBp6C2NaNz
X-Google-Smtp-Source: APBJJlEpLRJa1zHGSACbJNxHYKAVMd8d+GTqG+SkXFtOTRezcnrU3BhmfTEVkyw7dLhhmo/wqVNrvvbcJ8tKw00jNmE=
X-Received: by 2002:a25:d394:0:b0:d00:7d6d:4767 with SMTP id
 e142-20020a25d394000000b00d007d6d4767mr15011382ybf.44.1691018086791; Wed, 02
 Aug 2023 16:14:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690545605.git.geert+renesas@glider.be>
In-Reply-To: <cover.1690545605.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 3 Aug 2023 01:14:35 +0200
Message-ID: <CACRpkdbt0vZVCF5K_a2Sy0i2dWchvAZCtdAp2Z3jtFkqzsqXAQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.6
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jul 28, 2023 at 2:01=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit bfc374a145ae133613e05b9b89be561f169cb5=
8d:
>
>   pinctrl: renesas: rzg2l: Handle non-unique subnode names (2023-07-10 10=
:00:27 +0200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.6-tag1
>
> for you to fetch changes up to 95eb19869401850f069723b296170b8b3bd5be9e:
>
>   pinctrl: renesas: rzg2l: Use devm_clk_get_enabled() helper (2023-07-25 =
12:28:45 +0200)

Pulled into my devel branch, thanks!

Yours,
Linus Walleij
