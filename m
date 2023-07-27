Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C799765585
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jul 2023 16:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231638AbjG0OES convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Jul 2023 10:04:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbjG0OER (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jul 2023 10:04:17 -0400
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6693D19AF;
        Thu, 27 Jul 2023 07:04:16 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d1c988afebfso917293276.2;
        Thu, 27 Jul 2023 07:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690466655; x=1691071455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUfJPKLMRnnyLanmr2mstJ9L57MTpKbEAWS8/U21ayg=;
        b=TtfOrPeljQyfFeKGLvTWNh10AKoaYYXMap2MZov1Fq83IrHspuArPxMST9xW9KTcVG
         aPgy63HqqzxjcrkP6OrofOtM9CHyFCbjlXVejllKIyH3SNOzR6hpyPfhvoiMem+qJl26
         1kkaILTDWWXm7VBg70ZwKIGvJoef/lpshUiW0pweQyNVhV+dk+XxXRNMFVPFFX5MjJIx
         rf5qcAzozFs8REF0B1UFOynjA7kNWCEyDvIhL3YogzP81MCFBRK2Ue5zulY90k4jO7lb
         7JkqN8qeAngA04185skJiQoIEKd4MKEsj6PfROniomMpdC/TvPJcj3/o3t9KbMR9Tt+8
         Tt+Q==
X-Gm-Message-State: ABy/qLYggQTsOcZyMCmj0/fYwor0L9w4Taav/i4pKH/6SOVk0JG+Ua0u
        YoRNC+othaAA8fuTAU8pHHICs+G2mPdU7w==
X-Google-Smtp-Source: APBJJlHXEcNHLYw64ie+LbvnEWentjHMdRDey3p7wC0NQ0QtjM+2lp2jwk5fH5TEM69JebDgifvSqQ==
X-Received: by 2002:a25:dc93:0:b0:d0d:786:2999 with SMTP id y141-20020a25dc93000000b00d0d07862999mr4731256ybe.29.1690466654992;
        Thu, 27 Jul 2023 07:04:14 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id v125-20020a25c583000000b00d0b6ca620besm295259ybe.30.2023.07.27.07.04.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 07:04:14 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-d0b597e7ac1so920923276.1;
        Thu, 27 Jul 2023 07:04:13 -0700 (PDT)
X-Received: by 2002:a25:8750:0:b0:d12:64c9:f849 with SMTP id
 e16-20020a258750000000b00d1264c9f849mr4586479ybn.34.1690466653590; Thu, 27
 Jul 2023 07:04:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689776064.git.geert+renesas@glider.be> <b733ee0b398ace191a787cce965829f2777fc49e.1689776064.git.geert+renesas@glider.be>
 <20230720183130.GA2939849-robh@kernel.org>
In-Reply-To: <20230720183130.GA2939849-robh@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 Jul 2023 16:04:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWNnO3gyH-w7LmQ4T7pEANXtwTgdfx41+tSSP4oKs7zBQ@mail.gmail.com>
Message-ID: <CAMuHMdWNnO3gyH-w7LmQ4T7pEANXtwTgdfx41+tSSP4oKs7zBQ@mail.gmail.com>
Subject: Re: [PATCH 06/13] of: unittest: Merge of_unittest_apply{,_revert}_overlay_check()
To:     Rob Herring <robh@kernel.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On Thu, Jul 20, 2023 at 8:31 PM Rob Herring <robh@kernel.org> wrote:
> On Wed, Jul 19, 2023 at 05:00:06PM +0200, Geert Uytterhoeven wrote:
> > of_unittest_apply_overlay_check() and the first part of
> > of_unittest_apply_revert_overlay_check() are identical.
> > Reduce code duplication by replacing them by two wrappers around a
> > common helper.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  drivers/of/unittest.c | 61 ++++++++++++++++---------------------------
> >  1 file changed, 22 insertions(+), 39 deletions(-)
>
> I would do something like this instead:
>
> 8<-------------------------------------------------------------------
> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index a406a12eb208..a9635935aa26 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -2102,7 +2102,7 @@ static int __init of_unittest_apply_overlay(int overlay_nr, int *ovcs_id)
>  }
>
>  /* apply an overlay while checking before and after states */
> -static int __init of_unittest_apply_overlay_check(int overlay_nr,
> +static int __init _of_unittest_apply_overlay_check(int overlay_nr,
>                 int unittest_nr, int before, int after,
>                 enum overlay_type ovtype)
>  {
> @@ -2133,6 +2133,16 @@ static int __init of_unittest_apply_overlay_check(int overlay_nr,
>                 return -EINVAL;
>         }
>
> +       return ovcs_id;
> +}
> +
> +static int __init of_unittest_apply_overlay_check(int overlay_nr,
> +               int unittest_nr, int before, int after,
> +               enum overlay_type ovtype)
> +{
> +       int ovcs_id = _of_unittest_apply_overlay_check(overlay_nr, unittest_nr, before, after, ovtype);
> +       if (ovcs_id < 0)
> +               return ovcs_id;
>         return 0;
>  }
>
> @@ -2143,31 +2153,9 @@ static int __init of_unittest_apply_revert_overlay_check(int overlay_nr,
>  {
>         int ret, ovcs_id, save_ovcs_id;
>
> -       /* unittest device must be in before state */
> -       if (of_unittest_device_exists(unittest_nr, ovtype) != before) {
> -               unittest(0, "%s with device @\"%s\" %s\n",
> -                               overlay_name_from_nr(overlay_nr),
> -                               unittest_path(unittest_nr, ovtype),
> -                               !before ? "enabled" : "disabled");
> -               return -EINVAL;
> -       }
> -
> -       /* apply the overlay */
> -       ovcs_id = 0;
> -       ret = of_unittest_apply_overlay(overlay_nr, &ovcs_id);
> -       if (ret != 0) {
> -               /* of_unittest_apply_overlay already called unittest() */
> -               return ret;
> -       }
> -
> -       /* unittest device must be in after state */
> -       if (of_unittest_device_exists(unittest_nr, ovtype) != after) {
> -               unittest(0, "%s failed to create @\"%s\" %s\n",
> -                               overlay_name_from_nr(overlay_nr),
> -                               unittest_path(unittest_nr, ovtype),
> -                               !after ? "enabled" : "disabled");
> -               return -EINVAL;
> -       }
> +       ovcs_id = _of_unittest_apply_overlay_check(overlay_nr, unittest_nr, before, after, ovtype);
> +       if (ovcs_id < 0)
> +               return ovcs_id;
>
>         save_ovcs_id = ovcs_id;
>         ret = of_overlay_remove(&ovcs_id);

That's what I had done first, before I realized I could reduce it by
five more lines of code ;-)

mine:  1 file changed, 22 insertions(+), 39 deletions(-)
yours: 1 file changed, 14 insertions(+), 26 deletions(-)

Anyway, you're the maintainer, so I can update my patch if you insist...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
