Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D137A6B1332
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Mar 2023 21:36:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbjCHUgo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Mar 2023 15:36:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230297AbjCHUga (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Mar 2023 15:36:30 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E25FA92DC
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Mar 2023 12:36:27 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id c4so67120pfl.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Mar 2023 12:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678307787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8e12CcWTncBLIiWklM1FeVWvPTTAjKv7uZHqi0ZMXFY=;
        b=VAZTK6J1hZuZtouDyGdq9Lez0ntscTsnqdhyuUuntbymuT6lakAfp5umAHfmFYS6cc
         recwIWzwabfHYMwudF8uCRjZVGfwLWQqW4D/ak68KM09bF6Dvl33U37yYLZGAZlFCtqC
         xdEG8eVWQa0/1xCPPmeloj+naouik1gx2K5QtuSbeeryageNwDEYHkvG2Ca5385w79oJ
         4m25P7/0MSG/6VWoktiLyUMkitmh8h8VxcjXZ+q6omJcclhf+zfc+dvp8XIL9LjjoxsR
         /s/tNLH/ZbDs/aCYYbyX3dvPbgEruxgapyWVxFAbOY5D0FKI1i1LT71zx4N++i+BgzkR
         5rEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678307787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8e12CcWTncBLIiWklM1FeVWvPTTAjKv7uZHqi0ZMXFY=;
        b=z6LlOrsoam1F4qRu53FNY2NghPV+XEO5CNN7bGSXPbj5X4j2SZqtPennZINWWGPaNd
         TtVidlzj5sEILPbR2NGIiUAOmjDVwyRZNL0ruk++tumAy87D7KHDzBNqrcEVe2MxXXJp
         VtN5NXEtCkY+Arms0NcQMpxKPgftAfO2fdbYUz4smSV8RjCU9xlbAFhIZseGhpcl8SRc
         jScNKQYJxnsKpoTMOATS2VBRpKcQBZxBaCA+FoAqxv6TDYfUZkR/3qeANJG1rsVSOFnu
         FBjYGTQKwe7UWsZTf+MnZlfBHyqqnJSTOKOcLU9+WF14xPIP6YxeCT4ZnBp5ldUejAk6
         wn1A==
X-Gm-Message-State: AO0yUKV8aXn4jp/L377U2SKeyVAR1yIxcaZq6NvnV2tYbgedm8M97zlO
        1dGTqzDGtDBpH5L7ijAG+coBiKKsjcmvm/bn2qIt+PrUquP/D8nldI4/WQ==
X-Google-Smtp-Source: AK7set8nz6m1LbmDszMwpFCEfY/zsBTAtXC4Fcc501PcRp8UIAA7weHbUx8Hxezl4zu1cnhoz1vqwtGLCvs1E+ZOJzk=
X-Received: by 2002:a62:868b:0:b0:5d6:4f73:97a with SMTP id
 x133-20020a62868b000000b005d64f73097amr8323341pfd.1.1678307786718; Wed, 08
 Mar 2023 12:36:26 -0800 (PST)
MIME-Version: 1.0
References: <d49b9fb20d68709b12692558aca91997e6b06fb4.1678272276.git.geert+renesas@glider.be>
 <ZAi2T4mYefbLTI9U@smile.fi.intel.com>
In-Reply-To: <ZAi2T4mYefbLTI9U@smile.fi.intel.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 8 Mar 2023 12:35:50 -0800
Message-ID: <CAGETcx_WfsOuCyYEsLKZn6R63ypdWi98fuSO5QtB2+mvf-n9fg@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: rmobile-sysc: Use of_fwnode_handle() helper
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 8, 2023 at 8:22=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Mar 08, 2023 at 11:48:17AM +0100, Geert Uytterhoeven wrote:
> > Use the existing of_fwnode_handle() helper instead of open-coding the
> > same operation.
>
> LGTM,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Saravana Kannan <saravanak@google.com>

-Saravana

>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > To be queued in renesas-devel-for-v6.4.
> >
> >  drivers/soc/renesas/rmobile-sysc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/soc/renesas/rmobile-sysc.c b/drivers/soc/renesas/r=
mobile-sysc.c
> > index 204e6135180b919c..728ebac98e14a5cc 100644
> > --- a/drivers/soc/renesas/rmobile-sysc.c
> > +++ b/drivers/soc/renesas/rmobile-sysc.c
> > @@ -343,7 +343,7 @@ static int __init rmobile_init_pm_domains(void)
> >                       break;
> >               }
> >
> > -             fwnode_dev_initialized(&np->fwnode, true);
> > +             fwnode_dev_initialized(of_fwnode_handle(np), true);
> >       }
> >
> >       put_special_pds();
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
