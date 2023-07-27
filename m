Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5440F765B06
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jul 2023 19:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbjG0R6R (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Jul 2023 13:58:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjG0R6Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jul 2023 13:58:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE10B2D5F;
        Thu, 27 Jul 2023 10:58:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 746D761EDD;
        Thu, 27 Jul 2023 17:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0215C433CA;
        Thu, 27 Jul 2023 17:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690480694;
        bh=n1k2sMEjVb3F5RqXb/sa8LMkQ85lhKH+jJx8TpURg40=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=L4BcBPZvNG0ikPm6iVgmr/k0m0lSx4bJdALGpSYRKDbp5ECEaw7wlpfT+G+Yucoud
         2ZJ0rMyjxvI2DshxOr5r4Cpq+hCCxXS9O47OH19zp8OwG1+/1GMdRzXcUvP7UFG888
         Ri7nGr7FkMV0vPswD5QLIww7MBoGjY03xYJXBD/E8z02Ug9JXo45inyFiBh5XfmDxw
         os1Aw7A2BJtOgK8TbWz/mL2k0kl/pDPLmou2ztKFLmZCsMKLJAaspSB4DvSOKULsbK
         WYB5nxQbdr3HvPx+S9L7Gugi125ncvNTKfbdIHV6/8YaeQX/FJk1j02OGqxU4tlnht
         lKSztFJnxVcIQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2b962535808so20381731fa.0;
        Thu, 27 Jul 2023 10:58:14 -0700 (PDT)
X-Gm-Message-State: ABy/qLY3sgfJKdChnEZpVWpCnu6e9oJwoWvC/myWsDmW2QqlR+vpr3Ml
        bq2+lLH7itKWYdz0glZfPGU62eTwSz33URpU4A==
X-Google-Smtp-Source: APBJJlHIiInknIDpNIIi9X2WGUWytO0qqbQcnp2aDRsib5t1XpoIlTOPeNVXlPCsGvnkgTwCgHcYuhglYq5zD3bYv7o=
X-Received: by 2002:a2e:9982:0:b0:2b6:a08d:e142 with SMTP id
 w2-20020a2e9982000000b002b6a08de142mr2258506lji.7.1690480692828; Thu, 27 Jul
 2023 10:58:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689776064.git.geert+renesas@glider.be> <b733ee0b398ace191a787cce965829f2777fc49e.1689776064.git.geert+renesas@glider.be>
 <20230720183130.GA2939849-robh@kernel.org> <CAMuHMdWNnO3gyH-w7LmQ4T7pEANXtwTgdfx41+tSSP4oKs7zBQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWNnO3gyH-w7LmQ4T7pEANXtwTgdfx41+tSSP4oKs7zBQ@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 27 Jul 2023 11:58:00 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKj5qRzddUYwpdv2Xe1cfub2+OeyVuVL0ha-cYS2uPkwA@mail.gmail.com>
Message-ID: <CAL_JsqKj5qRzddUYwpdv2Xe1cfub2+OeyVuVL0ha-cYS2uPkwA@mail.gmail.com>
Subject: Re: [PATCH 06/13] of: unittest: Merge of_unittest_apply{,_revert}_overlay_check()
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jul 27, 2023 at 8:04=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Rob,
>
> On Thu, Jul 20, 2023 at 8:31=E2=80=AFPM Rob Herring <robh@kernel.org> wro=
te:
> > On Wed, Jul 19, 2023 at 05:00:06PM +0200, Geert Uytterhoeven wrote:
> > > of_unittest_apply_overlay_check() and the first part of
> > > of_unittest_apply_revert_overlay_check() are identical.
> > > Reduce code duplication by replacing them by two wrappers around a
> > > common helper.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > >  drivers/of/unittest.c | 61 ++++++++++++++++-------------------------=
--
> > >  1 file changed, 22 insertions(+), 39 deletions(-)
> >
> > I would do something like this instead:
> >
> > 8<-------------------------------------------------------------------
> > diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> > index a406a12eb208..a9635935aa26 100644
> > --- a/drivers/of/unittest.c
> > +++ b/drivers/of/unittest.c
> > @@ -2102,7 +2102,7 @@ static int __init of_unittest_apply_overlay(int o=
verlay_nr, int *ovcs_id)
> >  }
> >
> >  /* apply an overlay while checking before and after states */
> > -static int __init of_unittest_apply_overlay_check(int overlay_nr,
> > +static int __init _of_unittest_apply_overlay_check(int overlay_nr,
> >                 int unittest_nr, int before, int after,
> >                 enum overlay_type ovtype)
> >  {
> > @@ -2133,6 +2133,16 @@ static int __init of_unittest_apply_overlay_chec=
k(int overlay_nr,
> >                 return -EINVAL;
> >         }
> >
> > +       return ovcs_id;
> > +}
> > +
> > +static int __init of_unittest_apply_overlay_check(int overlay_nr,
> > +               int unittest_nr, int before, int after,
> > +               enum overlay_type ovtype)
> > +{
> > +       int ovcs_id =3D _of_unittest_apply_overlay_check(overlay_nr, un=
ittest_nr, before, after, ovtype);
> > +       if (ovcs_id < 0)
> > +               return ovcs_id;
> >         return 0;
> >  }
> >
> > @@ -2143,31 +2153,9 @@ static int __init of_unittest_apply_revert_overl=
ay_check(int overlay_nr,
> >  {
> >         int ret, ovcs_id, save_ovcs_id;
> >
> > -       /* unittest device must be in before state */
> > -       if (of_unittest_device_exists(unittest_nr, ovtype) !=3D before)=
 {
> > -               unittest(0, "%s with device @\"%s\" %s\n",
> > -                               overlay_name_from_nr(overlay_nr),
> > -                               unittest_path(unittest_nr, ovtype),
> > -                               !before ? "enabled" : "disabled");
> > -               return -EINVAL;
> > -       }
> > -
> > -       /* apply the overlay */
> > -       ovcs_id =3D 0;
> > -       ret =3D of_unittest_apply_overlay(overlay_nr, &ovcs_id);
> > -       if (ret !=3D 0) {
> > -               /* of_unittest_apply_overlay already called unittest() =
*/
> > -               return ret;
> > -       }
> > -
> > -       /* unittest device must be in after state */
> > -       if (of_unittest_device_exists(unittest_nr, ovtype) !=3D after) =
{
> > -               unittest(0, "%s failed to create @\"%s\" %s\n",
> > -                               overlay_name_from_nr(overlay_nr),
> > -                               unittest_path(unittest_nr, ovtype),
> > -                               !after ? "enabled" : "disabled");
> > -               return -EINVAL;
> > -       }
> > +       ovcs_id =3D _of_unittest_apply_overlay_check(overlay_nr, unitte=
st_nr, before, after, ovtype);
> > +       if (ovcs_id < 0)
> > +               return ovcs_id;
> >
> >         save_ovcs_id =3D ovcs_id;
> >         ret =3D of_overlay_remove(&ovcs_id);
>
> That's what I had done first, before I realized I could reduce it by
> five more lines of code ;-)
>
> mine:  1 file changed, 22 insertions(+), 39 deletions(-)
> yours: 1 file changed, 14 insertions(+), 26 deletions(-)

Less change to review is also worthwhile.

> Anyway, you're the maintainer, so I can update my patch if you insist...

The other thing about this that I noticed is I recall gregkh not
liking the pattern where function parameters change what the function
does (e.g. do_x_or_y(bool do_y)).

So yes, I prefer mine.

Rob
