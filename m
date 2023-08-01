Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E309A76BEBD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Aug 2023 22:50:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbjHAUuj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Aug 2023 16:50:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbjHAUui (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Aug 2023 16:50:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A24E8210D;
        Tue,  1 Aug 2023 13:50:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 338CC616F5;
        Tue,  1 Aug 2023 20:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A21CC433CA;
        Tue,  1 Aug 2023 20:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690923028;
        bh=bFq5IeWsOR8LO4LchuEh6aRVmJ05GMx1deNzPleS+jU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LCEWvjeMedfoDTzhIoBK0KatEiZxoCRQ8Nl4/QsVGVeD2KPY9N4X6+FkOOinOTuR0
         lwWm6MyKtj8QlDwrVLDqMY5n/rfm9G61vWSnGNxyysK0GXcj5F3JGFv0ur41LQQH7g
         127LUpz8ls5bZRNHPlInoTRMNAhXRgK/vUR3vfDfZEPjVjkCHi8rx8UtycLsa/dQeJ
         85J6fLfHloLUCuvtca3ybitExQm10PC2SXweuXohb2TfJxjGhVU4tavJN9ndsW7LkZ
         6402DkXezjUMYC80Vx3+eZAbpHwDAN2z38IiYcjbhbDuA1qKGZTF7DsZU5IQ0H3SV+
         zGiPcvI6JlxpA==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2b95d5ee18dso93642771fa.1;
        Tue, 01 Aug 2023 13:50:28 -0700 (PDT)
X-Gm-Message-State: ABy/qLbsCZ6EpxzXwa6mLl0+TniN2Vohvi2n/jQLWoPGWPupOUHE515V
        vMcgdER8P4RBKEWBBo5+8YaNLJEi80QimQ+XAA==
X-Google-Smtp-Source: APBJJlE5lYZVRh2EwtLx75UshR6ZyShhc7MXcA/QAfgOf827kuALi20cjkEyA9AJBQozZtN/lGlseJxC5ikiy1UZaaw=
X-Received: by 2002:a2e:b048:0:b0:2b6:e105:6174 with SMTP id
 d8-20020a2eb048000000b002b6e1056174mr2936897ljl.47.1690923026479; Tue, 01 Aug
 2023 13:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690533838.git.geert+renesas@glider.be> <594a6a8934e5569bf96d317a6a3c0a9129a2ae20.1690533838.git.geert+renesas@glider.be>
In-Reply-To: <594a6a8934e5569bf96d317a6a3c0a9129a2ae20.1690533838.git.geert+renesas@glider.be>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 1 Aug 2023 14:50:13 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJhd+t1Am48S+EGEf51Zge=83v8avYbzYTUjinebHm+nw@mail.gmail.com>
Message-ID: <CAL_JsqJhd+t1Am48S+EGEf51Zge=83v8avYbzYTUjinebHm+nw@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] of: unittest: Cleanup partially-applied overlays
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jul 28, 2023 at 2:50=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> When of_overlay_fdt_apply() fails, the changeset may be partially
> applied, and the caller is still expected to call of_overlay_remove() to
> clean up this partial state.  However, overlay_17 is the only test that
> takes care of cleaning up after an (expected) failure.
>
> Instead of adding cleanup code to each individual test, extend
> overlay_info with the optional expected return value of
> of_overlay_remove(), and handle cleanup in the overlay_data_apply()
> helper.  While at it, simplify the end marker in the overlay_info table.
>
> Update the expected error output for errors during the newly cleanup.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - No changes.
> ---
>  drivers/of/unittest.c | 130 +++++++++++++++++++++++++++---------------
>  1 file changed, 83 insertions(+), 47 deletions(-)
>
> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index b23a44de091bd044..f9c09d5787362601 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -2964,12 +2964,6 @@ static void __init of_unittest_overlay_notify(void=
)
>
>         unittest(ovcs_id, "ovcs_id not created for overlay_17\n");
>
> -       if (ovcs_id) {
> -               ret =3D of_overlay_remove(&ovcs_id);
> -               unittest(!ret,
> -                       "overlay_17 of_overlay_remove(), ret =3D %d\n", r=
et);
> -       }
> -
>         /* ---  overlay 18  --- */
>
>         unittest(overlay_data_apply("overlay_18", &ovcs_id),
> @@ -3257,17 +3251,19 @@ static void __init of_unittest_lifecycle(void)
>         extern uint8_t __dtbo_##overlay_name##_begin[]; \
>         extern uint8_t __dtbo_##overlay_name##_end[]
>
> -#define OVERLAY_INFO(overlay_name, expected) \
> -{      .dtbo_begin       =3D __dtbo_##overlay_name##_begin, \
> -       .dtbo_end         =3D __dtbo_##overlay_name##_end, \
> -       .expected_result =3D expected, \
> -       .name            =3D #overlay_name, \
> +#define OVERLAY_INFO(overlay_name, expected, expected_remove) \
> +{      .dtbo_begin             =3D __dtbo_##overlay_name##_begin, \
> +       .dtbo_end               =3D __dtbo_##overlay_name##_end, \
> +       .expected_result        =3D expected, \
> +       .expected_result_remove =3D expected_remove, \
> +       .name                   =3D #overlay_name, \
>  }
>
>  struct overlay_info {
>         uint8_t         *dtbo_begin;
>         uint8_t         *dtbo_end;
>         int             expected_result;
> +       int             expected_result_remove; /* if apply failed */
>         int             ovcs_id;
>         char            *name;
>  };
> @@ -3307,40 +3303,40 @@ OVERLAY_INFO_EXTERN(overlay_bad_symbol);
>
>  /* entries found by name */
>  static struct overlay_info overlays[] =3D {
> -       OVERLAY_INFO(overlay_base, -9999),
> -       OVERLAY_INFO(overlay, 0),
> -       OVERLAY_INFO(overlay_0, 0),
> -       OVERLAY_INFO(overlay_1, 0),
> -       OVERLAY_INFO(overlay_2, 0),
> -       OVERLAY_INFO(overlay_3, 0),
> -       OVERLAY_INFO(overlay_4, 0),
> -       OVERLAY_INFO(overlay_5, 0),
> -       OVERLAY_INFO(overlay_6, 0),
> -       OVERLAY_INFO(overlay_7, 0),
> -       OVERLAY_INFO(overlay_8, 0),
> -       OVERLAY_INFO(overlay_9, 0),
> -       OVERLAY_INFO(overlay_10, 0),
> -       OVERLAY_INFO(overlay_11, 0),
> -       OVERLAY_INFO(overlay_12, 0),
> -       OVERLAY_INFO(overlay_13, 0),
> -       OVERLAY_INFO(overlay_15, 0),
> -       OVERLAY_INFO(overlay_16, -EBUSY),
> -       OVERLAY_INFO(overlay_17, -EEXIST),
> -       OVERLAY_INFO(overlay_18, 0),
> -       OVERLAY_INFO(overlay_19, 0),
> -       OVERLAY_INFO(overlay_20, 0),
> -       OVERLAY_INFO(overlay_gpio_01, 0),
> -       OVERLAY_INFO(overlay_gpio_02a, 0),
> -       OVERLAY_INFO(overlay_gpio_02b, 0),
> -       OVERLAY_INFO(overlay_gpio_03, 0),
> -       OVERLAY_INFO(overlay_gpio_04a, 0),
> -       OVERLAY_INFO(overlay_gpio_04b, 0),
> -       OVERLAY_INFO(overlay_bad_add_dup_node, -EINVAL),
> -       OVERLAY_INFO(overlay_bad_add_dup_prop, -EINVAL),
> -       OVERLAY_INFO(overlay_bad_phandle, -EINVAL),
> -       OVERLAY_INFO(overlay_bad_symbol, -EINVAL),
> +       OVERLAY_INFO(overlay_base, -9999, 0),
> +       OVERLAY_INFO(overlay, 0, 0),
> +       OVERLAY_INFO(overlay_0, 0, 0),
> +       OVERLAY_INFO(overlay_1, 0, 0),
> +       OVERLAY_INFO(overlay_2, 0, 0),
> +       OVERLAY_INFO(overlay_3, 0, 0),
> +       OVERLAY_INFO(overlay_4, 0, 0),
> +       OVERLAY_INFO(overlay_5, 0, 0),
> +       OVERLAY_INFO(overlay_6, 0, 0),
> +       OVERLAY_INFO(overlay_7, 0, 0),
> +       OVERLAY_INFO(overlay_8, 0, 0),
> +       OVERLAY_INFO(overlay_9, 0, 0),
> +       OVERLAY_INFO(overlay_10, 0, 0),
> +       OVERLAY_INFO(overlay_11, 0, 0),
> +       OVERLAY_INFO(overlay_12, 0, 0),
> +       OVERLAY_INFO(overlay_13, 0, 0),
> +       OVERLAY_INFO(overlay_15, 0, 0),
> +       OVERLAY_INFO(overlay_16, -EBUSY, 0),
> +       OVERLAY_INFO(overlay_17, -EEXIST, 0),
> +       OVERLAY_INFO(overlay_18, 0, 0),
> +       OVERLAY_INFO(overlay_19, 0, 0),
> +       OVERLAY_INFO(overlay_20, 0, 0),
> +       OVERLAY_INFO(overlay_gpio_01, 0, 0),
> +       OVERLAY_INFO(overlay_gpio_02a, 0, 0),
> +       OVERLAY_INFO(overlay_gpio_02b, 0, 0),
> +       OVERLAY_INFO(overlay_gpio_03, 0, 0),
> +       OVERLAY_INFO(overlay_gpio_04a, 0, 0),
> +       OVERLAY_INFO(overlay_gpio_04b, 0, 0),
> +       OVERLAY_INFO(overlay_bad_add_dup_node, -EINVAL, -ENODEV),
> +       OVERLAY_INFO(overlay_bad_add_dup_prop, -EINVAL, -ENODEV),
> +       OVERLAY_INFO(overlay_bad_phandle, -EINVAL, 0),
> +       OVERLAY_INFO(overlay_bad_symbol, -EINVAL, -ENODEV),
>         /* end marker */
> -       {.dtbo_begin =3D NULL, .dtbo_end =3D NULL, .expected_result =3D 0=
, .name =3D NULL}
> +       { }
>  };
>
>  static struct device_node *overlay_base_root;
> @@ -3435,8 +3431,9 @@ void __init unittest_unflatten_overlay_base(void)
>  static int __init overlay_data_apply(const char *overlay_name, int *ovcs=
_id)
>  {
>         struct overlay_info *info;
> +       int passed =3D 1;
>         int found =3D 0;
> -       int ret;
> +       int ret, ret2;
>         u32 size;
>
>         for (info =3D overlays; info && info->name; info++) {
> @@ -3463,11 +3460,24 @@ static int __init overlay_data_apply(const char *=
overlay_name, int *ovcs_id)
>         pr_debug("%s applied\n", overlay_name);
>
>  out:
> -       if (ret !=3D info->expected_result)
> +       if (ret !=3D info->expected_result) {
>                 pr_err("of_overlay_fdt_apply() expected %d, ret=3D%d, %s\=
n",
>                        info->expected_result, ret, overlay_name);
> +               passed =3D 0;
> +       }
> +
> +       if (ret < 0) {
> +               /* changeset may be partially applied */
> +               ret2 =3D of_overlay_remove(&info->ovcs_id);
> +               if (ret2 !=3D info->expected_result_remove) {
> +                       pr_err("of_overlay_remove() expected %d, ret=3D%d=
, %s\n",
> +                              info->expected_result_remove, ret2,
> +                              overlay_name);
> +                       passed =3D 0;
> +               }
> +       }
>
> -       return (ret =3D=3D info->expected_result);
> +       return passed;
>  }
>
>  /*
> @@ -3660,10 +3670,18 @@ static __init void of_unittest_overlay_high_level=
(void)
>                      "OF: overlay: ERROR: multiple fragments add and/or d=
elete node /testcase-data-2/substation@100/motor-1/controller");
>         EXPECT_BEGIN(KERN_ERR,
>                      "OF: overlay: ERROR: multiple fragments add, update,=
 and/or delete property /testcase-data-2/substation@100/motor-1/controller/=
name");
> +       EXPECT_BEGIN(KERN_ERR,
> +                    "OF: changeset: remove_property failed @/testcase-da=
ta-2/substation@100/motor-1/controller/name");
> +       EXPECT_BEGIN(KERN_ERR,
> +                    "OF: Error reverting changeset (-19)");
>
>         unittest(overlay_data_apply("overlay_bad_add_dup_node", NULL),
>                  "Adding overlay 'overlay_bad_add_dup_node' failed\n");
>
> +       EXPECT_END(KERN_ERR,
> +                  "OF: Error reverting changeset (-19)");
> +       EXPECT_END(KERN_ERR,
> +                  "OF: changeset: remove_property failed @/testcase-data=
-2/substation@100/motor-1/controller/name");
>         EXPECT_END(KERN_ERR,
>                    "OF: overlay: ERROR: multiple fragments add, update, a=
nd/or delete property /testcase-data-2/substation@100/motor-1/controller/na=
me");
>         EXPECT_END(KERN_ERR,
> @@ -3675,10 +3693,18 @@ static __init void of_unittest_overlay_high_level=
(void)
>                      "OF: overlay: ERROR: multiple fragments add, update,=
 and/or delete property /testcase-data-2/substation@100/motor-1/electric/rp=
m_avail");
>         EXPECT_BEGIN(KERN_ERR,
>                      "OF: overlay: ERROR: multiple fragments add, update,=
 and/or delete property /testcase-data-2/substation@100/motor-1/electric/na=
me");
> +       EXPECT_BEGIN(KERN_ERR,
> +                    "OF: changeset: remove_property failed @/testcase-da=
ta-2/substation@100/motor-1/electric/name");
> +       EXPECT_BEGIN(KERN_ERR,
> +                    "OF: Error reverting changeset (-19)");
>
>         unittest(overlay_data_apply("overlay_bad_add_dup_prop", NULL),
>                  "Adding overlay 'overlay_bad_add_dup_prop' failed\n");
>
> +       EXPECT_END(KERN_ERR,
> +                  "OF: Error reverting changeset (-19)");
> +       EXPECT_END(KERN_ERR,
> +                  "OF: changeset: remove_property failed @/testcase-data=
-2/substation@100/motor-1/electric/name");
>         EXPECT_END(KERN_ERR,
>                    "OF: overlay: ERROR: multiple fragments add, update, a=
nd/or delete property /testcase-data-2/substation@100/motor-1/electric/name=
");
>         EXPECT_END(KERN_ERR,
> @@ -3689,9 +3715,19 @@ static __init void of_unittest_overlay_high_level(=
void)
>         unittest(overlay_data_apply("overlay_bad_phandle", NULL),
>                  "Adding overlay 'overlay_bad_phandle' failed\n");
>
> +       EXPECT_BEGIN(KERN_ERR,
> +                    "OF: changeset: remove_property failed @/testcase-da=
ta-2/substation@100/hvac-medium-2/name");

I noticed my printing patch will have an issue on this because it
prints the changeset pointer value. I guess we have to manually check
that if EXPECT can't handle some type of wildcard.

> +       EXPECT_BEGIN(KERN_ERR,
> +                    "OF: resolver: overlay phandle fixup failed: -22");
> +
>         unittest(overlay_data_apply("overlay_bad_symbol", NULL),
>                  "Adding overlay 'overlay_bad_symbol' failed\n");
>
> +       EXPECT_END(KERN_ERR,
> +                  "OF: resolver: overlay phandle fixup failed: -22");

I'm seeing "OF: Error reverting changeset (-19)" here instead.
Cut-n-paste error?

Rob
