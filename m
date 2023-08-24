Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC354786475
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Aug 2023 03:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238945AbjHXBHB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Aug 2023 21:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239023AbjHXBG2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Aug 2023 21:06:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80DB3101;
        Wed, 23 Aug 2023 18:06:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 046D86394F;
        Thu, 24 Aug 2023 01:06:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6968AC433C8;
        Thu, 24 Aug 2023 01:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692839185;
        bh=iP8W3tn22trb7ihWpxZtqU5t9wZAEMt5bFjTOf4SKE8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IMh5ENtQqLiDOaLltiDFdSZ4pLG1PTQZ2L7fEHXQuJY3B1iMfkMKn4aXw3w3M6OfJ
         w/jur+DHNHbHiiiA8vDVK0wMgVRQsEE9fn5x/KoSNCWnmF4BLl4xzNoVUI+h8Ut7o0
         YoVOqcW2PUEaOnzzVtYU9YHhzpzcxaRt6M10hGYlLz4qR5NycL6fDDMQAD25cCwT3z
         xuCo/lDcRaqeg4YRnXnJBehxsg8r88LjBmKbQ37aZ60YNOCXYE0S7BHyH12yIS/LQ/
         hO0KviasbYhjG1ldFmmBS0Y8qjpQUy9dBJeo9GUmxBgG4gPW5m2FPFyLchV8QpfqZQ
         dS92806X0178Q==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50043cf2e29so7088317e87.2;
        Wed, 23 Aug 2023 18:06:25 -0700 (PDT)
X-Gm-Message-State: AOJu0YztxzgP2+2yxnKEtgfez2BIjkligp5apmqiEAif84xdf54Lx254
        +FyWjhErATCtBBD2Gx0vOd8JPwl8rFF7JccVlw==
X-Google-Smtp-Source: AGHT+IFZuwLPgt5rdCS3fJ8EjrWDLOp3Jribuuhv6YwylWc8YQkHDpPFMFORJOn6UfBMvzg2MfPE6XlRQTU4VUFBP+M=
X-Received: by 2002:a2e:9b01:0:b0:2bc:c064:7252 with SMTP id
 u1-20020a2e9b01000000b002bcc0647252mr7600829lji.5.1692839183252; Wed, 23 Aug
 2023 18:06:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690533838.git.geert+renesas@glider.be> <594a6a8934e5569bf96d317a6a3c0a9129a2ae20.1690533838.git.geert+renesas@glider.be>
 <CAL_JsqJhd+t1Am48S+EGEf51Zge=83v8avYbzYTUjinebHm+nw@mail.gmail.com> <CAMuHMdXrKzM5B6_=pQmnXb8wWHpkw0yjQnzwOfYwFqw4aCfGEA@mail.gmail.com>
In-Reply-To: <CAMuHMdXrKzM5B6_=pQmnXb8wWHpkw0yjQnzwOfYwFqw4aCfGEA@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 23 Aug 2023 20:06:10 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKF2m6XjO5OY3B4EPKpSY1LYd7F-v6BeDPZNS-cCYyCHw@mail.gmail.com>
Message-ID: <CAL_JsqKF2m6XjO5OY3B4EPKpSY1LYd7F-v6BeDPZNS-cCYyCHw@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] of: unittest: Cleanup partially-applied overlays
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Aug 14, 2023 at 4:21=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Rob,
>
> On Tue, Aug 1, 2023 at 10:50=E2=80=AFPM Rob Herring <robh+dt@kernel.org> =
wrote:
> > On Fri, Jul 28, 2023 at 2:50=E2=80=AFAM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > > When of_overlay_fdt_apply() fails, the changeset may be partially
> > > applied, and the caller is still expected to call of_overlay_remove()=
 to
> > > clean up this partial state.  However, overlay_17 is the only test th=
at
> > > takes care of cleaning up after an (expected) failure.
> > >
> > > Instead of adding cleanup code to each individual test, extend
> > > overlay_info with the optional expected return value of
> > > of_overlay_remove(), and handle cleanup in the overlay_data_apply()
> > > helper.  While at it, simplify the end marker in the overlay_info tab=
le.
> > >
> > > Update the expected error output for errors during the newly cleanup.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > v2:
> > >   - No changes.
>
> > > --- a/drivers/of/unittest.c
> > > +++ b/drivers/of/unittest.c
>
> > > @@ -3689,9 +3715,19 @@ static __init void of_unittest_overlay_high_le=
vel(void)
> > >         unittest(overlay_data_apply("overlay_bad_phandle", NULL),
> > >                  "Adding overlay 'overlay_bad_phandle' failed\n");
> > >
> > > +       EXPECT_BEGIN(KERN_ERR,
> > > +                    "OF: changeset: remove_property failed @/testcas=
e-data-2/substation@100/hvac-medium-2/name");
> > > +       EXPECT_BEGIN(KERN_ERR,
> > > +                    "OF: resolver: overlay phandle fixup failed: -22=
");
> > > +
> > >         unittest(overlay_data_apply("overlay_bad_symbol", NULL),
> > >                  "Adding overlay 'overlay_bad_symbol' failed\n");
> > >
> > > +       EXPECT_END(KERN_ERR,
> > > +                  "OF: resolver: overlay phandle fixup failed: -22")=
;
> >
> > I'm seeing "OF: Error reverting changeset (-19)" here instead.
> > Cut-n-paste error?
>
> Indeed. Thanks for pointing this out!

I've fixed this up along with the other EXPECTs that changed due to my
rework and applied the series.

Thanks,
Rob
