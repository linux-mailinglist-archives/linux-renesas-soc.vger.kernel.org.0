Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6218755B484
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jun 2022 02:03:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbiFZX7Q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 26 Jun 2022 19:59:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiFZX7Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 26 Jun 2022 19:59:16 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 840F62AFC
        for <linux-renesas-soc@vger.kernel.org>; Sun, 26 Jun 2022 16:59:15 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id l11so13979579ybu.13
        for <linux-renesas-soc@vger.kernel.org>; Sun, 26 Jun 2022 16:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UX0ZahvnksbS43hC0oVDo55veOxsRUzLsN4dLUIysyE=;
        b=i3ZS21swey8WZg7H+BaBJ9EAliYbZuHUj1tBOA4laEah3aLR+qlso79pJY4BQU4psg
         KwX/zdg1c0U9SHIZkbNREjUorLQ8AFLCpJzGA1BWfGvkxT74O+XaXgKOLxp6RFANblrq
         CGi2KTeqmrgm51Gbk70rcyC06q5GNRFEmXeqvtR5w+98pQD7eW73IUwobgoDZxTnF0UG
         J/8KMUoIvZFTJKdfxBECGAxHe+/1YX+qidO/fF6iVtju1QMYle40sqQt56mE5TWoGLCX
         Wo3/8jfGAHSkCmAo51L40VdswXGX3/QLN9C7sDT9amw8rpbwHUGXaCKJ2ozbwvwWYtUF
         9WHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UX0ZahvnksbS43hC0oVDo55veOxsRUzLsN4dLUIysyE=;
        b=flgvAwAEGIrPy5RhLQOIBnVzWko1l9LUDTUKAXfpllalkO0m/J7jcXTLf5841gKS3j
         BrreqjsI2jdb+RoxGC+SJ8ts//SHiKOm18b7fsCOiL/eHaBfHb0xRdnNdC5+wEGT4/hW
         lxSg/tp0hsmq8O/ACDxjAEOzEjoyrZGO/HsKUFzSi+syVRt7mXptUjnZ/Kzqu6uuvshE
         o+qCEXa6qBBDvmqctGUoSon6Rkl8Mfj25zxD/BCJ2lGv/7WLzKJl4H+LWPyRJz7sB6Af
         v5II0VLEsVHLlHeHrXcV/vl5FclS6Rpe1ucaw0e3dQ0w5h016yG65+gZty5giPV4yU3E
         Uv7g==
X-Gm-Message-State: AJIora+0/YBW4wUC2B2+9QvBtcX6x55ttx56PJ6vHDV8Lj3FXVEX/fvR
        QNYmJTSzWlO9RT822B4BtumaJicJonAmNUdOz87LcA==
X-Google-Smtp-Source: AGRyM1vozhxXh9bkLXBjDcuH2MEgiR9GS/bmipxIfD2xqPOf9Wx/ekD7AcfNlreLynAjPlPQShKndHH5+/cWjK22m34=
X-Received: by 2002:a05:6902:152:b0:66c:e116:6a7 with SMTP id
 p18-20020a056902015200b0066ce11606a7mr723894ybh.533.1656287954770; Sun, 26
 Jun 2022 16:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1656071849.git.geert+renesas@glider.be>
In-Reply-To: <cover.1656071849.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 27 Jun 2022 01:59:03 +0200
Message-ID: <CACRpkdZiSwSLtNRYJvWL3-0hZ=O0jmXw9ZW2howZuFhJ0BJX0A@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v5.20
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
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

On Fri, Jun 24, 2022 at 2:01 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
>
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.20-tag1
>
> for you to fetch changes up to 5223c511eb4f919e6b423b2f66e02674e97e77e3:
>
>   pinctrl: renesas: rzg2l: Return -EINVAL for pins which have input disabled (2022-06-06 11:12:22 +0200)

Pulled in!

Yours,
Linus Walleij
